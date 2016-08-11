listen "unix:/var/run/unicorn.suchnull.sock"
worker_processes 3
user "noah"
working_directory "/home/noah/suchnull.com"
pid "/var/run/unicorn-suchnull.pid"
stderr_path "/var/log/unicorn/unicorn-suchnull.log"
stdout_path "/var/log/unicorn/unicorn-suchnull.log"
