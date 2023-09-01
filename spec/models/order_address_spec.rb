require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    @user_id = FactoryBot.build(:user)
    @item_id = FactoryBot.build(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user_id, item_id: @item_id)
  end

  context '内容に問題ない場合' do
    it '必要な情報があれば購入できる' do
      expect(@order_address).to be_valid
    end
    it '建物名が空でも購入できる' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空では購入できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空では購入できない' do
      @order_address.post_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号にハイフン（-）が含まれていないと購入できない' do
      @order_address.post_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it '郵便番号に３桁数字＋ハイフン（-）＋４桁数字でないと購入できない' do
      @order_address.post_code = '12-34567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end

    it '都道府県が空だと購入できない' do
      @order_address.perfectue_id = '1'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Perfectue can't be blank")
    end

    it '市町村が空だと購入できない' do
      @order_address.city_town_village = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City town village can't be blank")
    end

    it '番地が空だと購入できない' do
      @order_address.street_address = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Street address can't be blank")
    end

    it '電話番号が空だと購入できない' do
      @order_address.phone = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が９文字以下だと購入できない' do
      @order_address.phone = '123456'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input 10-11 digits')
    end
    it '電話番号にハイフン（-）を含んでいると購入できない' do
      @order_address.phone = '080-1234-5678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
    end
    it '電話番号が12桁以上では購入できない' do
      @order_address.phone = '123456789012'
      @order_address.valid?
    end

    it 'user_idが空だと購入できない' do
      @order_address.user_id = nil
      @order_address.valid?
    end

    it 'item_idが空だと購入できない' do
      @order_address.item_id = nil
      @order_address.valid?
    end
  end
end
