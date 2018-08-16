class Item < ApplicationRecord
    belongs_to :list
    belongs_to :user
    
    validates :description, presence: true

    STATUS = {
        :incomplete => false,
        :complete => true
    }
    
    def complete?
        self.status == STATUS[:complete]
    end

    def incomplete?
        self.status == STATUS[:complete]
    end

    def self.complete
        where(status: true).order('id DESC')
    end

    def self.incomplete
        where(stauts: false).order('id DESC')
    end

end
