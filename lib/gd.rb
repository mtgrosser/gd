require 'fiddle'
require 'fiddle/import'
require 'rbconfig'
require 'pathname'

module GD
  PNG   = 'png'
  JPEG  = 'jpeg'
  GIF   = 'gif'
  FORMATS = [PNG, JPEG, GIF]
end

require 'gd/version'
require 'gd/lib'
require 'gd/base'
require 'gd/image'
