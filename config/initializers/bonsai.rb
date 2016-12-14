if ENV['BONSAI_URL']
  print "************************************************************************************"
  Elasticsearch::Model.client = Elasticsearch::Client.new({url: ENV['BONSAI_URL'], logs: true})
end