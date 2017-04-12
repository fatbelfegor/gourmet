module ApplicationHelper
  def aws_config
    Aws::SNS::Client.new
  end

  def parse_webhook
    # Parse JSON request from remote calback server
    JSON.parse request.body.read
  # Handle exceptions in case of failed request
  rescue JSON::ParserError => error
    return { error: error.to_s }
  end

  def send_message(basecampbot_url, message)
    basecampbot_url ||= Rails.configuration.service['basecampbot_url']
    HTTParty.post basecampbot_url, query: { content: message }
  end
end
