class AddReconfirmableToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :unconfirmed_email, :string
  end
end
