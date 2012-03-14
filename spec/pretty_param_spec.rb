require 'active_record'
require_relative '../lib/pretty_param'

class TestObject < ActiveRecord::Base
	def title
		"Exciting, yet complicated (!@@&*) title  "
	end
	def name
		"and a name!"
	end
	def id
		14
	end
end

describe PrettyParam do
	let!(:object) { TestObject.new }
	
	it "shouldn't interfere with ActiveRecord without being called" do
		object.to_param.should eq(14)
	end
end