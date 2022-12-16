class DepartmentPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    return true if user.class.to_s == 'Admin'
    return true if record.doctors.include? user
    false
  end

  def create?
    user.class.to_s == 'Admin' ? true : false
  end

  def update?
    user.class.to_s == 'Admin' ? true : false
  end

  def destroy?
    user.class.to_s == 'Admin' ? true : false
  end
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
