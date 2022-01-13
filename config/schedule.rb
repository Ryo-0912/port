# Learn more: http://github.com/javan/whenever

# Rails.rootを使用するために必要。なぜなら、wheneverは読み込まれるときにrailsを起動する必要がある
require File.expand_path(File.dirname(__FILE__) + "/environment")

# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"

# 1時間ごとにarticle_state.rakeのchange_to_be_publishedを実行する
every 10.minutes do
  rails "reset_status:reset_user_status"
end
