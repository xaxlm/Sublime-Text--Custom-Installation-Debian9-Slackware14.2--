#!/bin/bash
# Ultima actualización: 04/11/2019
cd /
# Se descarga Sublimetext3
wget https://download.sublimetext.com/sublime_text_3_build_3211_x64.tar.bz2
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
mv /sublime_text_3_build_3211_x64.tar.bz2 /usr/local/$DIRINST
tar jvxf sublime_text_3_build_3211_x64.tar.bz2
#App a Menú
cd /usr/share/applications/
touch sublime.desktop
echo '[Desktop Entry]' > sublime.desktop
echo 'Version=3.2.2_build_3211_x64' >> sublime.desktop
echo 'Name=Sublime Text 3' >> sublime.desktop
echo 'Comment=Code Editor' >> sublime.desktop
echo 'Exec=/usr/local/'$DIRINST'/sublime_text_3/sublime_text' >> sublime.desktop
echo 'Icon=/usr/local/'$DIRINST'/sublime_text_3/Icon/16x16/sublime-text.png' >> sublime.desktop
echo 'Categories=Development;' >> sublime.desktop
echo 'Terminal=false' >> sublime.desktop
echo 'Type=Application' >> sublime.desktop
cd /usr/local/$DIRINST/sublime_text_3/
#
#Remove
touch remove.sh
echo '#!/bin/bash' > remove.sh
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
echo 'rm -rf /usr/share/applications/sublime.desktop' >> remove.sh
echo 'rm -rf /usr/local/'$DIRINST'/sublime_text_3/' >> remove.sh
echo 'rm -rf /home/*/.config/sublime-text-3/' >> remove.sh
echo "echo 'Completado!'" >> remove.sh
echo "echo '------------------------------'" >> remove.sh
echo 'exit' >> remove.sh
chmod 744 remove.sh
#
#README
touch README.txt
echo 'Sublime Text 3' > README.txt
echo 'Idioma=en_US' >> README.txt
echo 'Version=3.2.2_build_3211' >> README.txt
echo 'Arquitectura=x64' >> README.txt
echo 'Esta es una instalaciÃġn no invasiva.' >> README.txt
echo 'Para desinstalar ejecute el fichero remove.sh como root.' >> README.txt
echo '' >> README.txt
echo 'https://www.sublimetext.com/' >> README.txt
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
rm -rf /usr/local/$DIRINST/sublime_text_3_build_3211_x64.tar.bz2
if [ -d /home/*/.config/sublime-text-3/ ];
	then
		rm -rf /home/*/.config/sublime-text-3/
	else
		:
fi
echo 'Completado!'
echo '------------------------------'
exit
