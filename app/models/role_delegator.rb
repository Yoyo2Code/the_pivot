# class RoleDelegator
#   attr_reader :record
#   def initialize(record)
#     @record = record
#   end
#
#   def assign_role(status)
#     if record.is_a?(Business)
#       apply_business_role(status)
#     end
#   end
#
#   def apply_business_role(status)
#     record.roles.create(name: status)
#   end
# end
