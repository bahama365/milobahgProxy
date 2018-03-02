# milobahgProxy
Apache reverse proxy for Docker, running both HTTP and HTTPS
Replace 'key.key' and 'cert.crt' with your SSL cert and key, if you have a chain.crt then add as 'chain.crt' and uncomment in Dockerfile, and in proxy-ssl.conf


To run as a standalone container:

docker run --name proxy \
-d \
-p 8443:443 \
-p 8080:80 \
-e PROXY_PASS_HTTP='http://httpUrlHere.com/' \
-e PROXY_PASS_SSL='https://httpsUrlHere.com/' \
milobahg/proxy:latest

To run as a service:

docker service create --name proxy \
--publish 8443:443 \
--publish 8080:80 \
-e PROXY_PASS_HTTP='http://httpUrlHere.com/' \
-e PROXY_PASS_SSL='https://httpsUrlHere.com/' \
milobahg/proxy:latest

To run in a stack (with visualiser!), edit the variables inside of compose.yml for the PROXY_PASS* vars, then:

docker stack deploy -c compose.yml proxy

Visit: http://nodeIP.com
Or   : https://nodeIP.com:8443
