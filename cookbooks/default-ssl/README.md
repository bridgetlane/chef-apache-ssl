default-ssl Cookbook
====================
Enables the default SSL apache webpage. Uses the self-signed certs created by the ssl-cert package, located on each node at:
- `/etc/ssl/certs/ssl-cert-snakeoil.pem`
- `/etc/ssl/private/ssl-cert-snakeoil.key`

To use your own certification, set `node['default-ssl']['data_bags']` to `true`. The data bag should be named `keys` and the data bag item should be `keys`. Example data bag:

```json
{
  "id": "keys",
  "certificate": "derp_certificate",
  "key": "derp_private_key"
}
```

Requirements
------------
#### Platforms (tested on)
- `Debian 8`

#### Cookbooks (depends on)
- `apt`
- `apache2`


Usage
-----
Just include `default-ssl` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[default-ssl]"
  ]
}
```

License and Authors
-------------------
Author: Bridget Lane
