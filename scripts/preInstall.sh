#set env vars
set -o allexport; source .env; set +o allexport;


TOKEN=$(echo -n "${ADMIN_TOKEN}" | argon2 "$(openssl rand -base64 32)" -e -id -k 65540 -t 3 -p 4)

cat << EOT > ./.env

ADMIN_PASSWORD=${TOKEN}
EOT
