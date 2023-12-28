require 'sinatra'
require 'json'

class FotaServer < Sinatra::Base
  get '/system' do
    content_type :json

    file_path = 'REVISION'
    if File.exist?(file_path)
      content = File.read(file_path)  
      { revision: content }.to_json
    else
      status 404
      { error: 'Revision information unavailable' }.to_json
    end
  end

  get '/manifest' do
    content_type :json

    file_path = '/apps/fotasrv/shared/fota_manifest.json'
    if File.exist?(file_path)
      content = File.read(file_path)
      content
    else
      status 404
      { error: 'Firmware manifest file not found' }.to_json
    end
  end

  get '/firmware' do
    
  end
end
