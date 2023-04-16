# Secret secrets keys

Place sealed secret certificates here: tls.crt and tls.crt.
You can generate them yourself:
```sh
openssl req -x509 -days 365 -nodes -newkey rsa:4096 -keyout tls.key -out tls.crt -subj "/CN=sealed-secret/O=sealed-secret"
```