module CollectionsHelper
	def set_children_link(document)
		model = model_from_document(document)
		if model == "Collection"
			link_to "Show all in collection", "/?q=is_member_of_ssim:info:fedora/#{document.id}"
		end
	end

	def set_collection_link(document)
		model = model_from_document(document)
		if model != "Collection"
			link_to "More like this", "/?q=is_member_of_ssim:#{document['is_member_of_ssim'].to_sentence if document['is_member_of_ssim']}"
		end
	end

	# Returns the ActiveFedora model from the Solr document
	def model_from_document(document)
		active_fedora_model = document["active_fedora_model_ssi"]
	end

end