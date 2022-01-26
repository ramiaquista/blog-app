class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new if user.nil?
    if user.role.nil? ## A nil value will set to default users
      can :manage, Post, user_id: user.id
      can :manage, Comment, user_id: user.id
    else ## Admin role
      can :manage, Post
      can :manage, Comment
    end
  end
end
