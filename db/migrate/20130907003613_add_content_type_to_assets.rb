class AddContentTypeToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :content_type, :string
  end
end
