# Default installation prefix (can be overridden by the user)
PREFIX ?= /usr/local
# Directory where the binary will be installed
BINDIR = $(PREFIX)/bin
# Name of the installed executable
TARGET = blindsort
# Source script to be installed
SOURCE = game.sh

# Declare phony targets (not associated with real files)
.PHONY: install uninstall

# Install target: copies the script to the binary directory and makes it executable
install:
	@echo "Installing $(TARGET)..."
	install -Dm755 $(SOURCE) $(BINDIR)/$(TARGET)
	@echo "Installed in $(BINDIR)/$(TARGET)"

# Uninstall target: removes the installed executable
uninstall:
	@echo "Uninstalling $(TARGET)..."
	rm -f $(BINDIR)/$(TARGET)
	@echo "Uninstalled successfully"
