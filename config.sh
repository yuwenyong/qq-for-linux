#!/bin/bash

wine --version
if [ $? -ne 0 ];then
    echo "You have to install wine first!"
    exit 1
fi
rm -rf test/.wine
rm -rf test/.local
cp -ra .wine test/
cp -ra .local test/
echo "#!/bin/bash" > start_tm2013.sh
echo "wine '${HOME}/.wine/drive_c/Program Files/TM/Bin/TM.exe'" >> start_tm2013.sh
chmod a+x start_tm2013.sh
echo "[Desktop Entry]" > TM2013.desktop
echo "Name=TM2013" >> TM2013.desktop
echo "Icon=${HOME}/.local/share/icons/hicolor/48x48/apps/TM.png" >> TM2013.desktop
echo "Exec=/bin/start_tm2013.sh" >> TM2013.desktop
echo "StartupNotify=true" >> TM2013.desktop
echo "Terminal=false" >> TM2013.desktop
echo "Type=Application" >> TM2013.desktop
echo "Categories=Network;InstantMessaging;" >> TM2013.desktop
winecfg
echo "#!/bin/bash" > install.sh
echo "cp start_tm2013.sh /bin/" >> install.sh
echo "cp TM2013.desktop /usr/share/applications/" >> install.sh
chmod a+x install.sh

