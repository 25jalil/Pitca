class AddCreatedatToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :created_at, :datetime
    add_column :orders, :rendition, :boolean, default: false
  end
end
