class CreateBookstacks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookstacks do |t|
      t.text :books
      t.text :userids

      t.timestamps
    end
  end
end
