require 'rails_helper'

RSpec.describe "newsletters/index", type: :view do
  before(:each) do
    assign(:newsletters, [
      Newsletter.create!(),
      Newsletter.create!()
    ])
  end

  it "renders a list of newsletters" do
    render
  end
end
