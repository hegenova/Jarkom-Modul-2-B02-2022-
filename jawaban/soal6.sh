echo '
options {
        directory "/var/cache/bind";
        // forwarders {
        //      0.0.0.0;
        // };
        //dnssec-validation auto;
        allow-query{any;};
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};

' > /etc/bind/named.conf.options

echo '
zone "operation.wise.b02.com" {
    type master;
    file "/etc/bind/operation/operation.wise.b02.com";
};
' >> /etc/bind/named.conf.local

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     operation.wise.b02.com. root.operation.wise.b02.com. (
                        2022102401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      operation.wise.b02.com.
@       IN      A       10.4.3.3
www     IN      CNAME   operation.wise.b02.com.
strix    IN      A       10.4.3.3
www.strix     IN      CNAME   strix.operation.wise.b02.com.
' > /etc/bind/operation/operation.wise.b02.com