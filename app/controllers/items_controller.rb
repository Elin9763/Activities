class ItemsController < ApplicationController
  before_action :authentication_required

  def create
    @item = @list.items.build(item_params)
    @item.user_id = current_user.id
      if @item.save
        @list.items << @item
      end
        redirect_to [current_user, @list]
    end
  end

  def update #patch - /lists/:list_id/items/:item_id
    @item = Item.find(params[:id])
    @item.user_id = current_user.id
      if @item.update(item_params)
        redirect_to list_path(@item.list)
      else
        render "lists/show"
      end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.user_id = current_user.id
      if @item.destroy
        redirect_to list_path(@item.list)
      else
        render "lists/show"
      end
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
