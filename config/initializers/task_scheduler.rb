require 'rufus/scheduler'
require 'json'

scheduler = Rufus::Scheduler.start_new

scheduler.cron("0 * * * *") do
  status_url = "http://twitter.com/users/show/justincbeck.json"
  status_resp = Net::HTTP.get_response(URI.parse(status_url))
  status_data = status_resp.body
  status_result = JSON.parse(status_data)

  if status_result.has_key? 'error'
    $twitter_status = 'Twitter trouble!'
  else
    $twitter_status = status_result['status']['text']
  end
end