module ItemsHelper
  def del_day_name(del_day_id)
    del_day = DelDay.find(del_day_id)
    del_day.name
  end

  def category_name(category_id)
    category = Category.find(category_id)
    category.name
  end

  def item_status_name(item_status_id)
    item_status = ItemStatus.find(item_status_id)
    item_status.name
  end

  def del_price_name(del_price_id)
    del_price = DelPrice.find(del_price_id)
    del_price.name
  end

  def perfectue_name(perfectue_id)
    perfectue = Perfectue.find(perfectue_id)
    perfectue.name
  end
end
