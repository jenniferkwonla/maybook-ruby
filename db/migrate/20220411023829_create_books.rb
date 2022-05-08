class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :category1
      t.string :category2
      t.string :category3
      t.string :description1
      t.string :description2
      t.string :description3
      t.timestamps :createdate
      
      t.timestamps
    end
  end
end
