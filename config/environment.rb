# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
RailsApp::Application.initialize!

class WorkerLogger < Logger
  def format_message(severity, timestamp, progname, msg)
    "#{timestamp.to_formatted_s(:db)} #{severity} #{msg}\n"
  end
end