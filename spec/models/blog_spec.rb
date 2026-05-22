require 'spec_helper'

describe Blog do
  it 'find_by_tag gets tags by name' do
    Blog.find_by_tag('first').should be 1
  end
  
end
