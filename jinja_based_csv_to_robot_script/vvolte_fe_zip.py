#!/usr/bin/python
# -*- coding: utf-8 -*-

#******************************************************************
#   IMPORT SECTION
#******************************************************************

from pprint import pprint
import csv
import sys
from vspk import v5_0 as vspk
from jinja2 import Environment, FileSystemLoader

#reload(sys)
#sys.setdefaultencoding('utf8')

ent_name = "IMS"
dom_name = "VoLTE-FE"

"""     Get the macros information from the csv file as list if dicts """

with open(sys.argv[1]) as f:
    reader = csv.DictReader(f, delimiter=';')
    inputsDictList = list(reader)

#******************************************************************
#   CREATE THE DICT TO RENDER TO THE JINJA TEMPLATE
#******************************************************************

"""     Get the jinja template file """

env = Environment(loader=FileSystemLoader('./'))
template = env.get_template('vvolte_fe_zip.txt')

"""     Create the dict to be rendered to jinja - macros data + ent_name """

inputsDict = {"orgName" : ent_name, "l3_domain_name" : dom_name, "inputsList" : inputsDictList }

robotfile = '{}_.robot'.format(sys.argv[1])

with open( robotfile,'w' ) as f:
    f.write(template.render(inputsDict))
