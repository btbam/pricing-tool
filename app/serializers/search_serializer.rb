# SearchSerializer
class SearchSerializer < ActiveModel::Serializer
  attributes :name, :duns_number, :city, :state
end
