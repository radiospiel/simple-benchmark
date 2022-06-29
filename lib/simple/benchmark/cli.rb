module Simple
end

module Simple::Benchmark
end

require "simple-service"
require "simple-cli"

module Simple::Benchmark::CLI
  include Simple::Service
  include Simple::CLI::Helpers

  def info
    pp Benchmarker.git_info
  end

  # run a command
  def run(command, *argv)
    res = sh!(command, *argv)
    res = res.split("\n").each_with_object({}) do |line, hsh|
      case line
      when /^\s*$/
        :nop
      when /^(.*\S)\s*:\s*([\d.]+)\s*dps\s*$/
        hsh[$1] = $2.to_f
      else
        raise "Cannot parse line: #{line.inspect}\n"
      end
    end
    pp res
  end

  private

  MIGRATION = <<~SQL
    CREATE TABLE IF NOT EXISTS benchmarks (
      id INTEGER PRIMARY KEY,
      platform VARCHAR,
      run VARCHAR,
      runtime DOUBLE
    );

    CREATE INDEX IF NOT EXISTS benchmarks_platform_idx on benchmarks(platform);
  SQL

  def db
    @db ||= begin
      db = SQLite3::Database.open("benchmark.sql")
      at_exit { db.close }
      db.execute MIGRATION
      db
    end
  end
end
