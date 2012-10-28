
class DisplayDate

  def set_epoch(epoch)
    @epoch = Time.at(epoch)
  end

  def get_day(htmlclass)
    "<span class='#{htmlclass}'>#{@epoch.strftime("%A")}</span>"
  end

end
