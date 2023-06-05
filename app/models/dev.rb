class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.any? { |freebie| freebie.item_name == item_name }
    end

    def give_away(freebie, dev)
        # if freebie.dev == self
        #     nil
        # else
        #     freebie.update(dev: dev)
        # end
        freebie.update(dev: dev) unless freebie.dev != self
    end
end

