#!/bin/bash

# -------------------------------------
# Jadwal Backup Otomatis Harian - 23:15
# -------------------------------------
cron_file="/etc/cron.d/backup_otomatis"
pekerjaan_cron="15 23 * * * root backup"

if ! grep -Fq "$pekerjaan_cron" "$cron_file" 2>/dev/null; then
    echo "$pekerjaan_cron" > "$cron_file"
    echo "✅ Backup otomatis dijadwalkan setiap hari pukul 23:15."
else
    echo "ℹ️ Cron job backup otomatis sudah terpasang."
fi

# -------------------------------------
# Jadwal Reboot Otomatis Harian - 00:00
# -------------------------------------
cron_file="/etc/cron.d/auto_reboot"
pekerjaan_cron="0 0 * * * root /sbin/reboot"

if ! grep -Fq "$pekerjaan_cron" "$cron_file" 2>/dev/null; then
    echo "$pekerjaan_cron" > "$cron_file"
    echo "✅ Auto reboot dijadwalkan setiap hari pukul 00:00 (tengah malam)."
else
    echo "ℹ️ Cron job auto reboot sudah terpasang."
fi

# --------------------------------------------------
# Jadwal Hapus User Expired Setiap 2 Hari - 03:00 AM
# --------------------------------------------------
cron_file="/etc/cron.d/delete_exp"
pekerjaan_cron="0 3 */2 * * root xp"

if ! grep -Fq "$pekerjaan_cron" "$cron_file" 2>/dev/null; then
    echo "$pekerjaan_cron" > "$cron_file"
    echo "✅ Penghapusan user expired dijadwalkan setiap 2 hari pukul 03:00."
else
    echo "ℹ️ Cron job delete expired sudah terpasang."
fi


