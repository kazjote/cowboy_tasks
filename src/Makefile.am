## Process this file with automake to produce Makefile.in

## Created by Anjuta

uidir = $(pkgdatadir)/ui
ui_DATA = cowboy_tasks.ui cowboy_tasks.css


AM_CPPFLAGS = \
	-DPACKAGE_LOCALE_DIR=\""$(localedir)"\" \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\" \
	-DPACKAGE_DATA_DIR=\""$(pkgdatadir)"\" \
	$(COWBOY_TASKS_CFLAGS)

AM_CFLAGS =\
	 -Wall\
	 -g

bin_PROGRAMS = cowboy_tasks

cowboy_tasks_SOURCES = \
	cowboy_tasks.vala config.vapi rtm-task.vala rtm-note.vala cowboy_tasks.css

cowboy_tasks_VALAFLAGS =  \
	--pkg gtk+-3.0 \
	--pkg json-glib-1.0

cowboy_tasks_LDFLAGS = \
	-Wl,--export-dynamic

cowboy_tasks_LDADD = $(COWBOY_TASKS_LIBS)


EXTRA_DIST = $(ui_DATA)

# Remove ui directory on uninstall
uninstall-local:
	-rm -r $(uidir)
	-rm -r $(pkgdatadir)

