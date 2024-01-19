Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end

# If you specifically need the web-based console, add this line to your config/routes.rb file:
if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/rails/letter_opener"
  mount Rails::WebConsole::Engine, at: "/rails/console"
end
