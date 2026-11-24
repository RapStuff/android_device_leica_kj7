# android_device_leica_kj7 (`vendor/tecno/leicacamera`)

Prebuilt Leica / MIUI Camera 5.0 port for **TECNO Spark 20 Pro+ (`TECNO-KJ7` / `MT6789`)** packaged for AOSP / LineageOS-based ROM builds.

```bash
git clone https://github.com/RapStuff/android_device_leica_kj7.git vendor/tecno/leicacamera
```

## Contents

- `MiuiCamera` (`com.android.camera`) in `/system_ext/priv-app/MiuiCamera` (overrides `Aperture` and `Camera2`)
- `MiuiExtraPhoto` (`com.miui.extraphoto`) in `/system_ext/priv-app/MiuiExtraPhoto`
- Prebuilt arm64 JNI libraries for both apps in their respective `lib/arm64/` directories
- Privileged permissions (`privapp-permissions-miuicamera.xml`), default runtime permissions (`default-permissions-miuicamera.xml`), and hidden-API whitelist (`miuicamera-hiddenapi-package-whitelist.xml`)
- Camera scene detection config (`vendor/etc/camera/sceneDetection.xml`) and RAW capability XML (`vendor/etc/permissions/android.hardware.camera.raw.xml`)
- Camera vendor and watermark properties (`ro.product.marketname=Tecno Spark 20 Pro+`, `vendor.camera.aux.packagelist`, `persist.vendor.camera.*`)

> Note: `MiuiScanner.apk` from the original Magisk port is intentionally omitted because it declares `<uses-library android:name="miui-stat.jar" android:required="true"/>` without shipping `miui-stat.jar`. Camera operation does not depend on it.

## Integration

In `device/tecno/TECNO_KJ7/BoardConfig.mk`:
```makefile
-include vendor/tecno/leicacamera/BoardConfig.mk
```

In `device/tecno/TECNO_KJ7/device.mk`:
```makefile
$(call inherit-product-if-exists, vendor/tecno/leicacamera/leicacamera.mk)
```

## Git LFS Notice

`MiuiCamera.apk` exceeds GitHub's 100 MiB file limit (`*.apk` and `*.so` are configured in `.gitattributes` for Git LFS). Ensure `git-lfs` is installed and initialized before pushing this repository to GitHub (`git lfs install`).
