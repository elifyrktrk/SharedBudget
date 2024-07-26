# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'

target 'myProject' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for myProject
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'FirebaseFirestoreSwift'

end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
  end

  # `GDTCORPlatform.m` dosyasını düzenlemek için bir script ekleyin
  Dir.glob(File.join(installer.sandbox.root, 'GoogleDataTransport/**/*.m')).each do |file|
    text = File.read(file)
    new_contents = text.gsub(/GDTCORNetworkTypeMessage\(\)/, 'GDTCORNetworkTypeMessage(void)')
    File.open(file, "w") { |f| f.puts new_contents }
  end

  # `GDTCCTNanopbHelpers.m` dosyasını düzenlemek için bir script ekleyin
  Dir.glob(File.join(installer.sandbox.root, 'GoogleDataTransport/**/*.m')).each do |file|
    text = File.read(file)
    new_contents = text.gsub(/GDTCCTConstructNetworkConnectionInfoData\(\)/, 'GDTCCTConstructNetworkConnectionInfoData(void)')
    File.open(file, "w") { |f| f.puts new_contents }
  end
end
