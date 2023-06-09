class Prototype < ApplicationRecord

  belongs_to :user # usersテーブルとのアソシエーション
  has_one_attached :image #

  has_many :comments, dependent: :destroy # commentsテーブルとのアソシエーション
                                          # 関連prototypeデータに付随して削除されるオプション付き。


  with_options presence: true do
    validates :title
    validates :catch_copy
    validates :concept
    validates :image
  end

end
