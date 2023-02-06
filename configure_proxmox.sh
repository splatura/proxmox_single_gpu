#!/bin/sh

sed -i 's#^\(GRUB_CMDLINE_LINUX_DEFAULT="quiet\)"$#\1 amd_iommu=on iommu=pt initcall_blacklist=sysfb_init"#' /etc/default/grub
update-grub

echo "options kvm ignore_msrs=1 report_ignored_msrs=0" > /etc/modprobe.d/kvm.conf

echo "options vfio-pci ids=10de:2507,10de:228e disable_vga=1" > /etc/modprobe.d/vfio.conf

echo "blacklist nvidiafb" >> /etc/modprobe.d/pve-blacklist.conf
echo "blacklist nouveau" >> /etc/modprobe.d/pve-blacklist.conf
echo "blacklist nvidia" >> /etc/modprobe.d/pve-blacklist.conf
echo "blacklist snd_hda_codec_hdmi" >> /etc/modprobe.d/pve-blacklist.conf
echo "blacklist snd_hda_intel" >> /etc/modprobe.d/pve-blacklist.conf
echo "blacklist snd_hda_codec" >> /etc/modprobe.d/pve-blacklist.conf
echo "blacklist snd_hda_core" >> /etc/modprobe.d/pve-blacklist.conf
echo "blacklist radeon" >> /etc/modprobe.d/pve-blacklist.conf
echo "blacklist amdgpu" >> /etc/modprobe.d/pve-blacklist.conf

update-initramfs -u -k all

mkdir /var/lib/vz/snippets

curl https://raw.githubusercontent.com/splatura/proxmox_single_gpu/main/gpu-hookscript.sh --output /var/lib/vz/snippets/gpu-hookscript.sh
chmod +x /var/lib/vz/snippets/gpu-hookscript.sh
