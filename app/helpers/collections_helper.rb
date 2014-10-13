module CollectionsHelper
	def set_children_link(document)
		model = model_from_document(document)
		if model == "Collection"
			link_to "Show collection members", "/?q=is_member_of_ssim:info:fedora/#{document.id}"
		end
	end

	def set_collection_link(document)
		model = model_from_document(document)
		coll_name = collection_name(document['is_member_of_ssim'].to_sentence.sub('info:fedora/', '')) if document['is_member_of_ssim']
		if (coll_name) && (model != "Collection")
			link_to "See all members of #{coll_name}", "/?q=is_member_of_ssim:#{document['is_member_of_ssim'].to_sentence if document['is_member_of_ssim']}"
		end
	end

	 # Returns the ActiveFedora model from the Solr document
	def model_from_document(document)
		active_fedora_model = document["active_fedora_model_ssi"]
	end

	def collection_name(collection_id)
		collection_name = get_collection_name(collection_id);
    return collection_name
  end

  def get_collection_name(collection_id)
    collection = ActiveFedora::Base.where(active_fedora_model_ssi: "Collection").where(id: "#{collection_id}").to_a
    return collection.first.title.html_safe
  end

end