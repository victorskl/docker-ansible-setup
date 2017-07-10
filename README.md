# Setting Up Docker Engine using Ansible

- Specifically written for Ubuntu host system. 
- Pretty much Ansible-automation of [instruction found here](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository). 
- And `docker-compose` is also installed as [instruction found here](https://docs.docker.com/compose/install/).
- Define target Ubuntu host(s) in `hosts.ini` and then run
  ```
  bash setup.sh private_key.pem docker.yaml
  ```
- To initialize the default docker repository location at `/var/lib/docker`
  ```
  bash setup.sh private_key.pem docker_post.yaml
  ```
- To initialize the docker repository on a mounted volume e.g. `/mnt/docker`
  - `cd docker_mnt`
  - Then execute
  ```
  ansible-playbook -i ../hosts.ini -u ubuntu -v -b --ask-become-pass --become-method=sudo --key-file=private_key.pem docker_mnt.yaml
  ```
- The `daemon.json` is configured to use `overlay2` [storage driver](https://docs.docker.com/engine/userguide/storagedriver/selectadriver/#supported-backing-filesystems) instead of `aufs`.
- The `docker_build.yaml` is just an example to build an image from [Dockerfile](https://docs.docker.com/engine/reference/builder/). However, using [docker-compose](https://docs.docker.com/compose/) is better for this task. 