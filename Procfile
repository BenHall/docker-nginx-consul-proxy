nginx:  /usr/sbin/nginx -c /etc/nginx/nginx.conf -t && exec /usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;"
consul: consul-template -consul=consul:8500 -template "/etc/consul-templates/nginx.conf:/etc/nginx/conf.d/app.conf:nginx -s reload"
