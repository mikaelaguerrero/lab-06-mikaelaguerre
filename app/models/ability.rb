class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :create, Message
    can [:update, :destroy], Message, user_id: user.id
    can :read, Chat, sender_id: user.id
    can :read, Chat, receiver_id: user.id
    can :create, Chat
    can [:update, :destroy], Chat, sender_id: user.id
    can [:read, :update, :destroy], User, id: user.id

  end
  
end
