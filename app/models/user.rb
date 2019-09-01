class User
  def cases
    CourtCase.all
  end

  def notices
    Notice.all
  end
end
