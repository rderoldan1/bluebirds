class ExtractContentJob < ApplicationJob
  queue_as :default

  def perform(index_id)
    index = Index.find(index_id)
    index.status = 'Processing'
    index.save
    logger.info "Processing #{index.url}"
    index.elements.create(IndexContent.parse(index.url))
    index.status ='Finished'
    index.save
  end
end
