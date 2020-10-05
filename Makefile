# On modern systems, udev has a TAG uaccess, which is used in 73-seat-late.rules
# On older systems, we use GROUP plugdev with MODE
# --> Try `make setup` first, if it doesn't work, try `make legacy-setup`.


setup: | install activate
	@echo "*** Setup finished. You can now use the Safetech SafeKey device."

legacy-setup: | install-legacy activate
	@echo "*** Setup for the legacy systems finished. You can now use the Safetech SafeKey device."

RULES_PATH=/etc/udev/rules.d

activate:
	@echo "*** This action will reload the udev deamon"
	sudo udevadm control --reload-rules
	sudo udevadm trigger

install:
	sudo cp $(PWD)/70-safetech-access.rules ${RULES_PATH}/70-safetech-access.rules

install-legacy:
	sudo cp $(PWD)/70-safetech-legacy-access.rules ${RULES_PATH}/70-safetech-access.rules

