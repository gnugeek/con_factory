Gem::Specification.new do |s|
  s.name = 'con_factory'
  s.version = '0.1'
  s.date = '2009-07-30'
  s.summary = 'Simple tool for creating configuration objects from YAML files'
  s.description = 'Parses YAML config files and produces an openstruct object based on the config'
  s.authors = ['Brian Knox']
  s.email = 'gnutse@gmail.com'
  s.has_rdoc = true
  s.rdoc_options = ['README.rdoc']
  s.files = %w(README.rdoc lib lib/con_factory.rb test test/test_con_factory.yml test/test_con_factory.rb con_factory.gemspec) 
end
