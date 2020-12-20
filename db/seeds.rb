# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# タグ付紐付け(%w()の中に記述)
array = %w(ダンス サロン・カットモデル 歌 楽器演奏 撮影モデル 演技 エキストラ リモート可能 東京 神奈川 埼玉 千葉 )
array.each{ |tag|
  tag_list = ActsAsTaggableOn::Tag.new
  tag_list.name = tag
  tag_list.save
}
