class AddTagListToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :tag_list, :string
  end
end
