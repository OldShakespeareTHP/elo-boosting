class CreateRiotAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :riot_accounts do |t|
      t.string :username
      t.string :password
      t.string :server
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
