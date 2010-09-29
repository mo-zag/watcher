require 'find'
require 'fileutils'

class HamlSassPhp
#	Class Start here

	def findFilePath(dir, writeTo)

		Find.find(dir) do |path|
			
			if FileTest.directory?(path)
		
				if File.basename(path)[0] == ?.
						Find.prune
					else
						createDirectory("#{writeTo}/#{path}")
						
						puts "This is a Directory #{path} "
					
					end
				
		  else
				if File.file?("#{writeTo}/#{path}") 
						checkHamlSass("#{writeTo}/#{path}")
						puts "yes"
					else
						File.new("#{writeTo}/#{path}", "w+")
				end
				
			puts path
		  end
		end
	end
	
	def createDirectory(pathDirectory)
		if FileTest.directory?("#{writeTo}/#{path}")
			puts "This directory exists"
		else
			Dir.mkdir("#{writeTo}/#{path}")
		end
	end
	
	def checkHamlSass(filePath)
		# Start function
			ex = 'boo'
				puts " This is a path #{filePath}"
		# End function
	end
#Class ends here
end