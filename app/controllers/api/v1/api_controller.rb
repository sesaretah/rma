module Api::V1
  class ApiController < ApplicationController
    skip_before_action :verify_authenticity_token
    def areas
      geom = RGeo::GeoJSON.decode(params)
      if geom.blank?
        render :json => {result: 'ERROR', message: 'Invalid GeoJSON type'}.to_json
      else
        @id = SecureRandom.hex(4)
        File.open("public/#{@id}.json","w") do |f|
          f.write(params.to_json)
        end
        render :json => {result: 'OK', id: @id, message: 'GeoJSON recieved save id for feature correspondence'}.to_json
      end
    end

    def inside_checker
      areas = File.read("public/#{params[:id]}.json")
      containers = RGeo::GeoJSON.decode(areas)
      point = RGeo::GeoJSON.decode(params)
      @flag = false
      for container in containers
        if container.geometry.contains?(point)
          @flag = true
        end
      end
      render :json => {result: 'OK', inside: @flag}.to_json
    end
  end
end
