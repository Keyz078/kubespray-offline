#!/bin/bash
kubespray_dir="$HOME/kubesrpay"
inventory_dir="${kubespray_dir}/inventory/sample"  # replace with your inventory location
dir="${inventory_dir}/group_vars/k8s_cluster"
#echo $kubespray_dir
echo "==========================================================="
echo "This script to enable or disable kubespray addons feature"
echo "Choose y/n to enable or ignoring features"
echo "==========================================================="
echo

read -p 'kubernetes dashboard: ' kube_dashboard
read -p 'helm: ' helm
read -p 'registry: ' registry
read -p 'metrics server: ' metrics_server
read -p 'local path provisioner: ' local_path_provisioner
read -p 'local volume prvisioner: ' local_volume_provisioner
read -p 'ingress nginx controller: ' ingress_nginx
read -p 'ingress alb: ' ingress_alb
read -p 'cert manager: ' cert_manager
read -p 'metallb: ' metallb
read -p 'argocd: ' argocd
read -p 'krew: ' krew
#echo $kube_dashboard $ingress_nginx
while true; do echo -n .;sleep 1; done &
trap 'kill $!' SIGTERM SIGKILL
echo "Applying: "

if [[ $kube_dashboard == "y" ]]
then
  sed -i "s/kubbernetes_dashboard_enabled:.*/kubbernetes_dashboard_enabled: true/g" "${dir}"/addons.yml;
  sleep 0.5
elif [[ $kube_dashboard == "n" ]]
then
  sed -i "s/kubbernetes_dashboard_enabled:.*/kubbernetes_dashboard_enabled: false/g" "${dir}"/addons.yml;
  sleep 0.5
fi
if [[ $helm == "y" ]]
then
  sed -i "s/helm_enabled:.*/helm_enabled: true/g" "${dir}"/addons.yml;
  sleep 0.5
elif [[ $helm == "n" ]]
then
  sed -i "s/helm_enabled:.*/helm_enabled: false/g" "${dir}"/addons.yml;
  sleep 0.5
fi
if [[ $registry == "y" ]]
then
  sed -i "s/registry_enabled:.*/registry_enabled: true/g" "${dir}"/addons.yml;
  sleep 0.5
elif [[ $registry == "n" ]]
then
  sed -i "s/registry_enabled:.*/registry_enabled: false/g" "${dir}"/addons.yml;
  sleep 0.5
fi
if [[ $metrics_server == "y" ]]
then
  sed -i "s/metrics_server_enabled:.*/metrics_server_enabled: true/g" "${dir}"/addons.yml;
  sleep 0.5
elif [[ $metrics_server == "n" ]]
then
  sed -i "s/metrics_server_enabled:.*/metrics_server_enabled: false/g" "${dir}"/addons.yml;
  sleep 0.5
fi
if [[ $local_path_provisioner == "y" ]]
then
  sed -i "s/local_path_provisioner_enabled:.*/local_path_provisioner_enabled: true/g" "${dir}"/addons.yml;
  sleep 0.5
elif [[ $local_path_provisioner == "n" ]]
then
  sed -i "s/local_path_provisioner_enabled:.*/local_path_provisioner_enabled: false/g" "${dir}"/addons.yml;
  sleep 0.5
fi
if [[ $local_volume_provisioner == "y" ]]
then
  sed -i "s/local_volume_provisioner_enabled:.*/local_volume_provisioner_enabled: true/g" "${dir}"/addons.yml;
  sleep 0.5
elif [[ $local_volume_provisioner == "n" ]]
then
  sed -i "s/local_volume_provisioner_enabled:.*/local_volume_provisioner_enabled: false/g" "${dir}"/addons.yml;
  sleep 0.5
fi
if [[ $ingress_nginx == "y" ]]
then
  sed -i "s/ingress_nginx_enabled:.*/ingress_nginx_enabled: true/g" "${dir}"/addons.yml;
  sleep 0.5
elif [[ $ingress_nginx == "n" ]]
then
  sed -i "s/ingress_nginx_enabled:.*/ingress_nginx_enabled: false/g" "${dir}"/addons.yml;
  sleep 0.5
fi
if [[ $ingress_alb == "y" ]]
then
  sed -i "s/ingress_alb_enabled:.*/ingress_alb_enabled: true/g" "${dir}"/addons.yml;
  sleep 0.5
elif [[ $ingress_alb == "n" ]]
then
  sed -i "s/ingress_alb_enabled:.*/ingress_alb_enabled: false/g" "${dir}"/addons.yml;
  sleep 0.5
fi
if [[ $cert_manager == "y" ]]
then
  sed -i "s/cert_manager_enabled:.*/cert_manager_enabled: true/g" "${dir}"/addons.yml;
  sleep 0.5
elif [[ $cert_manager == "n" ]]
then
  sed -i "s/cert_manager_enabled:.*/cert_manager_enabled: false/g" "${dir}"/addons.yml;
  sleep 0.5
fi
if [[ $metallb == "y" ]]
then
  sed -i "s/metallb_enabled:.*/metallb_enabled: true/g" "${dir}"/addons.yml;
  sleep 0.5
elif [[ $metallb == "n" ]]
then
  sed -i "s/metallb_enabled:.*/metallb_enabled: false/g" "${dir}"/addons.yml;
  sleep 0.5
fi
if [[ $argocd == "y" ]]
then
  sed -i "s/argocd_enabled:.*/argocd_enabled: true/g" "${dir}"/addons.yml;
  sleep 0.5
elif [[ $argocd == "n" ]]
then
  sed -i "s/argocd_enabled:.*/argocd_enabled: false/g" "${dir}"/addons.yml;
  sleep 0.5
fi
if [[ $krew == "y" ]]
then
  sed -i "s/krew_enabled:.*/krew_enabled: true/g" "${dir}"/addons.yml;
  sleep 0.5
elif [[ $krew == "n" ]]
then
  sed -i "s/krew_enabled:.*/krew_enabled: false/g" "${dir}"/addons.yml;
  sleep 0.5
fi

echo "done"
kill $!
