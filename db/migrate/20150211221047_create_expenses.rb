class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.date :for_month

      t.timestamps
    end
  end
end
