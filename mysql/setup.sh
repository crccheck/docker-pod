#!/bin/bash
# misc one-time setup

GROUP_ID=${GID:-"5555"}


groupadd --gid $GROUP_ID docker
usermod --append --groups docker mysql
