require 'pty'

BIN = File.expand_path("../../bin/play", __FILE__)

describe 'CLI' do
  example 'it works' do
    PTY.spawn(BIN) do |output, input, pid|
      sleep 0.5

      input.write()
    end
  end
end
