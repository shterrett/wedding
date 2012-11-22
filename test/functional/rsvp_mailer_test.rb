require 'test_helper'

class RsvpMailerTest < ActionMailer::TestCase
  test "rsvp_success" do
    mail = RsvpMailer.rsvp_success
    assert_equal "Rsvp success", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
