SHELL := /bin/bash
HOMEDIR := /home/$(USER)
AHK_BIN := /mnt/c/Program\ Files/AutoHotkey/Compiler/Ahk2Exe.exe
DOCDIR := /mnt/f/OneDrive/Documents
LIB := DateParse
DESTLIBDIR := $(DOCDIR)/AutoHotkey/Lib
DEVHOME := $(DOCDIR)/dev/projects/
SRCDIR := $(DEVHOME)/$(LIB)
SRCS := $(shell find . -maxdepth 1 -type f -name '*.ahk' ! -name 'test.ahk' -exec bash -c 'for f; do [[ "$$f" =~ [[:space:]] ]] && printf "\"%s\" " "$$f" || printf "%s " "$$f"; done' _ {} +)

.PHONY: all clean install

all: install
	@echo All done at $$(date)

install:
	@mkdir -p $(DESTLIBDIR)
	@rsync -av --update --info=NAME --delete $(SRCS) $(DESTLIBDIR)
	@echo Sources copied at $$(date)

clean:
	@find $(DESTLIBDIR) -maxdepth 1 -type f \( $(foreach src,$(SRCS),-name $(notdir $(src)) -o) -false \) -exec echo Deleting: {} \; -exec rm -vf {} +
	@echo clean completed at $$(date)

