# proxmox_single_gpu
Script to set up a vanilla install of Proxmox for single gpu passthrough

Focused on the AMD platform with 6800xt GPU and a 3500 GPU

very alpha

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/splatura/proxmox_single_gpu/main/add_repo.sh)"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/splatura/proxmox_single_gpu/main/configure_proxmox.sh)"

Special mention to https://dazeb.uk/proxmox-vm-gpu-hardware-acceleration-for-jellyfin-plex-emby/ and https://www.reddit.com/r/homelab/comments/b5xpua/the_ultimate_beginners_guide_to_gpu_passthrough/ who both have awesome explainations of a lot of this stuff

qm set 102 --hookscript local:snippets/gpu-hookscript.sh
