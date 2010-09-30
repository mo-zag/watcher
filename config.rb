# Folder to write PHP files to must be full path to directory
@folderTo ="C:/location-of-php-folder"

# Location to write SASS files converted to css must be full path to directory
@cssFolderTo = "C:/location-to-save-converted-sass-files"

# Folder to watch for changes
@dirFolderTo = "haml-sass"

#Sass options
@sassoptions = { :style => :compact, :load_paths => ['haml-sass/stylesheets'], :template_location => '.', :cache => true, :cache_location => './.sass-cache', :syntax => :sass}

#Haml options
@hamloptions = {:attr_wrapper => '"'}
