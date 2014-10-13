class Photograph < ActiveFedora::Base
  has_metadata 'descMetadata', type: Datastreams::PhotographMetadata

  belongs_to :collection, :property=> :is_member_of, :class_name => "ActiveFedora::Base"

  has_attributes :title, datastream: 'descMetadata', multiple: false
  has_attributes :description, datastream: 'descMetadata', multiple: false
  has_attributes :creator, datastream: 'descMetadata', multiple: false

end