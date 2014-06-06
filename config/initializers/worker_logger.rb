require 'utility/worker_logger'

worker_logfile = File.open("#{Rails.root}/log/worker.log", 'a')
worker_logfile.sync = true
WORKER_LOG = WorkerLogger.new(worker_logfile)