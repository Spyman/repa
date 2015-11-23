require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it "create new post" do
    get :new
    expect(response).to be_success
  end

  it "read post" do
    pending "need to create test for read post"
  end

  it "update post" do
    pending "need to create test for update post"
  end

  it "edit post" do
    pending "need to create test for edit post"
  end
end
