require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Twitter
  class Application < Rails::Application

    config.generators.template_engine = :slim

    # 認証トークンをremoteフォームに埋め込む
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
