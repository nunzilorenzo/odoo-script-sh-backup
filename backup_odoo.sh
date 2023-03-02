#!/bin/bash

####odoo_backup_script####

# vars
BACKUP_DIR=/script/odoo_backups
ODOO_DATABASE=sanpaolo
ADMIN_PASSWORD=casc-wgm6-3gas
BACKUP_DIR=/script/odoo_backups
# create a backup directory
mkdir -p ${BACKUP_DIR}

# create a backup
curl -X POST -F "master_pwd=${ADMIN_PASSWORD}"  -F "name=${ODOO_DATABASE}"  -F "backup_format=zip"  -o ${BACKUP_DIR}/${ODOO_DATABASE}.$(date +%F).zip  http://localhost:8069/web/database/backup


# delete old backups
find ${BACKUP_DIR} -type f -mtime +8 -name "${ODOO_DATABASE}.*.zip" -delete
