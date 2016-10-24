require 'rails_helper'

RSpec.describe "newsletters/show", type: :view do
  before(:each) do
    @newsletter = assign(:newsletter, Newsletter.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
