# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    company = user.company if user.company_id

    if user.has_role? :admin
      can :[:index, :new, :create, :edit, :update], Product, company: company
      can :[:index, :new, :create, :edit, :update], Category, company: company
      can :[:index, :new, :create, :edit, :update], Order, company: company
    elsif user.has_role? :waiter
      can :[:index, :new, :create, :edit, :update], Order, company: company
      can :[:index, :new, :create, :edit, :update], Product, company: company
    elsif user.has_role? :kitchen
      can :[:index, :new, :create, :edit, :update], Order, company: company
      can :[:index, :new, :create, :edit, :update], Product, company: company
    elsif user.has_role? :till
      can :[:index, :new, :create, :edit, :update], Order, company: company
    end
  end
end
