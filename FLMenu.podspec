Pod::Spec.new do |s|
  s.name     = 'FLMenu'
  s.version  = '1.0'
  s.ios.deployment_target   = '7.0'
  s.summary  = 'Highly customized bottom menu with elegant transition animation, overlay and menu items animation.'
  s.author   = { 'Anton Gaenko' => 'antony.gaenko@gmail.com' }
  s.social_media_url = 'https://twitter.com/Anton_Gaenko'
  s.requires_arc = true
  s.source   = {
    :git => 'https://github.com/devenergy/FLMenu.git',
    :branch => 'master',
    :tag => s.version.to_s
  }
  s.source_files = '*.{h,m}'
  s.public_header_files = '*.h'
	s.resources = 'FLMenuCell.xib'
end
