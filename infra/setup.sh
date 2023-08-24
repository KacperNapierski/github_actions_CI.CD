#!/bin/bash

sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf install terraform

sudo dnf install nvim

sudo dnf install awscli
sudo aws configure