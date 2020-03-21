class CreateWidgets < ActiveRecord::Migration[6.0]
  def change
    create_table :widgets do |t|
      t.string :name
      t.string :description
      t.string :kind
      t.references :user

      t.timestamps
    end
  end
end
