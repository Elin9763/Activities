class ListsController < ApplicationController
    before_action :authentication_required

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

    def update
        @list = List.find(params[:id])
        @list.update(list_params)
    
        redirect_to list_path(@list)
    end

    def destroy
        @list.destroy

        redirect_to list_path(@list)
    end

    private

        def list_params #strong params
            params.require(:list).permit(:name)
        end

end
