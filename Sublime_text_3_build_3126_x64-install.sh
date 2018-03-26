#!/bin/bash
# Ultima actualización: 22/08/2017
cd /
# Se descarga Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
mkdir /tmp/google
chmod 755 /tmp/google/
cd /tmp/google/
mv /google-chrome-stable_current_amd64.deb .
FILE=/usr/bin/alien
if [ -f $FILE ];
	then
		echo 'El paquete Alien ya existe...'
		echo '>>> Procediendo...'
	else
		echo'El paquete Alien no esta instalado...'
		echo '>>> Descargando...'
		wget http://http.debian.net/debian/pool/main/a/alien/alien_8.95.tar.xz
		wget https://slackbuilds.org/slackbuilds/14.2/system/alien.tar.gz
		tar xzvf alien.tar.gz
		cd /alien
		mv ../alien_8.95.tar.xz .
		chmod +x alien.SlackBuild
		./alien.SlackBuild
		installpkg /tmp/alien-8.95-x86_64-1_SBo.tgz
fi
alien -t -c google-chrome-stable_current_amd64.deb
tar xzvf google-chrome-stable-65.0.3325.181.tgz
tar czvf google-chrome-stable_current_amd64-65.0.3325.181.tar.gz opt/ usr/ etc/
cd /
mv /tmp/google/google-chrome-stable_current_amd64-65.0.3325.181.tar.gz .
cd /usr/local/
echo 'Se va a instalar en /usr/local/...'
read -p "Ingresa el nombre del directorio principal de instalacion, si no existe se creará: " DIRINST
if [ -d $DIRINST ];
	then
		echo 'El directorio ya existe...'
		echo '>>> Ingresando...'
		cd $DIRINST
	else
		echo 'El directorio no existe...'
		echo 'Creando directorio...'
		mkdir $DIRINST
		echo 'Directorio creado...'
		echo '>>> Ingresando...'
		cd $DIRINST
fi
sleep 2
mkdir google-chrome
cd google-chrome/
mv /google-chrome-stable_current_amd64-65.0.3325.181.tar.gz .
tar xzvf google-chrome-stable_current_amd64-65.0.3325.181.tar.gz
cd ../
# El directorio tiene que ser propiedad de root para actuar sobre este
chown -R root:root google-chrome/
chmod -R +x google-chrome/
#
#App a Menú
cd /usr/share/applications/
touch google-chrome.desktop
echo '[Desktop Entry]' > google-chrome.desktop
echo 'Version=65.0.3325.181 empaquetado de *.deb' >> google-chrome.desktop
echo 'Name=Google Chrome' >> google-chrome.desktop
echo 'Comment=Suite Navegador Web' >> google-chrome.desktop
echo 'Exec=/usr/local/'$DIRINST'/google-chrome/opt/google/chrome/google-chrome' >> google-chrome.desktop
echo 'Icon=/usr/local/'$DIRINST'/google-chrome/opt/google/chrome/product_logo_16.png' >> google-chrome.desktop
echo 'Categories=Network;' >> google-chrome.desktop
echo 'Terminal=false' >> google-chrome.desktop
echo 'Type=Application' >> google-chrome.desktop
cd /usr/local/$DIRINST/google-chrome/
#
#Remove
touch remove.sh
echo "#!/bin/bash" > remove.sh
echo "echo '------------------------------'" >> remove.sh
echo "echo 'Removiendo...'" >> remove.sh
echo "echo -ne '[===>                                    ]( 8.33%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[=========>                              ](16.66%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[============>                           ](24.99%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[===============>                        ](33.32%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[==================>                     ](41.65%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[=====================>                  ](49.98%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[========================>               ](58.31%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[===========================>            ](66.64%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[==============================>         ](74.97%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[=================================>      ](83.30%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[====================================>   ](91.64%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[=======================================>](100.00%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '\n'" >> remove.sh
echo 'cd /' >> remove.sh
echo 'rm /usr/share/applications/google-chrome.desktop' >> remove.sh
echo 'rm -rf /usr/local/'$DIRINST'/google-chrome/' >> remove.sh
echo 'rm -rf /home/*/.cache/google-chrome/' >> remove.sh
echo 'rm -rf /home/*/.config/google-chrome/' >> remove.sh
echo "echo 'Completado!'" >> remove.sh
echo "echo '------------------------------'" >> remove.sh
echo 'exit' >> remove.sh
chmod 744 remove.sh
#
#README
touch README.txt
echo 'Google Chrome' > README.txt
echo 'Idioma=es_MX' >> README.txt
echo 'Version=65.0.3325.181 empaquetado de .deb' >> README.txt
echo 'Arquitectura=x86_64' >> README.txt
echo 'Esta es una instalación no invasiva.' >> README.txt
echo 'Para desinstalar ejecute el fichero remove.sh como root.' >> README.txt
echo '' >> README.txt
echo 'https://www.google.com.mx/chrome/browser/desktop/index.html' >> README.txt
echo '' >> README.txt
echo 'xaxlm' >> README.txt
#
# Limpieza
cd /
echo '------------------------------'
echo 'Limpiando...'
echo -ne '[===>                                    ]( 8.33%)\r';sleep 0.2
echo -ne '[=========>                              ](16.66%)\r';sleep 0.2
echo -ne '[============>                           ](24.99%)\r';sleep 0.2
echo -ne '[===============>                        ](33.32%)\r';sleep 0.2
echo -ne '[==================>                     ](41.65%)\r';sleep 0.2
echo -ne '[=====================>                  ](49.98%)\r';sleep 0.2
echo -ne '[========================>               ](58.31%)\r';sleep 0.2
echo -ne '[===========================>            ](66.64%)\r';sleep 0.2
echo -ne '[==============================>         ](74.97%)\r';sleep 0.2
echo -ne '[=================================>      ](83.30%)\r';sleep 0.2
echo -ne '[====================================>   ](91.64%)\r';sleep 0.2
echo -ne '[=======================================>](100.00%)\r';sleep 0.2
echo -ne '\n'
rm -rf /usr/local/$DIRINST/google-chrome/google-chrome-stable_current_amd64-65.0.3325.181.tar.gz
rm -rf /tmp/google/
rm -rf /tmp/alien-8.95-x86_64-1_SBo.tgz
if [ -d /home/*/.cache/google-chrome/ ];
	then
		rm -rf /home/*/.cache/google-chrome/
	else
		:
fi
if [ -d /home/*/.config/google-chrome/ ];
	then
		rm -rf /home/*/.config/google-chrome/
	else
		:
fi
echo 'Completado!'
echo '------------------------------'
exit
