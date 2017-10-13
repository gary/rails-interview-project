class AddAccessesToTenant < ActiveRecord::Migration
  def change
    add_column :tenants, :access_count, :int, null: false, default: 0
  end
end
