#! /bin/bash

read name

mkdocs git add . && git commit -m "$name" && git push
