#!/usr/bin/env ruby

require 'yaml'
require 'rubygems'
require 'tmpdir'
require 'ostruct'

class ConFactory
  def self.parse(config_file)
    conf_hash = YAML.load_file(config_file)
    conf_obj = self.parse_config(conf_hash)
  end

  private 

  def self.parse_config(conf_hash)
    if conf_hash.class == Hash
      conf_hash.each_pair do |k,v|
        if conf_hash[k].class == String
          conf_hash[k].gsub!(/\[TODAY\]/,Time.now.strftime('%Y%m%d'))
          conf_hash[k].gsub!(/\[YESTERDAY\]/,(Time.now - 86400).strftime('%Y%m%d'))
          conf_hash[k].gsub!(/\[TMPDIR\]/,Dir.tmpdir)
        end
        if conf_hash[k].class == Array
          conf_hash[k].each_with_index do |member,index|
            conf_hash[k][index] = self.parse_config(member) if conf_hash[k][index].class == Hash
          end
        end
      end
    end
    OpenStruct.new(conf_hash)
  end

end
