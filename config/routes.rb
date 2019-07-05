Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      post '/areas', to: 'api#areas'
      post '/inside_checker/:id', to: 'api#inside_checker'
    end
    namespace 'v2' do

    end
  end
end
