require 'sinatra'
require 'json'
require 'rack'

class FotaServer < Sinatra::Base
  use Rack::Auth::Basic, "Restricted" do |username, password|
    username == ENV['FOTASRV_USERNAME'] && password == ENV['FOTASRV_PASSWORD']
  end

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

  # perhaps let NGINX handle this
  get '/firmware/:binary' do
    puts "Firmware binary: #{params[:binary]}"

    file_path = "/apps/fotasrv/shared/firmware/#{params[:binary]}"
    if File.exist?(file_path)
      send_file file_path, disposition: 'attachment'
    else
      status 404
      { error: 'Firmware binary not found' }.to_json
    end
  end
end
