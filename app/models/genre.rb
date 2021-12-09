class Genre < ApplicationRecord
  require 'mechanize'

  belongs_to :user

  AGENT = Mechanize.new
  BASE_URL = 'https://yomikatawa.com/kanji/'

  def self.grouping_genres
    Genre.all.group_by do |genre|
      name = genre.name
      if genre.name.match(/[一-龠々]/)
        name = AGENT.get(BASE_URL + genre.name).search('#content p').first.inner_text
      end

      case name[0]
      when /[ぁ-お]/
        'あ'
      when /[か-ご]/
        'か'
      when /[さ-ぞ]/
        'さ'
      when /[た-ど]/
        'た'
      when /[な-の]/
        'な'
      when /[は-ぽ]/
        'は'
      when /[ま-も]/
        'ま'
      when /[ゃ-よ]/
        'や'
      when /[ら-ろ]/
        'ら'
      when /[ゎ-を]/
        'わ'
      else
        name[0]
      end
    end
  end
end
