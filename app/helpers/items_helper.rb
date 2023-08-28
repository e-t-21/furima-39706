module ItemsHelper
  def del_day_name(del_price_id)
    del_day = DelDay.find(del_price_id)
    del_day.name
  end
end
