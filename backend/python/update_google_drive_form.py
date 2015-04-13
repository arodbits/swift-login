#!/usr/bin/python2
# coding=UTF-8

# Obtenemos los nombres de los campos siguiendo los consejos de http://goo.gl/yhE6S y ejecutando
# eltos=new Array();$("div[class='ss-form-entry'] *[name]").each(function(){eltos.push($(this).attr('name'))}); eltos=eltos.filter (function (v, i, a) { return a.indexOf (v) == i }); eltos.join('","')

import csv
import requests
import urllib

FICHERO_DATOS='./test.csv'
# The URL should point to the route accepting POST requests. After checking how google has the routes structured, I found that the next one is the proper one.
#URL_FORMULARIO='https://docs.google.com/forms/d/1c4PaIVOo6RVx5yfk0WoUbXs9vD5ZG9WooT4zabTBcwY/formResponse'
URL_FORMULARIO='https://docs.google.com/forms/d/1c4PaIVOo6RVx5yfk0WoUbXs9vD5ZG9WooT4zabTBcwY/formResponse'
ifile  = open(FICHERO_DATOS, "rb")
reader = csv.reader(ifile)

rownum = 0
for row in reader:
    # Save header row.
    if rownum == 0:
        header = row
    else:
        colnum = 0
        payload={}
        for col in row:
            if colnum>0:
				payload[header[colnum]]=col
            colnum += 1
            
	f = requests.post(url=URL_FORMULARIO, data=payload)
        #Checking the status_code
	print f.status_code   
        #pip install requests     
      
	if "Este contenido no ha sido creado ni aprobado por Google" in f.text:
		print "--"
		print "Error enviando los datos; revisa los nombres de los campos"
		print payload
		print "--"
	else:
		print ".",
    rownum += 1

ifile.close()
