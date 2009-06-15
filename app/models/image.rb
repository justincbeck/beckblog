class Image < ActiveRecord::Base

  def file= (f)
    @file = f
  end

  def validate
    # Empty 'name' field is not allowed
    errors.add_on_empty 'name'

    # @file should contain file uploaded by HTTP
    # it is either StringIO object (if file was smaller than 10Kb)
    # or Tempfile (otherwise)
    if not (@file.kind_of? StringIO or @file.kind_of? Tempfile)
      errors.add_to_base("No file file selected")
      return
    end

    # We can't use StringIO data to call external programs
    # So, if object is StringIO -- we have to create Tempfile
    # Unfortunatly, in Rails it is impossible to force all uploads to be Tempfiles
    if @file.kind_of? StringIO
      # Yes, if @file is StringIO, create new Tempfile and copy everything to it
      @real_file = Tempfile.new("AEGALLERY")
      while not @file.eof?
        @real_file.write @file.read
      end
    else
      # Most uploads will be Tempfiles
      @real_file = @file
    end

    # Here is a call to ImageMagick tool identity
    # it prints to standard output
    # type, width and height of images
    # (this is specified by -format %m,%w,%h)
    identify = `#{IMAGE_MAGICK_PATH}/identify -format %m,%w,%h #{@real_file.path} 2>&1`
    # Now identity is a string like "JPEG,640,480"

    # We split this string to array
    @jpeg_info = identify.split(',', 3)
    # convert width and height to integer and assign it to object fields
    self.width = @jpeg_info[1].to_i
    self.height = @jpeg_info[2].to_i

    # Finally, cheking if everything was fine with this image
    # if file was not valid JPEG -- something will fail here
    if @jpeg_info == nil or @jpeg_info[0] != 'JPEG' or self.width <= 0 or self.height <= 0
       errors.add_to_base("Wrong image format (use only JPEG) or broken data")
       return
    end

  end


  def after_save
    dest_photo = "#{RAILS_ROOT}/public/photo/f/#{self.id}.jpeg"
    dest_photo_t = "#{RAILS_ROOT}/public/photo/t/#{self.id}.jpeg"

    # Copying Tempfile to our storage,
    # which is a subdirectory 'photo/f' in 'public'
    # directory of Rails project
    FileUtils.cp(@real_file.path, dest_photo);

    # Setting right permissions
    FileUtils.chmod 0644, dest_photo

    # call image magick 'convert' utility to
    # generate 200x200 thumbnail
    `#{IMAGE_MAGICK_PATH}/convert -size 200x200 #{dest_photo} \
    -resize 200x200 -quality 90 +profile \"*\" #{dest_photo_t} 2>&1`
  end

  def after_destroy
    # Deleting image files
    FileUtils.safe_unlink("#{RAILS_ROOT}/public/photo/f/#{self.id}.jpeg")
    FileUtils.safe_unlink("#{RAILS_ROOT}/public/photo/t/#{self.id}.jpeg")
  end

  def img_tag
    "<img src='/photo/f/#{self.id}.jpeg' width='#{self.width}' height='#{self.height}' alt='#{self.name}'>"
  end

  def img_tag_thumbnail
    kf = 200.0 / ( width > height ? width : height )
    tw = (width.to_f * kf).to_i
    th = (height.to_f * kf).to_i
    "<img src='/photo/t/#{self.id}.jpeg' width='#{tw}' height='#{th}' alt='#{self.name}'>"
  end

end
