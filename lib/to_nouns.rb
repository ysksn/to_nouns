require 'natto'
require 'to_nouns/version'

module ToNouns
  REQUIRED_METHOD_NAME = :to_s
  METHOD_NAME          = :to_nouns

  def self.append_features(klass)
    unless klass.instance_methods.include? REQUIRED_METHOD_NAME
      raise NoMethodError, "##{REQUIRED_METHOD_NAME} is required!"
    end

    if klass.instance_methods.include? METHOD_NAME
      raise NameError, "##{METHOD_NAME} has already defined!"
    end

    super
  end

  def self.included(klass)
    klass.class_exec do
      define_method(METHOD_NAME) do |general: false|
        nouns  = []
        append = general ? ',一般' : nil

        Natto::MeCab.new.parse(to_s) do |n|
          next unless n.feature =~ /名詞#{append}/
          nouns << n.surface
        end

        nouns
      end
    end
  end
end
