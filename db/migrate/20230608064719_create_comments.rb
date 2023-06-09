class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.text :content # コンテンツ（コメント内容）
      t.references :prototype, foreign_key: true # prototypeデータ用の外部キー
      t.references :user, foreign_key: true # userデータ用の外部キー

      t.timestamps
    end
  end
end
