class ApplicationController < Sinatra::Base
  post '/upload/:name' do
    # Check if user uploaded a file
    if params[:image] && params[:image][:filename]
      filename = params[:image][:filename]
      ext=filename.split(".").last
      file = params[:image][:tempfile]
      path = File.expand_path('./')+ "/images/#{params[:name]}.#{ext}"
  
      # Write file to disk
      #absolute path
      File.open(path, 'wb') do |f|
        f.write(file.read)
      end
    end
  end

get '/image/:name' do
  ext=(File.exist?  "./images/#{params[:name]}.png")? "png":(File.exist?  "./images/#{params[:name]}.jpg")? "jpg": "jpeg"
  send_file  "./images/#{params[:name]}.#{ext}"
end
  
end


