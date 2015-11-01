# chef-apache-ssl
Configures the default Apache website with SSL using Chef Solo, Vagrant, Berkshelf. To use without data bags, set `node['default-ssl']['data_bags']` to `false` in the `apache_ssl.json` role.

To Run
------
```berks install```

```vagrant up```
