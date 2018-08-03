class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id]) #finding the parent
    @item = @list.items.build(item_params)
    if @item.save
      redirect_to list_path(@list)
    else
      render "lists/show"
    end
  end

  private

    def item_params
      params.require(:item).permit(:description)
    end

end
