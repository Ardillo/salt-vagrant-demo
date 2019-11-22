# Salt Vagrant Demo

A Salt Demo using Vagrant. This repo is based on [github.com - UtahDave's salt-vagrant-demo](https://github.com/UtahDave/salt-vagrant-demo)


## Instructions

Run the following commands in a terminal. Git, VirtualBox and Vagrant must
already be installed.

```bash

git clone <repo>
cd salt-vagrant-demo
vagrant plugin install vagrant-vbguest
vagrant up
```

This will download an Ubuntu  VirtualBox image and create five virtual
machines for you. One will be a Salt Master named `master` and four will be Salt
Minions named `minion1`, `minion2`, `minion3` and `minion4`.  The Salt Minions will point to the Salt
Master and the Minion's keys will already be accepted. Because the keys are
pre-generated and reside in the repo, please be sure to regenerate new keys if
you use this for production purposes.

You can then run the following commands to log into the Salt Master and begin
using Salt.

```bash
vagrant ssh master
sudo salt \* test.ping
```
## Grains

In order to make this demo a bit more dynamic you can add the following content to `/etc/salt/grains` to let the minions have a certain state.

```txt 
roles:
  - ntp
```

```txt 
roles:
  - docker

docker:
  group_members:
    - [vagrant, ubuntu]
```

