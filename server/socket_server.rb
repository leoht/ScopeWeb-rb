# encoding: utf-8

require 'em-websocket'
require 'json'
require_relative 'client'
require_relative 'message'
require_relative 'association'

module Scope
  class SocketServer

    attr_accessor :clients
    attr_accessor :ongoing_associations
    attr_accessor :completed_associations
    
    def initialize
      @clients = {}
      @ongoing_associations = {}
      @completed_associations = {}
    end

    # Run the websocket server
    def run(port: port)

      EM.run {

        puts " [x] Websocket server started. Listening on port #{port}"

        EM::WebSocket.run(:host => "0.0.0.0", :port => port) do |ws|
          ws.onopen { |handshake|
            client = Client.new(ws)
            @clients[client.id] = client
            ws.client = client
            puts " [x] New client connected : #{client.id}"
          }

          ws.onclose {
            puts " [x] Client disconnected : #{ws.client.id}"
          }

          ws.onmessage { |msg|
            process_message ws, msg
          }
        
        end
      }
    end

    def process_message(from, message)
      message_data = JSON.parse(message)
      message = Scope::Message.from_raw_data(message_data)


      if message.name == MessageTypes::BEGIN_FACEBOOK_ASSOCIATION  || message.name == MessageTypes::BEGIN_CODE_ASSOCIATION

          association = Scope::Association.create_from_message(from, message)
          # puts association.association_code
          # return

          unless association.facebook_id.nil?
              identifier = association.facebook_id
          else
              identifier = association.association_code
          end

          @ongoing_associations[identifier] = association

      elsif message.name == MessageTypes::ASSOCIATE_WITH_FACEBOOK || message.name == MessageTypes::ASSOCIATE_WITH_CODE 

          identifier = message.name == MessageTypes::ASSOCIATE_WITH_CODE ? message.get('code') : message.get('facebook_id')

          puts identifier

          unless @ongoing_associations.has_key?(identifier)
              from.send(JSON.generate({
                :direction => MessageTypes::FROM_PLAYER_TO_DEVICE,
                :name      => MessageTypes::ASSOCIATION_REFUSED
              }))

              return
          end

          association = @ongoing_associations[identifier]

          if association.complete_with_message(from, message)
            register_association association
            @ongoing_associations.delete identifier
          else
            from.send(JSON.generate({
              :direction => MessageTypes::FROM_PLAYER_TO_DEVICE,
              :name      => MessageTypes::ASSOCIATION_REFUSED
            }))
          end

      else

      # For all other messages, a token should be provided
      # If so, we should have at this point a TokenizedMessage instance
      # (provided by the Message::create factory method).
      # Otherwise it means that no token has been provided, and we
      # cannot do anything else without the token.

          unless message.kind_of? Scope::TokenizedMessage
              from.send(JSON.generate({
                :code => 400,
                :message => 'No token information provided.'
              }))

              return
          end

          @completed_associations[message.token].dispatch(message)
      end
      
    end

    def register_association(association)
      association_token = Scope::Association.create_token(association)

      @completed_associations[association_token] = association

      message_json = JSON.generate({
          :direction => MessageTypes::BROADCAST,
          :name      => MessageTypes::ASSOCIATED_WITH_TOKEN,
          :data      => {
              :token    => association_token
          }
      })

      puts "Devices #{association.player_socket.client.id} and #{association.mobile_socket.client.id} now associated with token #{association_token}"

      association.broadcast(message_json)
    end

  end
end