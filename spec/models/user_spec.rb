require "rails_helper"

RSpec.describe User, type: :model do
  describe "バリデーション" do
    subject { user.valid? }

    context "データが条件を満たすとき" do
      let(:user) { build(:user) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end

    context "name が空のとき" do
      let(:user) { build(:user, name: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:name]).to include "を入力してください"
      end
    end

    context "name が31文字以上のとき" do
      let(:user) { build(:user, name: "a" * 31) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:name]).to include "は30文字以内で入力してください"
      end
    end
    context "email が空のとき" do
      let(:user) { build(:user, email: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "を入力してください"
      end
    end
    context "email が256文字以上のとき" do
      let(:user) { build(:user, email: "a" * 256) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "は255文字以内で入力してください"
      end
    end
    context "email がすでに存在するとき" do
      before { create(:user, email: "test@example.com") }
      let(:user) { build(:user, email: "test@example.com") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "はすでに存在します"
      end
    end
    context "email が アルファベット･英数字 のみのとき" do
      let(:user) { build(:user, email: Faker::Lorem.characters(number: 16)) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "は不正な値です"
      end
    end
    context "password が空のとき" do
      let(:user) { build(:user, password: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:password]).to include "を入力してください"
      end
    end
    context "password が5文字以下のとき" do
      let(:user) { build(:user, password: "a" * 5) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:password]).to include "は6文字以上で入力してください"
      end
    end
    context "address が31文字以上のとき" do
      let(:user) { build(:user, address: "a" * 31) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:address]).to include "は30文字以内で入力してください"
      end
    end
    context "go_to_area が31文字以上のとき" do
      let(:user) { build(:user, go_to_area: "a" * 31) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:go_to_area]).to include "は30文字以内で入力してください"
      end
    end
    context "like_situation が31文字以上のとき" do
      let(:user) { build(:user, like_situation: "a" * 31) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:like_situation]).to include "は30文字以内で入力してください"
      end
    end
  end

  context "ユーザーが削除されたとき" do
    subject { user.destroy }
    let(:user) { create(:user) }
    before do
      create_list(:post, 2, user: user)
      create(:post)
    end
    it "そのユーザーの投稿も削除される" do
      expect { subject }.to change { user.posts.count }.by(-2)
    end
  end
end
