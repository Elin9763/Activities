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

    def destroy
        @list = List.find(params[:id])
        if @list.present?
            @list.destroy
        end
            redirect_to lists_path

    end

    private

        def list_params #strong params
            params.require(:list).permit(:name)
        end

end
