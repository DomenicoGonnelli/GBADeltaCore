Pod::Spec.new do |spec|
  spec.name         = "GBAGameCore"
  spec.version      = "0.1"
  spec.summary      = "Game Boy Advance plug-in for Darlion."
  spec.description  = "iOS framework that wraps VBA-M to allow playing Game Boy Advance games"
  spec.homepage     = "https://github.com/DomenicoGonnelli/GBA-iOS"
  spec.platform     = :ios, "14.0"
  spec.source       = { :git => "https://github.com/DomenicoGonnelli/GBADeltaCore.git" }

  spec.author             = { "Domenico Gonnelli" => "domenico.gonnelli@outlook.it" }
  
  spec.source_files  = "GBAGameCore/**/*.{h,m,mm,swift}", "visualboyadvance-m/src/*.h", "visualboyadvance-m/src/common/*.h", "visualboyadvance-m/src/sdl/*.h", "visualboyadvance-m/src/gba/*.h", "SFML/include/**/*.{h,hpp,inl}", "SFML/src/SFML/System/{Err,Time,Thread,String}.cpp", "SFML/src/SFML/System/Unix/ThreadImpl.{hpp,cpp}"
  spec.public_header_files = "GBAGameCore/Types/GBATypes.h", "GBAGameCore/Bridge/GBAEmulatorBridge.h", "GBAGameCore/GBAGameCore.h"
  spec.header_mappings_dir = ""
  spec.resource_bundles = {
    "GBAGameCore" => ["GBAGameCore/**/*.deltamapping", "GBAGameCore/**/*.deltaskin", "visualboyadvance-m/src/vba-over.ini"]
  }
  
  spec.dependency 'GameCore'
  
  spec.xcconfig = {
    "HEADER_SEARCH_PATHS" => '"${PODS_CONFIGURATION_BUILD_DIR}" "$(PODS_ROOT)/Headers/Private/GBAGameCore/SFML/include" "$(PODS_ROOT)/Headers/Private/GBAGameCore/SFML/src"',
    "USER_HEADER_SEARCH_PATHS" => '"$(PODS_ROOT)/Headers/Private/GBAGameCore/visualboyadvance-m/fex" "$(PODS_ROOT)/Headers/Private/GBAGameCore/visualboyadvance-m/src"',
    "GCC_PREPROCESSOR_DEFINITIONS" => "STATIC_LIBRARY=1"
  }
  
end
