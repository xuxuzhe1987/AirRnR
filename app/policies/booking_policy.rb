class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def mybookings?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

end
