# spec/models/user_spec.rb
require 'spec_helper'

describe Comment do
  it "should respond to post" do
    comment = Factory.build(:comment)
    comment.should respond_to(:post)
  end

  it "should belongs to post" do
    comment = Comment.reflect_on_association(:post)
    comment.macro.should == :belongs_to
  end
end