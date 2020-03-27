class AddColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :access_counter, :integer, default: 0
  end
end
