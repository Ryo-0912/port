module ApplicationHelper
  def default_meta_tags
    {
      site: 'My Note',
      title: 'My Note',
      reverse: true,
      charset: 'utf-8',
      description: '',
      keywords: '勉強,暗記,苦手',
      canonical: request.original_url,
      separator: '|', # これで"タイトル | サイトネーム"ってなる
      icon: [
        { href: image_url('logo.png') }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        local: 'ja-JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@あなたのツイッターアカウント'
      }
    }
  end
end
