SHELL=/bin/bash

all: \
		ssh \
		ssh/admin \
		.env \
		ssh_config \
		~/.ssh/config.d/01_gitolite

ssh:
	mkdir -p $@ && chmod 0750 $@

ssh/admin:
	ssh-keygen -b 4096 -N '' -C 'admin@localhost' -f $@

.env:
	echo "SSH_KEY_NAME=admin" > $@
	echo "SSH_KEY=$$(cat ssh/admin.pub)" >> $@

ssh_config:
	eval "echo \"$$(<tpl/ssh_config.tpl)\"" 2> /dev/null > $@

~/.ssh/config.d/01_gitolite:
	if test -d ~/.ssh/config.d; then \
		cp ssh_config $@ ;\
	fi ;\
	if test -f ~/.ssh/Makefile; then \
		(cd ~/.ssh && make); \
	fi

gitolite-admin:
	git clone gitolite:gitolite-admin $@
