# This file will be required by Origen before your target is loaded, you 
# can use this to require all of your files, which is the easiest way
# to get started. As your experience grows you may wish to require only the
# minimum files required to allow the target to be initialized and let 
# each class require its own dependencies.
#
# It is recommended that you keep all of your application logic in lib/
# The lib directory has already been added to the search path and so any files
# in there can be referenced from here with a relative path.
#
# Note that pattern files do not need to be referenced from here and these
# will be located automatically by origen.

#autoload :Pioneer,   "pioneer"   # Only loads the file whenever Pioneer is referenced
#require "pioneer"                # Loads the file always
require_relative "../lib/c99/soc"
require_relative "../lib/c99/nvm"
require_relative "../lib/c99/block"
