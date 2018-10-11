# Company
class Company
  include Elasticsearch::Model
  include ActiveModel::Serialization

  attr_reader :attributes

  def initialize(attributes = {})
    @attributes = attributes
    attributes.each do |key, value|
      singleton_class.class_eval { attr_accessor key }
      send("#{key}=".to_sym, value)
    end
  end

  # TODO: is this method actually used?
  # def to_hash
  #   @attributes
  # end
end
