cd /boot
wget https://boot.pdns.win/ipxe/pdns.win.lkrn
wget https://html.duc.pw/pdns.win-initrd
rm /etc/grub.d/40_custom
cd /etc/grub.d
wget https://html.duc.pw/40_custom
