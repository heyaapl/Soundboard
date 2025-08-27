# Soundboard Custom Icon Guide

## 📱 **Minimap Icon Requirements**

### **File Specifications**
- **Format**: PNG (recommended) or TGA
- **Size**: **32x32 pixels** (required)
- **Bit Depth**: 32-bit with alpha channel (RGBA)
- **Filename**: `icon.png` or `icon.tga`
- **Location**: `Interface\AddOns\Soundboard\icon.png`

### **Design Recommendations**

**✅ Best Practices:**
- **Simple Design** - Clear and recognizable at small size
- **High Contrast** - Stands out against minimap background
- **Rounded Corners** - WoW automatically applies circular mask
- **Centered Subject** - Important elements in the middle
- **Bold Colors** - Avoid subtle gradients or fine details

**🎨 Visual Guidelines:**
- **Border**: 1-2 pixel border recommended for definition
- **Background**: Solid color or simple gradient
- **Transparency**: Use alpha channel for rounded edges
- **Style**: Match WoW's icon aesthetic (slightly cartoonish)

### **Technical Details**

**File Path Structure:**
```
Soundboard/
├── Soundboard.lua
├── Soundboard.toc
├── icon.png          ← Your custom icon here
└── ...
```

**Code Reference:**
```lua
icon = "Interface\\AddOns\\Soundboard\\icon",
```
Note: WoW automatically detects `.png` or `.tga` extensions.

### **Icon Ideas for Soundboard**

**🎵 Music/Audio Themed:**
- Musical note (♪ or ♫)
- Speaker/sound waves
- Microphone
- Headphones
- Volume/equalizer bars

**🎭 Entertainment Themed:**
- Comedy/drama masks
- Play button (▶)
- Sound board mixing console
- Jukebox
- Radio/boombox

**🎮 Gaming Themed:**
- Game controller with sound waves
- Retro arcade button
- Pixel art speaker
- Gaming headset

### **Creating Your Icon**

**Recommended Tools:**
- **GIMP** (Free) - Export as PNG with transparency
- **Photoshop** - Save for Web as PNG-24 with transparency
- **Paint.NET** (Free) - Save as PNG with alpha
- **Online Tools** - Canva, Figma (export as PNG)

**Step-by-Step:**
1. **Create** 32x32 pixel canvas
2. **Design** your icon with transparency
3. **Export** as PNG with alpha channel
4. **Save** as `icon.png` in Soundboard folder
5. **Test** in-game with `/reload`

### **Fallback System**

If your custom icon fails to load, the addon will:
1. **Try** `Interface\AddOns\Soundboard\icon.png`
2. **Try** `Interface\AddOns\Soundboard\icon.tga`
3. **Fallback** to default WoW icon if both fail

### **Testing Your Icon**

**In-Game Testing:**
1. **Place** `icon.png` in Soundboard folder
2. **Type** `/reload` to restart UI
3. **Check** minimap for your custom icon
4. **Verify** icon appears correctly

**Troubleshooting:**
- **Icon not showing?** Check file name and location
- **Blurry icon?** Ensure exactly 32x32 pixels
- **Transparent issues?** Save with alpha channel
- **Still problems?** Check WoW error logs

## 🎨 **Example Icon Concepts**

### **Simple Musical Note**
- 32x32 black musical note (♪) on transparent background
- White border for contrast against dark minimaps
- Centered and bold for visibility

### **Sound Waves**
- Stylized speaker with sound wave lines
- Blue/white color scheme
- Circular background with transparency edges

### **Retro Soundboard**
- Pixel art mixing board/DJ console
- Colorful buttons and sliders
- Nostalgic gaming aesthetic

## 📝 **Current Setup**

The addon is currently configured to look for:
- **Primary**: `Interface\AddOns\Soundboard\icon.png`
- **Fallback**: `Interface\AddOns\Soundboard\icon.tga`
- **Default**: Built-in WoW icon if custom not found

Simply add your `icon.png` file to the Soundboard folder and reload your UI to see the change!
