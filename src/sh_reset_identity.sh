echo "remove default"
rm ~/.config/dfx -rf
dfx identity whoami

echo "echo new identity"
dfx identity get-principal