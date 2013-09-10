class State < ActiveRecord::Base
  def to_s
    name
  end

  def default!
    State.find_by(default: true).try(:update!, default: false)

    update!(default: true)
  end
end
