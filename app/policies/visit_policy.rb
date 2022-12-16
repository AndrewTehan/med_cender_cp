class VisitPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record, arg)
    @user = user
    @record = record
    @arg = arg
  end

  def index?
    return true if @user.class.to_s == 'Admin'
    return true if @arg == @user
    false
  end

  def show?
    return true if @user.class.to_s == 'Admin'
    return true if @record == @user
    false
  end

  def create?
    return true if @user.class.to_s == 'Admin'
    return true if @record == @user
    false
  end

  def update?
    @user.class.to_s == 'Admin' ? true : false
  end

  def destroy?
    @user.class.to_s == 'Admin' ? true : false
  end
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
