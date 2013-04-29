require 'spec_helper'

describe "it should route to an admin-namespaced Invitations Controller" do 
  it "routes to admin/invitations" do
    expect(get: "/admin/invitations").to route_to(
      controller: "admin/invitations",
      action: "index"
    )
  end
end

describe "it should route to a non-admin namespaced Invitations Controller" do
  it "routes to invitations" do
    expect(get: "/invitations").to route_to(
      controller: "invitations",
      action: "index"
    )
  end
end