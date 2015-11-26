require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  it "add comment" do
    text_post = FactoryGirl.create(:post)
    comment_attr = FactoryGirl.attributes_for(:comment)
    post :create, comment: comment_attr, post_id: text_post.id
    expect(response).to redirect_to(post_path(text_post.id))
  end

  it "add empty comment" do
    text_post = FactoryGirl.create(:post)
    comment_attr = FactoryGirl.attributes_for(:comment)
    comment_attr[:text] = ""

    post :create, comment: comment_attr, post_id: text_post.id

    expect(Comment.where(text: '').count).to eq(0)
  end


  it "remove comment" do
    comment = FactoryGirl.create(:comment)
    request.env["HTTP_REFERER"] = 'http://localhost:3000/sessions/new'
    delete :destroy, id: comment.id
    expect(response).to have_http_status(302)
    expect(Comment.exists?(comment.id)).to eq(false)
  end
end
