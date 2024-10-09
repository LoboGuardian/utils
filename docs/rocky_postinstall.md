# Rocky PostInstall

## Add repos



## Optimizing RAM Usage

> This section is extracted from [Soplos Linux](soploslinux.com/como-personalizar-rocky-linux-con-gnome/). 

One of the critical points of Rocky Linux with GNOME is its RAM consumption. After making all these changes, you will notice that the system consumes between 1.5 and 2 GB of RAM. Although this consumption is normal for GNOME, you can optimize it even more by updating the kernel to the latest version.

To install the mainline kernel 6.10.10, follow these steps:

Add the kernel repository:

sudo dnf install https://www.elrepo.org/elrepo-release-9.el9.elrepo.noarch.rpm

Install the mainline kernel:

```bash
sudo dnf --enablerepo=elrepo-kernel install kernel-lt
```

```bash
sudo dnf --enablerepo=elrepo-kernel install kernel-ml
```

After installing it, reboot the system and check the memory consumption. You will see a significant improvement, reducing the RAM usage to approximately 1.2 GB.