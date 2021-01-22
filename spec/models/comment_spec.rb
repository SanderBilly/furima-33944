require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメントの投稿' do
    context 'コメントを投稿できる場合' do
      it "必要な情報を適切に入力すればコメントを投稿できる" do
        expect(@comment).to be_valid
      end
    end

    context 'コメントを投稿できない場合' do
      it "textが空だとコメントを投稿できない" do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include "コメントを入力してください"
      end
      it 'userが紐付いていない場合コメントを投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Userを入力してください"
      end
      it 'itemが紐付いていない場合コメントを投稿できない' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Itemを入力してください"
      end
    end
  end
end
