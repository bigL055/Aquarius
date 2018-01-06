
Pod::Spec.new do |s|
s.name             = 'Aquarius'
s.version          = '0.1.0'
s.summary          = 'json构造TableViewCotroller'

s.homepage         = 'https://github.com/bigL055/Aquarius'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'lin' => 'linhan.bigl055@outlook.com' }
s.source = { :git => 'https://github.com/bigL055/Aquarius.git', :tag => s.version.to_s }

s.ios.deployment_target = '8.0'

s.source_files = ["Sources/*/**","Sources/*/*/**","Sources/**"]

s.public_header_files = ["Sources/Aquarius.h"]
s.requires_arc = true
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
end
