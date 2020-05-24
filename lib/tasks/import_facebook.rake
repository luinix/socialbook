require 'progress_bar'

namespace :facebook do
  task :import_posts, [:path] => :environment do |t, args|
    MAX_TWEET_LENGTH = 280

    doc = File.open(args[:path]) { |f| Nokogiri::HTML(f) }
    status_updates = doc.xpath('//div[contains(text(), "actualizó su estado")]/parent::div').map { |div|
      content = div.css("._2pin").text

      unless content.empty?
        {
          content: content,
          publication_datetime: parse_spanish_date(div.css("._2lem").text),
          source: div,
          tweetable: content.length <= MAX_TWEET_LENGTH
        }
      end
    }.compact

    bar = ProgressBar.new(status_updates.count)
    Post.create(status_updates) do |_|
      bar.increment!
    end
  end

  def parse_spanish_date(date)
    english_date = {
      enero:      "january",
      febrero:    "february",
      marzo:      "march",
      abril:      "april",
      mayo:       "may",
      junio:      "june",
      julio:      "july",
      agosto:     "august",
      septiembre: "september",
      octubre:    "october",
      noviembre:  "november",
      diciembre:  "december",
    }.reduce(date.gsub(/\ de/, "")) { |date, (match, english_month)|
      date.gsub(/#{match}/, english_month)
    }

    DateTime.parse(english_date)
  end
end
