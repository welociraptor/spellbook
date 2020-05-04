#!/bin/bash

# rebase feature branch on top of master
git config alias.update 'pull --autostash --rebase origin master'

