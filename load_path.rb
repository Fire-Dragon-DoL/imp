bundler_standalone_loader = File.expand_path("./bundle/bundler/setup", __dir__)

begin
  require_relative bundler_standalone_loader
rescue LoadError
  warn "WARNING: Standalone bundle loader is not at #{bundler_standalone_loader}. Using Bundler to load gems."
  require "bundler/setup"
end
