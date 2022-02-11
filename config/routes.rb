Rails.application.routes.draw do

    scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :feedbacks
    root 'pages#index'
    end
    resource :session, only: %i[new create destroy]     #resourse - т.к. не нужны идентификаторы
    
    resources :users, only: %i[new create edit update]

    resources :questions do                 #вложенные маршруты
      resources :answers, except: %i[index new show]
    end

     get 'sessions/destroy'
    
end
