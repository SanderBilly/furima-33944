require 'rails_helper'

RSpec.describe "コメント投稿", type: :system do
  before do
    @item = FactoryBot.create(:item)
    @comment = Faker::Food.description
  end

  it 'ログインしたユーザーは商品詳細ページでコメント投稿できる' do
    sign_in(@item.user)
    visit item_path(@item)
    fill_in 'comment_text', with: @comment
    expect{
      find('input[name="commit"]').click
    }.to change { Comment.count }.by(1)
    expect(current_path).to eq item_path(@item)
    expect(page).to have_content @comment
  end
end
