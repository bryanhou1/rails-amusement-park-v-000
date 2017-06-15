class UserPolicy < ApplicationPolicy

	def show?
		user == record || user.try(:admin)
	end

end