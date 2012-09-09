class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :orders, :payment_type, :payment_type_id
    change_column :orders, :payment_type_id, :integer
  end

  def down
    change_column :orders, :payment_type_id, :string
    rename_column :orders, :payment_type_id, :payment_type
  end
end
