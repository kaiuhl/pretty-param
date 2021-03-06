require 'rails/all'
require 'pretty_param'

ActiveRecord::Base.establish_connection(adapter: "sqlite3",	database: "spec/test.db")
ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS 'dummies'")
ActiveRecord::Base.connection.create_table(:dummies) do |t|
	t.string :first_name
	t.string :last_name
	t.string :nickname
end

describe ActiveRecord::Base do
	it "should receive #has_pretty_param" do
		ActiveRecord::Base.should respond_to(:has_pretty_param)
	end
end

class Dummy < ActiveRecord::Base
	has_pretty_param :first_name, :last_name
end

describe PrettyParam do
	let(:dummy) { Dummy.create(first_name: "Alex", last_name: "Kiheri", nickname: "AFK") }
	let(:blinged_dummy) { Dummy.create(first_name: "^A%l/ex@#", last_name: "#K+iheri!@") }
	let(:multiple_space_dummy) { Dummy.create(first_name: "Alex ", last_name: " Kiheri") }
	
	it "should add specified attributes to `to_param`" do
		dummy.to_param.should include("alex-kiheri")
	end
	
	it "should filter out symbols and forward slashes" do
		blinged_dummy.to_param.should include("alex-kiheri")
	end
	
	it "should remove multiple hyphens" do
			multiple_space_dummy.to_param.should include("alex-kiheri")
	end
end