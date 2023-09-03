#! /bin/bash

mkdocs git add . && git commit -m "%*" && git push
