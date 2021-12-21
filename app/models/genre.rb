class Genre < ApplicationRecord
  require 'mechanize'
  require "nkf"

  belongs_to :user
  has_many :questions
  validates :name, presence: true

  attr_accessor :hiragana

  AGENT = Mechanize.new
  BASE_URL = 'https://yomikatawa.com/kanji/'

  def self.grouping_genres
    Genre.all.group_by do |genre|
      name = genre.name
      if genre.name.match(/[一-龠々]/)
        name = AGENT.get(BASE_URL + genre.name).search('#content p').first.inner_text
        genre.hiragana = name 
      elsif genre.name.match(/[ァ-ヴ]/)
        genre.hiragana  = NKF.nkf("-h1 -w", name)
      else
        genre.hiragana = name
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
      when /[ァ-オ]/
        'あ'
      when /[カ-ゴ]/
        'か'
      when /[サ-ゾ]/
        'さ'
      when /[タ-ド]/
        'た'
      when /[ナ-ノ]/
        'な'
      when /[ハ-ポ]/
        'は'
      when /[マ-モ]/
        'ま'
      when /[ャ-ヨ]/
        'や'
      when /[ラ-ロ]/
        'ら'
      when /[ヮ-ヲ]/
        'わ'
      when /[aA]/
        'A'
      when /[bB]/
        'B'
      when /[cC]/
        'C'
      when /[dD]/
        'D'
      when /[eE]/
        'E'
      when /[fF]/
        'F'
      when /[gG]/
        'G'
      when /[hH]/
        'H'
      when /[iI]/
        'I'
      when /[jJ]/
        'J'
      when /[kK]/
        'K'
      when /[lL]/
        'L'
      when /[mM]/
        'M'
      when /[nN]/
        'N'
      when /[oO]/
        'O'
      when /[pP]/
        'P'
      when /[qQ]/
        'Q'
      when /[rR]/
        'R'
      when /[sS]/
        'S'
      when /[tT]/
        'T'
      when /[uU]/
        'U'
      when /[vV]/
        'V'
      when /[wW]/
        'W'
      when /[xX]/
        'X'
      when /[yY]/
        'Y'
      when /[zZ]/
        'Z'
      else
        name[0]
      end
    end
  end
end
