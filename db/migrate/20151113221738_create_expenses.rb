class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.text :parties

      t.timestamps null: false
    end
  end
end
