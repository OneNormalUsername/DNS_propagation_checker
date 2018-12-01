Paquet dnsutils --> apt-get update && apt-get install dnsutils
--> includes dig et nslookup
_______________________________________________________________________

dig @server name type

server = name or IP adress of server to query. Can be either IPV4 or IPv6

nme = name of ressource record that is to be looked up

type = indicates what type of query is required. Can be ANY, A, MX, SIG etc
type can be any valid query type. If no type argument is provided dig will perform  a lookup for A record.

eg syntax : dig coventry.ac.uk ANY

______________________________________________________________________

nslookup [domain name] --> translate domain names to IP adress (or vice-versa)

nslookup [domain name] [dns_we_want_to_use]  --> same operation as above but with using the DNS we want instead of the system one

Options :

-port=[number] --> allow to request query on an other port than DNS normal one (53)

/!\ Use www.[domain_name] to avoid getting no answer (hi coventry website) /!\


______________________________________________________________________

There is no DNS cache on Loonix (at least on Pi) unless you got ncsd installed https://www.raspberrypi.org/forums/viewtopic.php?t=68715 https://www.siteground.com/kb/how_to_clear_the_local_dns_cache_in_linux/ )

_______________________________________________________________________

IDEA : Use dig to check DNS propagation 

--> dig [domain_name] ANY > output.txt before applying a DNS change
Do a DNS change
Repeat previous operation but this time change output file to output2.txt

Do a loop.

Compare output and output2.txt
If they're different print "DNS record has changed"
Otherwise print "DNS record has not changed"

Wait something like one minut before re checking
