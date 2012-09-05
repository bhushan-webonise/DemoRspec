# spec/models/user_spec.rb
require 'spec_helper'

describe Post do
  it "should be valid" do
    @post = Factory.build(:post)
    @post.should be_valid
  end

  it "should respond to comments" do
    post = Factory.build(:post)
    post.should respond_to(:comments)
  end

  it "should have many comments" do
    post = Post.reflect_on_association(:comments)
    post.macro.should == :has_many
  end
end