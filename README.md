# linus-spigot-server


# TODO: Enter the cookbook description here.


Testing:

```
export KITCHEN_LOCAL_YAML=.kitchen.dokken.yml
eval $(docker-machine env default)
```

NOTE: dokken is of limited use for this cookbook as it tries to change systemd stuff

# Production

```
ssh -A ubuntu@ec2...
```

Then set up this cookbook:

```
set -o vi
mkdir -p ~/chef-repo/cookbooks
cd ~/chef-repo/cookbooks
git clone git@github.com:pburkholder/linus-spigot-server.git
```

Install chefDK:

```bash
curl -LO https://omnitruck.chef.io/install.sh && sudo bash ./install.sh -v 1.4 -P chefdk
eval "$(chef shell-init bash)"
```

Configure:

```
sudo mkdir /etc/chef
sudo cp templates/client.rb /etc/chef/solo.rb
gem install berkshelf
berks vendor
```

Do it:

```bash
sudo bash
eval "$(chef shell-init bash)"
chef-solo -o 'recipe[linus-spigot-server]' -N spigot
```


