class Asset < ActiveRecord::Base
  mount_uploader :asset, AssetUploader
end
