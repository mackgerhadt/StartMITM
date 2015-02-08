# StartMITM
Automated Man in the Middle Script for Attacking SSL Connections.

NOTE: Make sure your etter.conf is configured accordingly.

# if you use iptables:
   redir_command_on = "iptables -t nat -A PREROUTING -i %iface -p tcp --dport %port -j REDIRECT --to-port %rport"
   redir_command_off = "iptables -t nat -D PREROUTING -i %iface -p tcp --dport %port -j REDIRECT --to-port %rport"


#############################################################################
DISCLAIMER:

I AM NOT RESPONSIBLY FOR ANY CRIMINAL ACTIONS THAT YOU MAY OR MAY NOT COMMIT.

#############################################################################
