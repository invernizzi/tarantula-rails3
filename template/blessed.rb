require "active_support/core_ext"
module Blessings
    mattr_accessor :blessings

    # Append the errors you want to ignore to the following array.
    # The format is:
    # [ < URL | URL_REGEXP > , HASH ]
    #
    # See also these examples
    self.blessings = [
         ["/dashboard", "9ed37f41d6d123e805c3f00dbf6eb0a5"], # Suppress error X on  http://example.com/dashboard
         [/.*/, "baddeed"],  # Suppress this error on every url
    ]
end
