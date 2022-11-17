class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.bigint :user_id, null: false, index: true
      t.bigint :post_id, null: false, index: true

      t.timestamps
    end

    add_foreign_key(:comments, :posts)
    add_foreign_key(:comments, :users)
  end
end
