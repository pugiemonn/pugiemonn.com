class Batch::GetApi
  def self.get_api
    # API を取得する処理
    event_array = []
    events, errors = EventsJp.get_events(service_limit: 100)
    events.each do |e|
      puts "イベントタイトル - #{e.title}"
      puts "イベントサイト - #{e.service}"
      puts "イベント住所 - #{e.address}"
      puts "イベントURL - #{e.event_url}"
      puts " キャッチ - #{e.catch}"
      puts " 開始時間- #{e.started_at}"
      puts " 終了時間- #{e.ended_at}"
      puts "イベント会場 - #{e.place}"
      puts "longitude - #{e.lon}"
      puts "latitude - #{e.lat}"
      puts "人数限界 - #{e.limit}"
      puts "accepted - #{e.accepted}"
      puts "待ち人数 - #{e.waiting}"

      event_array << Event.new(
          title: "#{e.title}",
          service: "#{e.service}",
          address: "#{e.address}",
          event_url: "#{e.event_url}",
          catch: (e.catch).blank? ? "本文が入力されていません。" : "#{e.catch}",
          started_at: "#{e.started_at}",
          ended_at: "#{e.ended_at}",
          place: (e.place).blank? ? "開催場所が指定されていません。" : "#{e.place}",
          lon: "#{e.lon}",
          lat: "#{e.lat}",
          limit: "#{e.limit}",
          accepted: "#{e.accepted}",
          waiting: "#{e.waiting}"
      )
    end
    Event.import event_array
  end
end

