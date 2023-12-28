require 'sinatra'
require 'json'

class FotaServer < Sinatra::Base
  get '/system' do
    file_path = 'REVISION'
    if File.exist?(file_path)
      content = File.read(file_path)
      content_type :json
      { revision: content }.to_json
    else
      status 404
      { error: 'Revision information unavailable' }.to_json
    end
  end

  get '/manifest' do
    file_path = '/apps/fotasrv/shared/manifest.json'

    if File.exist?(file_path)
      content = File.read(file_path)
      content_type :json
      content
    else
      status 404
      { error: 'Firmware manifest file not found' }.to_json
    end
  end

  get '/firmware' do
    'Firmware route - under construction'
  end
end
