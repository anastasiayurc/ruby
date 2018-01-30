require 'getoptlong'
require 'json'
require 'date'

class Builder
 def initialize(options)
 @options = options
 @set = process_set
  end

 def build
 assets = []
    @options[:asset_count].times do |i|
      json = { 'assets' => build_asset(i) }.to_json
      File.open("test/argos-tu-#{DateTime.now.strftime('%Q')}.json", 'w+') { |f| f.write(json) }
    end

 # @options[:asset_count].times { |i| assets << build_asset(i+1) }
 # json = { 'assets' => assets }.to_json
 # @options[:set_count].times { |i| File.open("test#{i}", 'w+') { |f| f.write(json) } }
 end

 private

 def process_set
 set = []
    @options[:set_count].times { |i| set << "#{@options[:set_name]}#{i+1}"}
    set
 end

 def build_asset(index)
    c = []
    @options[:count_assets].times do |i|
      c << {
          'name' => "#{@options[:asset_name]}#{index + i}",
          'url' => @options[:asset_url],
          'seq' => index + i,
          'set' => ["#{@options[:set_name]}#{index + i}"]
        }
    end
 c
 end
end


# Builder.new(*ARGV).build
opts = GetoptLong.new(
    ['--help', '-h', GetoptLong::NO_ARGUMENT],
    ['--asset_count', '-a', GetoptLong::REQUIRED_ARGUMENT],
    ['--set_count', '-s', GetoptLong::REQUIRED_ARGUMENT],
    ['--set_name_template', '-c', GetoptLong::REQUIRED_ARGUMENT],
    ['--asset_name_template', '-d', GetoptLong::REQUIRED_ARGUMENT],
    ['--asset_url', '-u', GetoptLong::REQUIRED_ARGUMENT],
    ['--file_name', '-f', GetoptLong::REQUIRED_ARGUMENT],
    ['--count_assets', '-e', GetoptLong::REQUIRED_ARGUMENT]
)

options = {
    asset_count: 100,
    asset_name: 'TUC-10000_R_Z',
    set_count: 1,
    set_name: 'TUC-89890_R_SET',
    asset_url: 'http://dev-solutions.s3-eu-west-1.amazonaws.com/jenny/L1004220-cs2-big.jpg',
    file_name: 'argos-tu-.json',
    count_assets: 1
}

help = <<-HELP
 --help, -h -- Help
 --asset_count, -a, -- Number of assets in json (default 100),
 --set_count, -s, -- Number of sets each assets is being applied to (default 1),
 --asset_name_template, -c, -- Template name for assets (default TUC-10000_R_Z(INDEX)),
 --set_name_template, -d, -- Template name for sets (default TUC-89890_R_SET(INDEX)),
 --asset_url, -u, -- Asset url (default 'http://dev-solutions.s3-eu-west-1.amazonaws.com/jenny/L1004220-cs2-big.jpg')
 --file_name, -f, -- Output json file name (default sample.json)
 --count_assets', -e -- count assets in the file
HELP

opts.each do |opt, arg|
  case opt
 when '--help'
 puts help
 when '--asset_count'
 options[:asset_count] = arg.to_i
    when '--set_count'
 options[:set_count] = arg.to_i
    when '--asset_name_template'
 options[:asset_name] = arg
 when '--set_name_template'
 options[:set_name] = arg
 when '--asset_url'
 options[:asset_url] = arg
 when '--count_assets'
 options[:count_assets] = arg.to_i
  end
end

Builder.new(options).build
require 'getoptlong'
require 'json'
require 'date'

class Builder
 def initialize(options) #метод который
 @options = options
 @set = process_set
  end

 def build
 assets = []
    @options[:asset_count].times do |i|
      json = { 'assets' => build_asset(i) }.to_json
      File.open("test/argos-tu-#{DateTime.now.strftime('%Q')}.json", 'w+') { |f| f.write(json) }
    end

 # @options[:asset_count].times { |i| assets << build_asset(i+1) }
 # json = { 'assets' => assets }.to_json
 # @options[:set_count].times { |i| File.open("test#{i}", 'w+') { |f| f.write(json) } }
 end

 private

 def process_set
 set = []
    @options[:set_count].times { |i| set << "#{@options[:set_name]}#{i+1}"}
    set
 end

 def build_asset(index)
    c = []
    @options[:count_assets].times do |i|
      c << {
          'name' => "#{@options[:asset_name]}#{index + i}",
          'url' => @options[:asset_url],
          'seq' => index + i,
          'set' => ["#{@options[:set_name]}#{index + i}"]
        }
    end
 c
 end
end


# Builder.new(*ARGV).build
opts = GetoptLong.new(
    ['--help', '-h', GetoptLong::NO_ARGUMENT],
    ['--asset_count', '-a', GetoptLong::REQUIRED_ARGUMENT],
    ['--set_count', '-s', GetoptLong::REQUIRED_ARGUMENT],
    ['--set_name_template', '-c', GetoptLong::REQUIRED_ARGUMENT],
    ['--asset_name_template', '-d', GetoptLong::REQUIRED_ARGUMENT],
    ['--asset_url', '-u', GetoptLong::REQUIRED_ARGUMENT],
    ['--file_name', '-f', GetoptLong::REQUIRED_ARGUMENT],
    ['--count_assets', '-e', GetoptLong::REQUIRED_ARGUMENT]
)

options = {
    asset_count: 100,
    asset_name: 'TUC-10000_R_Z',
    set_count: 1,
    set_name: 'TUC-89890_R_SET',
    asset_url: 'http://dev-solutions.s3-eu-west-1.amazonaws.com/jenny/L1004220-cs2-big.jpg',
    file_name: 'argos-tu-.json',
    count_assets: 1
}

help = <<-HELP
 --help, -h -- Help
 --asset_count, -a, -- Number of assets in json (default 100),
 --set_count, -s, -- Number of sets each assets is being applied to (default 1),
 --asset_name_template, -c, -- Template name for assets (default TUC-10000_R_Z(INDEX)),
 --set_name_template, -d, -- Template name for sets (default TUC-89890_R_SET(INDEX)),
 --asset_url, -u, -- Asset url (default 'http://dev-solutions.s3-eu-west-1.amazonaws.com/jenny/L1004220-cs2-big.jpg')
 --file_name, -f, -- Output json file name (default sample.json)
 --count_assets', -e -- count assets in the file
HELP

opts.each do |opt, arg|
  case opt
 when '--help'
 puts help
 when '--asset_count'
 options[:asset_count] = arg.to_i
    when '--set_count'
 options[:set_count] = arg.to_i
    when '--asset_name_template'
 options[:asset_name] = arg
 when '--set_name_template'
 options[:set_name] = arg
 when '--asset_url'
 options[:asset_url] = arg
 when '--count_assets'
 options[:count_assets] = arg.to_i
  end
end

Builder.new(options).build
