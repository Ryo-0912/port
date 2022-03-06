module ApplicationHelper
  def default_meta_tags
    {
      site: 'My Nort',
      title: 'My Nort',
      reverse: true,
      charset: 'utf-8',
      description: '学校のテスト本番で暗記したことが思い出せない・暗記が苦手、そんな方におすすめなのが「My Nort」です。',
      keywords: '勉強,暗記,苦手',
      canonical: request.original_url,
      separator: '|', # これで"タイトル | サイトネーム"ってなる
      icon: [
        { href: image_url('https://img14.shop-pro.jp/PA01308/843/etc/%A5%DE%A5%A4%A5%CE%A1%BC%A5%C89.JPG?cmsp_timestamp=20200721144234') },
        { href: image_url('https://img14.shop-pro.jp/PA01308/843/etc/%A5%DE%A5%A4%A5%CE%A1%BC%A5%C89.JPG?cmsp_timestamp=20200721144234'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
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
        site: '@MyMemorial02'
      }
    }
  end
end
