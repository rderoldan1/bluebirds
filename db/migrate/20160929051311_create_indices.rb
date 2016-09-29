class CreateIndices < ActiveRecord::Migration[5.0]
  def change
    create_table :indices do |t|
      t.text :url
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
