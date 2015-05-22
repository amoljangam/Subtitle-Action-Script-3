/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
 package org.mangui.osmf.plugins.loader {
    import flash.net.NetStream;
    import flash.net.NetConnection;

    import org.osmf.net.NetLoader;
    import org.osmf.media.URLResource;
    import org.mangui.hls.HLS;
    import flash.external.ExternalInterface;
    public class HLSNetLoader extends NetLoader {
        private var _hls : HLS;
        private var _connection : NetConnection;
        private var _resource : URLResource;

        public function HLSNetLoader(hls : HLS) {
	ExternalInterface.call("console.log","HLSNetLoader constructor called.");
            _hls = hls;
            super();
        }

        override protected function createNetStream(connection : NetConnection, resource : URLResource) : NetStream {
	ExternalInterface.call("console.log","createElement function call print resource:" + resource);
            _connection = connection;
            _resource = resource;
            return _hls.stream;
        }
    }
}
