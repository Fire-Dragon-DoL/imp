module Imp
  version_path = File.expand_path("../../VERSION", __dir__)
  VERSION = File.read(version_path).strip.freeze
end
