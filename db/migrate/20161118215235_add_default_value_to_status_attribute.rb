class AddDefaultValueToStatusAttribute < ActiveRecord::Migration
  def up
    change_column :poems, :status, :string, :default => "Pending"
  end

  def down
    change_column :peoms, :status, :string, :default => nil
  end
end
