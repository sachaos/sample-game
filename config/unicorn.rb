worker_processes 2
working_directory '/var/www/app'
listen '/tmp/unicorn.sock'
pid '/tmp/unicorn.pid'

timeout 60

preload_app true

stdout_path '/var/log/unicorn.log'
stderr_path '/var/log/unicorn.log'

GC.respond_to?(:copy_on_write_friendly=) && (GC.copy_on_write_friendly = true)

before_fork do |_server, _worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end
end

after_fork do |_server, _worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end
  
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end
