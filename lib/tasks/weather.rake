namespace :weather do
  desc "weather"

# $ rake weather:info のように使う
  task :info => :environment do
    class Weather_Api
        require 'rexml/document'
        require "net/http"
        require "json"
        require "uri"
        require 'open-uri'
        require "date"

      def forecast_date (prefecture = 'Tokyo')
        uri = URI.parse("http://api.openweathermap.org/data/2.5/forecast")
        apikey = "a7d292f879d2c1f96e6bee70d338e687"
        json = Net::HTTP.get( uri + "?q=#{ prefecture },jp&appid=#{ apikey }")
        JSON.parse(json)
      end

      def weather_status_case (id)
        case id
          when 200, 201, 202, 210, 211, 212, 221, 230, 231, 232
            "雷雨"
          when 300, 301, 302, 310, 311, 312, 313, 314, 321
            "霧雨"
          when 500
            "小雨"
          when 501
            "雨"
          when 502
            "強い雨"
          when 503
            "豪雨"
          when 504
            "極端に強い雨"
          when 511, 520, 521, 522, 531
            "シャワーのような雨"
          when 600
            "小雪"
          when 601
            "雪"
          when 602
            "大雪"
          when 611, 612
            "みぞれ"
          when 615, 616
            "雨と雪が降る"
          when 620, 621, 622
            "シャワーのような雪"
          when 701, 721, 741
            "霧"
          when 731, 751
            "砂塵が舞う"
          when 761, 711
            "ほこりっぽい"
          when 762
            "火山灰"
          when 771
            "スコール"
          when 781, 900, 902
            "竜巻"
          when 800
            "晴れ"
          when 801, 802, 803, 804
            "曇り"
          when 901
            "熱帯暴雨"
          when 903
            "かなり冷え込む"
          when 904
            "かなり暑い"
          when 905
            "強風"
          when 906
            "ひょうが降る"
          when 951
            "比較的に大気の状態が穏やか"
          when 952, 953
            "風が吹き荒れる"
          when 954, 955, 956, 957, 958, 959
            "暴風"
          when 960, 961
            "嵐"
          when 962
            "ハリケーン"
          else
            "現在の天気情報を取得できません"
        end
      end

      def weather_ids()
        once = forecast_date("Tokyo")
        once["list"][0]["weather"][0]["id"]
      end
    end

    weatherapi = Weather_Api.new()
    currentStatus = weatherapi.weather_status_case(weatherapi.weather_ids())
    #system("say '現在の東京の天気は#{currentStatus}です'")
    message = "say '現在の東京の天気は#{currentStatus}です'"
    JSON.parse(message)
  end
end
