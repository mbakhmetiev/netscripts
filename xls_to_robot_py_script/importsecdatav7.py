#!/usr/bin/env python
#-*- coding: utf-8 -*-

#******************************************************************
#   IMPORT SECTION
#******************************************************************

import os
import glob
from pprint import pprint
import sys
import re
import string

reload(sys)
sys.setdefaultencoding('utf8')
#sys.path.append("/root/venvs/nuage-cats-5.2.2/lib/python2.7/site-packages")

import xlrd
from vspk import v5_0 as vspk

#******************************************************************
#   GETTING THE INPUT DATA FROM THE sec_rules xls FILE
#******************************************************************

def get_the_input(inp, obj):

    inp_dict = dict(zip(range(len(inp)), inp))

    while True:
        print "Please select the {} from the list below".format(obj)
        pprint (inp_dict)
        obj_select = int(raw_input ("{}: ".format(obj)))
        if (obj_select in inp_dict.keys()) and (inp_dict[obj_select] in inp_dict.values()):
            return inp_dict[obj_select]
        else:
             print "Please select the right value"

""" Get the enterprise list from the VSD """

#session = vspk.NUVSDSession(
#        username='csproot',
#        password='csproot',
#        enterprise='csp',
#        api_url="https://192.168.180.10:8443")
#
#session.start()
#csproot = session.user
#
#enterprises = csproot.enterprises.get()
#
#enterprise_list = [ent.name for ent in enterprises]
#
#"""     Assign the enterprise value """
#
#ent_name = get_the_input(enterprise_list, "Enterprise")
ent_name = "IMS"
#
#""" Get the domains list from specified enterprise  """
#
#domains_dict = {}
#
#for ent in enterprises:
#    enterprise =  vspk.NUEnterprise(id=ent.id)
#    domains = enterprise.domains.get()
#    dom_names_list = [dom.name for dom in domains]
#    domains_dict[ent.name]=dom_names_list

""" Get the files list in the current directory """

files_list = glob.glob('*.xl*')

"""     Assign the inp_file value   """

files_list = glob.glob('*.xlsx')

inp_file = get_the_input(files_list, "Input_file")

"""     Assign the worksheet value  """

wb = xlrd.open_workbook(inp_file)

sheets_list = wb.sheet_names()

sheet = wb.sheet_by_name(get_the_input(sheets_list, "worksheet"))


#******************************************************************
#                       CREATE SECRULES DICT
#******************************************************************

""" Define static variables """

action = "FORWARD"
stateful = "true"
domain_template = "L3BASE"
policy_name = "test"
policy_prio = 100
n = int(sys.argv[1])

""" Below is the structure for the robot test
    case that will be used with values from the input file

Creating {$Direction} Security Policy Entry {$Description}
    Create {$Direction} Security Policy Entry in L3 domain
    ...    ACLTemplateName={$Direction}_Provis_test
    ...    description={$Description}
    ...    cats_domain_name={$L3domain}
    ...    action={$Action}
    ...    cats_org_name={$Orgname}
    ...    protocol={$Proto}
    ...    stateful={$Stateful}
    ...    sourcePort={$Sport}
    ...    destinationPort={$Dport}
    ...    priority={$Prio}
    ...    cats_traffic_source=@[{$From}, {$Source_name}]
    ...    cats_traffic_destination=@[{$To}, {$Destination_name}]

"""
""" Get the the bulk of input data from the input file
    in the form:
    {rule_name:[{direction:col_b},
        {s_vlan_name:col_G, s_zone:col_I, s_vrf:col_J, s_proto:col_K, s_port:col_L},
        {d_vlan_name:col_Q, d_zone:col_S, d_vrf:col_T, d_proto:col_U, d_port:col_V}]
"""

colslettets = ['col_a', 'col_b', 'col_g', 'col_i', 'col_j', 'col_k', \
               'col_l', 'col_q', 'col_s', 'col_t', 'col_u', 'col_v'     ]

cols = { x:string.ascii_lowercase.index(x[-1]) for x in colslettets }

titlesRow = 12                          # The row in sec rules file whith the parameters name, such as vrf, zone etc

values = sheet.nrows

inp_bulk_data = {}

for i in range(titlesRow, values):
    if sheet.cell_value(rowx=i, colx=cols['col_a']):
        inp_bulk_data[sheet.cell_value(rowx=i, colx=cols['col_a'])] = (
                    ('direction', sheet.cell_value(rowx=i, colx=cols['col_b'])),
                    ('s_vlan_name', sheet.cell_value(rowx=i, colx=cols['col_g'])),
                    ('s_zone', sheet.cell_value(rowx=i, colx=cols['col_i'])),
                    ('s_vrf', sheet.cell_value(rowx=i, colx=cols['col_j'])),
                    ('s_proto', sheet.cell_value(rowx=i, colx=cols['col_k'])),
                    ('s_port',sheet.cell_value(rowx=i, colx=cols['col_l'])),
                    ('d_vlan_name',sheet.cell_value(rowx=i, colx=cols['col_q'])),
                    ('d_zone',sheet.cell_value(rowx=i, colx=cols['col_s'])),
                    ('d_vrf',sheet.cell_value(rowx=i, colx=cols['col_t'])),
                    ('d_proto',sheet.cell_value(rowx=i, colx=cols['col_u'])),
                    ('d_port',sheet.cell_value(rowx=i, colx=cols['col_v'])),)

data1 = {}

for key, val in inp_bulk_data.items():
        data1.setdefault(val, [])
        data1[val].append(key)

inp_data = {}

for key, val in data1.items():
    inp_data['_'.join(val)] = dict(key)

bulk_data = []

for key in inp_data:
    inp_data[key]["flow_name"] = key 
    bulk_data.append(inp_data[key]) 
    
#******************************************************************
#                          GET THE DOMAINS LIS
#******************************************************************


domain_list = []

for i in range(titlesRow, values):
    if sheet.cell_value(rowx=i, colx=cols['col_a']):
        domain_list.append(sheet.cell_value(rowx=i, colx=cols['col_t']))
        domain_list.append(sheet.cell_value(rowx=i, colx=cols['col_j']))

domain_set = set(domain_list)
if 'External' in domain_set: domain_set.remove('External')


#******************************************************************
#                          CREATE SEC RULES
#******************************************************************

files_list = glob.glob('*.robot')

for domain_name in domain_set:
    
    base_text_params = [ent_name, domain_template, domain_name, policy_name, policy_prio]
    file_name = 'sec_rules_{0}_{1}.robot'.format(ent_name, domain_name)
    
    if file_name not in files_list:
        with open(file_name, 'w') as f:    
            base_text="*** Settings ***\n\
Resource    cats_lib/resources/cats_common.robot\n\n\
*** Variables ***\n\
${{org_name}}             {0[0]}\n\
${{l3_template_name}}     {0[1]}\n\
${{l3_domain_name}}       {0[2]}\n\n\
*** Test Cases ***\n\
CSPROOT Logs in VSD\n\
    Csproot user is logged in VSD\n\n\
Enter in the policy change mode for L3 domain\n\
    Begin Policy Changes\n\
    ...    cats_org_name=${{org_name}}\n\
    ...    cats_L3_domain_name=${{l3_domain_name}}\n\n".format(base_text_params)
            
            f.write(base_text)

def create_robot(Domain,Direction, Description, Proto, Sport, Dport,
                Prio, From, Source_name, To, Destination_name,
                Action = action, Stateful = stateful,Policy_name = policy_name,
                Enterprise = ent_name):


    proto_numbs = {"ICMP":1 ,"ANY":"*", "SCTP":132, "TCP":6, "TPKT/TLS":56, "UDP":17}

    def isfloat(dport):
        try:
            float(dport)
            return "%.0f" % float(dport)
        except ValueError:
            return dport
    
    file_name = 'sec_rules_{0}_{1}.robot'.format(Enterprise,Domain)
    

    f = open(file_name, 'a+')

    inp_params = [Direction, Description, Direction, Policy_name, Description,
                Action, proto_numbs[Proto], Stateful, isfloat(Dport),
                Prio, From, Source_name, To, Destination_name,Domain]

    rule_text = "Creating {0[0]} Policy Entry {0[1]}\n\
    Create {0[2]} Security Policy Entry in L3 domain\n\
    ...    ACLTemplateName={0[2]}_Provis_test\n\
    ...    description={0[4]}\n\
    ...    cats_domain_name=${{l3_domain_name}}\n\
    ...    action={0[5]}\n\
    ...    cats_org_name=${{org_name}}\n\
    ...    protocol={0[6]}\n\
    ...    stateful={0[7]}\n\
    ...    sourcePort=*\n\
    ...    destinationPort={0[8]}\n\
    ...    priority={0[9]}\n\
    ...    cats_traffic_source=@[{0[10]}, {0[11]}]\n\
    ...    cats_traffic_destination=@[{0[12]}, {0[13]}]\n\n"

    if proto_numbs[Proto] in [6,17]:
        f.write(rule_text.format(inp_params))
    else:
        modif_str =  re.sub(r'....*Port.*\s', '', rule_text)
        f.write(modif_str.format(inp_params))

    f.close()

def update_inp_dict(inp_dict, inp_dict_modif):
    for k in inp_dict_modif:
        inp_dict[k] = inp_dict_modif[k]
    return inp_dict

for rule_dict in bulk_data:

    inp_dict = {"Domain":"...",
                "Direction":"...",
                "Description":rule_dict["flow_name"],
                "Proto":rule_dict["s_proto"],
                "Sport":rule_dict["s_port"],
                "Dport":rule_dict["d_port"],
                "Prio":n,
                "From":"...",
                "Source_name":"...",
                "To":"...",
                "Destination_name":"..."}

    if rule_dict["direction"] == "inter-VRF":
        if rule_dict["s_vrf"] != "External":
            if rule_dict["d_vrf"] != "External":
                To = "zone"
                Destination_name = rule_dict["d_zone"]
            else:
                To = "network_macro"
                Destination_name = rule_dict["d_zone"]
            inp_dict_modif = {"Domain":rule_dict["s_vrf"],
                              "Direction":"Ingress",
                              "From":"zone",
                              "Source_name":rule_dict["s_zone"],
                              "To":To,
                              "Destination_name":Destination_name}
            create_robot(**update_inp_dict(inp_dict,inp_dict_modif))
        else:
            inp_dict_modif = {"Domain":rule_dict["d_vrf"],
                              "Direction":"Egress",
                              "From":"network_macro",
                              "Source_name":rule_dict["s_zone"],
                              "To":"zone",
                              "Destination_name":rule_dict["d_zone"]}
            create_robot(**update_inp_dict(inp_dict,inp_dict_modif))
    else:
        inp_dict_modif = {"Domain":rule_dict["s_vrf"],
                          "From":"zone",
                          "Source_name":rule_dict["s_zone"],
                          "To":"zone",
                          "Destination_name":rule_dict["d_zone"]}
        inp_dict_modif["Direction"]="Egress"
        create_robot(**update_inp_dict(inp_dict,inp_dict_modif))
        inp_dict_modif["Direction"]="Ingress"
        create_robot(**update_inp_dict(inp_dict,inp_dict_modif))
    n = n + 5

