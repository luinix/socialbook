require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:content) { "My content" }
  let(:post) { described_class.new({ content: content, publication_datetime: DateTime.now, source: ""}) }

  describe "#tweetable?" do
    context "when content is shorter or equal to 280 characters" do
      let(:content) { "." * 280 }

      it "returns true" do expect(post.tweetable?).to be_truthy end
    end

    context "when content is longer than 280 characters" do
      let(:content) { "." * 281 }

      it "returns false" do expect(post.tweetable?).to be_falsy end
    end
  end
end
