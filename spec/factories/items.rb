FactoryBot.define do
  factory :item do
    item_name {'物の名前'}
    message {'出品物の詳細'}
    price {'10000'}
    category_id {'2'}
    item_status_id {'2'}
    del_price_id {'2'}
    perfectue_id {'2'}
    del_day_id {'2'}
    association :user, factory: :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end