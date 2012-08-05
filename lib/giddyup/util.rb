# -*- coding: utf-8 -*-
module Giddyup
  class Util
    def post_files(files)
      manifest_files = files.inject({}) do |acc, file|
        acc["#{File.basename(file)}"] => File.open(file).readlines.to_s
      end

      manifest = {
        "description": "This gist was ★automagically★ generated by giddyup™"
        "public": true,
        "files": manifest_files
        }
      }
    end
  end
end
