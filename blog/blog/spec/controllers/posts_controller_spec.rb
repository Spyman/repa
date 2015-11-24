require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it "open new post form" do
    get :new
    expect(response).to be_success
  end

  it "create new post" do
    text_post = FactoryGirl.attributes_for(:post)
    post :create, post: text_post
    expect(response).to redirect_to (posts_path(assigns[:post]))
  end

  it "show all posts" do
    get :show
    expect(response).to be_success
  end
end
