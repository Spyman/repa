require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it "open new post form" do
    get :new
    expect(response).to be_success
  end

  it "create new post" do
    text_post = FactoryGirl.attributes_for(:post)
    post :create, post: text_post
    expect(response).to redirect_to (post_path(assigns[:post]))
  end

  it "show all posts" do
    get :index
    expect(response).to be_success
  end

  it "show one post" do
    text_post = FactoryGirl.create(:post)
    FactoryGirl.create(:state)
    get :show, id: text_post.id
    expect(response).to be_success
  end

  it "remove post" do
    text_post = FactoryGirl.create(:post)
    delete :destroy, id: text_post.id
    expect(Post.find_by_id(text_post.id)).to eq(nil)
    expect(response).to redirect_to (posts_path)
  end

  it 'edit post form' do
    text_post = FactoryGirl.create(:post)
    get :edit, id: text_post.id
    expect(response).to be_success
  end

  it 'update post' do
    text_post = FactoryGirl.create(:post)
    prev_updated_at = text_post.updated_at

    put :update, :id => text_post.id, :post => FactoryGirl.attributes_for(:post)

    text_post.reload
    expect(text_post.updated_at).not_to eq(prev_updated_at)
  end
end
