class AddIpColumnToErrors < ActiveRecord::Migration
  def self.up
    add_column :errors, :author_ip, :string
  end

  def self.down
    remove_column :errors, :author_ip
  end
end
