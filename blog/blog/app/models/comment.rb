class Comment < ActiveRecord::Base
  has_closure_tree
  belongs_to :post
  validates :text, presence: true
end
