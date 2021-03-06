class ReadingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:sensor, sensor: :home).where('homes.owner_id': user.id)
    end
  end

  private

  def owned_by_current_user?
    record.sensor.home.owner_id == user.id
  end
end
