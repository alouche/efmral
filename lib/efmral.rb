# encoding: utf-8
#
# This file belongs to the efmral codebase.
# Copyright (C) 2011, Ali Abbas <ali@alouche.net>
#
# efmral is licensed under the GNU General Public License, version 3. A copy of
# the license text can be found in the file COPYING in the source distribution.
#

require 'bundler'
require 'sinatra'
require 'haml'
require 'efmral/mapper'

Bundler.require

$:<< File.dirname(__FILE__)

module Efmral

  $version = 0.1

  class Application < Sinatra::Base

    set :public_folder, File.join(File.dirname(__FILE__), 'efmral', 'public')
    set :views, File.join(File.dirname(__FILE__), 'efmral', 'views')

    def initialize(app)
      super(app)
    end

    # modulo largest prime < 2^16
    def modulo_prime(x)
      return (x + x.modulo(65521))
    end

    helpers do

      def partial(page, options={})
        haml page.to_sym, options.merge!(:layout => false)
      end

    end

    not_found do
      redirect '/'
    end

    get '/' do
      haml :new
    end

    post '/secret' do
      t = Time.now.to_i
      l = modulo_prime(t)
      entry = EfmralMapper.new(:secret => params[:to_share], :id => l , :ref => t)
      if entry.save
        redirect "/#{entry.id}"
      else
        redirect '/'
      end
    end

    get '/:id' do
      entry = EfmralMapper.get(params[:id])
      @info = Proc.new {
        entry.view || ''
      }
      if entry
        @ref = entry.ref
        haml :share
      else
        redirect '/'
      end
    end

    get '/reveal/:ref' do
      ref = (params[:ref]).to_i
      id = modulo_prime(ref)
      entry = EfmralMapper.get(id)
      @secret_delete = Proc.new {
        entry.update(:view => Time.now, :secret => 'null')
      }
      if entry and ! entry.view
        @secret = entry.secret
        haml :secret
      else
        haml :refnil
      end
    end

  end
end
