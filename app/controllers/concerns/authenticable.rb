#
# authenticable.rb
# Copyright (C) 2023 tinix <tinix@archlinux>
#
# Distributed under terms of the MIT license.
#
module Authenticable
  def current_user
    return @current_user if @current_user

    header = request.headers['Authorization']
    return nil if header.nil?

    decoded = JsonWebToken.decode(header)

    @current_user = User.find(decoded[:user_id]) rescue
    ActiveRecord::RecordNotFound
  end
end



