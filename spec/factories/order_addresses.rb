FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    perfectue_id { '2' }
    city_town_village { '川越市' }
    street_address { '神泉1-22-3' }
    building_name { 'アジアビル9F' }
    phone { '09012345678' }
    item_id { '1' }
    user_id { '1' }
  end
end
