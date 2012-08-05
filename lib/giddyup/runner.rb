# -*- coding: utf-8 -*-
module Giddyup
  class Runner
    class << self
      def run!(*args)
        files = parse_options(args)
        Giddyup::Util.post_files(files) if files
        return 0
      end

      def parse_options(args)
        value = args.shift
        error "WHERES MY FILE щ(ಠ益ಠщ)" if value.nil? || !valid_file(value)
        files = args.inject([value]) do |acc, arg|
          acc << arg if valid_file(arg)
          acc
        end
        files
      end

      def valid_file(path)
        cwd = `pwd`.strip
        File.exists?(File.join(cwd, path))
      end
    end
  end
end
