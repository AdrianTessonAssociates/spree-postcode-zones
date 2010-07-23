class AddNameToPostcodeList < ActiveRecord::Migration
  def self.up
    add_column :postcode_lists, :name, :string
  end

  def self.down
    remove_column :postcode_lists, :name
  end
end
