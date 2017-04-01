module V1
  class People < Grape::API
    resource :people do

      # GET /v1/people
      desc 'api.'
      get do
        p 'api'
      end
    end
  end
end
