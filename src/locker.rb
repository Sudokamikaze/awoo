con = Mysql2::Client.new(:host => "localhost", :username => "awoo", :password => "awoo", :database => "test")
config_raw = File.read(File.dirname(__FILE__) + '/config.json')
config = JSON.parse(config_raw)
con.query("UPDATE posts SET is_locked = TRUE WHERE UNIX_TIMESTAMP(CURRENT_TIMESTAMP()) - UNIX_TIMESTAMP(date_posted) > #{config[:seconds_until_archival]} AND parent IS NULL")
