google-auth-proxy
=================

Built from releases at https://github.com/bitly/google_auth_proxy

Based on the work done at https://github.com/lincolnloop/docker-google-auth-proxy


Configuration
-------------

Documentation is here: https://github.com/bitly/google_auth_proxy#configuration

Run the image like:

    docker run crccheck/google-auth-proxy google_auth_proxy -upstream=... -redirect-url=...

Consider using environment variables for secrets such as:

* `GOOGLE_AUTH_PROXY_CLIENT_SECRET`
* `GOOGLE_AUTH_PROXY_COOKIE_SECRET`


Differences
-----------

Uses a smaller basebox for an image size of 16MB versus 183MB. Some personal
style tweaks.
