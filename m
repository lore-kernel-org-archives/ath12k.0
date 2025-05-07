Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD8BC3ABC0
	for <ath12k@archiver.kernel.org>; Wed,  7 May 2025 19:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aajyCbehm0MwKmyxwGdAZ66JyvVeNNg/vMHTnIceKTs=; b=UT+cyIUPA9lwEvU9vStO81R9Tz
	WQNyhfwIEOAqyZnXX0bZmxjNTWPFepXMxudw+gPU0fKC1/LUmE6VHJVjD2/4f6qKDjUAHAzvKbtpI
	xu/gxYoFgkYMZMqfZIIgVYEqcAf12+yf6dOS/ZU3LRr3QRIjBcPvMCF6jC3fqPSTcXXOl9A9SD/rn
	r/Zi4meFGkIQI7YKw3wN5lrPC0v9iRqgB3bzRckIa8EBIgchxIhS01OpOFzCvMAlU47XNMka8V3uJ
	7JArMZIJ0zHIjDqix7q/u1vu8xNO0pK2t5zAbw6HfFl/GmX3qgghYQiVMH0e88J7zEkXfQlO5ilEz
	Q//nslYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCklM-0000000Gbfe-000v;
	Wed, 07 May 2025 19:49:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCklI-0000000Gbei-1VHA
	for ath12k@lists.infradead.org;
	Wed, 07 May 2025 19:49:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547BVQIm018441
	for <ath12k@lists.infradead.org>; Wed, 7 May 2025 19:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aajyCbehm0M
	wKmyxwGdAZ66JyvVeNNg/vMHTnIceKTs=; b=BVAmXWbqoW532gQDn4L+Qs3ZJM2
	xIAoLE16LwBsmcWwsoV4xopBKY96FmfE+YOddxgTGL74nV4/fr0Z20C6hh2wAE6R
	QJFrRM9xiOs/+t76Wsu3QrhBPCFYV+oOe3vn9njAxUhMIOcpbeoi87Sm6Q1J57nL
	9S//rrhiTtBR+D0od3vaaX+DTnfeMq93h7x36egvIv2dJ0gCPkBuHOrPkMvLR6sI
	3dY3RHv1HtCEBgwppruJrhAjO76lY+pws21dY0rmFOSZrrhhgVa8LwAnNu3sy+hC
	XsRBO5y7QtxPRZ59OlQE595irYVkqNrvZSo3GS1Q0OvduVF3XV5QAt7BYvw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5tbevrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 07 May 2025 19:48:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-739525d4d7bso173201b3a.2
        for <ath12k@lists.infradead.org>; Wed, 07 May 2025 12:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746647338; x=1747252138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aajyCbehm0MwKmyxwGdAZ66JyvVeNNg/vMHTnIceKTs=;
        b=HJd67Yr+xm2l3CHgqjXv8YlLtz8Ghg6wkLK2gSL13TyUh2FnZ5C+AHpRE+yZxcCgnp
         0Y3pAHFbgE56OC9p9oqCMZ/zpjE/E/MmSXhYC2GEWAOTVXKtj3tCsC5pIOEKE0qI+jBV
         7rtVJ/rF9GyJc5hDUGN0tAHchWKnc+Q9OkRo2YIVxshVjENADgfZZGNs+eMFpabO7uSv
         +D7hhHDi/M2P3obzyld1SCJ9TCsRkU/wQu/kCCbNppmeXz9mhbh6dAV5g9LJEIk/ydjQ
         R/6IVW5TJUwZ4I8LFrE2BuOYS3xc1s2D2XYEetnCJ0FlQJec18cXeuRDBo5MK4lMiN6x
         6P1Q==
X-Gm-Message-State: AOJu0YycLzaXaki74PE2BAdVN03fgc98Olex3Jr1xKt0RqLkWuUtwZfk
	az1x6mT100ebzPBItKRUqZ0f/2Rut5yUhf9YsriAjk/Yt8v1OBTQYNTiAQ7IoaMm/DsmSGweoca
	xN/mr9swTGLhEkd84rTNcVNzqj91cfN2MOswVErYBoJrrWzHpwCTI+LBHzdUbFqRpcXZn
X-Gm-Gg: ASbGncuHagXuj8PmNdFFcDCPZFgve4NbWxXhnXyS+Cc5rm3QcypuMHFKQph856EgDLF
	liCsfHffuamlurLs48r4FE8fuSeIqx7vliMRKrt1TRdjyu1xO2w2oAHg2KPHerWKlU5gYJxmjJC
	3+hpSzQjEbvgfE15wO1cpg+dqd9Lcc7zNHE5LUBu/Iql/jv73BeX7ZJVjKoBU/sVnjzNQeJIm3T
	pGcBP4jw9DNZMlH9Mbb7pMcNJVSZ9pjvjB1vBrCUwBtkxsEdeZHbqPLeR8Owyjy5XW40oENtOBP
	2XecdBAeIWX4W+RWFRZtvqDinclgwNi1F21uoKTDU9eK48s/aO7zg4ImfZMvOOsnZzt6l2nHsm+
	1Kbk0kbtfRp/ScSyve2Afopqm4ByK0O5SY3SAdbBE
X-Received: by 2002:a05:6a20:9f8e:b0:1f5:8e94:2e81 with SMTP id adf61e73a8af0-2148b0189e3mr6439149637.9.1746647337745;
        Wed, 07 May 2025 12:48:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4TYuk97KTtTsyO/NrO0CTbCTThvoFpjlTpol8SdKog7Ft5aya/JjpPjX6sexqYyYk4Jd4NQ==
X-Received: by 2002:a05:6a20:9f8e:b0:1f5:8e94:2e81 with SMTP id adf61e73a8af0-2148b0189e3mr6439104637.9.1746647337170;
        Wed, 07 May 2025 12:48:57 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm9972704a12.11.2025.05.07.12.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 12:48:56 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Vignesh C <quic_vignc@quicinc.com>,
        Mahendran P <quic_mahep@quicinc.com>
Subject: [PATCH ath-pending v2 2/2] wifi: ath12k: Split scan request for split band device
Date: Thu,  8 May 2025 01:18:32 +0530
Message-Id: <20250507194832.2501668-3-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507194832.2501668-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250507194832.2501668-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kRsZcYZj7zjwRTvatKyNxWlYjstrGFHP
X-Proofpoint-GUID: kRsZcYZj7zjwRTvatKyNxWlYjstrGFHP
X-Authority-Analysis: v=2.4 cv=doXbC0g4 c=1 sm=1 tr=0 ts=681bb92b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=BBq-wa7h3OHIyVUFt-wA:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE4MSBTYWx0ZWRfX157wPX0pFMKA
 nJQEapjCm8DTQwesxg3Ko12LWRLUzo0tdvNiYgMKnt3K7zWJtLgLGZUxz0ZV5uIsiZkg6A9Pmhz
 15GxNhbJz67G0LLFdDv9kXAS41ezN1PGelmPJiTVLrDgpRKOBJjuf9jlyWqe6E/9wrb3f82rrp4
 WQbdKBKcA2zcGQuPAJoHHHrcQYbBr4br6KY2vZybyF8e6mzzmvAiRoVQZY1L7//0PxEQytWV7dr
 7rNRf3r5RUDJLlgy61UHOU1vaQYA++1faiDKIHcO4EM4bXdpNtB7pigchWOqk4jULhZGTN7Bi4y
 bh7nRoCdylfkAHNkp2QM4dLU/tp0ifiiFnO/FCqlrzYWBg40Y+4hD2haJEHsck4VkKZv3O6Uw13
 zqf/xGCDKLeUd7zoLBuMeSGb1Hk0ZCs6wKGcWX877Eg3vl6M1dqvGuyfPDcQklyOs7jLMgMW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_06,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_124900_517222_15CFC3FB 
X-CRM114-Status: GOOD (  29.44  )
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

When two split-phy devices having supported frequency range in same band
(as mentioned below) are combined into an ath12k HW group, they will be
part of same wiphy and hence the channel list (wiphy->bands[]) will be
common for all of the radios (ar).

1 - 2.4 GHz + 5 GHz Low band
2 - 5 GHz High band + 6 GHz

When a scan is triggered with frequency list containing frequencies of
both 5 GHz low and 5 GHz high, mac80211 generates a single scan request
to driver with both the frequencies. This is because mac80211 splits the
scan request based on band.

ath12k checks the first frequency in the requested scan frequency list and
initiates scan to corresponding radio's(ar) firmware with all the
frequencies. Firmware rejects this scan as some frequencies in the scan
request are not supported, resulting is scan failure.

Fix this by splitting the scan request into multiples scans in driver
based on the supported frequency range of different radios in a band and
schedule scans in parallel to them.
Finally send scan completion/abort notification to mac80211 after all the
radios complete their scheduled scan.

Also, last_scan_link is not needed anymore as ath12k internally schedules
multiple scans, remove the same and use ahvif->links_map to identify
scan links when scan is cancelled.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Co-developed-by: Vignesh C <quic_vignc@quicinc.com>
Signed-off-by: Vignesh C <quic_vignc@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Reviewed-by: Mahendran P <quic_mahep@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |   2 -
 drivers/net/wireless/ath/ath12k/mac.c  | 148 ++++++++++++++++++++-----
 2 files changed, 118 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 570bbe4aecd5..0e69811627da 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -381,8 +381,6 @@ struct ath12k_vif {
 	struct ath12k_vif_cache *cache[IEEE80211_MLD_MAX_NUM_LINKS];
 	/* indicates bitmap of link vif created in FW */
 	u32 links_map;
-	u8 last_scan_link;
-
 	/* Must be last - ends in a flexible-array member.
 	 *
 	 * FIXME: Driver should not copy struct ieee80211_chanctx_conf,
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b80ae1476f5e..562f8b170a1a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4683,6 +4683,23 @@ static void ath12k_scan_timeout_work(struct work_struct *work)
 	wiphy_unlock(ath12k_ar_to_hw(ar)->wiphy);
 }
 
+static void ath12k_mac_scan_send_complete(struct ath12k *ar,
+					  struct cfg80211_scan_info *info)
+{
+	struct ath12k_hw *ah = ar->ah;
+	struct ath12k *partner_ar;
+	int i;
+
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
+	for_each_ar(ah, partner_ar, i)
+		if (partner_ar != ar &&
+		    partner_ar->scan.state == ATH12K_SCAN_RUNNING)
+			return;
+
+	ieee80211_scan_completed(ah->hw, info);
+}
+
 static void ath12k_scan_vdev_clean_work(struct wiphy *wiphy, struct wiphy_work *work)
 {
 	struct ath12k *ar = container_of(work, struct ath12k,
@@ -4721,7 +4738,7 @@ static void ath12k_scan_vdev_clean_work(struct wiphy *wiphy, struct wiphy_work *
 				    ATH12K_SCAN_STARTING)),
 		};
 
-		ieee80211_scan_completed(ar->ah->hw, &info);
+		ath12k_mac_scan_send_complete(ar, &info);
 	}
 
 	ar->scan.state = ATH12K_SCAN_IDLE;
@@ -4940,12 +4957,14 @@ ath12k_mac_find_link_id_by_ar(struct ath12k_vif *ahvif, struct ath12k *ar)
 	return ATH12K_FIRST_SCAN_LINK;
 }
 
-static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
-				 struct ieee80211_vif *vif,
-				 struct ieee80211_scan_request *hw_req)
+static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
+				       struct ieee80211_vif *vif,
+				       struct ieee80211_scan_request *hw_req,
+				       int n_channels,
+				       struct ieee80211_channel **chan_list,
+				       struct ath12k *ar)
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
-	struct ath12k *ar;
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	struct ath12k_link_vif *arvif;
 	struct cfg80211_scan_request *req = &hw_req->req;
@@ -4959,13 +4978,6 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 
 	arvif = &ahvif->deflink;
 
-	/* Since the targeted scan device could depend on the frequency
-	 * requested in the hw_req, select the corresponding radio
-	 */
-	ar = ath12k_mac_select_scan_device(hw, vif, hw_req->req.channels[0]->center_freq);
-	if (!ar)
-		return -EINVAL;
-
 	/* check if any of the links of ML VIF is already started on
 	 * radio(ar) corresponding to given scan frequency and use it,
 	 * if not use scan link (link id >= 15) for scan purpose.
@@ -5068,8 +5080,8 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 		arg->scan_f_passive = 1;
 	}
 
-	if (req->n_channels) {
-		arg->num_chan = req->n_channels;
+	if (n_channels) {
+		arg->num_chan = n_channels;
 		arg->chan_list = kcalloc(arg->num_chan, sizeof(*arg->chan_list),
 					 GFP_KERNEL);
 		if (!arg->chan_list) {
@@ -5078,7 +5090,7 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 		}
 
 		for (i = 0; i < arg->num_chan; i++)
-			arg->chan_list[i] = req->channels[i]->center_freq;
+			arg->chan_list[i] = chan_list[i]->center_freq;
 	}
 
 	ret = ath12k_start_scan(ar, arg);
@@ -5096,13 +5108,6 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac scan started");
 
-	/* As per cfg80211/mac80211 scan design, it allows only one
-	 * scan at a time. Hence last_scan link id is used for
-	 * tracking the link id on which the scan is been done on
-	 * this vif.
-	 */
-	ahvif->last_scan_link = arvif->link_id;
-
 	/* Add a margin to account for event/command processing */
 	ieee80211_queue_delayed_work(ath12k_ar_to_hw(ar), &ar->scan.timeout,
 				     msecs_to_jiffies(arg->max_scan_time +
@@ -5123,25 +5128,108 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 	return ret;
 }
 
+static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
+				 struct ieee80211_vif *vif,
+				 struct ieee80211_scan_request *hw_req)
+{
+	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ieee80211_channel **chan_list, *chan;
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	unsigned long links_map, link_id;
+	struct ath12k_link_vif *arvif;
+	struct ath12k *ar, *scan_ar;
+	int i, j, ret = 0;
+
+	lockdep_assert_wiphy(hw->wiphy);
+
+	chan_list = kcalloc(hw_req->req.n_channels, sizeof(*chan_list), GFP_KERNEL);
+	if (!chan_list)
+		return -ENOMEM;
+
+	/* There could be channels that belong to multiple underlying radio
+	 * in same scan request as mac80211 sees it as single band. In that
+	 * case split the hw_req based on frequency range and schedule scans to
+	 * corresponding radio.
+	 */
+	for_each_ar(ah, ar, i) {
+		int n_chans = 0;
+
+		for (j = 0; j < hw_req->req.n_channels; j++) {
+			chan = hw_req->req.channels[j];
+			scan_ar = ath12k_mac_select_scan_device(hw, vif,
+								chan->center_freq);
+			if (!scan_ar) {
+				ath12k_hw_warn(ah, "unable to select scan device for freq %d\n",
+					       chan->center_freq);
+				ret = -EINVAL;
+				goto abort;
+			}
+			if (ar != scan_ar)
+				continue;
+
+			chan_list[n_chans++] = chan;
+		}
+		if (n_chans) {
+			ret = ath12k_mac_initiate_hw_scan(hw, vif, hw_req, n_chans,
+							  chan_list, ar);
+			if (ret)
+				goto abort;
+		}
+	}
+abort:
+	/* If any of the parallel scans initiated fails, abort all and
+	 * remove the scan interfaces created. Return complete scan
+	 * failure as mac80211 assumes this as single scan request.
+	 */
+	if (ret) {
+		ath12k_hw_warn(ah, "Scan failed %d , cleanup all scan vdevs\n", ret);
+		links_map = ahvif->links_map;
+		for_each_set_bit(link_id, &links_map, ATH12K_NUM_MAX_LINKS) {
+			arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+			if (!arvif)
+				continue;
+
+			ar = arvif->ar;
+			if (ar->scan.arvif == arvif) {
+				wiphy_work_cancel(hw->wiphy, &ar->scan.vdev_clean_wk);
+				spin_lock_bh(&ar->data_lock);
+				ar->scan.arvif = NULL;
+				ar->scan.state = ATH12K_SCAN_IDLE;
+				ar->scan_channel = NULL;
+				ar->scan.roc_freq = 0;
+				spin_unlock_bh(&ar->data_lock);
+			}
+			if (link_id >= ATH12K_FIRST_SCAN_LINK) {
+				ath12k_mac_remove_link_interface(hw, arvif);
+				ath12k_mac_unassign_link_vif(arvif);
+			}
+		}
+	}
+	kfree(chan_list);
+	return ret;
+}
+
 static void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
 					 struct ieee80211_vif *vif)
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	u16 link_id = ahvif->last_scan_link;
+	unsigned long link_id, links_map = ahvif->links_map;
 	struct ath12k_link_vif *arvif;
 	struct ath12k *ar;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
-	if (!arvif || arvif->is_started)
-		return;
+	for_each_set_bit(link_id, &links_map, ATH12K_NUM_MAX_LINKS) {
+		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+		if (!arvif || arvif->is_started)
+			continue;
 
-	ar = arvif->ar;
+		ar = arvif->ar;
 
-	ath12k_scan_abort(ar);
+		ath12k_scan_abort(ar);
 
-	cancel_delayed_work_sync(&ar->scan.timeout);
+		cancel_delayed_work_sync(&ar->scan.timeout);
+	}
 }
 
 static int ath12k_install_key(struct ath12k_link_vif *arvif,
@@ -9465,7 +9553,7 @@ static void ath12k_mac_op_remove_interface(struct ieee80211_hw *hw,
 					.aborted = true,
 				};
 
-				ieee80211_scan_completed(ar->ah->hw, &info);
+				ath12k_mac_scan_send_complete(ar, &info);
 			}
 
 			ar->scan.state = ATH12K_SCAN_IDLE;
-- 
2.34.1


