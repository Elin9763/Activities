class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)
    @item.save

    redirect_to list_path(@list)
  end

  private

    def item_params
      params.require(:item).permit(:description)
    end

end
