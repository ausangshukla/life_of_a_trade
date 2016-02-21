namespace :lot do    
  
  require "faker"
  require 'digest/sha1'  
  require 'factory_girl'  
  # require File.expand_path("spec/factories.rb")
  
  
  desc "Cleans p DB - DELETES everything -  watch out" 
  task :emptyDB => :environment do
  	User.delete_all
  	Trade.delete_all
  	Position.delete_all
  	Security.delete_all
  	Customer.delete_all
  	Contest.delete_all
  	Team.delete_all
  end
  
  
  
  
  desc "generates fake users for testing" 
  task :generateFakeUsers => :environment do

	begin    
  
	    # Now generate some consumers
	    (1..20).each do |j|    
	      u = FactoryGirl.build(:user)
	      u.save
	      puts "User #{u.id}"  
	    end
	    
	    (1..10).each do |j|    
	      u = FactoryGirl.build(:user, role: "Simulation", account_balance: 1000000000)
	      u.save
	      puts "User #{u.id}"  
	    end 
    
    rescue Exception => exception
      puts exception.backtrace.join("\n")
      raise exception
    end
    
  end  
  
  desc "generates fake users for testing" 
  task :generateFakeAdmin => :environment do
    
    begin    
      
      u = FactoryGirl.build(:user, email: "admin@lot.com", password: "admin@lot.com", role: "Super")
      u.save
      puts u.to_xml              
   
    rescue Exception => exception
      puts exception.backtrace.join("\n")
      raise exception
    end
    
  end  
  

    
  desc "generates Securities" 
  task :generateSecurities => :environment do
	(1..50).each do
		FactoryGirl.create(:security)
	end
  end
  
  desc "generates Customers" 
  task :generateCustomers => :environment do
	(1..50).each do
		FactoryGirl.create(:customer)
	end
  end
  
  desc "generates Trades" 
  task :generateTrades => :environment do
  	User.where(role: "Contestant").each do |u|
  		(1..5).each do
  			FactoryGirl.create(:trade, {team_id: u.team_id, user_id: u.id, contest_id: u.contest_id})
  		end
  	end
  end
  
  desc "Generating all Fake Data"
  task :generateFakeAll => [:emptyDB, :generateFakeUsers, :emptyDB, :generateSecurities, :generateCustomers] do
    puts "Generating all Fake Data"
  end
  
 	
end