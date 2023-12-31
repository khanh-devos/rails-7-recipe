class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Food, buyer_id: user.id
    can :manage, Recipe, author_id: user.id

    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
