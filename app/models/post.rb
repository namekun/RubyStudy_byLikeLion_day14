class Post < ApplicationRecord
    mount_uploader :image_path, ImageUploader # image_path라는 곳에 이미지 주소를 저장할 것이다.
    has_many :comments
    belongs_to :user
    belongs_to :daum
end
