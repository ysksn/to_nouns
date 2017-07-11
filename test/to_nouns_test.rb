require 'test_helper'

class String
  include ToNouns
end

class NoToSMethod < BasicObject; end

class AlreadyHasToNouns
  def to_nouns; end
end

####################################
# Test starts here
####################################

class ToNounsTest < Minitest::Test
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

  def test_if_base_class_without_method_to_s
    e = assert_raises NoMethodError do
      NoToSMethod.class_exec do
        include ToNouns
      end
    end

    assert_equal '#to_s is required!', e.message
  end

  def test_if_base_class_has_already_defined_method_to_nouns
    e = assert_raises NameError do
      AlreadyHasToNouns.class_exec do
        include ToNouns
      end
    end

    assert_equal '#to_nouns has already defined!', e.message
  end
end
