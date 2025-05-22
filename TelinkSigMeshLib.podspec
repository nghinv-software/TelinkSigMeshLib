Pod::Spec.new do |s|
  s.name             = 'TelinkSigMeshLib'
  s.version          = '1.1.1'
  s.summary          = 'Telink SigMesh Library'
  s.description      = 'Telink SigMesh Library for BLE Mesh'
  s.homepage         = 'https://www.telink-semi.com'
  s.license          = { :type => 'Commercial', :text => 'Commercial' }
  s.author           = { 'Telink' => 'telink-semi.com' }
  s.source           = { :path => '.' }
  
  s.ios.deployment_target = '12.0'
  
  s.ios.vendored_frameworks = 'TelinkSigMeshLib.framework'
  s.frameworks = 'CoreBluetooth'
  
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'VALID_ARCHS' => 'arm64 x86_64',
    'ENABLE_BITCODE' => 'NO',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
end 