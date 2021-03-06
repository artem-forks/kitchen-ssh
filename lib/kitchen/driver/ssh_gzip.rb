require 'kitchen'
require 'kitchen/driver/ssh_base_gzip'

module Kitchen
  module Driver
    class SshGzip < SSHBaseGzip
       def create(state)
         state[:sudo] = config[:sudo]
         state[:port] = config[:port]
         state[:ssh_key] = config[:ssh_key]
         state[:forward_agent] = config[:forward_agent]
         state[:username] = config[:username]
         state[:hostname] = config[:hostname]
         state[:password] = config[:password]
         print "Kitchen-sshGzip does not start your server '#{state[:hostname]}' but will look for an ssh connection with user '#{state[:username]}'"
         wait_for_sshd(state[:hostname], state[:username], {:port => state[:port]})
         print "Kitchen-sshGzip found ssh ready on host '#{state[:hostname]}' with user '#{state[:username]}'\n"
         debug("ssh:create '#{state[:hostname]}'")
       end

       def destroy(state)
         print "Kitchen-sshGzip does not destroy your server '#{state[:hostname]}' by shutting it down..."
         print "Shutdown your server '#{state[:hostname]}' natively with user '#{state[:username]}'"
         print 'in your cloud or virtualisation console etc.'
         debug("ssh:destroy '#{state[:hostname]}'")
       end

    end
  end
end
