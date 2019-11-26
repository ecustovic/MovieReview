class ChangeDataTypeForAdmin < ActiveRecord::Migration[6.0]
  def self.up
    add_column :users, :role, :integer, default: 0

    User.all.each do |user|
      if user.admin
        user.role = :admin
        user.save
      end
    end
  end

  def self.down
    remove_column :users, :role
  end
end
