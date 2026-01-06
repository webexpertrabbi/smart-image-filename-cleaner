# 🖼️ Smart Image Filename Cleaner (PowerShell)

A **safe, configurable, and beginner-friendly PowerShell tool**  
to **clean and rename image filenames in bulk** —  
❌ without deleting any files.

> 🎯 Goal: Remove unwanted text like `http`, `www`, `com`, or random hashes  
> and generate clean, readable, SEO-friendly image filenames.

---

## 🚀 What Does This Tool Do?

This script scans a folder containing image files and:

- Removes specific unwanted words from filenames (e.g. `http`, `https`, `www`, `com`)
- Removes random hash suffixes like `-695cbe1522b04`
- Optionally removes characters from the **start** or **end** of filenames
- Renames files only — **never deletes**
- Supports a **Preview (Dry Run)** mode before applying changes

---

## 🧠 When Should You Use This?

This tool is ideal when:

- 🌐 You are managing images for websites or e-commerce platforms
- 🔍 You need SEO-friendly image filenames
- 🧹 You receive messy filenames from scrapers, CDNs, or third-party tools
- 📦 You want to clean hundreds of image files at once
- ⏱️ Manual renaming is slow and error-prone

---

## 📂 Supported File Types

By default, the script works with the following image extensions:

```

.webp, .jpg, .jpeg, .png, .gif, .bmp, .svg, .avif

````

👉 You can fully customize this list.

---

## 🧪 Before → After Examples

| Before | After |
|------|------|
| `httpsspeedtechsylhetcom-695cbe1522b04.webp` | `speedtechsylhet.webp` |
| `wwwexamplebd-695cbe65f0b1e.jpg` | `examplebd.jpg` |
| `httpmyshopcom-8821ab33.png` | `myshop.png` |

---

## ⚙️ USER CONFIGURATION ZONE (Most Important)

At the top of the script, you’ll find a **USER CONFIGURATION ZONE**.  
👉 **Only this section should be modified by users.**

---

### 1️⃣ Supported Image Extensions
```powershell
$imageExtensions = @(
    ".webp", ".jpg", ".jpeg", ".png",
    ".gif", ".bmp", ".svg", ".avif"
)
````

🔹 Defines which image types the script will process
🔹 Add or remove extensions as needed

---

### 2️⃣ Words to Remove From Filenames

```powershell
$removeWords = @(
    "http",
    "https",
    "www",
    "com"
)
```

🔹 These words will be removed wherever they appear in filenames
🔹 Fully customizable

---

### 3️⃣ Remove Characters From the START

```powershell
$removeFromStart = 0
```

🔹 Removes a fixed number of characters from the beginning
🔹 Example: `3` removes the first 3 characters
🔹 Set to `0` to disable

---

### 4️⃣ Remove Characters From the END

```powershell
$removeFromEnd = 0
```

🔹 Removes characters from the end (before file extension)
🔹 Useful for trimming unwanted suffixes

---

### 5️⃣ Remove Hash Suffix

```powershell
$removeHashSuffix = $true
$hashRegex = '-[a-f0-9]{8,20}$'
```

🔹 Removes random hash patterns like `-695cbe1522b04`
🔹 To disable:

```powershell
$removeHashSuffix = $false
```

---

### 6️⃣ Dry Run (Preview Mode)

```powershell
$dryRun = $true
```

✅ **Highly recommended for beginners**

* `true` → Preview changes only (no rename)
* `false` → Apply actual renaming

Preview output example:

```
[PREVIEW] old-name.jpg -> new-name.jpg
```

---

## ▶️ How to Run the Script

1️⃣ Place the `.ps1` file inside the image folder
2️⃣ Hold **Shift + Right Click** in the folder
3️⃣ Click **Open PowerShell here**
4️⃣ Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\smart-image-filename-cleaner.ps1
```
1️⃣ Or Click on the Folder path and past the script and hit Enter
```powershell
powershell -ExecutionPolicy Bypass -File .\smart-image-filename-cleaner.ps1
```

---

## ⚠️ Important Notes

* ❌ No files are deleted
* ⚠️ Duplicate filenames may cause overwrite conflicts
* 💾 Always back up large folders before running
* 🪟 Windows only (PowerShell required)

---

## 🏁 Summary

✔ Beginner-friendly
✔ Fully customizable
✔ Safe and non-destructive
✔ Ideal for bulk image renaming

In short:
**A production-ready image filename cleanup tool** 🚀

---
