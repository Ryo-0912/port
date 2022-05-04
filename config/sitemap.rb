# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://www.mynort.com'
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{Rails.application.credentials.aws[:s3_bucket_name]}"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  Rails.application.credentials.aws[:s3_bucket_name],
  Rails.application.credentials.aws[:access_key_id],
  Rails.application.credentials.aws[:secret_access_key],
  Rails.application.credentials.aws[:default_region]
)

SitemapGenerator::Sitemap.create do
  add root_path
  add login_path
  add terms_path
  add privacy_path
  add new_user_path
end
