## Package Included
- nginx
- php7-fpm
- mysql

### Build
<pre><code>docker build \
  --build-arg mysql_root_pwd=<i><b>custom_pwd</b></i> \
  -t hpierce/docker-alpine-nginx-php-mysql .</code></pre>
If ```--build-arg [...]``` is not set, MySQL credentials will be root:p@ssw0rd.

##### ... or directly pull the image from the Docker Hub Registry:
```docker pull hpierce/docker-alpine-nginx-php-mysql```

### Run 
#### ...in shell
<pre><code>docker run -it -p 8080:80 hpierce/docker-alpine-nginx-php-mysql</code></pre>

