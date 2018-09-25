# This file is created to share commands of this plugin to any app that imports it.

# Map any command aliases here, for example to allow origen -x to refer to a 
# command called execute you would add a reference as shown below: 
aliases ={

}

# The requested command is passed in here as @command, this checks it against
# the above alias table and should not be removed.
@command = aliases[@command] || @command

# Now branch to the specific task code
case @command
# in here or you can require an external file if preferred.
when "core_support:test"
  require_relative "../app/commands/test_command"
  exit 0

# Always leave an else clause to allow control to fall back through to the
# Origen command handler.
# You probably want to also add the command details to the help shown via
# origen -h, you can do this be assigning the required text to @application_commands
# before handing control back to Origen. Un-comment the example below to get started.
else
  @plugin_commands ||= []
  @plugin_commands << " core_support:test         Test command from plugin core_support plugin"
end 

