# Miscellaneous Drawer — Academia SD

Cajón de herramientas, instaladores y recursos que acompañan a los vídeos del canal
[Academia SD](https://www.youtube.com/@AcademiaSD).

Antes vivían dentro del repositorio de los nodos
([comfyui_AcademiaSD](https://github.com/AcademiaSD/comfyui_AcademiaSD)). Se han
separado para que ese paquete contenga solo el código de los nodos.

---

## `patches/`

Parches para fallos actuales de **ComfyUI-Manager 4.2.2**. Son fallos del Manager, no de
tu instalación, y no se arreglan actualizando porque 4.2.2 es la última versión que existe.

| Archivo | Qué arregla |
|---|---|
| `Fix_Manager_UpdateAll_Crash.bat` | El error `AttributeError: 'NoneType' object has no attribute 'content_type'` al pulsar **Update All** |
| `Fix_Manager_CacheButtons.bat` | Los botones de limpiar caché (las escobitas) que desaparecieron de la barra |

**Cómo usarlos:** colocad el `.bat` en la carpeta `ComfyUI_windows_portable` (la que
contiene `python_embeded`) y doble clic, con ComfyUI cerrado. Hacen copia de seguridad
`.bak` antes de tocar nada y no hacen nada si ya están aplicados.

> **Ojo:** los parches se pierden cada vez que se actualiza el Manager, porque sobrescribe
> los archivos corregidos. Si el problema reaparece, volved a ejecutar el `.bat`.
> Tras aplicar `Fix_Manager_CacheButtons.bat` hay que recargar con **Ctrl + F5**.

---

## `installers/`

| Archivo | Para qué |
|---|---|
| `Install_ComfyUI_Internal-Manager_pip.bat` | Instala o actualiza el Manager interno en ComfyUI portable |
| `Update_Requirements.bat` | Sincroniza dependencias cuando sale el aviso de versiones antiguas |
| `Install_Google_Generative_AI_ComfyUI_portable.bat` | Dependencias de Google Gemini |
| `Install_Triton&SageAttention220_ComfyUI.bat` | Triton y SageAttention 2.2.0 |
| `LowVram_launchers.zip` | Lanzadores preparados para GPUs con poca VRAM |
| `installer_google_ai.zip` | Instalador de Google AI |

Todos se colocan en la carpeta `ComfyUI_windows_portable` y se ejecutan con doble clic.

---

## `data/`

Listas en JSON usadas por algunos vídeos y workflows: prompts de MiniMax-H3, listado de
modelos y lista de descarga de Krea 2.

---

## `node-images/`

Capturas de los nodos, usadas en la documentación.

---

## Los nodos

El paquete de nodos sigue en su sitio:
**https://github.com/AcademiaSD/comfyui_AcademiaSD**
