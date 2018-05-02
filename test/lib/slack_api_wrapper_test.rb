require 'test_helper'

describe SlackApiWrapper do

  it "Can send valid message to real channel" do
    VCR.use_cassette("channels") do
      message = "test message"

      response = SlackApiWrapper.send_message("CAGCPB64A", message)

      # or test response.must_equal true
      response["ok"].must_equal true
      response["message"]["text"].must_equal message
    end
  end

end
