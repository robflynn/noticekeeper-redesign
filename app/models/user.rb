class User
  def cases
    CourtCase.all
  end

  def notices
    Notice.all
  end

  def claims
    Claim.all
  end
end
