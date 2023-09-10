#! /bin/bash

read name

git add . && git commit -m "$name" && git push
