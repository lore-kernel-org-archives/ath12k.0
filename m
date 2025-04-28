Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0026C369DC
	for <ath12k@archiver.kernel.org>; Mon, 28 Apr 2025 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnJ2hYZEY+C9abKGNANThMZDQlSXnCbi/4KX5tD/DtI=; b=mgFnDIFvzBV1/oI6s4CN7VeoKh
	zMnQHg0nNn2amFCGZfJC70iDesT2untQu7L0Mym7wdc8hvKn8VhtsFxk1KL56ReNKJKIV9cx659vD
	GJ8du0sOjmaNPxB1392n2KThRPnDF9KiGfPiY21pdtIl330/sMMJE6tEhgkryg3Lr0zokcYWw0ZQ8
	F9H2TeYteGwEQ/KtOFgyLZZeeL/ChWadEYWbDKdlo/zihXcuXWstbuGYihwmnTexYwNAED34KhDBd
	6Bo59m7Ps/e9nYLEdGQ0J6tq/y3maGWR2RoZIKdnqSgQuQZf4FEHbOxTCk+RgWfru6BdXJEKS1Mwy
	ZmvwJEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QH2-00000006jzp-36JZ;
	Mon, 28 Apr 2025 15:20:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QGz-00000006jyT-2Jaa
	for ath12k@lists.infradead.org;
	Mon, 28 Apr 2025 15:19:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S99Y51021850
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 15:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lnJ2hYZEY+C
	9abKGNANThMZDQlSXnCbi/4KX5tD/DtI=; b=HH6WtjfKzL1JFT25e+7XfatlVLx
	1Com5e3hZW5AVWk1Oh8rADPH2+4o79YivnLVzqIskjLAcLuh+8I+OP9bNHeVgVim
	rBnp+BB0WtBPGEStXQhGwp8xuhGagYHvIKVDZimAKAw0VDdDhI9FtG2U4vWV0NvT
	rY9HNKZ+f9l6EOpaDk+YOwGSB3DIsr6rKb7Qf121F2HrQ9d6lFFk+NFuOckm6P2D
	5MRmLOnX6OrzXCoWcLC8A1kj64fRXcgyrO7l0grAXp7R6PTKph82hfBHeuy3xxDI
	hAOoUhlq4MI+ChuMEoQ+DXPg9csxyKdavCSNOmDDdr5Fx2+u8qtzRsluPcQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hrh9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 15:19:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2262051205aso35476335ad.3
        for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 08:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745853596; x=1746458396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnJ2hYZEY+C9abKGNANThMZDQlSXnCbi/4KX5tD/DtI=;
        b=RxNUfbyQDj9ftd0UUEgJfrbW/OioCYEzHeiMP7xKb3mfUYE4c1oKMwEh+0/FXhapsJ
         Uq1o3MPyVBM9hI5ac/WjMmmH3KDGhdzAPr1eezSloFvZMTh8Nuo82oz3d1KKxfz5WS/i
         HzSuQ3sC7Uu7m5Y7AvYHRVO3LEt/mj4AIWMYr4xpHtKa1TS6A+4l3HNrGYPE1xhJBJKI
         FHM07TedSG0ygSDuYlrYMPigGrgMSlnliB006lTBOF1icpr/JHwTLJEshykPi5zo8+os
         38vL8F7zPz1jCbQb19br1ZUqZA5pQ9VzuwKi+Vj0b7BWeMKLNiktW9r9C6RBsxJt2HWM
         iNXQ==
X-Gm-Message-State: AOJu0YzeyQMjd1NtklROAjqA1ZDKMNmgUKbYRaCNV4biG2mRqZ8Oilc6
	spHll7jPp2jtSN++66fxw0x4viESd8Vsh0H//J3VPceoT2X4R752LAHLIoYbkV+iuOoGemvfTA6
	ntzClUjbSLEEOpucUcAzZ6htsPGzTkpReuorZwjLkkC2Fg7VUorPkAWWeNGU8DvcADG/f
X-Gm-Gg: ASbGnctuh7PpMiyIBqDZQYh0RTRHC6MDOC9PDBxXs+o1Lnj4jPVF6ajiy9V/WRalx9g
	evs2Yqah0u9hHISOlK5uNEYf/jd+40CsKra9mDOuwylx2qdLmi15GV6ogZ8r2pcSjNJFcEUukl3
	zeI1ULK0YOhQvPQrZ3Z/i0CH1a4HAJK/MqomsHaf4ApRKpE6F6oMXgPK85ePIH8rxW8oAmXfOXi
	baKKTvAI+PHVtLOTc5xIgnFJ1yraEFa+Phe4Q3qk74ecVqWJxF+/sUYTkkaj2P68QE9oWLLOq73
	PtqKlXgPhLT5pHeZtJ5D0EVwadURgWMQw29Vg7wWqfsfPWW94miW3wluwFZn09HBo+fJSLnVauk
	S58PqTwn1fuwDDtmp1Px7I7IP0koB3LlotANNN2Cz
X-Received: by 2002:a17:903:3bcb:b0:215:bc30:c952 with SMTP id d9443c01a7336-22dbf4dc1d0mr155375275ad.6.1745853595780;
        Mon, 28 Apr 2025 08:19:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB5eA/ZTNxYCtM//3uhLUuvf4IIw2MP2Ze0TgoYN5D26Y2lavI+mPf4C+8z+8FDqNYszRWRQ==
X-Received: by 2002:a17:903:3bcb:b0:215:bc30:c952 with SMTP id d9443c01a7336-22dbf4dc1d0mr155374905ad.6.1745853595270;
        Mon, 28 Apr 2025 08:19:55 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c13sm84134515ad.162.2025.04.28.08.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:19:54 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Vignesh C <quic_vignc@quicinc.com>
Subject: [PATCH ath-next 2/2] wifi: ath12k: Split scan request for split band device
Date: Mon, 28 Apr 2025 20:49:27 +0530
Message-Id: <20250428151927.1169783-3-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428151927.1169783-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250428151927.1169783-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FBx3CP6OQMuQgnyJaxgCLonnLEY0SpiL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEyNSBTYWx0ZWRfX2hVapZs3DKCY ICIpNeV3DnUbnuwbJYoTHA7bG0h9Az3oOvIstSjvAEteE1XzlTvb5KOiFKKdjfoytG3uLBFlwFa +9j+tYqjBmTkSYBZJLQnqnIB2ZRryxbwA4513nq0wfILhSrN56q3euTR25C9lZmcYoF2y3LjMcC
 0GdOII1G66ZZiMZIBoHHCXs4W2lrI/jvMD3o7Fgdd/umZzptF2gWTdG0YmJ85qEqZZLBFHu499v TCo/WYo0WicNuUAkiOBewgfGWdVuMi1h7z+hL136JZo0SFf6X5xZP7Q38e3ccBYQSAN8bFoeSh8 aL51KF70yvlbw5wjiheaOG0eu3mt/1M1kkMa+oDZdVbWrz2s8hCBfb9DH62r7ZtlTX4vV6+IYeC
 j5wSvm8fWqO15zl3nF5XyXULwE5AtfHtYpZoa3lM3DZxGNI+/BrBY4dEDfmWxrVAw5nYSLUS
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680f9c9d cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=BBq-wa7h3OHIyVUFt-wA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FBx3CP6OQMuQgnyJaxgCLonnLEY0SpiL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_081957_605912_B2813928 
X-CRM114-Status: GOOD (  29.34  )
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
both  5 GHz low and 5 GHz high, mac80211 generates a single scan request
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
---
 drivers/net/wireless/ath/ath12k/core.h |   2 -
 drivers/net/wireless/ath/ath12k/mac.c  | 148 ++++++++++++++++++++-----
 2 files changed, 118 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 0d512818ee96..c8fd0b29aaa1 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -353,8 +353,6 @@ struct ath12k_vif {
 	struct ath12k_vif_cache *cache[IEEE80211_MLD_MAX_NUM_LINKS];
 	/* indicates bitmap of link vif created in FW */
 	u32 links_map;
-	u8 last_scan_link;
-
 	/* Must be last - ends in a flexible-array member.
 	 *
 	 * FIXME: Driver should not copy struct ieee80211_chanctx_conf,
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 6dab2f3a9e0d..236e3ee22d4d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4249,6 +4249,23 @@ static void ath12k_scan_timeout_work(struct work_struct *work)
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
@@ -4287,7 +4304,7 @@ static void ath12k_scan_vdev_clean_work(struct wiphy *wiphy, struct wiphy_work *
 				    ATH12K_SCAN_STARTING)),
 		};
 
-		ieee80211_scan_completed(ar->ah->hw, &info);
+		ath12k_mac_scan_send_complete(ar, &info);
 	}
 
 	ar->scan.state = ATH12K_SCAN_IDLE;
@@ -4506,12 +4523,14 @@ ath12k_mac_find_link_id_by_ar(struct ath12k_vif *ahvif, struct ath12k *ar)
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
@@ -4525,13 +4544,6 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 
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
@@ -4634,8 +4646,8 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 		arg->scan_f_passive = 1;
 	}
 
-	if (req->n_channels) {
-		arg->num_chan = req->n_channels;
+	if (n_channels) {
+		arg->num_chan = n_channels;
 		arg->chan_list = kcalloc(arg->num_chan, sizeof(*arg->chan_list),
 					 GFP_KERNEL);
 		if (!arg->chan_list) {
@@ -4644,7 +4656,7 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 		}
 
 		for (i = 0; i < arg->num_chan; i++)
-			arg->chan_list[i] = req->channels[i]->center_freq;
+			arg->chan_list[i] = chan_list[i]->center_freq;
 	}
 
 	ret = ath12k_start_scan(ar, arg);
@@ -4662,13 +4674,6 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 
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
@@ -4689,25 +4694,108 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
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
@@ -8917,7 +9005,7 @@ static void ath12k_mac_op_remove_interface(struct ieee80211_hw *hw,
 					.aborted = true,
 				};
 
-				ieee80211_scan_completed(ar->ah->hw, &info);
+				ath12k_mac_scan_send_complete(ar, &info);
 			}
 
 			ar->scan.state = ATH12K_SCAN_IDLE;
-- 
2.34.1


