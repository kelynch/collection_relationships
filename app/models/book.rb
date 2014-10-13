class Book < ActiveFedora::Base
  has_metadata 'descMetadata', type: Datastreams::BookMetadata

  belongs_to :collection, :property=> :is_member_of, :class_name => "ActiveFedora::Base"

  has_attributes :title, datastream: 'descMetadata', multiple: false
  has_attributes :author, datastream: 'descMetadata', multiple: false
  has_attributes :publisher, datastream: 'descMetadata', multiple: false

end