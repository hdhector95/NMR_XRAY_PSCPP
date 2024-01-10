# Tesis de Investigación en Empaquetamiento de Cadenas Laterales de Proteínas
*"Un enfoque evaluativo del rendimiento con muestras de solucion NMR y Cristalografía de rayos X", nuestro manual ofrece una guía detallada para los estados del arte, proporcionando una valiosa referencia para la investigación en empaquetamiento de cadenas laterales de proteínas.*

[//]: # (Este repositorio contiene información y manuales relacionados con los algoritmos de empaquetamiento de cadenas laterales de proteínas. En particular, se proporcionan guías detalladas para los siguientes estados del arte:)
En particular, se proporcionan guías detalladas para los siguientes estados del arte:
- **SCWRL4:**  en biocomputación, optimiza conformaciones de cadenas laterales proteicas mediante una biblioteca dual de rotámeros (RRM y FRM). Adaptándose a variaciones sutiles, cuantifica la probabilidad de rotámeros utilizando interacciones internas, mejorando la precisión en predicciones de estructuras proteicas.
- **FASPR:** destaca por su rapidez y precisión en el empaquetamiento de cadenas laterales proteicas. Utiliza una función de puntuación optimizada y un algoritmo determinista para ensamblar conformaciones a partir de la biblioteca de rotámeros de Dunbrack, logrando resultados notables.
- **OSCAR-star:** este método multifacético utiliza técnicas de optimización y bibliotecas de rotámeros, proporcionando una solución precisa y eficiente. El proceso utiliza una biblioteca de rotámeros rígidos para calcular funciones de energía que determinan la puntuación de la conformación, considerando la frecuencia observada de rotámeros en la estructura.
- **Opus-Rota4:** fusiona tres módulos clave: OPUS-RotaNN2, OPUS-RotaCM y OPUS-Fold2. Destaca con una función de entorno local mejorada en OPUS-RotaNN2, inspirada en el método DLPacker, elevando la precisión del modelado de cadenas laterales proteicas. OPUS-RotaCM transforma características para predecir distancias y orientaciones, redefiniendo el modelado de cadenas laterales con innovadores mapas de contacto.


## Uso de SCWRL4 en Ubuntu 20.04

### Paso 1: Descargar e Instalar SCWRL4

Descarga el instalador de SCWRL4 desde [este enlace](http://dunbrack.fccc.edu/retro/scwrl4/license/tempToDownload_76395/Roland_Dunbrack_251234447/). Luego, abre una terminal y navega al directorio donde descargaste el archivo. Este repositorio además cuenta con el proyecto ya descargado en la carpeta `scwrl4`.

```bash
cd scwrl4
```
Ejecuta el siguiente comando para instalar SCWRL4:
```bash
./install_scwrl4.0.2_64bit_2020_linux
```
Durante la instalación, se te pedirá que especifiques la dirección de instalación. Ingresa la ruta completa deseada y confirma la carga del proyecto al presionar 'Y'.

Se solicitará información sobre la licencia. Si deseas obtener una licencia académica, puedes acceder [aquí](http://dunbrack.fccc.edu/lab/scwrl). Si no, simplemente presiona 'Enter' para continuar.

### Paso 2: Uso de SCWRL4

Una vez instalado, ejecuta SCWRL4 desde la consola con el siguiente comando:

```bash
scwrl4 -i inputpdbfilename -o outputpdbfilename > logfilename
```
Donde `inputpdbfilename` es el nombre del archivo de entrada, `outputpdbfilename` es el nombre del archivo de salida y `logfilename` es el nombre del archivo de registro para verificar la ejecución.

#### Ejemplo

```bash
./Scwrl4 -i abcd_IN.pdb -o salida.pdb > log.txt
```

## Uso de FASPR

### Paso 1: Descargar e Instalar FASPR

Descarga el instalador de FASPR desde [este enlace](https://github.com/tommyhuangthu/FASPR), o en este repositorio también lo encontrará en la carpeta `FASPR`. Luego, abre una terminal y navega al directorio.

```bash
cd FASPR
```
Ejecuta el siguiente comando para compilar FASPR:
```bash
g++ -O3 --fast-math -o FASPR src/*.cpp
```

### Paso 2: Ejecución de FASPR

Utilice el siguiente comando para ejecutar FASPR:

```bash
./FASPR  -i input.pdb -o output.pdb [-s sequence.txt]
```
Donde `input.pdb` es la direccion del pdb de entrada, `output.pdb` es el direccion del archivo de salida y `sequence.txt` es una secuencia de entrada para ser repackeada en la columna vertebral proteica de entrada (opcional).

#### Ejemplo

```bash
./FASPR -i abcd_IN.pdb -o salida.pdb
```

## Uso de OSCAR-star
### Paso 1: Descargar

Descarga el proyecto de OSCAR-star desde [este enlace](http://sysimm.ifrec.osaka-u.ac.jp/OSCAR), o en este repositorio también lo encontrará en la carpeta `OSCAR_RFV`. Luego, abre una terminal y navega al directorio.

```bash
cd OSCAR_RFV
```

### Paso 2: Configuración del Entorno

```bash
MULUL=<oscar-basepath>/z/
export MULUL
```
Asegúrate de reemplazar `<oscar-basepath>` con la ruta absoluta donde se encuentra la carpeta /z/. No olvides incluir el carácter '/' al final.

#### Paso 3: Ejecución de OSCAR-star
Ejecutar para un archivo PDB
```bash
./oscar pdb_file
```
Ejecutar con un archivo que contiene una lista de PDBs:
```bash
./oscar -pdb data
```
Donde 'data' es un archivo que contiene una lista de archivos PDB.

## Uso de OPUS-Rota4 en Ubuntu 20.04

Este proyecto proporciona herramientas para la predicción de ángulos diédricos y modelado de cadenas laterales de proteínas. Las principales herramientas son:

1. **OPUS-RotaNN2:** Predice ángulos diédricos de cadenas laterales.
2. **OPUS-RotaCM:** Mide distancia y orientación entre cadenas laterales de residuos distintos.
3. **OPUS-Fold2:** Guía el modelado de cadenas laterales utilizando las salidas de los módulos anteriores.

### Implementación

Este proyecto fue implementado en una máquina con las siguientes características:

- **Procesador:** Intel i7 8700K
- **RAM:** 16 GB
- **Gráfica:** Nvidia 2070-RTX - 8 GB
- **Sistema Operativo:** Ubuntu 20.04 LTS

### Dependencias Generales

- **nvidia-driver-450** (compatible con Cuda 11.0 para Nvidia 2070-RTX)
- **Cuda** 11.0
- **CuDNN** 8.2.0
- **Python 3.7**
  - `biopython==1.79`
  - `pickle5==0.0.12`
  - `Keras-Preprocessing==1.1.2`
  - `numpy==1.19.5`
  - `tensorflow==2.4.0`
- **xssp-3.0.10**
  - `libzeep version >= 3.0`
  - `libboost version >= 1.48`
  - `libbz2`
  - `autoconf`
  - `automake`
  - `autotools-dev`


### Instrucciones

1. Descarga el proyecto desde la [página oficial](https://github.com/thuxugang/opus_rota4), o en este repositorio también encontrará la versión standalone en la carpeta `opus-rota4`.

2. Abre una terminal y posicionate dentro del proyecto.
    ```bash
    cd opus-rota4
    ```

3. **Instalación de un ambiente virtual para Python 3.7:**
    ```bash
    sudo apt install python3-virtualenv python3-venv
    virtualenv -p python3.7 venv-rota4
    source venv-rota4/bin/activate
    pip install -r requirements.txt
    ```

4. **Instalación del driver nvidia-driver-450 con CUDA 11:**

- Desde la aplicación "Software y Actualizaciones," selecciona el driver nvidia-driver-450.


5. **Preparar RotaNN2**
    - Descomprime `RotaNN2/`.
    ```bash
    cd OPUS_RotaNN2_and_RotaCM
    cat RotaNN2.tar.gz.part-* | tar -xzvf -
    ```
   
6. **Compilación de xssp-3.0.10:**
- Instalamos las dependencias C++
    ```bash
    sudo apt-get install libboost-all-dev
    sudo apt-get install libboost-filesystem-dev
    ```
- Compilamos xssp-3.0.10
    ```bash
    cd OPUS_RotaNN2_and_RotaCM/RotaNN2/mkdssp
    tar zxvf xssp-3.0.10.tar.gz
    cp dssp.cpp xssp-3.0.10/
    cd xssp-3.0.10/
    ./autogen.sh
    ./configure
    make mkdssp
    ```

7. **Ejecución de OPUS-RotaNN2_and_RotaCM:**
    - Activa el entorno si no está activado:
    ```bash
    source venv-rota4/bin/activate
    ```
    - Corre el proyecto:
    ```bash
    python OPUS_RotaNN2_and_RotaCM/run_opus_rota4.py
    ```
   Esto generá los resultados de OPUS-RitaNN2(*.rotann2) y OPUS-RotaCM(*.rotacm.npz) (dichos archivos se encuentran en OPUS_RotaNN2_and_RotaCM/tmp_files), a partir de los pdbs definidos en  OPUS_RotaNN2_and_RotaCM/data_db, los pdbs se encuentra en opus-rota4/datasets


8. **Ejecución de OPUS-Fold2:**
    - Una vez obtenidos los resultados de OPUS-RotaNN2_and_RotaCM:
    ```bash
    python OPUS-Fold2/run_opus_fold2.py
    ```
   Esto generará los resultados optimizados de OPUS-Rota4 (*.rota4) y (*.pdb) (almacenados en OPUS-Fold2/predictions/).
