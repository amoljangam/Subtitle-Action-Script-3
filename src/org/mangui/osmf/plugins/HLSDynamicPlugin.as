/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
 package org.mangui.osmf.plugins {
    import flash.display.Sprite;
    import flash.system.Security;
    import flash.external.ExternalInterface;
    import org.osmf.media.PluginInfo;

    public class HLSDynamicPlugin extends Sprite {
        private var _pluginInfo : PluginInfo;

        public function HLSDynamicPlugin() {
	ExternalInterface.call("console.log","HLSDynamicPlugin constructor called");
            super();
            Security.allowDomain("*");
            _pluginInfo = new HLSPlugin();
        }

        public function get pluginInfo() : PluginInfo {
	ExternalInterface.call("console.log","HLSDynamicPlugin->get pluginInfo");
            return _pluginInfo;
        }
    }
}
