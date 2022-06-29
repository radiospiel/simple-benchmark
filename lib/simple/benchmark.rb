module Simple
  # The Simple::Benchmark module
  module Benchmark
    extend self

    def git_info
      # to track a specific software version we
      #
      # - determine the current repo
      # - determine the current sha1
      # - determine the newest tag in the history of the current head matching '^v\d'
      #
      raise "Must run this in a git repo" unless File.exist?(".git")

      {
        repo: File.basename(Dir.getwd),
        tag: sh!("git tag --list 'v*' --sort='-version:refname' --merged | head -n 1"),
        ref: sh!("git log --oneline -n 1 | awk '{print $1}'"),
        uname: sh!("uname -a")
      }
    end

    private
    
    def sh!(*args)
      Simple::CLI::Helpers.sh!(*args)
    end
  end
end
