class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    true
    # user == record.user
    # @record.user == @user
  end

  def destroy?
    true
  end

end
