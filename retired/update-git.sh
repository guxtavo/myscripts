#!/bin/bash
cp ~/.bashrc .
rsync -avr --delete ~/.config/autokey ./
git commit -m "commit"
git push
