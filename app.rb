require 'sinatra'
require 'json'

class FotaServerApp < Sinatra::Base
get '/manifest' do
  file_path = 'path_to_file.json'

  if File.exist?(file_path)
    content = File.read(file_path)
    content_type :json
    content
  else
    status 404
    { error: 'File not found' }.to_json
  end
end

get '/firmware' do
  'Firmware route - under construction'
end
end
