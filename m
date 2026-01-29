Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D57D46C01
	for <ath12k@archiver.kernel.org>; Thu, 29 Jan 2026 02:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qCXUIpVaz/FWsfJXyE0wx3UZw3tMasE32Or3Jgl450=; b=hsYNyP5WPl1RA0hux1SbpTzVQE
	pSNNXMU3Bu7zq/+/5qQIqmQn0gCKfCzhF16HjAupqbZkmUrlThlt0zRRVO45lH52H/G1pNpEQYl8y
	gJPpubqfy9gPawX/qYMIcYmZKBLakARvnNnarRtx+0Cib+3sO7BvpdTjFXVOsAp5S7BVmby700W5B
	jRcuQlzhj94RZpfLopeHNbwc6RPGyUZx2fZ13B734t582Bq9bORkQPFYIZFGBiCPsKJhGGdlht4L7
	PPsR/thsnWDT/Rb6OCLPPI6tZWRd+hJ69448gmLMhkTWmXwWOHzUtD6R8jwVlkfpShZJGxrOrWGmp
	MfAI6zIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHhu-0000000H7h5-3pHO;
	Thu, 29 Jan 2026 02:24:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHhr-0000000H7fY-1eP7
	for ath12k@lists.infradead.org;
	Thu, 29 Jan 2026 02:24:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SLotrv1396988
	for <ath12k@lists.infradead.org>; Thu, 29 Jan 2026 02:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7qCXUIpVaz/FWsfJXyE0wx3UZw3tMasE32Or3Jgl450=; b=fuPzggkhVq/GYPnN
	OQ1RXMtceOCyRNw1l4aIS8BVz7sjlCzGFElxFKhZ185syuVE9tmcIuuv7r24edwj
	N1/b4EpXRGwUlMNUMICg38lfeUBQkMEBF25uCJHpzOVn47vZPKEx+osiY+tKp6sw
	IFADVRazTV4p9liF+HQQ9qbn/arR2UHKNK7mIuqWjCZBm3SN/LPygSY444EERU3r
	LrMWM5Qx6oDsjLIjH4apn7KNOFxT/ZRaBUSCWFXBOwS//WZ0OhI49ljS47oPE8Ku
	L4KOZ1sv8mSPc+c1z0NdV1eAKrn7RXRs5z92Em19/za1Ljb9GeukjRwgKwtZEcs1
	NdKXSw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bytqy0nc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 29 Jan 2026 02:24:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7d7b87977so3947995ad.0
        for <ath12k@lists.infradead.org>; Wed, 28 Jan 2026 18:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769653465; x=1770258265; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qCXUIpVaz/FWsfJXyE0wx3UZw3tMasE32Or3Jgl450=;
        b=FR5M0CgD6vO0qr0wHwd4tfQwq6+r/y0/GK6+VyIguTLkX2cA0PBwewhPHF4aggDSDp
         aea9zsaJOGFWCl3AXfTCJqsHC9F9OiO4dhyqv1pkJaBpXNrlLUMUNHYVIDZOnf7radm1
         R8tdNC+4B7+YimOEfMLN/pYy6LAqGHSatRYbxHSCYokQF90ZPhAW0VLvtVCBOqsdk4BL
         Wh25ihnnU50Y4fL9K6OcScGGlQ/ko0G3HsOaSCSU7Mg4YmyldZOrIvTQLZwv3c0FXOFJ
         42PrxYxyMRqdHzocaeGjxgfXnFy3mDgNVwQyuOYRmknv1pGfrvYWwu0I9PRdpZcrfepL
         shYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769653465; x=1770258265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7qCXUIpVaz/FWsfJXyE0wx3UZw3tMasE32Or3Jgl450=;
        b=QqU5opGYNGu0bVbbjb70Ry26z6PXdYxLJo/tNQE8bxGpy2sMaJQf0boaD5eai+aET3
         t+Q70kT+gt6IGvAEi/eoWMvhZTNofqm39Tbpez/i3AsOaSUCYSbDOL6KfKbm8+aNwAQ4
         26kDT1cGew8oR/ut0UErLTfyoxuC6s/yH2Jmhj6hvbhG6lJe2BxyGJ8al7wCJhkO89tv
         UF9B0laFm8lNRQd7uBcNPZnjjPBiCBOtVo3EAeTGKL+mb/mueEvuCcXFFIW+fx9IOVNS
         4LpDTIngn3pSBgf6E+CkFOVj07RZ2mm5oDYK3dQQSA7bzoXwyplDtKTOSYYLpTv6QoHu
         V4uA==
X-Forwarded-Encrypted: i=1; AJvYcCWzPN0YiQ+JBjSEY1V9+Q5kOGdkSXVZSzHr2NApAdNC4wCnwL/TKIf7e7xN59KsiFwasNbN1Gs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw81nDAPWf8a1e1Z51HAL0wREF9EU9TiMTRud082OciwtYRbMLT
	yijVkMt7Sdb3P7nAbl5Gb4c/BWRvKYsrVy3FXQXkSlPYkWIIunIoxtBepBaSbsF3Q2I/lxaab8C
	krgb2iylilNVaaaLpJzFSKOSy7fEUAdMCfHsV9XI7C1uIx0J5h2eKpMrVNOEcS6LL
X-Gm-Gg: AZuq6aKmMyBWLA4oDqj9YWduC9J0Y6fqf1dtsPn8NNAJ55rAHOTHVxBIh3ewQToWDF6
	yFRvvgZVeLcrWRxQEkj6msaeBhhQABYMX5PW8O587mdlcPWG/hfeKVsAO58XqEd4ZfqCxX2aUZY
	rwLTHcjSHgQ3qKfj3ncwduLc8hZb1p41Xxuo3hPtJ/9YvnrOv1ZZht0V7VexdtDn+d04Mod/UbX
	gfoJkkTApjEVJI8TrVe5AGDjmUSqn4oO/XcPEoAuwo7vKvSAQ6iG0wvCpPwlhil3FRYp+cOU1oj
	D28H3YjnM8grcCi0oisGHjVMgLwmqVpXjLA5Vp4nvaR2msTteBftLBGPGZHUE7pVuJTmdt+2klA
	2cToHmzjHdvw0edtMiIFPpcjSjmadqQuKnRzxuXOltgiDDOBLfZNjy42e+M2c+7M=
X-Received: by 2002:a17:902:da4f:b0:2a0:92a6:955 with SMTP id d9443c01a7336-2a870d66543mr76808115ad.23.1769653465031;
        Wed, 28 Jan 2026 18:24:25 -0800 (PST)
X-Received: by 2002:a17:902:da4f:b0:2a0:92a6:955 with SMTP id d9443c01a7336-2a870d66543mr76807815ad.23.1769653464512;
        Wed, 28 Jan 2026 18:24:24 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm33851035ad.69.2026.01.28.18.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 18:24:24 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 10:24:06 +0800
Subject: [PATCH ath-next 2/2] wifi: ath12k: fix station lookup failure when
 disconnecting from AP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-ath12k-fw-stats-fixes-v1-2-55d66064f4d5@oss.qualcomm.com>
References: <20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d5@oss.qualcomm.com>
In-Reply-To: <20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d5@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAxNiBTYWx0ZWRfX3FpqR7p8XuLm
 mcdd4xQ0fAeIEPDCFyBmLskPVmpLBs+r1xP1j6rNDTJ9Ir57oQWpfbzkIMcOOiNUV35GATzs6a2
 MOhS7m9UwLJRb3uujCmzWjblj+64zUtTw8vMUrm6VuOUMPlAXN8eG8Gvj+cuqvywen/uU39WrWk
 KL0z0l4ypPt5GxseFNpqBlr2KbyZ5YqCtjQh902EYAhx0Vo9bQcEKcP8qVKnYnq3q0T+d9AFeiv
 1zyiwZdwyytBHDToyFd44GzhaX8OdwnwHgPs+QEqCkfscgYF1tI/NCiZUbxixYWzElEhoU8glMp
 aNlQvCyFh7bh+bIpV0mv3JcMdf8UEflx/qXpxO8trHOWafd3t0SWtMcZEwtRVAmmVQFefHQeLn8
 A7INqBqC/SFByT1iwbCdY3RGLtTtRwSzliZMJZ5MYF6z9fIECu0p/fd82kwZH+IFO+FAnqfPq5e
 dWSJe35wysA/4gTnE5g==
X-Authority-Analysis: v=2.4 cv=Je2xbEKV c=1 sm=1 tr=0 ts=697ac4da cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=c0rEsw2Pbq29Pm4qmBMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 6PTiiXp2XjIFZ-hjYwWlj1uYGnulDo7g
X-Proofpoint-GUID: 6PTiiXp2XjIFZ-hjYwWlj1uYGnulDo7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_182427_573873_AD7487B1 
X-CRM114-Status: GOOD (  15.72  )
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

In ath12k_wmi_tlv_fw_stats_data_parse() and
ath12k_wmi_tlv_rssi_chain_parse(), the driver uses
ieee80211_find_sta_by_ifaddr() to look up the station associated with the
incoming firmware statistics. This works under normal conditions but fails
during AP disconnection, resulting in log messages like:

 wlan0: deauthenticating from xxxxxx by local choice (Reason: 3=DEAUTH_LEAVING)
 wlan0: moving STA xxxxxx to state 3
 wlan0: moving STA xxxxxx to state 2
 wlan0: moving STA xxxxxx to state 1
 ath12k_pci 0000:02:00.0: not found station bssid xxxxxx for vdev stat
 ath12k_pci 0000:02:00.0: not found station of bssid xxxxxx for rssi chain
 ath12k_pci 0000:02:00.0: failed to pull fw stats: -71
 ath12k_pci 0000:02:00.0: time out while waiting for get fw stats
 wlan0: Removed STA xxxxxx
 wlan0: Destroyed STA xxxxxx

The failure happens because the station has already been removed from
ieee80211_local::sta_hash by the time firmware statistics are requested
through drv_sta_statistics().

Switch the lookup to ath12k_link_sta_find_by_addr(), which searches the
driver's link station hash table that still has the station recorded
at that time.  This also implicitly fixes another issue: the current code
always uses deflink regardless of which link the statistics belong to,
which is incorrect in MLO scenarios. The new helper returns the correct
link station.

Additionally, raise the log level on lookup failures. With the updated
helper, such failures should no longer occur under normal conditions.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: 79e7b04b5388 ("wifi: ath12k: report station mode signal strength")
Fixes: 6af5bc381b36 ("wifi: ath12k: report station mode per-chain signal strength")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 36 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index cce3d699112d..92e4f820005e 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -8099,8 +8099,6 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
 	struct ath12k_fw_stats *stats = parse->stats;
 	struct ath12k *ar;
 	struct ath12k_link_vif *arvif;
-	struct ieee80211_sta *sta;
-	struct ath12k_sta *ahsta;
 	struct ath12k_link_sta *arsta;
 	int i, ret = 0;
 	const void *data = ptr;
@@ -8136,21 +8134,19 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
 
 		arvif = ath12k_mac_get_arvif(ar, le32_to_cpu(src->vdev_id));
 		if (arvif) {
-			sta = ieee80211_find_sta_by_ifaddr(ath12k_ar_to_hw(ar),
-							   arvif->bssid,
-							   NULL);
-			if (sta) {
-				ahsta = ath12k_sta_to_ahsta(sta);
-				arsta = &ahsta->deflink;
+			spin_lock_bh(&ab->base_lock);
+			arsta = ath12k_link_sta_find_by_addr(ab, arvif->bssid);
+			if (arsta) {
 				arsta->rssi_beacon = le32_to_cpu(src->beacon_snr);
 				ath12k_dbg(ab, ATH12K_DBG_WMI,
 					   "wmi stats vdev id %d snr %d\n",
 					   src->vdev_id, src->beacon_snr);
 			} else {
-				ath12k_dbg(ab, ATH12K_DBG_WMI,
-					   "not found station bssid %pM for vdev stat\n",
-					   arvif->bssid);
+				ath12k_warn(ab,
+					    "not found link sta with bssid %pM for vdev stat\n",
+					    arvif->bssid);
 			}
+			spin_unlock_bh(&ab->base_lock);
 		}
 
 		data += sizeof(*src);
@@ -8221,8 +8217,6 @@ static int ath12k_wmi_tlv_rssi_chain_parse(struct ath12k_base *ab,
 	struct ath12k_fw_stats *stats = parse->stats;
 	struct ath12k_link_vif *arvif;
 	struct ath12k_link_sta *arsta;
-	struct ieee80211_sta *sta;
-	struct ath12k_sta *ahsta;
 	struct ath12k *ar;
 	int vdev_id;
 	int j;
@@ -8258,19 +8252,15 @@ static int ath12k_wmi_tlv_rssi_chain_parse(struct ath12k_base *ab,
 		   "stats bssid %pM vif %p\n",
 		   arvif->bssid, arvif->ahvif->vif);
 
-	sta = ieee80211_find_sta_by_ifaddr(ath12k_ar_to_hw(ar),
-					   arvif->bssid,
-					   NULL);
-	if (!sta) {
-		ath12k_dbg(ab, ATH12K_DBG_WMI,
-			   "not found station of bssid %pM for rssi chain\n",
-			   arvif->bssid);
+	guard(spinlock_bh)(&ab->base_lock);
+	arsta = ath12k_link_sta_find_by_addr(ab, arvif->bssid);
+	if (!arsta) {
+		ath12k_warn(ab,
+			    "not found link sta with bssid %pM for rssi chain\n",
+			    arvif->bssid);
 		return -EPROTO;
 	}
 
-	ahsta = ath12k_sta_to_ahsta(sta);
-	arsta = &ahsta->deflink;
-
 	BUILD_BUG_ON(ARRAY_SIZE(arsta->chain_signal) >
 		     ARRAY_SIZE(stats_rssi->rssi_avg_beacon));
 

-- 
2.25.1


