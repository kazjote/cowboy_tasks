/* -*- Mode: vala; indent-tabs-mode: t; c-basic-offset: 4; tab-width: 4 -*-  */
/*
 * rtm-note.vala
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

public class RtmNote : GLib.Object {

  private Json.Node root_node;

  public RtmNote (Json.Node node) {
    root_node = node;
  }

  public string get_content () {
    if(root_node == null) return "";

    if(root_node.type_name () == "JsonObject") { // Hash
      return read_node (root_node);
    } else { // Array
      var array = root_node.get_array ();
      var element = array.get_element(0);

      return read_node (element);
    }
  }

  private string read_node (Json.Node node) {
    return node.get_object ().get_string_member ("$t");
  }
}
