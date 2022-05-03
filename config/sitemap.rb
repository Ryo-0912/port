# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://www.mynort.com'
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['Rails.application.credentials.aws[:s3_bucket_name]']}"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  ENV['Rails.application.credentials.aws[:s3_bucket_name]'],
  aws_access_key_id: ENV['Rails.application.credentials.aws[:access_key_id]'],
  aws_secret_access_key: ENV['Rails.application.credentials.aws[:secret_access_key]'],
  aws_region: 'ap-northeast-1',
)

SitemapGenerator::Sitemap.create do
  add root_path
  add login_path
  add terms_path
  add privacy_path
  add new_user_path
end
