class DailyActivityCounter
  class Qiita < ::DailyActivityCounter
    def self.regenerate_qiita_contribution(activist_id)
      conn = Faraday.new(url: 'https://qiita.com') do |faraday|
        faraday.request :url_encoded
        faraday.request :qiita_api_header, '5eb534b59ba1cb50f599cb00c306330693686bce'
        faraday.adapter Faraday.default_adapter # using Net::HTTP
      end
      authenticated_user_res = conn.get do |req|
        req.url '/api/v2/authenticated_user'
      end
      items_count = JSON.parse(authenticated_user_res.body)['items_count']
      authenticated_user_items_res = conn.get do |req|
        req.url '/api/v2/authenticated_user/items'
        req.params[:page] = 1
        req.params[:per_page] = items_count # TODO: items_countが100以上の場合は、qiita側のAPIの制限にかかるので、pageとper_pageを調整してループする処理が必要
      end
      title_list =
        JSON.parse(authenticated_user_items_res.body).map do |v|
          v.slice('title', 'created_at')
        end

      where(activist_id: activist_id).delete_all

      title_list.group_by { |v| v['created_at'].to_date }.each do |k, v|
        self.create(activist_id: activist_id, date: k, count: v.count)
      end
    end
  end
end
class Faraday::Request::QiitaApiHeader
  Faraday::Request.register_middleware qiita_api_header: self

  def initialize(app, token)
    @app = app
    @token = token
  end

  def call(env)
    env[:request_headers]['Authorization'] = "Bearer #{@token}"
    @app.call(env)
  end
end
