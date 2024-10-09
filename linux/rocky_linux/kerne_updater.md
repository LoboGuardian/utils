Optimización del Consumo de RAM

Uno de los puntos críticos de Rocky Linux con GNOME es su consumo de memoria RAM. Tras realizar todos estos cambios, notarás que el sistema consume entre 1,5 y 2 GB de RAM. Aunque este consumo es habitual en GNOME, puedes optimizarlo aún más actualizando el kernel a la última versión.

Para instalar el kernel mainline 6.10.10, sigue estos pasos:

Añade el repositorio de kernels:

sudo dnf install https://www.elrepo.org/elrepo-release-9.el9.elrepo.noarch.rpm

Instala el kernel mainline:

sudo dnf --enablerepo=elrepo-kernel install kernel-lt

sudo dnf --enablerepo=elrepo-kernel install kernel-ml

Después de instalarlo, reinicia el sistema y comprueba el consumo de memoria. Verás una mejora significativa, reduciendo el uso de RAM a aproximadamente 1,2 GB.
