class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.string :url
      t.references :department, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
