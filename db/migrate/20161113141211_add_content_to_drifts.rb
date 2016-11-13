class AddContentToDrifts < ActiveRecord::Migration
  def change
    add_column :drifts, :content, :text
  end
end
