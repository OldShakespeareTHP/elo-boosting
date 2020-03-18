class CreateRiotAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :riot_accounts do |t|
      t.string :username, null: false, default: ""
      t.string :password, null: false, default: ""
      t.string :server, null: false, default: ""
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
