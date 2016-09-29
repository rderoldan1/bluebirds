class CreateElements < ActiveRecord::Migration[5.0]
  def change
    create_table :elements do |t|
      t.string :dom_type
      t.text :content
      t.belongs_to :index, foreign_key: true

      t.timestamps
    end
  end
end
