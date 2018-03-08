# module Gitius
#   module Error
#     class BaseError < StandardError
#     end
#
#     class InvalidRepository < BaseError
#       def message
#         'invalid repository'
#       end
#     end
#
#     class IncorrectSettings < BaseError
#       def message
#         'incorrect settings'
#       end
#     end
#   end
#   end
# end