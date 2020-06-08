class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    true
  end
  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def new?
    true
  end
end

# TODO: delete me?
