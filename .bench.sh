#!/bin/sh

git checkout master
rake benchtest
git checkout matt-branch
rake benchtest
git checkout dynamic-apply-method
rake benchtest
git checkout fetch-and-default-args
rake benchtest
