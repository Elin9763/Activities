class ItemsController < ApplicationController

  def create
    @list = List.find(params[:list_id]) #finding the parent
    @item = @list.items.build(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to list_path(@list)
    else
      render "lists/show"
    end
  end

  def update #patch - /lists/:list_id/items/:item_id
    @item = Item.find(params[:id])
    @item.update(item_params)

    redirect_to list_path(@item.list)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to list_path(@item.list)
  end

  def complete
    Item.where(id: params[:item_ids]).update_all(status: true)
    current_user.items_completed_count +=(params[:item_ids].count)
    current_user.save

    redirect_to_items_path(current_user.id)
  end

  private

    def item_params
      params.require(:item).permit(:description, :status)
    end

end
