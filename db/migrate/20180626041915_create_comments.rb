class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :post_id # post 테이블과 연결하기 위한 외래키

      t.timestamps
    end
  end
end
