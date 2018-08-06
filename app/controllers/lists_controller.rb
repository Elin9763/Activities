class ListsController < ApplicationController

    def index 
        @list = List.new #<-- the new form(def new)
        @lists = List.all
    end

    def show
        #data passed by user // /lists/:id thanks to params[:id]
        @list = List.find(params[:id])
        @item = Item.new
    end

    def create
        @list = List.new(list_params)
        if @list.save
            redirect_to list_url(@list)
        else
            @lists = List.all 
            render :index
        end
    end

    private

        def list_params #strong params
            params.require(:list).permit(:name)
        end

end
