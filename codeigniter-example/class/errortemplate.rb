def goHere(message, nameoffile)
		@messag = ""
		#@messag += "<html><head><title>ERROR IN CODE</title>"
		#CSS for error styling.
			@messag += "<style type = \"text/css\">"
			@messag +="body { background-color: #fff; margin: 40px; font-family: Lucida Grande, Verdana, Sans-serif; font-size: 12px; color: #000;}"
			@messag +="#content { border: #999 1px solid; background-color: #fff; padding: 20px 20px 12px 20px;}"
			@messag +="h1 { font-weight: normal; font-size: 14px; color: #990000; margin: 0 0 4px 0; }"
			@messag += "</style>"
		@messag += "<div id=\"content\">"
		@messag += "<h1>(This is a HAML - SASS error):  You have Error in you code </h1>"
		@messag += "<p>#{message} </p>"
		@messag += "<p> On Line : #{get_line message}.</p>"
		@messag += "<p>Error in file location: <strong>#{nameoffile}</strong></p>"
		@messag += "</div>"
		return @messag
		
end

		def get_line(exception)
				# SyntaxErrors have weird line reporting
				# when there's trailing whitespace,
				# which there is for Haml documents.
				return (exception.message.scan(/:(\d+)/).first || ["??"]).first if exception.is_a?(::SyntaxError)
				(exception.backtrace[0].scan(/:(\d+)/).first || ["??"]).first
		end
		
		def plainError message, nameoffile
		@plainMessage = ""
			@plainMessage += "Error: #{message} \n"
			@plainMessage += "Line number #{get_line message} "
			@plainMessage += "File error detected: #{nameoffile}"
			return @plainMessage
		end
		
		def sassErrorLine message
			return message
		end