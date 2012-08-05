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
        error "WHERES MY FILE щ(ಠ益ಠщ)" if value.nil? || !valid_file(path)
        files = args.inject([value]) do |acc, arg|
          acc << arg if valid_file(path)
          acc
        end
        files
      end

      def valid_file(path)
        File.exists?(File.join(__FILE__, path))
      end
    end
  end
end
