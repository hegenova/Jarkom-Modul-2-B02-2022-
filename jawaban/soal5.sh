echo '
zone "wise.b02.com" {
    type slave;
    masters { 10.4.2.2; }; // Masukan IP Wise tanpa tanda petik
    file "/var/lib/bind/wise.b02.com";
}; ' > /etc/bind/named.conf.local