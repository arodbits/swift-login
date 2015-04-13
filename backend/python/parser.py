#!/usr/bin/python2
## -*- coding: UTF-8 -*-

with open('./datos-reales.csv', 'rw') as f:
    for line in f:
    	n = ''
        for c in line:
        	u = ord(c)
        	if u == 241 :
        		n += "&ntilde;"
        	elif u ==  :
        		
        	else :
        		n += c
        print n
        
           

