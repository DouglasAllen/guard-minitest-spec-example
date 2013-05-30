require 'turn/autorun'

ROOT = File.expand_path("../../", __FILE__)

$:.unshift File.join(ROOT, "lib")

Dir[File.join(ROOT, "lib", "**/*.rb")].each do |file|
  require file
end
