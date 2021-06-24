class CreateQuotations < ActiveRecord::Migration[6.1]
  def change
    create_table :quotations do |t|
      t.string :detail_tattoo
      t.string :detail_body
      t.string :centimeter
      t.boolean :approved
      t.integer :amount

      t.timestamps
    end
  end
end