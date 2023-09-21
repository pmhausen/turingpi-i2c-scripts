all:
	@echo "Use 'make install' to install the scripts into /usr/local/sbin."
	@echo "Use 'make uninstall' to remove."

install:
	@sudo mkdir -p /usr/local/sbin
	@sudo cp nodectl-$(uname -s | tr '[:upper:]' '[:lower:]').sh /usr/local/sbin/nodectl
	@sudo cp nodestat-$(uname -s | tr '[:upper:]' '[:lower:]').sh /usr/local/sbin/nodestat
	@sudo chmod 755 /usr/local/sbin/nodectl /usr/local/sbin/nodestat

uninstall:
	@sudo rm -f /usr/local/sbin/nodectl /usr/local/sbin/nodestat
