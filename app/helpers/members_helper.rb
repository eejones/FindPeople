module MembersHelper

  def address_there?(member)
    !member.address.nil?
  end
end
