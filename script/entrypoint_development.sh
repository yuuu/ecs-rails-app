if [ -e /app/tmp/pids/server.pid ]; then rm -f /app/tmp/pids/server.pid; fi
bundle exec rails db:migrate
bundle exec rails s -p 80 -b 0.0.0.0
# bundle exec foreman start
