*** Settings ***
Resource    cats_lib/resources/cats_common.robot

*** Variables ***
${org_name}             IMS
${l3_domain_name}       VoLTE-FE

*** Test Cases ***
CSPROOT Logs in VSD
    Csproot user is logged in VSD

Creating Ingress Security Policy Entry ZIP_CFX_zip_vsbg_sig_sp1_5060_TCP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_zip_vsbg_sig_sp1_5060_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060
    ...    priority=10
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[zone, zip_vsbg_sig_sp1]

Creating Egress Security Policy Entry ZIP_CFX_zip_vsbg_sig_sp1_5060_TCP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_zip_vsbg_sig_sp1_5060_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060
    ...    priority=10
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[zone, zip_vsbg_sig_sp1]

Creating Ingress Security Policy Entry ZIP_CFX_zip_vsbg_sig_sp1_5060_UDP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_zip_vsbg_sig_sp1_5060_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060
    ...    priority=20
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[zone, zip_vsbg_sig_sp1]

Creating Egress Security Policy Entry ZIP_CFX_zip_vsbg_sig_sp1_5060_UDP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_zip_vsbg_sig_sp1_5060_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060
    ...    priority=20
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[zone, zip_vsbg_sig_sp1]

Creating Ingress Security Policy Entry ZIP_CFX_zip_vsbg_sig_sp2_5060_TCP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_zip_vsbg_sig_sp2_5060_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060
    ...    priority=30
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[zone, zip_vsbg_sig_sp2]

Creating Egress Security Policy Entry ZIP_CFX_zip_vsbg_sig_sp2_5060_TCP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_zip_vsbg_sig_sp2_5060_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060
    ...    priority=30
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[zone, zip_vsbg_sig_sp2]

Creating Ingress Security Policy Entry ZIP_CFX_zip_vsbg_sig_sp2_5060_UDP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_zip_vsbg_sig_sp2_5060_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060
    ...    priority=40
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[zone, zip_vsbg_sig_sp2]

Creating Egress Security Policy Entry ZIP_CFX_zip_vsbg_sig_sp2_5060_UDP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_zip_vsbg_sig_sp2_5060_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060
    ...    priority=40
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[zone, zip_vsbg_sig_sp2]

Creating Ingress Security Policy Entry ZIP_CFX_zip_vmtas_sig_sp1_5060_TCP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_zip_vmtas_sig_sp1_5060_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060,5094
    ...    priority=50
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[zone, zip_vmtas_sig_sp1]

Creating Egress Security Policy Entry ZIP_CFX_zip_vmtas_sig_sp1_5060_TCP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_zip_vmtas_sig_sp1_5060_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060,5094
    ...    priority=50
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[zone, zip_vmtas_sig_sp1]

Creating Ingress Security Policy Entry ZIP_CFX_zip_vmtas_sig_sp1_5060_UDP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_zip_vmtas_sig_sp1_5060_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060,5094
    ...    priority=60
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[zone, zip_vmtas_sig_sp1]

Creating Egress Security Policy Entry ZIP_CFX_zip_vmtas_sig_sp1_5060_UDP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_zip_vmtas_sig_sp1_5060_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060,5094
    ...    priority=60
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[zone, zip_vmtas_sig_sp1]

Creating Ingress Security Policy Entry ZIP_CFX_ZIP_mtas_evip_5060_TCP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_ZIP_mtas_evip_5060_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060,5094
    ...    priority=70
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]

Creating Egress Security Policy Entry ZIP_CFX_ZIP_mtas_evip_5060_TCP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_ZIP_mtas_evip_5060_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=5060,5094
    ...    destinationPort=*
    ...    priority=70
    ...    cats_traffic_source=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]
    ...    cats_traffic_destination=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]

Creating Ingress Security Policy Entry ZIP_CFX_ZIP_mtas_evip_5060_UDP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_ZIP_mtas_evip_5060_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060,5094
    ...    priority=80
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]

Creating Egress Security Policy Entry ZIP_CFX_ZIP_mtas_evip_5060_UDP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_CFX_ZIP_mtas_evip_5060_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=5060,5094
    ...    destinationPort=*
    ...    priority=80
    ...    cats_traffic_source=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]
    ...    cats_traffic_destination=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]

Creating Ingress Security Policy Entry ZIP_mtas_evip_ZIP_CFX_5080_TCP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_mtas_evip_ZIP_CFX_5080_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=5080,5092
    ...    destinationPort=*
    ...    priority=90
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]

Creating Egress Security Policy Entry ZIP_mtas_evip_ZIP_CFX_5080_TCP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_mtas_evip_ZIP_CFX_5080_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5080,5092
    ...    priority=90
    ...    cats_traffic_source=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]
    ...    cats_traffic_destination=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]

Creating Ingress Security Policy Entry ZIP_mtas_evip_ZIP_CFX_5080_UDP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_mtas_evip_ZIP_CFX_5080_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=5080,5092
    ...    destinationPort=*
    ...    priority=100
    ...    cats_traffic_source=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]
    ...    cats_traffic_destination=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]

Creating Egress Security Policy Entry ZIP_mtas_evip_ZIP_CFX_5080_UDP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_mtas_evip_ZIP_CFX_5080_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5080,5092
    ...    priority=100
    ...    cats_traffic_source=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]
    ...    cats_traffic_destination=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]

Creating Ingress Security Policy Entry ZIP_vsbg_sig_sp1_ZIP_CFX_5080_TCP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_vsbg_sig_sp1_ZIP_CFX_5080_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5080,5090
    ...    priority=110
    ...    cats_traffic_source=@[zone, zip_vsbg_sig_sp1]
    ...    cats_traffic_destination=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]

Creating Egress Security Policy Entry ZIP_vsbg_sig_sp1_ZIP_CFX_5080_TCP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_vsbg_sig_sp1_ZIP_CFX_5080_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5080,5090
    ...    priority=110
    ...    cats_traffic_source=@[zone, zip_vsbg_sig_sp1]
    ...    cats_traffic_destination=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]

Creating Ingress Security Policy Entry ZIP_vsbg_sig_sp1_ZIP_CFX_5080_UDP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_vsbg_sig_sp1_ZIP_CFX_5080_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5080,5090
    ...    priority=120
    ...    cats_traffic_source=@[zone, zip_vsbg_sig_sp1]
    ...    cats_traffic_destination=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]

Creating Egress Security Policy Entry ZIP_vsbg_sig_sp1_ZIP_CFX_5080_UDP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_vsbg_sig_sp1_ZIP_CFX_5080_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5080,5090
    ...    priority=120
    ...    cats_traffic_source=@[zone, zip_vsbg_sig_sp1]
    ...    cats_traffic_destination=@[zone, ZIP_CFX_vVoLTE_VLAN-SIGTCP]

Creating Ingress Security Policy Entry ZIP_vsbg_sig_sp1_ZIP_mtas_evip_5060_TCP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_vsbg_sig_sp1_ZIP_mtas_evip_5060_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060,5094
    ...    priority=130
    ...    cats_traffic_source=@[zone, zip_vsbg_sig_sp1]
    ...    cats_traffic_destination=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]

Creating Egress Security Policy Entry ZIP_vsbg_sig_sp1_ZIP_mtas_evip_5060_TCP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_vsbg_sig_sp1_ZIP_mtas_evip_5060_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=5060,5094
    ...    destinationPort=*
    ...    priority=130
    ...    cats_traffic_source=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]
    ...    cats_traffic_destination=@[zone, zip_vsbg_sig_sp1]

Creating Ingress Security Policy Entry ZIP_vsbg_sig_sp1_ZIP_mtas_evip_5060_UDP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_vsbg_sig_sp1_ZIP_mtas_evip_5060_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060,5094
    ...    priority=140
    ...    cats_traffic_source=@[zone, zip_vsbg_sig_sp1]
    ...    cats_traffic_destination=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]

Creating Egress Security Policy Entry ZIP_vsbg_sig_sp1_ZIP_mtas_evip_5060_UDP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_vsbg_sig_sp1_ZIP_mtas_evip_5060_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=5060,5094
    ...    destinationPort=*
    ...    priority=140
    ...    cats_traffic_source=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]
    ...    cats_traffic_destination=@[zone, zip_vsbg_sig_sp1]

Creating Ingress Security Policy Entry ZIP_mtas_evip_ZIP_vsbg_sig_sp1_5060_TCP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_mtas_evip_ZIP_vsbg_sig_sp1_5060_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=5060
    ...    destinationPort=*
    ...    priority=150
    ...    cats_traffic_source=@[zone, zip_vsbg_sig_sp1]
    ...    cats_traffic_destination=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]

Creating Egress Security Policy Entry ZIP_mtas_evip_ZIP_vsbg_sig_sp1_5060_TCP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_mtas_evip_ZIP_vsbg_sig_sp1_5060_TCP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=6
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060
    ...    priority=150
    ...    cats_traffic_source=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]
    ...    cats_traffic_destination=@[zone, zip_vsbg_sig_sp1]

Creating Ingress Security Policy Entry ZIP_mtas_evip_ZIP_vsbg_sig_sp1_5060_UDP
    Create Ingress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_mtas_evip_ZIP_vsbg_sig_sp1_5060_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=5060
    ...    destinationPort=*
    ...    priority=160
    ...    cats_traffic_source=@[zone, zip_vsbg_sig_sp1]
    ...    cats_traffic_destination=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]

Creating Egress Security Policy Entry ZIP_mtas_evip_ZIP_vsbg_sig_sp1_5060_UDP
    Create Egress Security Policy Entry in L3 domain
    ...    ACLTemplateName=VoLTE_Intra_Zipec_Datacenter_Policies
    ...    description=ZIP_mtas_evip_ZIP_vsbg_sig_sp1_5060_UDP
    ...    cats_domain_name=${l3_domain_name}
    ...    action=FORWARD
    ...    cats_org_name=${org_name}
    ...    protocol=17
    ...    stateful=TRUE
    ...    sourcePort=*
    ...    destinationPort=5060
    ...    priority=160
    ...    cats_traffic_source=@[network_macro_group, VoLTE_ZIP_mtas_eVIP]
    ...    cats_traffic_destination=@[zone, zip_vsbg_sig_sp1]
