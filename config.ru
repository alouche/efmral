$LOAD_PATH << File.dirname(__FILE__)

require 'bundler/setup'
require 'lib/efmral'

Encoding.default_internal = 'utf-8'
Encoding.default_external = 'utf-8'

use Efmral::Application
run Sinatra::Application
