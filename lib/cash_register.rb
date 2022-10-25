class CashRegister
    attr_reader :discount, :total , :price, :quantity, :title, :items   #read only
    attr_accessor :accumulated_price #reads and writes
    def initialize (discount=0)
        @total = 0
        @discount = discount
        @items = []
         @accumulated_price = 0
    end
    def total=(total)
    @total = total
    end
    def add_item(title, price, quantity=1)
        self.accumulated_price = price * quantity
        self.total += self.accumulated_price
        quantity.times {self.items << title}

    end 
    def apply_discount
        if self.discount > 0
        self.total = self.total - (self.total * self.discount/100)
        "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end
    def void_last_transaction
    self.total -= self.accumulated_price
    end
end
purchasing = CashRegister.new