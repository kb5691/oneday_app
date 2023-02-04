require "rails_helper"

RSpec.describe PostValuation, type: :model do
  describe "バリデーション" do
    subject { post_valuation.valid? }

    context "データが条件を満たすとき" do
      let(:post_valuation) { build(:post_valuation) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end

    context "access_point が空のとき" do
      let(:post_valuation) { build(:post_valuation, access_point: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(post_valuation.errors.messages[:access_point]).to include "を入力してください"
      end
    end

    context "casually_point が空のとき" do
      let(:post_valuation) { build(:post_valuation, casually_point: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(post_valuation.errors.messages[:casually_point]).to include "を入力してください"
      end
    end

    context "price_point が空のとき" do
      let(:post_valuation) { build(:post_valuation, price_point: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(post_valuation.errors.messages[:price_point]).to include "を入力してください"
      end
    end

    context "go_to_again_point が空のとき" do
      let(:post_valuation) { build(:post_valuation, go_to_again_point: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(post_valuation.errors.messages[:go_to_again_point]).to include "を入力してください"
      end
    end

    context "one_person_point が空のとき" do
      let(:post_valuation) { build(:post_valuation, one_person_point: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(post_valuation.errors.messages[:one_person_point]).to include "を入力してください"
      end
    end
  end
end
