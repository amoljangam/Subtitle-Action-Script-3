/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
 package org.mangui.osmf.plugins.traits {
    import org.mangui.hls.HLS;
    import org.mangui.hls.event.HLSEvent;
    import org.mangui.hls.constant.HLSPlayStates;
    import org.osmf.traits.BufferTrait;
    import flash.external.ExternalInterface;
    CONFIG::LOGGING {
    import org.mangui.hls.utils.Log;
    }
    
    public class HLSBufferTrait extends BufferTrait {
        private var _hls : HLS;

        public function HLSBufferTrait(hls : HLS) {
	ExternalInterface.call("console.log","HLSBufferTrait constructor");
            CONFIG::LOGGING {
            Log.debug("HLSBufferTrait()");
            }
            super();
            _hls = hls;
            _hls.addEventListener(HLSEvent.PLAYBACK_STATE, _stateChangedHandler);
        }

        override public function dispose() : void {
	ExternalInterface.call("console.log","HLSBufferTrait->dispose()");
            CONFIG::LOGGING {
            Log.debug("HLSBufferTrait:dispose");
            }
            _hls.removeEventListener(HLSEvent.PLAYBACK_STATE, _stateChangedHandler);
            super.dispose();
        }

        override public function get bufferLength() : Number {
            return _hls.stream.bufferLength;
        }

        /** state changed handler **/
        private function _stateChangedHandler(event : HLSEvent) : void {
		ExternalInterface.call("console.log","HLSBufferTrait->stateChangedHandler()");
            switch(event.state) {
                case HLSPlayStates.PLAYING_BUFFERING:
                case HLSPlayStates.PAUSED_BUFFERING:
                    CONFIG::LOGGING {
                    Log.debug("HLSBufferTrait:_stateChangedHandler:setBuffering(true)");
                    }
                    setBuffering(true);
                    break;
                default:
                    CONFIG::LOGGING {
                    Log.debug("HLSBufferTrait:_stateChangedHandler:setBuffering(false)");
                    }
                    setBuffering(false);
                    break;
            }
        }
    }
}
