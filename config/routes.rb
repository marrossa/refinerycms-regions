Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :regions do
    resources :regions, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :regions, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :regions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
