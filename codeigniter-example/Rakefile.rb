require 'rubygems'
require 'rake'

# Require files
require "class/filesystemwatcher"
require "haml"
require "haml/exec"
require "sass"
require 'sass/plugin'
#require 'class/sassrt.rb'
require 'class/errortemplate.rb'
require 'sass/plugin/rack'
load 'config.rb'

task :watch do |t|
# Start task
		watcher = FileSystemWatcher.new()
		# Set Configuration variables
		folder =  @folderTo
		cssFolder = @cssFolderTo
		directorytowatch = @dirFolderTo
		optionsass = @sassoptions
		optionshaml = @hamloptions

		watcher.addDirectory(directorytowatch, '**/*.*')

		watcher.sleepTime = 1

		watcher.start { |status,file|
			if(status == FileSystemWatcher::MODIFIED) then
					fileName = file.split('/');
					fil = file.sub("#{directorytowatch}/", "")
					sassFile = file.split("#{directorytowatch}/")
					ex = fileName.last.match(/(sass|haml|phaml)$/)[1]
					if(ex == "haml")
						filetoname = sassFile[1].sub(".haml", "")
							begin
									puts "#{optionshaml}"
									template = File.read(file)
									engine = Haml::Engine.new(template, optionshaml)
									te = engine.render
									fileWrite = "#{folder}/#{filetoname}.html"
									File.open(fileWrite, 'w') {|f| f.write(te) } 
									puts  "Writing haml file - (#{fileName.last})"
								rescue Exception => e 
									puts "#{plainError e, file}"
									fileWrite = "#{folder}/#{filetoname}.html"
									re = goHere e, file
									File.open(fileWrite, 'w') {|f| f.write(re) } if File::exists?(fileWrite)
								end
					elsif(ex == "sass")
						filetonamesass =fileName.last.sub(".sass", "")
								begin

									stylesheet = Sass::Engine.new(File.read(file), optionsass)
									sassConverted = stylesheet.render #stylesheet.to_css
									fileWrite = "#{cssFolder}/#{filetonamesass}.css"
									File.open(fileWrite, 'w') {|f| f.write(sassConverted) } 
									puts "Writing sass file - (#{fileName.last})"
								rescue Exception => e 
										puts "#{plainError e, file}"
										fileWrite = "#{cssFolder}/#{filetonamesass}.css"
										re = goHere e, file
										File.open(fileWrite, 'w') {|f| f.write(re) } if File::exists?(fileWrite)
								end

					elsif(ex == "phaml")
					filetonamephp = sassFile[1].sub(".phaml", "")
							begin
								template = File.read(file)
								engine = Haml::Engine.new(template, optionshaml)
								te = engine.render
								fileWrite = "#{folder}/#{filetonamephp}.php"
								File.open(fileWrite, 'w') {|f| f.write(te) } #if File::exists?(fileWrite)
								puts "Writing phaml file - (#{fileName.last})"
							rescue Exception => e 
									puts "#{plainError e, file}"
								fileWrite = "#{folder}/#{filetonamephp}.php"
								re = goHere e, file
								File.open(fileWrite, 'w') {|f| f.write(re) } if File::exists?(fileWrite)
							end
					end
			end
		}

		puts "-- Watching for changes in #{directorytowatch} --"
		watcher.join() # join to the thread to keep the program alive 
#END task
end