#!/bin/bash

# Descarga e instala Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Agrega tus comandos personalizados aquí, por ejemplo:
tailscale up
tailscale login

# Mensaje de finalización
echo "Instalación de Tailscale completada."
