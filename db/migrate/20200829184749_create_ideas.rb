class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.string :content
      t.integer :impact
      t.integer :ease
      t.integer :confidence
      t.integer :user_id
      t.timestamps
    end
  end
end
