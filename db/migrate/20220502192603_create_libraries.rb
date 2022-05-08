class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :userid
      t.text :books

      t.timestamps
    end
  end
end
