namespace :reset_status do
  #ここから処理を書いていく
    #定期実行する際に、そのログを取っておくのは大事。ログがないと定期実行でエラーが起きても分からない。
    logger = Logger.new 'log/reset_status.log'
  desc 'ユーザーのstatusをデフォルト値に戻す'
  task reset_user_status: :environment do
    User.find_each do |user|
      begin
        user.update!(status: false)

      rescue => e
        #何かしらエラーが起きたら、エラーログの書き込み ただし次のユーザーの処理へは進む
        logger.error "user_id: #{user.id}でエラーが発生"
        logger.error e
        logger.error e.backtrace.join("\n")
        next
      end
    end
  end
end
