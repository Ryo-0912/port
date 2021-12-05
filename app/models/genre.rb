class Genre < ApplicationRecord
  require 'mechanize'

  belongs_to :user

  AGENT = Mechanize.new
  BASE_URL = 'https://yomikatawa.com/kanji/'

  def to_hiragana(kanji)
    AGENT.get(BASE_URL + kanji).search('#content p').first.inner_text
  end

  def to_romaji(kanji)
    AGENT.get(BASE_URL + kanji).search('#content p')[1].inner_text
  end

  # 検索結果が正しくない可能性がある時、alertがでるのでそれを所得するメソッド
  # ひらがな所得時に確実性をもたせたい時に使う。
  def certain?(kanji)
    AGENT.get(BASE_URL + kanji).search('.alert').empty?
  end

end
