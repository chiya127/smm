module V1
  class Root < Grape::API
    # http://localhost:3000/v1/
    version 'v1'
    format :json

    mount V1::People
    #mount V1::Products
  end
end
