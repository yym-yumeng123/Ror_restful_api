class CreateTagSheets < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_sheets do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :sheet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :tag_sheets, [:user_id, :tag_id, :sheet_id], :unique =>  true
  end
end
