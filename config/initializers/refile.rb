require 'refile'

if Rails.env.production? # 本番環境の場合はS3へアップロード
  aws = {
    access_key_id: ENV['S3_ACCESS_KEY_ID'], # アクセスキーID
    secret_access_key: ENV['S3_SECRET_ACCESS_KEY'], # シークレットアクセスキー
    region: 'ap-northeast-3', # リージョン
    bucket: 'ecohabigram', # バケット名
  }
  Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
  Refile.store = Refile::S3.new(prefix: 'store', **aws)
end