module ItemsHelper
    def li_class_for_item(item)
        "completed" if item.complete?
    end

    def li_for_item(item)
        content_tag_for :li, item, :class => li_class_for_item(item) do
            yield
        end
    end

end
