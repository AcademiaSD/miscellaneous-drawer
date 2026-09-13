# Miscellaneous Drawer — Academia SD

Tools, installers and resources that accompany the videos on the
[Academia SD](https://www.youtube.com/@Academia_SD) channel.

These files used to live inside the node pack repository
([comfyui_AcademiaSD](https://github.com/AcademiaSD/comfyui_AcademiaSD)). They were moved
here so that repository holds nothing but the node code.

---

## `patches/`

Fixes for current bugs in **ComfyUI-Manager 4.2.2**. These are Manager bugs, not problems
with your installation, and updating does not help because 4.2.2 is the latest release.

| File | What it fixes |
|---|---|
| `Fix_Manager_UpdateAll_Crash.bat` | `AttributeError: 'NoneType' object has no attribute 'content_type'` when clicking **Update All** |
| `Fix_Manager_CacheButtons.bat` | The cache-clearing buttons that disappeared from the toolbar |

**How to use:** put the `.bat` in your `ComfyUI_windows_portable` folder (the one containing
`python_embeded`) and double-click it with ComfyUI closed. Each script backs the file up to
`.bak` before touching anything and does nothing if the fix is already applied.

> **Note:** these patches are lost every time ComfyUI-Manager is updated, because the update
> overwrites the patched files. If the problem comes back, run the `.bat` again.
> After `Fix_Manager_CacheButtons.bat`, reload the page with **Ctrl + F5**.

---

## `installers/`

| File | Purpose |
|---|---|
| `Install_ComfyUI_Internal-Manager_pip.bat` | Installs or updates the internal Manager on ComfyUI portable |
| `Update_Requirements.bat` | Syncs dependencies when ComfyUI warns about outdated versions |
| `Install_Google_Generative_AI_ComfyUI_portable.bat` | Google Gemini dependencies |
| `Install_Triton&SageAttention220_ComfyUI.bat` | Triton and SageAttention 2.2.0 |
| `LowVram_launchers.zip` | Launchers prepared for low-VRAM GPUs |
| `installer_google_ai.zip` | Google AI installer |

All of them go in the `ComfyUI_windows_portable` folder and run with a double click.

---

## `data/`

JSON lists used by some videos and workflows: MiniMax-H3 prompts, a model list, and the
Krea 2 download list.

---

## `node-images/`

Node screenshots used in the documentation.

---

## The nodes

The node pack itself stays where it has always been:
**https://github.com/AcademiaSD/comfyui_AcademiaSD**
