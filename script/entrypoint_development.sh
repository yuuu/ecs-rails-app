if [ -e /app/tmp/pids/server.pid ]; then rm -f /app/tmp/pids/server.pid; fi
bundle exec rails db:migrate
bundle exec foreman start
