class AddFileToDocs < ActiveRecord::Migration[5.0]
  def change
    add_column :docs, :file, :string
  end
end
