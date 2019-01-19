class SomeAPI
  def self.notify! alarm
    conn = Faraday.new(:url => 'https://bellbird.joinhandshake-internal.com')
    conn.post do |req|
      req.url '/push'
      req.headers['Content-Type'] = 'application/json'
      req.body = alarm.to_json
    end
  end
end
