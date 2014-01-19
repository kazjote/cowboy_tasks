/* -*- Mode: vala; indent-tabs-mode: t; c-basic-offset: 4; tab-width: 4 -*-  */
/*
 * rtm-task.vala
 * Copyright (C) 2014 Kacper Bielecki <kazjote@Desktop-Power>
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

public class RtmTask : GLib.Object {

	private Json.Object root_node;

	// Constructor
	public RtmTask (Json.Object node) {
		root_node = node;
	}

	public string name {
		get { return root_node.get_string_member("name"); }
	}
}