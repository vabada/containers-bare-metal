openstack coe cluster template create \
--master-flavor m2.medium \
--external-network CERN_NETWORK \
--image 87be5e80-3ff5-4ebf-bca4-8ab7cf1fa033 \
--fixed-network CERN_NETWORK \
--coe kubernetes \
--flavor p1.dl6036580 \
--dns-nameserver 137.138.17.5 \
--labels kube_dashboard_enabled=false \
--labels prometheus_monitoring=true \
--labels kube_tag="v1.8.0-1" \
--labels grafana_admin_passwd=changeme \
--labels flannel_backend=vxlan \
--labels cvmfs_tag=qa \
--name vabada-coe-001

openstack coe cluster template update vabada-coe-001 replace floating_ip_enabled="False"
openstack coe cluster template update dabadaba-coe-001 replace flavor_id=p1.cd6108707
openstack coe cluster create --name vabadaklus-001 --keypair dockercernabad2 --cluster-template vabada-coe-001 --node-count 2
$(openstack coe cluster config vabadaklus-001)
kubectl get pods
