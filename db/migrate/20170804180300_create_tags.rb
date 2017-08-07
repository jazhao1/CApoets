class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :status
      t.integer :popularity
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
