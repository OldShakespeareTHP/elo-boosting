class CreateBoosts < ActiveRecord::Migration[5.2]
  def change
    create_table :boosts do |t|
      t.string :queue, null: false, default: ""
      t.string :current_rank, null: false, default: ""
      t.string :desired_rank, null: false, default: ""
      t.references :riot_account, foreign_key: true

      t.timestamps
    end
  end
end
