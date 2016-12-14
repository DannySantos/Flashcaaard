Elasticsearch::Model.client = Elasticsearch::Client.new({url: ENV['BONSAI_URL'], logs: true})
