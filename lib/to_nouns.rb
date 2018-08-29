# frozen_string_literal: true

require 'natto'
require 'to_nouns/version'

module ToNouns
  refine String do
    def to_nouns(general: false)
      append = general ? ',一般' : nil
      nouns  = []

      Natto::MeCab.new.parse(to_s) do |n|
        next unless n.feature =~ /名詞#{append}/
        nouns << n.surface
      end

      nouns
    end
  end
end
