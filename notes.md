# Generate client cert
````
docker exec openvpn easyrsa build-client-full client1 nopass
````

# Take client config
````
docker exec openvpn ovpn_getclient client1 > client1.ovpn
````
