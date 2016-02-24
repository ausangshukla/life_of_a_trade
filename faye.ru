# Start using the following command
# rackup faye.ru -s thin -E production

require 'faye'
Faye::WebSocket.load_adapter('thin')

app = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)

app.on(:publish) do |client_id, channel, data|
  puts "#{channel} recvd #{data}"
end

run app