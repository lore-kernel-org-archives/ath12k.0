Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F14C3ABAC
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 13:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tb0uI8Vc+4eJj1Krp/L02KCDgshNgaLZ6KRsPsvSHmk=; b=Azmzzxpb79/BHQyiCPJZ2k6dPE
	UsFPlEjO44MeS/hjK8cLZ+DxD7zk60CVujf98aQOH+Ad4BCR14ffzQyT0W3BWCK9a8xNvaDQPiqmE
	w2tMpl8io5Q0totW1c2Bd20bGDywvYg/Z3mMn9nEGEOTAXG59zy4GL+uVrdhoCisYvP95ZH2thWMQ
	Jn95jV30NAqyd0ZsoN2+x9+Q43S4D32H2RFJjdFp1/vPsJ1KHTIvCuPZbQ0pPoNNlmUgKf7GfhxzM
	1Owef5LRwGssrIIK7RZuRWmAoSrzn0E2GmVTX5/G0k+lqm6VJXddvi6Epb3kcpD9KePsHo/h7HM8h
	RkOPH7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIIr-0000000C6Gp-31yy;
	Tue, 06 May 2025 13:25:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFyk-0000000BdpI-2cKZ
	for ath12k@lists.infradead.org;
	Tue, 06 May 2025 10:56:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468iKix028273
	for <ath12k@lists.infradead.org>; Tue, 6 May 2025 10:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tb0uI8Vc+4eJj1Krp/L02KCDgshNgaLZ6KR
	sPsvSHmk=; b=GzMG4gBuLt1tto5Ity7pe6wy0wBDd5IdtbbiFoUfuCtNpZfMWWL
	Gun34B+MEAswT99V9kGVEvcZZnz+H9ZcFDq8leHnrqc2WWsI3Lw0G3TQG/YfVZDJ
	xCoQm9NjCXgZEqBSCIz8wZpPRqTSRm3zWA7zOIRZV4Rt1NIT0z3ROlV+B2m4ZTHU
	BlFs3fq90X2nsJI+qCeJbwt2XNPq5tStCRt+MCGeFY/pjgea7tPl6AZG5a+dD8Jp
	TZISUgw+rGglvlIXlbk2oLwF8j6JY+Tvj3kAqucSZc3f2qkDT5Fi1m9GE2lw2aaL
	LIYg+7Jey5i9fBfKUJ7VqYOSR7uVJ65PpFQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5uusyf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 06 May 2025 10:56:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-72f3b4c0305so5874526b3a.0
        for <ath12k@lists.infradead.org>; Tue, 06 May 2025 03:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746529007; x=1747133807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tb0uI8Vc+4eJj1Krp/L02KCDgshNgaLZ6KRsPsvSHmk=;
        b=rkmdUUViXXpxWlU9xkWhI3mqlPiJIRhzgrtThZaJwI+r3xnU5ldCCNegP2S8kYJxBl
         q8wLrdlwV3ZMTm/1tZ9JtFU6obEK+/0KpUDxMURj74k47b0tc1Wm7cafTYwaB6XyubT3
         P2kbU0mn3t8E7GQgqXeYFEW8jIuNH0pSRfVMA8j1shhdQJSNUeGmaYZ2CKmLbeaS+5VE
         aiBvrQhkU1rjZ7N6OSiAbwK+obDPRJfw4Iebyu6FqNhxmS/zGc23ZAjvXv7QWUvHI152
         1/BASYXBeoPga3V00p72O+hgK1ZqZ+6PAPxl/jZQ18dzNfelY13aApwrCadxuxXycZaw
         RX/g==
X-Gm-Message-State: AOJu0Yxd+oIzH8sTZygb0zTG/Av2raUekmNU5bCLTFOw9hycFFuHptuO
	7YrR1JfOjU6wm+eoqTEmI+zQhTvlPZgVRW9qAl/elHYsyEWcRe+ThQ/43gF2N7gLeeDZI9b6OUf
	4LlM++Fevmm9Eo+D4QqeuKDOaN4l1K7PcgD2Cc+mQ1k5p0SbD5GIYC6v5EDaWDMe0rJ6p
X-Gm-Gg: ASbGncvHxSaEKIWNlN3J5pmwz+WYXH4j4yvv/Gcgs1Vb6RysYLoWvRoFoxb8wpzzy0p
	7ce70h5ks9WDJJ4BPHUyP7Q/a1XmFLjW6Bua+vbcKY7xLaHIgrT/CSMWw9M9TJ71w+BYCHwZ4Q9
	T7E/SDZLCUep8t7smG6nxSG49LsJxAkU3k942UXaHzLwS1uv6MeE09pNoOZlE8aDSPkAabxA4+G
	pAnPxVFazxn2+JiwM7AApaYgBD10n3a2PMZEN5XBy80/8KjBEga/n1dLd/1Ky+noqLdCvtFmpLx
	mfdkcRlXATIcKj1whRfg2h9ccFZLabR4jvZjvjLwR+QC3DqEumNYQPAMhvD6fEHIl+vEl2JN+Oy
	NzbaZ5aOV/vKzLBTw2J6hB7T75r4tiuLUcCqWZwQ4
X-Received: by 2002:a05:6a00:ac0b:b0:740:67ce:1d8b with SMTP id d2e1a72fcca58-74091a16c05mr3248698b3a.7.1746529006885;
        Tue, 06 May 2025 03:56:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8OOSUClMJ12fdQiSy9tFQzrC7l4sCBoinRErzr6JQSPK8wSG94dFSc2usAmKR3WTko0YO7A==
X-Received: by 2002:a05:6a00:ac0b:b0:740:67ce:1d8b with SMTP id d2e1a72fcca58-74091a16c05mr3248674b3a.7.1746529006471;
        Tue, 06 May 2025 03:56:46 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059064cf2sm8805124b3a.142.2025.05.06.03.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:56:45 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: combine channel list for split-phy devices in single-wiphy
Date: Tue,  6 May 2025 16:26:24 +0530
Message-Id: <20250506105624.466019-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=6819eaf0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KBSZuLJJbAmD61iNme8A:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: CmTTFiP_Iu4wSDsdwTDps2QlT4JS-p5E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEwNCBTYWx0ZWRfX7WrbjqerlYWZ
 Y+z8BN2tJ+c2tMf7gKvXHedg+sjxhoKYXBmKZb6t/nbjduFr53UIR9u8O5vxXOetY/ZCieI4JUH
 oVGx+2ByotmHpQx8z9JwetAwp8SSZXD6CwWJJfcMuDsyydkmdH+p/yx5sV+EULm25rf9qrH8zzJ
 iLIQTfCZrMtPP6PkrjpZ+mOv2u8qaR333IhFBSdd0QvOYKUa4aIv7ZhQBSsPQKaCQMjWHbx3oiO
 EobsFrR9/nmAxS5bLYUlKOUB1zMJwan+nUhiHJh7ySPep06GvLfVoPYHFv1YwZ6MVXFspNjSAVN
 MZ73Nk4CdaOHp+V3SAgNdFyX7mcBajeJB6e4ZFVGJbf3YEsWd61uiG9gdYKdwC5F+JXZUcNRDOm
 waBUqBlS1SJzAJA/y4h7go+qaIYvmdqZwuajFChqr+MVV25lrdddNLXLd4d7KlqwXrt2hC3Y
X-Proofpoint-ORIG-GUID: CmTTFiP_Iu4wSDsdwTDps2QlT4JS-p5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_035650_785006_16875357 
X-CRM114-Status: GOOD (  22.53  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

When two split-phy devices that support overlapping frequency ranges within
the same band are grouped into an ath12k hardware (HW) setup, they share a
common wiphy instance. Consequently, the channel list (wiphy->bands[])
becomes unified across all associated radios (ar).

For reference, the devices are:
2.4 GHz + 5 GHz Low Band
5 GHz High Band + 6 GHz

The first radio probed within the 5 GHz range (say 5 GHz Low Band) updates
its sband reference (&ar->mac.sbands[NL80211_BAND_5GHZ]) within
wiphy->bands[]. However, when the second 5 GHz radio (5 GHz High Band) is
probed, it replaces the existing wiphy->bands[] entry with its own sub-band
reference. As a result, wiphy->bands[] always reflects the channel list
from the most recently probed radio in that band, restricting supported
channels to those within its specific range for upper-layer.

Fix this by updating the wiphy->bands[] to just enable the channels of
current radio when there exist a radio which already has set it.
This will make sure wiphy->bands[] holds reference of first radio which
got probed in 5 GHz band and subsequent radio just updates the channel list
in the same address space.

Since same sband memory space is shared between radios of a band, while
determining the allowed frequency range of radio, its frequency limits
(ar->freq_range.start_freq, end_freq) should be used.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---

*v2:
  - Fixed frequency conversion from KHZ to MHZ in freq_to_idx()

---
 drivers/net/wireless/ath/ath12k/mac.c | 93 +++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/reg.c | 13 ++++
 drivers/net/wireless/ath/ath12k/wmi.c |  9 ++-
 3 files changed, 109 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4dae941c9615..23cbf348e836 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4131,8 +4131,9 @@ ath12k_mac_select_scan_device(struct ieee80211_hw *hw,
 		band = NL80211_BAND_6GHZ;
 
 	for_each_ar(ah, ar, i) {
-		/* TODO 5 GHz low high split changes */
-		if (ar->mac.sbands[band].channels)
+		if (ar->mac.sbands[band].channels &&
+		    center_freq >= KHZ_TO_MHZ(ar->freq_range.start_freq) &&
+		    center_freq <= KHZ_TO_MHZ(ar->freq_range.end_freq))
 			return ar;
 	}
 
@@ -10925,6 +10926,32 @@ static u32 ath12k_get_phy_id(struct ath12k *ar, u32 band)
 	return 0;
 }
 
+static int ath12k_mac_update_band(struct ath12k *ar,
+				  struct ieee80211_supported_band *orig_band,
+				  struct ieee80211_supported_band *new_band)
+{
+	int i;
+
+	if (!orig_band || !new_band)
+		return -EINVAL;
+
+	if (orig_band->band != new_band->band)
+		return -EINVAL;
+
+	for (i = 0; i < new_band->n_channels; i++) {
+		if (new_band->channels[i].flags & IEEE80211_CHAN_DISABLED)
+			continue;
+		/* An enabled channel in new_band should not be already enabled
+		 * in the orig_band
+		 */
+		if (WARN_ON(!(orig_band->channels[i].flags &
+			      IEEE80211_CHAN_DISABLED)))
+			return -EINVAL;
+		orig_band->channels[i].flags &= ~IEEE80211_CHAN_DISABLED;
+	}
+	return 0;
+}
+
 static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 					   u32 supported_bands,
 					   struct ieee80211_supported_band *bands[])
@@ -10935,6 +10962,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 	u32 phy_id, freq_low, freq_high;
 	struct ath12k_hw *ah = ar->ah;
 	void *channels;
+	int ret;
 
 	BUILD_BUG_ON((ARRAY_SIZE(ath12k_2ghz_channels) +
 		      ARRAY_SIZE(ath12k_5ghz_channels) +
@@ -10956,7 +10984,6 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 		band->channels = channels;
 		band->n_bitrates = ath12k_g_rates_size;
 		band->bitrates = ath12k_g_rates;
-		bands[NL80211_BAND_2GHZ] = band;
 
 		if (ab->hw_params->single_pdev_only) {
 			phy_id = ath12k_get_phy_id(ar, WMI_HOST_WLAN_2GHZ_CAP);
@@ -10973,6 +11000,22 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 					  reg_cap->high_2ghz_chan);
 
 		ath12k_mac_update_freq_range(ar, freq_low, freq_high);
+
+		if (!bands[NL80211_BAND_2GHZ]) {
+			bands[NL80211_BAND_2GHZ] = band;
+		} else {
+			/* Split mac in same band under same wiphy */
+			ret = ath12k_mac_update_band(ar, bands[NL80211_BAND_2GHZ], band);
+			if (ret) {
+				kfree(channels);
+				band->channels = NULL;
+				return ret;
+			}
+			ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac pdev %u identified as 2 GHz split mac with start freq %d end freq %d",
+				   ar->pdev->pdev_id,
+				   KHZ_TO_MHZ(ar->freq_range.start_freq),
+				   KHZ_TO_MHZ(ar->freq_range.end_freq));
+		}
 	}
 
 	if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP) {
@@ -10991,7 +11034,6 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 			band->channels = channels;
 			band->n_bitrates = ath12k_a_rates_size;
 			band->bitrates = ath12k_a_rates;
-			bands[NL80211_BAND_6GHZ] = band;
 
 			freq_low = max(reg_cap->low_5ghz_chan,
 				       ab->reg_freq_6ghz.start_freq);
@@ -11004,6 +11046,26 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 
 			ath12k_mac_update_freq_range(ar, freq_low, freq_high);
 			ah->use_6ghz_regd = true;
+
+			if (!bands[NL80211_BAND_6GHZ]) {
+				bands[NL80211_BAND_6GHZ] = band;
+			} else {
+				/* Split mac in same band under same wiphy */
+				ret = ath12k_mac_update_band(ar,
+							     bands[NL80211_BAND_6GHZ],
+							     band);
+				if (ret) {
+					kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
+					ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
+					kfree(channels);
+					band->channels = NULL;
+					return ret;
+				}
+				ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac pdev %u identified as 6 GHz split mac with start freq %d end freq %d",
+					   ar->pdev->pdev_id,
+					   KHZ_TO_MHZ(ar->freq_range.start_freq),
+					   KHZ_TO_MHZ(ar->freq_range.end_freq));
+			}
 		}
 
 		if (reg_cap->low_5ghz_chan < ATH12K_MIN_6GHZ_FREQ) {
@@ -11022,7 +11084,6 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 			band->channels = channels;
 			band->n_bitrates = ath12k_a_rates_size;
 			band->bitrates = ath12k_a_rates;
-			bands[NL80211_BAND_5GHZ] = band;
 
 			if (ab->hw_params->single_pdev_only) {
 				phy_id = ath12k_get_phy_id(ar, WMI_HOST_WLAN_5GHZ_CAP);
@@ -11039,6 +11100,28 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 						  reg_cap->high_5ghz_chan);
 
 			ath12k_mac_update_freq_range(ar, freq_low, freq_high);
+
+			if (!bands[NL80211_BAND_5GHZ]) {
+				bands[NL80211_BAND_5GHZ] = band;
+			} else {
+				/* Split mac in same band under same wiphy */
+				ret = ath12k_mac_update_band(ar,
+							     bands[NL80211_BAND_5GHZ],
+							     band);
+				if (ret) {
+					kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
+					ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
+					kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
+					ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
+					kfree(channels);
+					band->channels = NULL;
+					return ret;
+				}
+				ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac pdev %u identified as 5 GHz split mac with start freq %d end freq %d",
+					   ar->pdev->pdev_id,
+					   KHZ_TO_MHZ(ar->freq_range.start_freq),
+					   KHZ_TO_MHZ(ar->freq_range.end_freq));
+			}
 		}
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 7048834e0d14..5c577188fa74 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -176,6 +176,12 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
 			if (bands[band]->channels[i].flags &
 			    IEEE80211_CHAN_DISABLED)
 				continue;
+			/* Skip Channels that are not in current radio's range */
+			if (bands[band]->channels[i].center_freq <
+			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
+			    bands[band]->channels[i].center_freq >
+			    KHZ_TO_MHZ(ar->freq_range.end_freq))
+				continue;
 
 			num_channels++;
 		}
@@ -204,6 +210,13 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
 			if (channel->flags & IEEE80211_CHAN_DISABLED)
 				continue;
 
+			/* Skip Channels that are not in current radio's range */
+			if (bands[band]->channels[i].center_freq <
+			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
+			    bands[band]->channels[i].center_freq >
+			    KHZ_TO_MHZ(ar->freq_range.end_freq))
+				continue;
+
 			/* TODO: Set to true/false based on some condition? */
 			ch->allow_ht = true;
 			ch->allow_vht = true;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index ea303dca38b5..dfd36491c024 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5887,9 +5887,16 @@ static int freq_to_idx(struct ath12k *ar, int freq)
 		if (!sband)
 			continue;
 
-		for (ch = 0; ch < sband->n_channels; ch++, idx++)
+		for (ch = 0; ch < sband->n_channels; ch++, idx++) {
+			if (sband->channels[ch].center_freq <
+			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
+			    sband->channels[ch].center_freq >
+			    KHZ_TO_MHZ(ar->freq_range.end_freq))
+				continue;
+
 			if (sband->channels[ch].center_freq == freq)
 				goto exit;
+		}
 	}
 
 exit:

base-commit: 21346cd925c2567d5f56cdb1421c94815ac10221
-- 
2.34.1


