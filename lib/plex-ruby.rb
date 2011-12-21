require 'nokogiri'
require 'open-uri'
require 'cgi'

module Plex

  # Converts camel case names that are commonly found in the Plex APIs into
  # ruby friendly names.  I.E. <tt>playMedia</tt> -> <tt>play_media</tt>
  #
  # @param [String] camel case name to be converted
  # @return [String] snake case form
  def self.underscore(string)
    string.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end

  # Converts ruby style snake case names into the cammel case names that are
  #   used in the Plex APIs. I.E. <tt>play_media</tt> -> <tt>playMedia</tt>
  def self.camelize(string, first_letter_uppercase = false)
    if first_letter_uppercase
      string.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
    else
      string.to_s[0].chr.downcase + camelize(string, true)[1..-1]
    end
  end

end

require 'plex-ruby/parser'
require 'plex-ruby/server'
require 'plex-ruby/client'
require 'plex-ruby/library'
require 'plex-ruby/section'
require 'plex-ruby/video'
require 'plex-ruby/media'
require 'plex-ruby/part'
require 'plex-ruby/stream'
require 'plex-ruby/tags'
require 'plex-ruby/show'
require 'plex-ruby/season'
require 'plex-ruby/episode'
require 'plex-ruby/movie'

