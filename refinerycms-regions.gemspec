# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-regions'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Regions extension for Refinery CMS'
  s.date              = '2012-06-18'
  s.summary           = 'Regions extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  .authors            = 'Maria Rosa Sanchez'
  s.homepage          = 'http://innku.com'
  s.email             = 'rosa@innku.com'

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.3'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.3'
end
