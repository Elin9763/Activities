class ListsController < ApplicationController

    def index
        @lists = List.all
    end

    def show
        #data passed by user // /lists/:id thanks to params[:id]
        @list = List.find(params[:id])
    end

end
