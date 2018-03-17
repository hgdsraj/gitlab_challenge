require 'benchmark'
require 'net/https'

FIVE_MINUTES = 300

def main
    start_time = Time.now
    current_time = Time.now
    while current_time - start_time < FIVE_MINUTES do
        time = Benchmark.measure do
            uri = URI.parse('https://gitlab.com')
            req = Net::HTTP.new(uri.host, uri.port)
            req.use_ssl = true
            req.verify_mode = OpenSSL::SSL::VERIFY_NONE
            resp = req.get('/')
        end
        current_time = Time.now
        print(time)
    end

end

main