class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.references :service, null: false, foreign_key: true
      t.string :file_path
      t.text :description

      t.timestamps
    end
  end
end
