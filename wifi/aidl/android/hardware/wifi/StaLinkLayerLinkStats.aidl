/*
 * Copyright (C) 2022 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.hardware.wifi;

import android.hardware.wifi.StaLinkLayerIfaceContentionTimeStats;
import android.hardware.wifi.StaLinkLayerIfacePacketStats;
import android.hardware.wifi.StaPeerInfo;

/**
 * Per Link statistics for the current connection. For MLO, this is
 * the statistics for one link in the connection.
 */
@VintfStability
parcelable StaLinkLayerLinkStats {
    /**
     * Identifier for the link within MLO. For single link operation this field
     * is not relevant and can be set to 0.
     */
    int linkId;
    /**
     * Number of beacons received from the connected AP on the link.
     */
    int beaconRx;
    /**
     * Access Point Beacon and Management frames RSSI (averaged) on the link.
     */
    int avgRssiMgmt;
    /**
     * WME Best Effort Access Category packet counters on the link.
     */
    StaLinkLayerIfacePacketStats wmeBePktStats;
    /**
     * WME Background Access Category packet counters on the link.
     */
    StaLinkLayerIfacePacketStats wmeBkPktStats;
    /**
     * WME Video Access Category packet counters on the link.
     */
    StaLinkLayerIfacePacketStats wmeViPktStats;
    /**
     * WME Voice Access Category packet counters on the link.
     */
    StaLinkLayerIfacePacketStats wmeVoPktStats;
    /**
     * Duty cycle for the link.
     * If this link is being served using time slicing on a radio with one or
     * more links then the duty cycle assigned to this link in %. If not using
     * time slicing, set to 100.
     */
    byte timeSliceDutyCycleInPercent;
    /**
     * WME Best Effort (BE) Access Category (AC) contention time statistics on
     * the link.
     */
    StaLinkLayerIfaceContentionTimeStats wmeBeContentionTimeStats;
    /**
     * WME Background (BK) Access Category (AC) contention time statistics on
     * the link.
     */
    StaLinkLayerIfaceContentionTimeStats wmeBkContentionTimeStats;
    /**
     * WME Video (VI) Access Category (AC) contention time statistics on the
     * link.
     */
    StaLinkLayerIfaceContentionTimeStats wmeViContentionTimeStats;
    /**
     * WME Voice (VO) Access Category (AC) contention time statistics on the
     * link.
     */
    StaLinkLayerIfaceContentionTimeStats wmeVoContentionTimeStats;
    /**
     * Per peer statistics for the link.
     */
    StaPeerInfo[] peers;
}
