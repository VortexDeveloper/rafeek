require 'test_helper'

class TicketControllerTest < ActionDispatch::IntegrationTest
  test "should get purchase" do
    get ticket_purchase_url
    assert_response :success
  end

end
