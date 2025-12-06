#!/bin/bash
set -e
clone_if_missing() {
    local repo_url="$1"
    local branch="$2"
    local target_dir="$3"

    if [ -d "$target_dir/.git" ] || [ -d "$target_dir" ]; then
        echo "[SKIP] $target_dir already exists."
        return 0
    fi

    echo "[CLONE] $target_dir"

    if [ -n "$branch" ]; then
        git clone --branch "$branch" "$repo_url" "$target_dir"
    else
        git clone "$repo_url" "$target_dir"
    fi

    echo "[DONE] $target_dir"
}

# Device
clone_if_missing "https://github.com/fogos4ever/android_device_motorola_fogos.git" "17" "device/motorola/fogos"
clone_if_missing "https://github.com/fogos4ever/android_device_motorola_sm6375-common.git" "17" "device/motorola/sm6375-common"
# Vendor
clone_if_missing "https://github.com/fogos4ever/android_vendor_motorola_fogos.git" "17" "vendor/motorola/fogos"
clone_if_missing "https://github.com/fogos4ever/android_vendor_motorola_sm6375-common.git" "17" "vendor/motorola/sm6375-common"
# Kernel
clone_if_missing "https://github.com/fogos4ever/android_kernel_motorola_sm6375.git" "lineage-23.2" "kernel/motorola/sm6375"
# Hardware
clone_if_missing "https://github.com/fogos4ever/android_hardware_motorola.git" "lineage-23.2" "hardware/motorola"
clone_if_missing "https://github.com/JNWSG/hardware_dolby.git" "16.0" "hardware/dolby"
clone_if_missing "https://github.com/LineageOS/android_hardware_samsung_slsi_nfc.git" "" "hardware/samsung_slsi/nfc"
# ViPER4AndroidFX
clone_if_missing "https://github.com/JNWSG/packages_apps_ViPER4AndroidFX.git" "v4a" "packages/apps/ViPER4AndroidFX"
