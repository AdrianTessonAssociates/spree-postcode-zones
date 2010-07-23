class CreatePostcodeLists < ActiveRecord::Migration
  def self.up
    create_table :postcode_lists do |t|
      t.column :postcodes, :string
    end
  end

  def self.down
    drop_table :postcode_lists
  end
end
