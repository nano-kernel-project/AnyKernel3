NAME ?= Nano Kernel

DATE := $(shell date "+%Y%m%d-%H%M")

CODE := Kernel-rosy

ZIP := $(NAME)-$(CODE)-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* *placeholder* *.md*

normal: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."


clean:
	@rm -vf *.zip*
	@rm -vf zImage
	@echo "Done."


