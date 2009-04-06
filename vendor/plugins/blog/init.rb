# Include hook code here
model_path = File.join(directory, 'app', 'models')
$LOAD_PATH << model_path
ActiveSupport::Dependencies.load_paths << model_path

controller_path = File.join(directory, 'app', 'controllers')
$LOAD_PATH << controller_path
ActiveSupport::Dependencies.load_paths << controller_path
config.controller_paths << controller_path