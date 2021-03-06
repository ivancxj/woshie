#!/usr/bin/env puma

# environment 'production'
environment ENV['RAILS_ENV'] || 'production'
daemonize true

wd          = File.expand_path('../../', __FILE__)
tmp_path    = File.join(wd, 'log')
Dir.mkdir(tmp_path) unless File.exist?(tmp_path)

pidfile          File.join(tmp_path, 'puma.pid')
state_path       File.join(tmp_path, 'puma.state')
stdout_redirect  File.join(tmp_path, 'puma.out.log'), File.join(tmp_path, 'puma.err.log'), true

threads 0, 32
bind 'tcp://0.0.0.0:3000'

workers 0

# Preload the application before starting the workers; this conflicts with
# phased restart feature. (off by default)
preload_app!
