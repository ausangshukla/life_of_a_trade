class Ability
  include CanCan::Ability
  def initialize(user)

    if(!user)
      @user =  User.new
    else
      @user = user
    end

    case @user.role

    when "Contestant"
      contestant_privilages
    when "Team Admin"
      team_admin_privilages
    when "Contest Admin"
      contest_admin_privilages
    when "Super User"
      super_user_privilages
    else
      guest_privilages
    end

  end

  def guest_privilages
    can [:read, :search], :all
  end

  def contestant_privilages
    guest_privilages
    
    can [:manage], Trade, :team_id=>@user.team_id
    can [:read], Position, :team_id=>@user.team_id
    can [:manage], User, :id=>@user.id
    can [:read, :search], User, :team_id=>@user.team_id   
         
  end

  def team_admin_privilages
    contestant_privilages
    
    can [:manage], User, :team_id=>@user.team_id
      
  end
  
  def contest_admin_privilages
    team_admin_privilages
    
    can [:read], Position, :contest_id => @user.contest_id
    can [:read], Trade, :contest_id => @user.contest_id
    can [:manage], Team, :contest_id => @user.contest_id
    can [:create], Contest
    can [:manage], Contest, :id => @user.contest_id
    
    can [:manage], User, :contest_id => @user.contest_id
    can [:read], User, :contest_id => @user.contest_id
    can [:manage], Customer  
    can [:manage], Security
      
  end
  
  def super_user_privilages   
    can [:read, :manage], :all
  end

end

