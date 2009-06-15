class Image < ActiveRecord::Base

  def file= (f)
    @file = f
  end

  def validate
    errors.add_on_empty 'name'

    if not (@file.kind_of? StringIO or @file.kind_of? Tempfile)
      errors.add_to_base("No file file selected")
      return
    end

    if @file.kind_of? StringIO
      @real_file = Tempfile.new("AEGALLERY")
      while not @file.eof?
        @real_file.write @file.read
      end
    else
      @real_file = @file
    end

    identify = `#{IMAGE_MAGICK_PATH}/identify -format %m,%w,%h #{@real_file.path} 2>&1`

    @jpeg_info = identify.split(',', 3)
    self.width = @jpeg_info[1].to_i
    self.height = @jpeg_info[2].to_i

    if @jpeg_info == nil or @jpeg_info[0] != 'JPEG' or self.width <= 0 or self.height <= 0
       errors.add_to_base("Wrong image format (use only JPEG) or broken data")
       return
    end
  end


  def after_save
    dest_photo = "#{RAILS_ROOT}/public/photo/f/#{self.id}.jpeg"
    dest_photo_t = "#{RAILS_ROOT}/public/photo/t/#{self.id}.jpeg"

    FileUtils.cp(@real_file.path, dest_photo);

    FileUtils.chmod 0644, dest_photo

    `#{IMAGE_MAGICK_PATH}/convert -size 200x200 #{dest_photo} \
    -resize 200x200 -quality 90 +profile \"*\" #{dest_photo_t} 2>&1`
  end

  def after_destroy
    FileUtils.safe_unlink("#{RAILS_ROOT}/public/photo/f/#{self.id}.jpeg")
    FileUtils.safe_unlink("#{RAILS_ROOT}/public/photo/t/#{self.id}.jpeg")
  end

  def img_tag
    "<img src='/photo/f/#{self.id}.jpeg' width='#{self.width}' height='#{self.height}' alt='#{self.name}'>"
  end

  def img_tag_thumbnail
    kf = 100.0 / ( width > height ? width : height )
    tw = (width.to_f * kf).to_i
    th = (height.to_f * kf).to_i
    "<img src='/photo/t/#{self.id}.jpeg' width='#{tw}' height='#{th}' alt='#{self.name}'>"
  end
end
