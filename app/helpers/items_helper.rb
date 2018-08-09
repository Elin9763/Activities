module ItemsHelper
    def li_class_for_item(item)
        "completed" if item.complete?
    end

        
end
