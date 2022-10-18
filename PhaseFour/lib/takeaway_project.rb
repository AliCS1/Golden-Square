require 'twilio-ruby'





class Shop
    def initialize(io,message)
        @io = io
        @message = message
        @menu = {
            "Burger" => 3.00,
            "Sandwich" => 1.50,
            "Cake" => 3.50,
            "Pepsi" => 1.00,
            "Milkshake" => 0.50
        }
        @orders = []
    end

    def menu
        @io.puts("Welcome Customer, Here is the menu.")
        current_item = 1
        @menu.each { |key,value| 
            @io.puts(current_item.to_s + ". " + key + " - " + convert_to_price(value))
            current_item += 1
        }

    end

    def convert_to_price(num)
        s = "£"
        s += num.to_s
        if s[-2] == "."
            s += "0"
        end
        return s
    end

    def get_orders
        return @orders
    end

    def order(item)
        fail 'This item is not in the menu!' if @menu.has_key?(item) == false
        @orders << item
    end

    def receipt
        fail "You haven't ordered anything yet!" if @orders.empty?
        @io.puts("Your order is:")
        cost = 0
        @orders.each {|order| 
            @io.puts(order + " - " + convert_to_price(@menu[order]))
            cost += @menu[order]
        }
        @io.puts("Grand Total - "+ convert_to_price(cost))
    end

    def SendMessage
        account_sid = 'AC84c31924b371f4ddf99b4be8d61f346'
        auth_token = '0d342ba75c9d2de58060d2b3141f109'


        @client = @message.new account_sid, auth_token

        #myLogger = Logger.new(STDOUT)
        #myLogger.level = Logger::DEBUG
        #@client.logger = myLogger
        #@client.messages.create(
        #    from: "+16614662299",
        #    to: '+447306365590',
        #    body:'Thank you! Your order was placed and will be delivered before 11:30'
        #    )
    end

end

#s = Shop.new(Kernel,Twilio::REST::Client)
#s.menu
#s.SendMessage