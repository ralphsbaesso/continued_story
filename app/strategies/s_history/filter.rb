class SHistory::Filter < AStrategy

  def process
    filter = bucket[:filter] || {}

    query =
      if current_user
        current_user.histories
      else
        History.list_public
      end

    bucket[:histories] = query
  end
end