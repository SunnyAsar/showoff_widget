class CreateWids < ActiveRecord::Migration[6.0]
  def change
    create_table :wids do |t|
      t.string :userId
      t.string :title
      t.string :completed

      t.timestamps
    end
  end
end
