class CreateRefreshTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :refresh_tokens do |t|
      t.string :token_value
      t.integer :user_id
      t.timestamps
    end
  end
end
