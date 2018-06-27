Rails.application.routes.draw do
  
  root 'cafes#index'
  
  resources :posts  # posts가 아니라 post면 controller에서도 post여야한다.
  post 'posts/:id/comments/create' => 'comments#create' # 댓글을 생성하는 것
  delete 'comments/:id' => 'comments#destroy' # 댓글 삭제하는 것.
  
  # cafe
  resources :cafes, except: [:destroy] # only로 필요한 기능만 뽑아내는 것도 가능
  post '/join_cafe/:cafe_id' => 'cafes#join_cafe', as: 'join_cafe' # as옵션으로 prefix 강제 할당
  
  
    
  
  # authenticate
  get '/sign_up' => 'authenticate#sign_up'
  post '/sign_up' => 'authenticate#user_sign_up'
  get '/sign_in' => 'authenticate#sign_in'
  post '/sign_in' =>'authenticate#user_sign_in'
  delete '/sign_out' => 'authenticate#sign_out'
  get '/user_info/:user_name' => 'authenticate#user_info'
  
end

  