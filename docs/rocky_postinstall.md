# Rocky PostInstall

# Enable h264 codec

$ sudo dnf install openh264.x86_64 @epel-cisco-openh264

$ sudo dnf install gstreamer1-plugin-openh264.x86_64 @epel-cisco-openh264

$ sudo dnf install gstreamer1-libav.x86_64                          1.18.4-1.el9                        @rpmfusion-free-updates

## Enable extra repositories
> This section is extracted from [CiQ](https://ciq.com/blog/top-10-things-to-do-after-rocky-linux-9-install/). 
> 
Install the latest available updates. Make sure you’re running the latest patches, security updates, and feature updates with dnf.

$ sudo dnf -y update

Enable the CodeReady Linux Builder (CRB) repository. The CRB repository contains extra libraries and developer tools. This repository is available on Rocky Linux 9 but is disabled by default.

$ sudo dnf config-manager --set-enabled crb

Install the package for the Extra Packages for Enterprise Linux (EPEL) repository. EPEL is a Fedora project full of helpful applications for enterprise users. It includes packages like Python, Perl, Ruby, ImageMagick, and Chromium browser builds. (Please note that this package requires the CRB libraries in the previous step.)

$ sudo dnf -y install epel-release


## Extra productivity applications

Install Libre Office. LibreOffice is a free and powerful office suite. Build world-class word processing, spreadsheets, presentations, diagrams, databases, and more with this popular open source productivity software.

$ dnf -y install  libreoffice-*

Install Zoom. If you don’t know Zoom, we’re a little envious of the freedom you must experience on a regular basis. For the rest of us, we’ve got to be on video calls several times a day and Zoom is one of the most popular platforms out there.

$ sudo dnf -y install <https://zoom.us/client/latest/zoom_x86_64.rpm>

## Optional developer apps

Install extra applications needed for a basic development environment. The “Development Tools” packages include compilers, rpm builders, stack trace utilities, and other helpful apps that make software development easier.

And, of course, you’re gonna want git.

$ sudo dnf -y groupinstall "Development Tools"
$ sudo dnf -y install git

## Optional apps for scientists and researchers

Install extra applications helpful for scientific and academic research. Get mathematical tools and libraries, Python and packages like NumPy or SciPy, plotting tools, statistical software like R, and simulation tools.

$ sudo dnf -y groupinstall "Scientific Support"

## Optional apps and tools for system administrators

Install extra tools for system administration, network monitoring, and container related tasks. Get system monitoring tools, network utilities, hardware utilities, file system tools, and backup and recovery tools.

The second command installs Ansible, one of the most popular and powerful tools for IT system administration. (By the way, if you’re a fan of Ansible, level up your game and try Ascender.)

$ sudo dnf groupinstall  "System Tools"  "Container Management"
$ sudo dnf -y install ansible-core

## Optional apps and tools for security professionals

Install extra security tools for integrity and trust verification. Get intrusion detection systems, security audit tools, and network security monitors.

$ sudo dnf -y groupinfo "Security Tools"


## Optimizing RAM Usage

> This section is extracted from [Soplos Linux](soploslinux.com/como-personalizar-rocky-linux-con-gnome/). 

One of the critical points of Rocky Linux with GNOME is its RAM consumption. After making all these changes, you will notice that the system consumes between 1.5 and 2 GB of RAM. Although this consumption is normal for GNOME, you can optimize it even more by updating the kernel to the latest version.

To install the mainline kernel 6.10.10, follow these steps:

Add the kernel repository:

sudo dnf install https://www.elrepo.org/elrepo-release-9.el9.elrepo.noarch.rpm

Install the mainline kernel:

```bash
$ sudo dnf --enablerepo=elrepo-kernel install kernel-lt
```

```bash
$ sudo dnf --enablerepo=elrepo-kernel install kernel-ml
```

After installing it, reboot the system and check the memory consumption. You will see a significant improvement, reducing the RAM usage to approximately 1.2 GB.