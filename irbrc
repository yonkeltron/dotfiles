if defined? IRB
  # History
  require 'irb/ext/save-history'
  IRB.conf[:SAVE_HISTORY] = 1000
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

  require 'rubygems'
  begin
    # load wirble
    require 'wirble'

    # start wirble (with color)
    Wirble.init({:skip_history => true})
    Wirble.colorize
  rescue LoadError => err
    warn "Couldn't load Wirble: #{err}"
  end
  require 'pp'

  begin
    require 'hirb'
    # Hirb.enable :pager => false
  rescue LoadError => err
    warn "Couldn't load Hirb: #{err}"
  end

  begin
    if ((defined? Rails) && Rails.env) || ((defined? ActiveRecord) && (defined? ActiveResource))
      require 'logger'
      logger = Logger.new(STDOUT)
      ActiveRecord::Base.logger = logger
      ActiveResource::Base.logger = logger
    end
  rescue Exception => e
    warn "Tried to load Railsy stuff. It didn't work out: #{e}"
  end

  if ENV['RAILS_ENV']
    require 'logger'
    Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT)) # Rails 2
  end

  require 'irb/completion'

  # Prompt behavior
  ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
end
