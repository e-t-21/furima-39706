require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it '必要な情報を適切に入力すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it '商品の説明が空では登録できない' do
        @item.message = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Message can't be blank"
      end
      it 'カテゴリーが空では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態が空では登録できない' do
        @item.item_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item status can't be blank"
      end
      it '配送料の負担が空では登録できない' do
        @item.del_price_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Del price can't be blank"
      end
      it '発送元の地域が空では登録できない' do
        @item.perfectue_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Perfectue can't be blank"
      end
      it '発送までの日数が空では登録できない' do
        @item.del_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Del day can't be blank"
      end
      it '販売価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '販売価格が10000000以上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it '販売価格が299以下だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '100-00'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
