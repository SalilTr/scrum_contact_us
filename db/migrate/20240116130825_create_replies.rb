# db/migrate/[timestamp]_create_replies.rb

class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.references :contact, foreign_key: true
      t.string :description
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :contact_type
      t.text :content

      t.timestamps
    end
  end
end
