module Simple
  module Benchmark
    module GemHelper
      extend self

      def version(name)
        spec = Gem.loaded_specs[name]
        return "unreleased" unless spec

        version = spec.version.to_s
        version += "+unreleased" if unreleased?(spec)
        version
      end

      private

      def unreleased?(spec)
        return false unless defined?(Bundler::Source::Gemspec)
        return true if spec.source.is_a?(::Bundler::Source::Gemspec)
        return true if spec.source.is_a?(::Bundler::Source::Path)

        false
      end
    end

    GEM_NAME = self.name.gsub(/::/, "-").downcase
    VERSION = GemHelper.version GEM_NAME
  end
end
