version: '2'
services:
  nginx:
    image: nginx
    labels:
        io.rancher.container.pull_image: always
  {{- if eq .Values.DEPLOY_APACHE "true"}}
  httpd:
    image: httpd
    labels:
      io.rancher.container.pull_image: always
    health_check:
      response_timeout: 60000
      healthy_threshold: 1
      port: 80
      unhealthy_threshold: 2
      initializing_timeout: 60000
      interval: 60000
      strategy: recreate
      reinitializing_timeout: 60000
  {{- end}}
