class User
  def cases
    CourtCase.includes(:notices).all
  end
end
