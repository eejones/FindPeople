module MembersHelper


  def address_there?(member)
    !member.address.nil?
  end

  def has_theme?(member)
    !member.mytheme.nil?
  end

  def attribute_there?(attribute)
    attribute==true
  end
end
