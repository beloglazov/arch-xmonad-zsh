These notes are for installing Arch Linux as dual boot on a Macbook Pro Retina 2012.


# Wireless

1. Download b43 firmware
2. Disable ipv6: add ipv6.disable=1 to the kernel line
3. rmmod b43
4. modprobe b43
5. ip link set wlp4s0 down
6. netctl start ibm


# Bootloader

## In OS X

Download rEFInd from http://www.rodsbooks.com/refind/, then install it into the
ESP:

```Bash
./install.sh --esp
```

Mount the EFI partition and add the following options to refind.conf located on it:

1. dont_scan_volumes
2. scan_all_linux_kernels
3. also_scan_dirs

## In the Arch install

```Bash
pacstrap /mnt grub dosfstools efibootmgr grub-efi-x86_64
arch-chroot /mnt
mkdir -p /boot/efi
mount -t vfat /dev/sdXY /boot/efi
modprobe dm-mod
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck --debug
mkdir -p /boot/grub/locale
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
grub-mkconfig -o /boot/grub/grub.cfg
```
