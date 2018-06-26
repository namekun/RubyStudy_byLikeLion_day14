Rails.application.routes.draw do
  post 'posts/:id/comments/create' => 'comments#create' # 댓글을 생성하는 것
  delete 'comments/:id' => 'comments#destroy' # 댓글 삭제하는 것.
  
  get 'comments/destroy' 
  root 'posts#index'
  resources :posts  # posts가 아니라 post면 controller에서도 post여야한다.
end
