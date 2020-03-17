class CreateBoosts < ActiveRecord::Migration[5.2]
  def change
    create_table :boosts do |t|
      t.string :queue
      t.string :current_rank
      t.string :desired_rank
      t.references :riot_account, foreign_key: true

      t.timestamps
    end
  end
end
