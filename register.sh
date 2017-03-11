#!/bin/bash
subscription-manager register --username rhn-support-gfigueir --password <password>
subscription-manager attach --pool=8a85f981576f2592015770330df347d9
yum update --security
