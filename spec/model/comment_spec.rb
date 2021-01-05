require 'rails_helper'

describe Comment do
  describe '#create' do

    it "コメントが空欄の場合は送信できない" do
      comment = build(:comment, comment: "")
      comment.valid?
      expect(comment.errors[:comment]).to include("コメントを記入してください。")
    end
    
  end
end
