lib_path = File.join(__dir__, "lib")

unless $LOAD_PATH.include?(lib_path)
  $LOAD_PATH.unshift(lib_path)
end
