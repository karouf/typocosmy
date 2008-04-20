class AddCommentAndEmailToErrorModel < ActiveRecord::Migration
  def self.up
    add_column :errors, :comment, :text
    add_column :errors, :email, :string
  end

  def self.down
    remove_column :errors, :comment
    remove_column :errors, :email
  end
end
