require "spec_helper"
require "simple/benchmark/version"

describe Simple::Benchmark do
  describe "VERSION" do
    it "defines a version string" do
      # Note: this allows for 0.12.34beta
      expect(Simple::Benchmark::VERSION).to match(/(^\d+\.\d+\.\d+)|(unreleased)$/)
    end
  end
end
