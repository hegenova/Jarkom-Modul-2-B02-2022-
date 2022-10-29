echo '
zone "wise.b02.com" {
        type master;
          notify yes;
          also-notify {10.4.3.2;};
          allow-transfer {10.4.3.2;};
        file "/etc/bind/wise/wise.b02.com";
};

zone "2.4.10.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/2.4.10.in-addr.arpa";
};
' > 

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
@       IN      NS      wise.b02.com.
@       IN      A       10.4.2.2
www     IN      CNAME   wise.b02.com.
eden    IN      A       10.4.3.3
www.eden     IN      CNAME   eden.wise.b02.com.

' > /etc/bind/wise/wise.b02.com