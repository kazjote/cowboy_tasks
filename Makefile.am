## Process this file with automake to produce Makefile.in
## Created by Anjuta

SUBDIRS = src 

cowboy_tasksdocdir = ${prefix}/share/doc/cowboy_tasks
cowboy_tasksdoc_DATA = \
	README\
	COPYING\
	AUTHORS\
	ChangeLog\
	INSTALL\
	NEWS


EXTRA_DIST = $(cowboy_tasksdoc_DATA)


# Remove doc directory on uninstall
uninstall-local:
	-rm -r $(cowboy_tasksdocdir)
