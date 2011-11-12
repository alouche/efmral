# encoding: utf-8
#
# This file belongs to the efmral codebase.
# Copyright (C) 2011, Ali Abbas <ali@alouche.net>
#
# efmral is licensed under the GNU General Public License, version 3. A copy of
# the license text can be found in the file COPYING in the source distribution.
#

require 'dm-core'
require 'dm-migrations'
require 'dm-validations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/efmral.sqlite3")

class EfmralMapper
  include DataMapper::Resource
  
  property :id, Serial
  property :ref, String
  property :secret, Text, :required => true
  property :view, String

  validates_presence_of :secret

  DataMapper.auto_upgrade!
end
