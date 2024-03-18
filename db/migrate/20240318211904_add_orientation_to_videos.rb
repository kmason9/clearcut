class AddOrientationToVideos < ActiveRecord::Migration[7.1]
  def change
    add_column :videos, :orientation, :string
  end
end
