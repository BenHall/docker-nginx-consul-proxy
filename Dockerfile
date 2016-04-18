FROM nginx:1.9

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qq && \
    apt-get -y install unzip curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/jwilder/forego/releases/download/v0.16.1/forego -o /usr/local/bin/forego && chmod +x /usr/local/bin/forego
RUN chmod u+x /usr/local/bin/forego

RUN curl -L https://releases.hashicorp.com/consul-template/0.14.0/consul-template_0.14.0_linux_amd64.zip -o consul-template.zip && \
      unzip consul-template.zip -d /usr/local/bin 

RUN rm -v /etc/nginx/conf.d/*
ADD nginx.conf /etc/consul-templates/nginx.conf

COPY Procfile /app/Procfile
WORKDIR /app/

CMD ["forego", "start", "-r"]
