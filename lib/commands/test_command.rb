puts <<-EOT
This is a test command to test the command sharing capability of plugins.

You can now write commands in plugins which can be called from any app that
includes the plugin.

For the app to add your command in it's own command list, share your shared_commands.rb file in
config.shared hash as follows:

config.shared = {

  :command_launcher => "config/shared_commands.rb"

}

EOT


