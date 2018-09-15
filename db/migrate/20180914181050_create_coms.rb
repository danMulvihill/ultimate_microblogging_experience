class CreateComs < ActiveRecord::Migration[5.2]
  def change
    create_table :coms do |t|
      t.string :content
      t.string :post_id
      t.string :user_id

      t.timestamps
    end
  end
end
