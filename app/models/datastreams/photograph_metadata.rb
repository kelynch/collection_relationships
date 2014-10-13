class Datastreams::PhotographMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "fields")
    t.title index_as: :stored_searchable
    t.description(:index_as=>[:facetable, :sortable, :stored_searchable], :type=>:string)
    t.creator(:index_as=>[:facetable, :sortable, :stored_searchable], :type=>:string)

  end

  def self.xml_template
    Nokogiri::XML.parse("<fields/>")
  end

  def prefix
    '' # add a prefix for solr index terms if you need to namespace identical terms in multiple data streams 
  end

end