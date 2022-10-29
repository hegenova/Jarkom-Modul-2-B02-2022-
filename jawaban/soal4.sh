echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     wise.b02.com. root.wise.b02.com. (
                        2022102401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
2.4.10.in-addr.arpa. IN      NS      wise.b02.com.
2                       IN      PTR     wise.b02.com.
' > /etc/bind/wise/2.4.10.in-addr.arpa