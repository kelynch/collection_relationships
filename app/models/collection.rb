class Collection < ActiveFedora::Base
  has_metadata 'descMetadata', type: CollectionMetadata

  has_attributes :title, datastream: 'descMetadata', multiple: false
  has_attributes :about_statement, datastream: 'descMetadata', multiple: false

end