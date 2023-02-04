require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "バリデーション" do
    subject { comment.valid? }

    context "データが条件を満たすとき" do
      let(:comment) { build(:comment) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end

    context "content が空のとき" do
      let(:comment) { build(:comment, content: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(comment.errors.messages[:content]).to include "を入力してください"
      end
    end

    context "content が501文字以上のとき" do
      let(:comment) { build(:comment, content: "a" * 501) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(comment.errors.messages[:content]).to include "は500文字以内で入力してください"
      end
    end

    # context "recommend_point が空のとき" do
    #   let(:post) { build(:post, recommend_point: "") }
    #   it "エラーが発生する" do
    #     expect(subject).to eq false
    #     expect(post.errors.messages[:recommend_point]).to include "を入力してください"
    #   end
    # end

    # context "recommend_point が501文字以上のとき" do
    #   let(:post) { build(:post, recommend_point: "a" * 501) }
    #   it "エラーが発生する" do
    #     expect(subject).to eq false
    #     expect(post.errors.messages[:recommend_point]).to include "は500文字以内で入力してください"
    #   end
    # end

    # context "situation が31文字以上のとき" do
    #   let(:post) { build(:post, situation: "a" * 31) }
    #   it "エラーが発生する" do
    #     expect(subject).to eq false
    #     expect(post.errors.messages[:situation]).to include "は30文字以内で入力してください"
    #   end
    # end

    # context "area が31文字以上のとき" do
    #   let(:post) { build(:post, area: "a" * 31) }
    #   it "エラーが発生する" do
    #     expect(subject).to eq false
    #     expect(post.errors.messages[:area]).to include "は30文字以内で入力してください"
    #   end
    # end

    # context "投稿が削除されたとき" do
    #   subject { post.destroy }
    #   let(:post) { create(:post) }
    #   before do
    #     create_list(:like, 1, post: post)
    #     create(:like)
    #     create_list(:comment, 1, post: post)
    #     create(:comment)
    #   end

    #   it "その投稿のいいねも削除される" do
    #     expect { subject }.to change { post.likes.count }.by(-1)
    #   end

    #   it "その投稿のコメントも削除される" do
    #     expect { subject }.to change { post.comments.count }.by(-1)
    #   end
    # end
  end
end
