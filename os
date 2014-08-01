#!/bin/sh

_copyright(){ echo "
  ozh lightweight shell extensions
  2008-2014 - anx @ ulzq de (Sebastian Glaser)
  Licensed under GNU GPL v3"; }
_license(){ echo "
  ozh is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2, or (at your option)
  any later version.

  ozh is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this software; see the file COPYING.  If not, write to
  the Free Software Foundation, Inc., 59 Temple Place, Suite 330,
  Boston, MA 02111-1307 USA

  http://www.gnu.org/licenses/gpl.html"; }

export OZ_SHELL_OS='c'
os_ios(){          test -d /private/var/mobile; }
os_x(){            test -f "$(which system_profiler 2>/dev/null)" 2>/dev/null; }
os_xnu(){          uname -a |grep -qi xnu; }
os_debian(){       uname -a |grep -qi debian; }
os_ubuntu(){       uname -a |grep -qi ubuntu; }
os_linux(){        uname -a  |grep -qi linux; }
os_tinycore(){     test -e /opt/bootlocal.sh; }
os_microcore(){    test -e /opt/bootlocal.sh; }
os_mcx(){          test -e /etc/mcx-dist; }
os_openwrt(){      test -e /etc/openwrt_release; }
os_cygwin(){       /bin/false; }
os_android_rooted(){ test -d /system -a -f $(which su); }
os_android(){      test -d /system; }

  if os_ios;then            OZ_SHELL_OS='apple-ios';
                            OZ_SHELL_OS_ROOTED=true;
elif os_x;then              OZ_SHELL_OS='apple-osx'
elif os_xnu;then            OZ_SHELL_OS='gnu-darwin'
elif os_android_rooted;then OZ_SHELL_OS='gnu-linux-android';
                            OZ_SHELL_OS_ROOTED=true;
elif os_android;then        OZ_SHELL_OS='gnu-linux-android'
                            OZ_SHELL_OS_ROOTED=false;
elif os_ubuntu;then         OZ_SHELL_OS='gnu-linux-ubuntu'
elif os_debian;then         OZ_SHELL_OS='gnu-linux-debian'
elif os_tinycore;then       OZ_SHELL_OS='gnu-linux-tinycore'
elif os_microcore;then      OZ_SHELL_OS='gnu-linux-microcore'
elif os_mcx;then            OZ_SHELL_OS='gnu-linux-mcx'
elif os_openwrt;then        OZ_SHELL_OS='gnu-linux-openwrt'
elif os_linux;then          OZ_SHELL_OS='gnu-linux'
elif os_cygwin;then         OZ_SHELL_OS='gnu-windows';fi

OZ_SHELL_ARCH=$(uname -m)
case "$OZ_SHELL_ARCH" in
"i386"|"i686")    OZ_SHELL_ARCH="x86";;
"x86_64"|"amd64") OZ_SHELL_ARCH="x64";;
esac
