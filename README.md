# 🎭 Godot Custom BBCode Effects

A lightweight, plug-and-play collection of custom animated `RichTextEffect` nodes for Godot. Features gold sweeps, silver shimmers, supercharged electric jitters, ghost shivering, and iconic custom tags.

![Demo Preview](demo.gif) <!-- Replace with a link to your GIF or mp4 video preview -->

---

## ✨ Features

- **`[gold]`** — Metallic golden sweep animation.
- **`[silver]`** — Clean silver shine effect.
- **`[supercharge]`** — High-voltage electrical color jitter.
- **`[soul_out]`** — Ghostly shivering and spatial offset.
- **`[rick]`** — Rainbow color cycle with rhythmic bouncing letters.

---

## 🚀 Quick Start & Installation

### Option 1: The Helper Script (Recommended)

1. Copy the `addons/custom_bbcode/` folder into your Godot project.
2. In any script, register all effects on a `RichTextLabel` with a single line:

```gdscript
# Automatically enables bbcode and installs all custom effects
BBCodeEffects.register_all($RichTextLabel)
```
This Git repo contains all my custom BBCode effects! Node that they could only be used in Godot... Don't try using it in Unity since the files are *.gd
