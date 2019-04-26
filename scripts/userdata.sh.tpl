#!/bin/bash

yum install unzip curl -y

SECRET_KEY=${api_key} sh -c "$(curl -fsSl https://bindplane.bluemedora.com/collectors/unix_install.sh)" unix_install.sh -a y
