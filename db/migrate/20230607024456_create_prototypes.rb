class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|

      t.string :title # プロトタイプの名称
      t.text :catch_copy # キャッチコピー
      t.text :concept # コンセプト
      t.references :user, foreign_key: true # userデータ用の外部キー

      t.timestamps
    end
  end
end
