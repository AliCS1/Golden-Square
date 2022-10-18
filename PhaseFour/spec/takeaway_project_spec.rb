require 'takeaway_project.rb'

#As a customer
#So that I can check if I want to order something
#I would like to see a list of dishes with prices.
RSpec.describe 'Creating menu' do
    it 'puts entire list with dishes' do
        io = double(:io)
        message = double(:message)
        expect(io).to receive(:puts).with("Welcome Customer, Here is the menu.")
        expect(io).to receive(:puts).with("1. Burger - £3.00")
        expect(io).to receive(:puts).with("2. Sandwich - £1.50")
        expect(io).to receive(:puts).with("3. Cake - £3.50")
        expect(io).to receive(:puts).with("4. Pepsi - £1.00")
        expect(io).to receive(:puts).with("5. Milkshake - £0.50")

        food_menu = Shop.new(io,message)
        food_menu.menu
    end
end
#As a customer
#So that I can order the meal I want
#I would like to be able to select some number of several available dishes.
RSpec.describe 'ordering items from menu' do
    it 'orders 2 burgers then checks order list' do
        io = double(:io)
        message = double(:message)
        food_order = Shop.new(io,message)
        food_order.order("Burger")
        food_order.order("Burger")
        result = food_order.get_orders
        expect(result).to eq ["Burger",'Burger']
    end
    it 'orders an item not on the menu' do
        io = double(:io)
        message = double(:message)
        food_order = Shop.new(io,message)
        expect{food_order.order('Cookie')}.to raise_error 'This item is not in the menu!'
    end
    it 'orders a sandwich and pepsi' do
        io = double(:io)
        message = double(:message)
        food_order = Shop.new(io,message)
        food_order.order("Sandwich")
        food_order.order("Pepsi")
        result = food_order.get_orders
        expect(result).to eq ["Sandwich","Pepsi"]
    end
end


#As a customer
#So that I can verify that my order is correct
#I would like to see an itemised receipt with a grand total.
RSpec.describe 'test receipt method' do
    it 'adds two items and returns correct price' do
        io = double(:io)
        message = double(:message)
        expect(io).to receive(:puts).with("Your order is:")
        expect(io).to receive(:puts).with("Milkshake - £0.50")
        expect(io).to receive(:puts).with("Cake - £3.50")
        expect(io).to receive(:puts).with("Grand Total - £4.00")

        receipt_order = Shop.new(io,message)
        receipt_order.order('Milkshake')
        receipt_order.order('Cake')
        receipt_order.receipt
    end
    it 'asks for receipt without ordering anything' do
        io = double(:io)
        message = double(:message)
        request_receipt = Shop.new(io,message)
        expect{request_receipt.receipt}.to raise_error "You haven't ordered anything yet!"

    end

end

#As a customer
#So that I am reassured that my order will be delivered on time
#I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

RSpec.describe 'testing the text method' do
    it 'returns a text message' do
        io = double(:io)
        message = double(:message, messages: 2)
        expect(message).to receive(:new).with("AC84c31924b371f4ddf99b4be8d61f346","0d342ba75c9d2de58060d2b3141f109")
        #expect(message).to receive(:messages)

        m = Shop.new(io,message)
        m.SendMessage
    end

end
