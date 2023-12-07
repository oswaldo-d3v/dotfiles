#!/bin/bash

src="$(echo ~)/Descargas"
exception="$(echo ~)/Descargas/Staging"
documentos="$(echo ~)/Descargas/Staging/Documentos"
comprimidos="$(echo ~)/Descargas/Staging/Comprimidos"
otros="$(echo ~)/Descargas/Staging/Otros"

# Crear gerarquia de documentos

mkdir -p $documentos 
mkdir -p $comprimidos 
mkdir -p $otros 

# Eliminar basura Speed-E

find $src -type f -name "*.html" -o -name "*.htm" | grep -v $exception | xargs rm 

# Mover documentos

find $src -type f \( \
-name "*.pdf" -o -name "*.xlsx" -o -name "*.xlsm" -o \
-name "*.xls" -o -name "*.txt" -o -name "*.doc" -o \
-name "*.docm" -o -name "*.docx" -o -name "*.pptx" -o \
-name "*.pptm" -o -name "*.ppt" -o -name "*.ppsx" \) \
| grep -v $exception | xargs -I {} mv  {} $documentos

# Mover comprimidos

find $src -type f \( \
-name "*.iso" -o -name "*.rar" -o -name "*.zip" -o \
-name "*.tar" -o -name "*.gz" -o -name "*.tbz" \) \
| grep -v $exception | xargs -I {} mv  {} $comprimidos 

# Mover otros 

find $src -type f | grep -v $exception | xargs -I {} mv  {} $otros

# Borrar carpetas sin archivos

find $src -type d -empty -delete
