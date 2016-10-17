class CreateShirts < ActiveRecord::Migration[5.0]
  def change
    create_table :shirts do |t|
      t.text :description
      t.datetime :last_worn_at
      t.string :name
      t.string :picture
      t.belongs_to :user

      t.timestamps
    end
  end
end
