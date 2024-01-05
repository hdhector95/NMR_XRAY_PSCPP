#!/bin/bash

# Directorio donde se encuentran los archivos de entrada
input_directory="./dataset65/pdb65_origfc"

# Verificar si el directorio de entrada existe
if [ ! -d "$input_directory" ]; then
    echo "El directorio $input_directory no existe."
    exit 1
fi

# Obtener la lista de archivos de entrada con extensión .pdb en el directorio
input_files=("$input_directory"/*.pdb)

# Verificar si hay archivos .pdb en el directorio
if [ ${#input_files[@]} -eq 0 ]; then
    echo "No se encontraron archivos .pdb en el directorio $input_directory."
    exit 1
fi

# Iterar sobre la lista de archivos de entrada y ejecutar Scwrl4 para cada uno
for input_file in "${input_files[@]}"; do
    # Extraer solo el nombre del archivo sin la ruta ni la extensión
    file_name=$(basename "$input_file" .pdb)

    # Nombre de archivo de salida
    output_file="${file_name}_out.pdb"

    # Ejecutar el comando Scwrl4 con el archivo de entrada actual y el archivo de salida
    ./Scwrl4 -i "$input_file" -o ./salida/pdb65_origfc/"$output_file"

    # Opcional: mostrar un mensaje para indicar que se ha procesado el archivo actual
    echo "Archivo $input_file procesado. Resultado guardado en $output_file"
done
