require 'socket'
require 'timeout'

module ServiceWait
  class Runner
    def initialize(ip, port, timeout = 20)
      @ip = ip
      @port = port
      @timeout = timeout
    end

    def wait(&block)
      Timeout::timeout(@timeout) do
        while !port_open?(@ip, @port)
          yield :failure if block_given?

          sleep 1
          yield :attempt if block_given?
        end

        yield :success if block_given?
      end

    rescue Timeout::Error
      yield :timeout if block_given?
    end

    private

    def port_open?(ip, port, seconds=1)
      Timeout.timeout(seconds) do
        begin
          TCPSocket.new(ip, port).close
          true
        rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
          false
        end
      end

    rescue Timeout::Error
      false
    end
  end
end
