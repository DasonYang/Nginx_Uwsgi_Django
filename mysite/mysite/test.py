#!/usr/bin/python
# _*_ coding: UTF-8 _*_
# test.py

from django.http import HttpResponse as http
def application(reqs):
    
    return http(content='200 Ok.', status=200)