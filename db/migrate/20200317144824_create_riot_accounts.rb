class CreateRiotAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :riot_accounts do |t|
      t.string :username
      t.string :password
      t.string :server
      t.belongs_to :user

      t.timestamps
    end
  end
end
