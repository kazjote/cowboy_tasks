/* -*- Mode: C; indent-tabs-mode: t; c-basic-offset: 4; tab-width: 4 -*-  */
/*
 * main.c
 * Copyright (C) 2014 Kacper Bielecki <kazjote@gmail.com>
 * 
 * cowboy-tasks is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * cowboy-tasks is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using GLib;
using Gtk;

public class Main : Object 
{

	/* 
	 * Uncomment this line when you are done testing and building a tarball
	 * or installing
	 */
	//const string UI_FILE = Config.PACKAGE_DATA_DIR + "/ui/" + "cowboy_tasks.ui";
	const string UI_FILE = "src/cowboy_tasks.ui";
	const string CSS_FILE = "src/cowboy_tasks.css";

	private Builder builder;

	/* ANJUTA: Widgets declaration for cowboy_tasks.ui - DO NOT REMOVE */

	public Main (RtmTask task)
	{
		try {
			builder = new Builder ();
			builder.add_from_file (UI_FILE);
			builder.connect_signals (this);

			var window = builder.get_object ("window") as Window;

			var screen = Gdk.Screen.get_default ();
			var css_provider = new CssProvider(); 
			css_provider.load_from_file (File.new_for_path (CSS_FILE));

			var style_context = window.get_style_context ();
			style_context.add_provider_for_screen (screen, css_provider, STYLE_PROVIDER_PRIORITY_APPLICATION);
			
			/* ANJUTA: Widgets initialization for cowboy_tasks.ui - DO NOT REMOVE */
			window.show_all ();
		}
		catch (Error e) {
			stderr.printf ("Could not load UI: %s\n", e.message);
		} 

		var name_label = builder.get_object ("name_label") as Label;
		name_label.label = task.name;
	}

	[CCode (instance_pos = -1)]
	public void on_destroy (Widget window) 
	{
		Gtk.main_quit();
	}

	static int main (string[] args) 
	{
		string json = stdin.read_line ();

		var parser = new Json.Parser ();
        parser.load_from_data (json, -1);

        var root_object = parser.get_root ().get_object ();

		RtmTask task = new RtmTask (root_object);
		
		Gtk.init (ref args);
		var app = new Main (task);

		Gtk.main ();
		
		return 0;
	}
}

