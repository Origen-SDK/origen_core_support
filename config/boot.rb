# This file is used to boot your plugin when it is running in standalone mode
# from its own workspace - i.e. when the plugin is being developed.
#
# It will not be loaded when the plugin is imported by a 3rd party app - in that
# case only lib/c402t_nvm_tester.rb is loaded.
#
# Therefore this file can be used to load anything extra that you need to boot
# the development environment for this app. For example this is typically used
# to load some additional test classes to use your plugin APIs so that they can
# be tested and/or interacted with in the console.
require "origen_core_support"
