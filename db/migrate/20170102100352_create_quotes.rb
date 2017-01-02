class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :body
      t.string :author
      t.integer :mood_id
      t.string :quote_type

      t.timestamps

    end
  end
end
