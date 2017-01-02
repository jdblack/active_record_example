class CreateInitialTables < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :first
      t.string :last
      t.string :phone
      t.timestamps

    end
    create_table :locations do |t|
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.string :lat_lon
    end

    add_column :people, :home_address_id, :integer
    add_column :people, :work_address_id, :integer

  end
  def self.down
  end

end
