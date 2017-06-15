class AttractionPolicy < ApplicationPolicy
	def new?
		user.try(:admin)
	end

	def create?
		user.try(:admin)
	end
end