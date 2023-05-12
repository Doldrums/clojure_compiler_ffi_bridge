Pod::Spec.new do |s|
  s.name             = 'clojure_compiler_ffi_bridge'
  s.version          = '0.0.3'
  s.summary          = 'A new Flutter FFI plugin project.'
  s.description      = <<-DESC
A new Flutter FFI plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.compiler_flags = '-I/opt/homebrew/include/', '-I/usr/local/include/'
  s.vendored_libraries = 'Libraries/libprotobuf.dylib'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.13'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
