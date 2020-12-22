# タグ付紐付け(%w()の中に記述)
array = %w(ダンス 歌 撮影モデル サロン・カットモデル 演技 マジック アイドリング エキストラ 楽器演奏 リモート可能 東京 神奈川 埼玉 千葉 群馬 茨城 兵庫 北海道 大阪 京都 愛知 福岡 5000円~ 10000円~ 15000円~ 20000円~ 25000円~ 30000円~ 積極募集 Youtube広告モデル)
array.each{ |tag|
  tag_list = ActsAsTaggableOn::Tag.new
  tag_list.name = tag
  tag_list.save
}