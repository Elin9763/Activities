class ListsController < ApplicationController

    def index 
        @list = List.new #<-- the new form(def new)
        @lists = List.all
    end

    def show
        #data passed by user // /lists/:id thanks to params[:id]
        @list = List.find(params[:id])
        @item = @list.items.build
    end

    def create
        @list = List.new(list_params)
        @list.name = params[:list][:name]
        @list.save

        redirect_to list_url(@list)
    end

    private

        def list_params #strong params
            params.require(:list).permit(:name)
        end

end
