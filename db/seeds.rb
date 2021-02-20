# タグ付紐付け(%w()の中に記述)
array = %w(HIPHOP LOCK POP JAZZ PUNKING SOUL BRAKE GIRLS 撮影モデル エキストラ 東京 神奈川 埼玉 千葉 5000円 10000円 15000円 20000円 25000円 30000円 リモート可能 積極募集 Youtube広告)
array.each{ |tag|
  tag_list = ActsAsTaggableOn::Tag.new
  tag_list.name = tag
  tag_list.save
}