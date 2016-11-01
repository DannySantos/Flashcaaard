class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    unless user.id.blank?
      can :manage, Flashcard, user_id: user.id
    end
  end
end
