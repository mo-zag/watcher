# Folder to write PHP files to must be full path to directory
@folderTo ="E:/business/test/codeigniter-example/system/application/views"

# Location to write SASS files converted to css must be full path to directory
@cssFolderTo = "E:/business/test/codeigniter-example/assets/css"

# Folder to watch for changes
@dirFolderTo = "haml-sass"

#Sass options
@sassoptions = { :style => :compact, :load_paths => ['haml-sass/stylesheets'], :template_location => '.', :cache => true, :cache_location => './.sass-cache', :syntax => :sass}
#Haml options
@hamloptions = {:attr_wrapper => '"'}
