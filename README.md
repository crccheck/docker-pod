# google-auth-proxy container

Built from releases at https://github.com/bitly/google_auth_proxy

## Configuration

Documentation is here: https://github.com/bitly/google_auth_proxy#configuration

The entry point is configured such that you can pass options right into your run command:

    docker run ipmb/google_auth_proxy -upstream=... -redirect-url=...

Consider using environment variables for secrets such as:

* `GOOGLE_AUTH_PROXY_CLIENT_SECRET`
* `GOOGLE_AUTH_PROXY_COOKIE_SECRET`


