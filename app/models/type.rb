class Type < ActiveHash::Base
  include ActiveHash::Associations

  has_many :works

  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'アプリケーション' },
    { id: 2, name: 'デザイン' },
    { id: 3, name: 'アニメーション' },
    { id: 4, name: 'イラスト' },
    { id: 5, name: '絵画' },
    { id: 6, name: '彫刻・立体作品' },
    { id: 7, name: 'その他' },
  ]
end
