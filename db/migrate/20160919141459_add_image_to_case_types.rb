class AddImageToCaseTypes < ActiveRecord::Migration
  def change
    add_column :case_types, :image, :string
  end
end
