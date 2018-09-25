class OrigenCoreSupportApplication < Origen::Application
  config.semantically_version = true

  # This information is used in headers and email templates, set it specific
  # to your application
  config.name     = "Origen Core Support"
  config.initials = "OrigenCoreSupport"
  config.rc_url   = "ssh://git@github.com:Origen-SDK/origen_core_support.git"
  config.shared   = {
    patterns: "app/patterns/shared",
    command_launcher: "config/shared_commands.rb",
    #templates: "templates",
    #programs: "program"
  }
  config.release_externally = true

  # Versioning is based on a timestamp by default, if you would rather use semantic
  # versioning, i.e. v1.0.0 format, then set this to true.
  # In parallel go and edit config/version.rb to enable the semantic version code.
  #config.semantically_version = true

  # You can map moo numbers to targets here, this allows targets to be selected via
  # origen t <moo>
  #config.production_targets = {
  #  "1m79x" => "pioneer_1_production",
  #}

  # Specify a specific version of origen that must be used with this application, origen
  # will then enforce that every user's origen version is correct at runtime
  #config.required_origen_version = "v2.0.0"

  # An example of how to set application specific LSF parameters
  #config.lsf.project = "msg.te"
  
  # An example of how to specify a prefix to add to all generated patterns
  #config.pattern_prefix = "nvm"

  # An example of how to add header comments to all generated patterns
  #config.pattern_header do
  #  cc "This is a pattern created by the example origen application"
  #end

  # By default all generated output will end up in ./output.
  # Here you can specify an alternative directory entirely, or make it dynamic such that
  # the output ends up in a setup specific directory. 
  #config.output_directory do
  #  "#{Origen.root}/output/#{$dut.class}"
  #end

  # Similarly for the reference files, generally you want to setup the reference directory
  # structure to mirror that of your output directory structure.
  #config.reference_directory do
  #  "#{Origen.root}/.ref/#{$dut.class}"
  #end

end
