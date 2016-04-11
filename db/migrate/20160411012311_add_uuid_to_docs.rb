class AddUuidToDocs < ActiveRecord::Migration[5.0]
  def change
    add_column :docs, :uuid, :string
  end
end
