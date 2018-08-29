# frozen_string_literal: true

require 'test_helper'

class ToNounsTest < Minitest::Test
  using ToNouns

  def test_that_it_has_a_version_number
    refute_nil ::ToNouns::VERSION
  end

  def test_it_without_general_nouns
    str = '私の出身地は島根県松江市です。'
    assert_equal %w[私 出身 地 島根 県 松江 市], str.to_nouns
  end

  def test_it_with_general_nouns
    str = '私の出身地は島根県松江市です。'
    assert_equal %w[私 出身], str.to_nouns(general: true)
  end

  def test_it_without_applicable_nouns
    str = ''
    assert_equal [], str.to_nouns
    assert_equal [], str.to_nouns(general: true)
  end
end
