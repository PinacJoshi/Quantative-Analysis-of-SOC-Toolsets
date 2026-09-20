#!/usr/bin/env bash
# generate-certs.sh — Wazuh SOC Lab TLS Certificate Generator
# Run ONCE from lab/soc-cluster/ before starting the Docker Compose stack.
#
# Generates:
#   root-ca.pem / root-ca-key.pem   — Root CA (signs all other certs)
#   admin.pem / admin-key.pem        — Admin cert (OpenSearch security tool)
#   esnode.pem / esnode-key.pem      — Wazuh Indexer node cert
#   wazuh-manager.pem / -key.pem     — Wazuh Manager filebeat cert
#   wazuh-dashboard.pem / -key.pem   — Wazuh Dashboard cert
#
# All certs are 10-year self-signed (lab use only).

set -euo pipefail

CERT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$CERT_DIR"

echo "==> Generating Wazuh lab TLS certificates in: $CERT_DIR"

# ─── Root CA ──────────────────────────────────────────────────────────────────
echo "[1/5] Generating Root CA..."
openssl genrsa -out root-ca-key.pem 2048 2>/dev/null
openssl req -new -x509 -sha256 \
  -key root-ca-key.pem \
  -out root-ca.pem \
  -days 3650 \
  -subj "/C=US/L=California/O=Wazuh/OU=Wazuh/CN=root-ca"

# ─── Admin cert (used by OpenSearch securityadmin.sh) ─────────────────────────
echo "[2/5] Generating admin cert..."
openssl genrsa -out admin-key.pem 2048 2>/dev/null
openssl req -new \
  -key admin-key.pem \
  -out admin.csr \
  -subj "/C=US/L=California/O=Wazuh/OU=Wazuh/CN=admin"
openssl x509 -req -sha256 \
  -in admin.csr \
  -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial \
  -out admin.pem \
  -days 3650

# ─── Wazuh Indexer node cert (esnode) ─────────────────────────────────────────
echo "[3/5] Generating Wazuh Indexer (esnode) cert..."
openssl genrsa -out esnode-key.pem 2048 2>/dev/null
openssl req -new \
  -key esnode-key.pem \
  -out esnode.csr \
  -subj "/C=US/L=California/O=Wazuh/OU=Wazuh/CN=wazuh-indexer"
cat > esnode.ext <<EOF
subjectAltName=IP:172.20.0.10,IP:127.0.0.1,DNS:wazuh-indexer,DNS:localhost
EOF
openssl x509 -req -sha256 \
  -in esnode.csr \
  -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial \
  -out esnode.pem \
  -days 3650 \
  -extfile esnode.ext

# ─── Wazuh Manager cert (used by Filebeat → Indexer TLS) ──────────────────────
echo "[4/5] Generating Wazuh Manager cert..."
openssl genrsa -out wazuh-manager-key.pem 2048 2>/dev/null
openssl req -new \
  -key wazuh-manager-key.pem \
  -out wazuh-manager.csr \
  -subj "/C=US/L=California/O=Wazuh/OU=Wazuh/CN=wazuh-manager"
openssl x509 -req -sha256 \
  -in wazuh-manager.csr \
  -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial \
  -out wazuh-manager.pem \
  -days 3650

# ─── Wazuh Dashboard cert ─────────────────────────────────────────────────────
echo "[5/5] Generating Wazuh Dashboard cert..."
openssl genrsa -out wazuh-dashboard-key.pem 2048 2>/dev/null
openssl req -new \
  -key wazuh-dashboard-key.pem \
  -out wazuh-dashboard.csr \
  -subj "/C=US/L=California/O=Wazuh/OU=Wazuh/CN=wazuh-dashboard"
openssl x509 -req -sha256 \
  -in wazuh-dashboard.csr \
  -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial \
  -out wazuh-dashboard.pem \
  -days 3650

# ─── Cleanup intermediates ────────────────────────────────────────────────────
rm -f ./*.csr ./*.ext ./*.srl root-ca-key.pem

echo ""
echo "✓ Certificates generated successfully:"
ls -lh "$CERT_DIR"/*.pem
echo ""
echo "Next step: docker compose down -v && docker compose up -d"
