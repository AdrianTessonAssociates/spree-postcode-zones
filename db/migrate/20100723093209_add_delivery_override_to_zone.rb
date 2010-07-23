class AddDeliveryOverrideToZone < ActiveRecord::Migration
  def self.up
    add_column :postcode_lists, :price, :decimal
  end

  def self.down
    remove_column :postcode_lists, :price
  end
end
