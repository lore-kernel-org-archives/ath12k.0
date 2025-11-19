Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80BACEE35E
	for <ath12k@archiver.kernel.org>; Wed, 19 Nov 2025 02:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M782Qd31NYBZNKd3a0HfmkYvhogEJxqedgY0I+voOOI=; b=ERlh5Gti14v3teeXh+KgOH5J3U
	US9VlpHEQlRyDPPao+h4+pa2daDHdpJXpIGoBc1bJYymHiGl/R4c7IpH14iYWI/kU8yV3NOv4HH/4
	aA5QX4LVr+M+txQOcL/9lG7DI+DJVNW/EA9R1ZYIMABADIpy6haX1DPBlygeEyBJJc9T/WkR/r8/u
	cqI8zjEAWZgo/FvrYILZM8zQgGxBIZSpfGFCiBsAgpdG+mWsUxFoQoYSRU42rdSLW4KMohXww0xGi
	NQMS/c/jyw+RCcUUKVf2RkQBdL9h6XK8JFtZ3RoSdUE+VSNTTHdcx3QCsj6+LKiLoVemmrqWYKo/4
	U8pjcZUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXsR-00000001O4L-1xqY;
	Wed, 19 Nov 2025 02:24:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXsO-00000001O40-3eaK
	for ath12k@lists.infradead.org;
	Wed, 19 Nov 2025 02:24:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIJfloG2802379
	for <ath12k@lists.infradead.org>; Wed, 19 Nov 2025 02:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M782Qd31NYBZNKd3a0Hfmk
	YvhogEJxqedgY0I+voOOI=; b=DdMFiZp+jAkSDWCqACBm0qefxT1ubuEVzVU9Od
	pbbpEN7Vs0i2DMBJkj6dHClPHviUis+9jTVx/pBBAuQEYgnvQesFdmjCe1VMW8ml
	smxcwKwUPNVqEIXKll9FHFRcAmyQZ19nG+eVyqS5I4EYswaUr4Oa8AnjoJ0U+vVE
	kItKCN9xFT/NQD0yR8iqgbR8Bw9Duf+jljtpt9+XWXnAEB2TyR8311o7vqDxVXxy
	8Obu5pxzLM82TLbX4Zjrcp8wGm9XUC+ZxFRIjRoJOl65zwWXwsGAr7UddxlI5dBN
	MxaitnLTDGC40TlLaIlllNOblIMTkWRB0USvj9xi1C+pND8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk22984-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Nov 2025 02:24:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956cdcdc17so74532115ad.3
        for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 18:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763519095; x=1764123895; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M782Qd31NYBZNKd3a0HfmkYvhogEJxqedgY0I+voOOI=;
        b=D8/lNbzsB56UAbvtP69TWGep6hRbKauE6lYt8r5JNcVmNmSGbDbeWyFb2sg+mwd7w5
         +un2qnlm2DCh6MG4NzKfvFALTt51aGgMTPb+m6rp+7kLuVykUHdR9Z5vhYb5Nm5nhf89
         efrsxEkV1N1XMuf63oxygCXQs9EilKOTpEJuorK/UCUFTGkkQYHfZRNvRXSwm44cqJ8e
         x8WkF63ntN+Q+ysxHPSY4ddDF6CtLE6Mv8idSYfJIcl75S2mPzsVxwaF+9uU0qbSB4eT
         5BkLmQ00mDPEfyMKrpQsMhHQqUK2bMcgn5fddKcbZ8MCz6TGHCnGrCGNdG5e0DitUbFh
         OyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763519095; x=1764123895;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M782Qd31NYBZNKd3a0HfmkYvhogEJxqedgY0I+voOOI=;
        b=o0XeS9PbjT4qx1JV2sTYZ/oAUXP8ADfpRCt426I3zUDft83XiodM6ZYx4qjBdf0ikj
         1n3vK/vzfcWVUN3h/WWmN7RK4mhNlFNLWEcNsOky4sLci3O2C9B9lhO4/oH5RwCvy3TZ
         JM7TbQwI40M2Pkdaq5g66gQn3/SbUQCcoYMPA+Y36GfRWNr0P10X/F16N1Cjl4xt8N9M
         2QW40M2CZwuvKVupn664gFmXiitjCsQjsLo/GGuL5/VEWcn0EfiL+O2eYbMto5e2DX+9
         MsOTWVT8S0szD45GfwUlrrQ5cPgo8EScxOyaM3oFvKfVLXn64KY2m9+KGOG7yWfmfdWG
         Am6g==
X-Forwarded-Encrypted: i=1; AJvYcCXoMvpaTwjexkt2Lf+EwhHU6ISmxzaVBAur7d3GMJPmJC2WdAxdRyJyyME4Ni4dy/jVsuuCryI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzkFhl25CzoCCApoYoxrsg0nLkMPpR+P8TchKM3fU4oOdpCok3w
	o/Mw3H34V8+/QlrNmWxyOrKunEXF6Nz1+1XEztEAHS6ooVJs2lPEndjWg0dgpDCXBbPU/lXUG7Y
	negwmrCDDIwcjsKTr9CrC68r2c022jWAMg014FjsIE7uwDyF7t0MavJf2ZRsWbLPC
X-Gm-Gg: ASbGnctnOdYtyc9GVtxPc4IDkPCw7YGpviy0Rzfz9ccZRE+bUzYOTPnGNqNetY2IPlU
	MkIBunFXNarDkdnKUNit4A+4wqgeTYBJIAxiiNgiZljD9RPwH9L+DFQGNpOnSPGlkBUgxJN54VZ
	Tspz+LdkcR4vIhNJ5UFYO4dS4TM2lySXNmNNDghjeNl613KhRj9w+Ng+sAbqHOXvuizTfFfVLnv
	6Znk8xww3M4U7chWyYmT6lNxi/jSGyhNw3RiQz25ZnV3Xa4ABRo2XPIwq4/fXlqD8FJk0o3sjl2
	tWAEjVkCKr7bPacp5WYKIQhHp9TVVHnRmlwBXvAquL+NXpjEdlzMpbtXKfako2ld6oPdSdqnbzJ
	1vokYbE24juy2qHytQrKCm5w4J+wCMcnlKoG5uVAkN1iITI+O22F4qrfBAzFzsRs=
X-Received: by 2002:a17:90b:1844:b0:340:b572:3b7d with SMTP id 98e67ed59e1d1-343fa528260mr20092900a91.19.1763519095258;
        Tue, 18 Nov 2025 18:24:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJ1PLktoZEBxjtT9d5F+2ee2MpmVNcVOT9F5afI4O1pAmtd8OW64Xfxr81QiqzVrZh6bnarw==
X-Received: by 2002:a17:90b:1844:b0:340:b572:3b7d with SMTP id 98e67ed59e1d1-343fa528260mr20092875a91.19.1763519094734;
        Tue, 18 Nov 2025 18:24:54 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345bc111e72sm811857a91.15.2025.11.18.18.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 18:24:54 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 10:24:47 +0800
Subject: [PATCH ath12k-ng] wifi: ath12k: move firmware stats request
 outside of atomic context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-ath12k-ng-sleep-in-atomic-v1-1-5d1a726597db@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG4qHWkC/41NSw6CMBC9ipm1Q5gGSnTlPQyLUgaYCC22SDSEu
 9uwcO3mJe+/QeQgHOF62iDwKlG8S4TOJ7CDcT2jtImDylVJRAWaZSD1QNdjHJlnFJckP4lF7rh
 ptanysmgg9efAnbyP7Tv8alAna5C4+PA5Xlc6An8crISEWlelLlp9Ka26+Riz58uM1k9TlgDqf
 d+/pAGJGdQAAAA=
X-Change-ID: 20251114-ath12k-ng-sleep-in-atomic-efebd6a7054b
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691d2a78 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1JFbABHWMOtqWNdtv10A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: xtC4dEuUXsFMIoeEY0h0ATi80CoQ3MLV
X-Proofpoint-ORIG-GUID: xtC4dEuUXsFMIoeEY0h0ATi80CoQ3MLV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAxNyBTYWx0ZWRfX+cSnqK9JeQwk
 P7MPNtU0gE4xYJHF8OBdq0uxClmqG2tpGy0PXW9m7DaW4vEsnKvlT6Q6LUMVkMNNX94biZW5umL
 x4GIrQDv89KKH8rQcBmmaW+Nw+ekBcfRox5C0nqQ3daHs7uXBItXfdjy43ElS7gY5M+iyD499LU
 MluBuZdXjIlrOOiee1PRx92lLgnP7jQ79DyR1AXTL2r//DHT1RU0oA8dP5VuaXekxrp1aDWJo4w
 0JscomOjT6TWN1CzMCeG6/4asNtTP5GwoffIysNW5IfGtr7FB/b6XQWARDmiZ1/VZjPxxoBVw6O
 /j92iHwqV43TDsOGOXnfJ/mgRDKSq1AB0wwJqyuDA/lKzHWe7fEI5mXfIRQFuyjtZyfcuJIjH8h
 O2C5eABn3FTERBQ7vOS0y3rJT4no8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_182456_948978_BD53BE99 
X-CRM114-Status: GOOD (  13.82  )
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

In ath12k_mac_op_link_sta_statistics(), the atomic context scope
introduced by dp_lock also covers firmware stats request. Since that
request could block, below issue is hit:

BUG: sleeping function called from invalid context at kernel/locking/mutex.c:575
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 6866, name: iw
preempt_count: 201, expected: 0
RCU nest depth: 0, expected: 0
3 locks held by iw/6866:
 #0:[...]
 #1:[...]
 #2: ffff9748f43230c8 (&dp->dp_lock){+.-.}-{3:3}, at:
ath12k_mac_op_link_sta_statistics+0xc6/0x380 [ath12k]
Preemption disabled at:
[<ffffffffc0349656>] ath12k_mac_op_link_sta_statistics+0xc6/0x380 [ath12k]
Call Trace:
 <TASK>
 show_stack
 dump_stack_lvl
 dump_stack
 __might_resched.cold
 __might_sleep
 __mutex_lock
 mutex_lock_nested
 ath12k_mac_get_fw_stats
 ath12k_mac_op_link_sta_statistics
 </TASK>

Since firmware stats request doesn't require protection from dp_lock, move
it outside to fix this issue.

While moving, also refine that code hunk to make function parameters get
populated when really necessary.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 44 ++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index aa80afebb69e..3649f58fef84 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12792,10 +12792,12 @@ void ath12k_mac_op_link_sta_statistics(struct ieee80211_hw *hw,
 	db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
 			  ar->ab->wmi_ab.svc_map);
 
-	guard(spinlock_bh)(&ar->ab->dp->dp_lock);
+	spin_lock_bh(&ar->ab->dp->dp_lock);
 	peer = ath12k_dp_link_peer_find_by_addr(ar->ab->dp, arsta->addr);
-	if (!peer)
+	if (!peer) {
+		spin_unlock_bh(&ar->ab->dp->dp_lock);
 		return;
+	}
 
 	link_sinfo->rx_duration = peer->rx_duration;
 	link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_DURATION);
@@ -12822,35 +12824,35 @@ void ath12k_mac_op_link_sta_statistics(struct ieee80211_hw *hw,
 		link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
 	}
 
+	link_sinfo->signal_avg = ewma_avg_rssi_read(&peer->avg_rssi);
+	if (!db2dbm)
+		link_sinfo->signal_avg += ATH12K_DEFAULT_NOISE_FLOOR;
+	link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
+
+	link_sinfo->tx_retries = peer->tx_retry_count;
+	link_sinfo->tx_failed = peer->tx_retry_failed;
+	link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
+	link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_FAILED);
+
 	/* TODO: Use real NF instead of default one. */
 	signal = peer->rssi_comb;
 
-	params.pdev_id = ar->pdev->pdev_id;
-	params.vdev_id = 0;
-	params.stats_id = WMI_REQUEST_VDEV_STAT;
+	spin_unlock_bh(&ar->ab->dp->dp_lock);
 
-	if (!signal &&
-	    ahsta->ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
-	    !(ath12k_mac_get_fw_stats(ar, &params)))
-		signal = arsta->rssi_beacon;
+	if (!signal && ahsta->ahvif->vdev_type == WMI_VDEV_TYPE_STA) {
+		params.pdev_id = ar->pdev->pdev_id;
+		params.vdev_id = 0;
+		params.stats_id = WMI_REQUEST_VDEV_STAT;
+
+		if (!ath12k_mac_get_fw_stats(ar, &params))
+			signal = arsta->rssi_beacon;
+	}
 
 	if (signal) {
 		link_sinfo->signal =
 			db2dbm ? signal : signal + ATH12K_DEFAULT_NOISE_FLOOR;
 		link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
 	}
-
-	link_sinfo->signal_avg = ewma_avg_rssi_read(&peer->avg_rssi);
-
-	if (!db2dbm)
-		link_sinfo->signal_avg += ATH12K_DEFAULT_NOISE_FLOOR;
-
-	link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
-
-	link_sinfo->tx_retries = peer->tx_retry_count;
-	link_sinfo->tx_failed = peer->tx_retry_failed;
-	link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
-	link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_FAILED);
 }
 EXPORT_SYMBOL(ath12k_mac_op_link_sta_statistics);
 

---
base-commit: 7cd7392a07782b8ad4aa6360e4be1967af2eab04
change-id: 20251114-ath12k-ng-sleep-in-atomic-efebd6a7054b

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


