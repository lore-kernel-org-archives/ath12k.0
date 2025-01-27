Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F74C0218A
	for <ath12k@archiver.kernel.org>; Mon, 27 Jan 2025 17:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnwPHaAP2r9TWS3/Hq3ojIy3J1a5iwPeNI3adWR5StI=; b=DQpHtQuZmJZjxuqdWUIHNMxz5L
	X5ncp8Id2YuflNshkwl/B7fz3aIdORSMa34pfNUmcIhf3rrx/u0U1B6OzBbsj2hs4RkVIkya3Xe1Q
	l3At/tC5m73ULkDY5uNbpHuPQc9V2mh08ArbDem7AkINCBH9jW6YueydzozSCBYEi5a4eVQOCKWQM
	EobLLmzyexOeOQ0w3nQpge3Wn7pKvZHLGyOWLyzFELqRGpjVB0MVq0IHosOvGyP1FK570000zCTLZ
	Cbe48nILdKE5GbJdzM20w3kB30c6XU+Wggc2Jj6Y2SJ+SNR1wEg/5i54zJyaEJQqsxFA4JNKw1UqJ
	06QnifBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcSog-00000002sBb-2PTe
	for ath12k@archiver.kernel.org;
	Mon, 27 Jan 2025 17:22:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcSoe-00000002sAL-2Ub4
	for ath12k@lists.infradead.org;
	Mon, 27 Jan 2025 17:22:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RCidnX009469
	for <ath12k@lists.infradead.org>; Mon, 27 Jan 2025 17:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZnwPHaAP2r9
	TWS3/Hq3ojIy3J1a5iwPeNI3adWR5StI=; b=cktkEx4l2kx30bk1q2FYPVLCTxN
	LYQe5ntrmt4shy/GXw5UbmiVtNE4UgvtEeiCR8L3035fUHZFFxdtgwfOgKGLwU9B
	8DcK3uU4FIXDFhATBe6T7FCmUnrwmV+U5Xh7UFVg4fieCuGnj/1EAgOvXciwfdNA
	R+w2+ab2xNa6Lr6gcaflth6hYzot4RK3Z5yYKBoEhdlfOm7wey5CLAcr1wa47YZP
	qgnYsD35osyAH9dlhPMzNCgl3IY0nLz9GqVpj+k+7RVvuqF1boxTXpupmAjuJ1gg
	tPvCoubJOVy1jSFuizy9tA06SD7f22CWYR+9W7yaIvNys/IBcrn0HM2ZvbQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44eadvrk84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Jan 2025 17:22:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2162f80040aso82529545ad.1
        for <ath12k@lists.infradead.org>; Mon, 27 Jan 2025 09:22:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737998546; x=1738603346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnwPHaAP2r9TWS3/Hq3ojIy3J1a5iwPeNI3adWR5StI=;
        b=sEU563SeSAKNvvgzNj4NRKFU9fGSKzd8ELuM1+85p/ispDqD0ZCH0m811w9ZfsD7hv
         PXVlTMLIp0Fri0cA2x4Sjc+7TsX870Uf2w0MdECr41N/0XekOdPODs/o2BICO7kTefin
         g87U1Xslcik6syiJ0Vr1XA2FDSiZ2ByD0vTsC0DXv7dO2nFBEPnN3XQvGaXxrE9hpzKY
         ZLRZPdi9MWdzzVD/Tb02vLoCvV1+7gvKxOv5ywZ2mHxtQ64vmj9AHPCC2WgqLhXsgxqW
         PLM8MgRojbUTq6owCvBBKdSV3tHfOHtyaETjdzOCFaXNjV5aW176fcwqSoqbs3SzPIHe
         eydg==
X-Gm-Message-State: AOJu0YxSFLq6fKZs3fHPniVbDc7zhBATWptYnEEPnDeH2g4qzLYkPD2N
	o9A2BYFlUCR60owNwagyD0thxE7GIybKc5FF5IS1c7f5c9l1UnVbNc6FMHtopiaheyLip05freG
	2y1MpLL8zFKGgmqcspw5iudMz/BvYWEd9qCd8qTBQZiahTYxBl4Jdh/J1OiBIy1VsU/JC
X-Gm-Gg: ASbGnctGILDZRXCBZKP5cc4YijEeG04o5O0+Bu8Tm/RxvgffhP6CBTE5MoOii1luTBQ
	RnRdenuaBykEtvtHtULx5Ck3u3awdTZK3Ikhld4cTHNHCdoCnLfWj453Jy4iyOQeOyzQ9q+ifx4
	add4VbecIidjyZ7wqj5nLp7XHMGrkwKt+eyT3KgZ4rx8LxJ18AAn9OnLEG3hRPXo/rtOPRlxe0b
	K7liVRBCDp0UZsrwqETGWzoOSWmvAtD9RewPC4aTTXYG41OOmzkl/PcK6C6fvTPRmcZHZiSoaAz
	KBr1O2PQvxP09DQrE7c4BV9zQzx0jwPpDdTy70jB4ZtBab1f4NxBngqg4pdJ6UfZ2WWUnpSryTr
	BgEgqdjZUFLgaesJ0roWOHiNWtR54QbIgKg==
X-Received: by 2002:a05:6a20:841c:b0:1e0:d9a0:4ff7 with SMTP id adf61e73a8af0-1eb21599eecmr79368781637.32.1737998546091;
        Mon, 27 Jan 2025 09:22:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdzq4Vt7MMNk3AD7SlnNop+TuN7ee9FwN4ArVllGpYZ8aw/1rUktfYpRREbnCZERBE4ODNfQ==
X-Received: by 2002:a05:6a20:841c:b0:1e0:d9a0:4ff7 with SMTP id adf61e73a8af0-1eb21599eecmr79368707637.32.1737998545544;
        Mon, 27 Jan 2025 09:22:25 -0800 (PST)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b2c07sm7464639b3a.40.2025.01.27.09.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 09:22:25 -0800 (PST)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH 2/2] wifi: ath12k: add get_txpower mac ops
Date: Mon, 27 Jan 2025 22:52:02 +0530
Message-Id: <20250127172202.1410429-3-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250127172202.1410429-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250127172202.1410429-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EWIgklLUGLN56Mf8FJnWwtJErg3Z1wnn
X-Proofpoint-GUID: EWIgklLUGLN56Mf8FJnWwtJErg3Z1wnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_08,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_092228_783329_CC97E466 
X-CRM114-Status: GOOD (  27.11  )
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

From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Driver does not support get_txpower mac ops because of which
cfg80211 returns vif->bss_conf.txpower to user space. bss_conf.txpower
gets its value from ieee80211_channel->max_reg_power. However, the final
txpower is dependent on few other parameters apart from max regulatory
supported power. It is the firmware which knows about all these
parameters and considers the minimum for each packet transmission.

All ath12k firmware reports the final TX power in firmware pdev stats
which falls under fw_stats. add get_txpower mac ops to get the TX power
from firmware leveraging fw_stats and return it accordingly.

While at it, there is a possibility that repeated stats request WMI
commands are queued to FW if mac80211/userspace does get tx power back
to back(in Multiple BSS cases). This could potentially consume the WMI
queue completely. Hence limit this by fetching the power only for every
5 seconds and reusing the value until the refresh timeout or when there
is a change in channel.

Also remove init_completion(&ar->fw_stats_complete) in
ath12k_mac_hw_register() as ath12k_fw_stats_init() takes care of
it for each ar.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |   1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 155 +++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/mac.h  |   3 +
 3 files changed, 123 insertions(+), 36 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index e4f51ad6a59f..42da19870713 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -731,6 +731,7 @@ struct ath12k {
 	u32 mlo_setup_status;
 	u8 ftm_msgref;
 	struct ath12k_fw_stats fw_stats;
+	unsigned long last_tx_power_update;
 };
 
 struct ath12k_hw {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4fb7e235be66..54fe3a2c9c0b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4280,6 +4280,120 @@ static int ath12k_start_scan(struct ath12k *ar,
 	return 0;
 }
 
+static int ath12k_mac_get_fw_stats(struct ath12k *ar, u32 pdev_id,
+				   u32 vdev_id, u32 stats_id)
+{
+	struct ath12k_base *ab = ar->ab;
+	struct ath12k_hw *ah = ath12k_ar_to_ah(ar);
+	unsigned long time_left;
+	int ret;
+
+	guard(mutex)(&ah->hw_mutex);
+
+	if (ah->state != ATH12K_HW_STATE_ON)
+		return -ENETDOWN;
+
+	spin_lock_bh(&ar->data_lock);
+	ar->fw_stats.fw_stats_done = false;
+	ath12k_fw_stats_free(&ar->fw_stats);
+	spin_unlock_bh(&ar->data_lock);
+
+	reinit_completion(&ar->fw_stats_complete);
+
+	ret = ath12k_wmi_send_stats_request_cmd(ar, stats_id, vdev_id, pdev_id);
+
+	if (ret) {
+		ath12k_warn(ab, "failed to request fw stats: stats id %u ret %d\n",
+			    stats_id, ret);
+		return ret;
+	}
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI,
+		   "get fw stat pdev id %d vdev id %d stats id 0x%x\n",
+		   pdev_id, vdev_id, stats_id);
+
+	time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
+
+	if (!time_left)
+		ath12k_warn(ab, "time out while waiting for get fw stats\n");
+
+	return ret;
+}
+
+static int ath12k_mac_op_get_txpower(struct ieee80211_hw *hw,
+				     struct ieee80211_vif *vif,
+				     unsigned int link_id,
+				     int *dbm)
+{
+	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ath12k_fw_stats_pdev *pdev;
+	struct ath12k_hw *ah = hw->priv;
+	struct ath12k_link_vif *arvif;
+	struct ath12k_base *ab;
+	struct ath12k *ar;
+	int ret;
+
+	/* Final Tx power is minimum of Target Power, CTL power, Regulatory
+	 * Power, PSD EIRP Power. We just know the Regulatory power from the
+	 * regulatory rules obtained. FW knows all these power and sets the min
+	 * of these. Hence, we request the FW pdev stats in which FW reports
+	 * the minimum of all vdev's channel Tx power.
+	 */
+	lockdep_assert_wiphy(hw->wiphy);
+
+	arvif = wiphy_dereference(ah->hw->wiphy, ahvif->link[link_id]);
+	if (!arvif || !arvif->ar)
+		return -EINVAL;
+
+	ar = arvif->ar;
+	ab = ar->ab;
+	if (ah->state != ATH12K_HW_STATE_ON)
+		goto err_fallback;
+
+	if (test_bit(ATH12K_FLAG_CAC_RUNNING, &ar->dev_flags))
+		return -EAGAIN;
+
+	/* Limit the requests to Firmware for fetching the tx power */
+	if (ar->chan_tx_pwr != ATH12K_PDEV_TX_POWER_INVALID &&
+	    time_before(jiffies,
+			msecs_to_jiffies(ATH12K_PDEV_TX_POWER_REFRESH_TIME_MSECS) +
+					 ar->last_tx_power_update))
+		goto send_tx_power;
+
+	ret = ath12k_mac_get_fw_stats(ar, ar->pdev->pdev_id, arvif->vdev_id,
+				      WMI_REQUEST_PDEV_STAT);
+	if (ret) {
+		ath12k_warn(ab, "failed to request fw pdev stats: %d\n", ret);
+		goto err_fallback;
+	}
+
+	spin_lock_bh(&ar->data_lock);
+	pdev = list_first_entry_or_null(&ar->fw_stats.pdevs,
+					struct ath12k_fw_stats_pdev, list);
+	if (!pdev) {
+		spin_unlock_bh(&ar->data_lock);
+		goto err_fallback;
+	}
+
+	ar->chan_tx_pwr = pdev->chan_tx_power;
+	spin_unlock_bh(&ar->data_lock);
+	ar->last_tx_power_update = jiffies;
+
+send_tx_power:
+	/* tx power reported by firmware is in units of 0.5 dBm */
+	*dbm = ar->chan_tx_pwr / 2;
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "txpower from firmware %d, reported %d dBm\n",
+		   ar->chan_tx_pwr, *dbm);
+	return 0;
+
+err_fallback:
+	/* We didn't get txpower from FW. Hence, relying on vif->bss_conf.txpower */
+	*dbm = vif->bss_conf.txpower;
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "txpower from firmware NaN, reported %d dBm\n",
+		   *dbm);
+	return 0;
+}
+
 static u8
 ath12k_mac_find_link_id_by_ar(struct ath12k_vif *ahvif, struct ath12k *ar)
 {
@@ -7433,6 +7547,7 @@ static int ath12k_mac_start(struct ath12k *ar)
 	ar->num_created_vdevs = 0;
 	ar->num_peers = 0;
 	ar->allocated_vdev_map = 0;
+	ar->chan_tx_pwr = ATH12K_PDEV_TX_POWER_INVALID;
 
 	/* Configure monitor status ring with default rx_filter to get rx status
 	 * such as rssi, rx_duration.
@@ -8638,6 +8753,7 @@ static int ath12k_mac_op_add_chanctx(struct ieee80211_hw *hw,
 	 */
 	ar->rx_channel = ctx->def.chan;
 	spin_unlock_bh(&ar->data_lock);
+	ar->chan_tx_pwr = ATH12K_PDEV_TX_POWER_INVALID;
 
 	return 0;
 }
@@ -8666,6 +8782,7 @@ static void ath12k_mac_op_remove_chanctx(struct ieee80211_hw *hw,
 	 */
 	ar->rx_channel = NULL;
 	spin_unlock_bh(&ar->data_lock);
+	ar->chan_tx_pwr = ATH12K_PDEV_TX_POWER_INVALID;
 }
 
 static enum wmi_phy_mode
@@ -10109,40 +10226,6 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 	return 0;
 }
 
-static int ath12k_mac_get_fw_stats(struct ath12k *ar, u32 pdev_id,
-				   u32 vdev_id, u32 stats_id)
-{
-	struct ath12k_base *ab = ar->ab;
-	struct ath12k_hw *ah = ath12k_ar_to_ah(ar);
-	unsigned long time_left;
-	int ret;
-
-	guard(mutex)(&ah->hw_mutex);
-
-	if (ah->state != ATH12K_HW_STATE_ON)
-		return -ENETDOWN;
-
-	reinit_completion(&ar->fw_stats_complete);
-
-	ret = ath12k_wmi_send_stats_request_cmd(ar, stats_id, vdev_id, pdev_id);
-
-	if (ret) {
-		ath12k_warn(ab, "failed to request fw stats: %d\n", ret);
-		return ret;
-	}
-
-	ath12k_dbg(ab, ATH12K_DBG_WMI,
-		   "get fw stat pdev id %d vdev id %d stats id 0x%x\n",
-		   pdev_id, vdev_id, stats_id);
-
-	time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
-
-	if (!time_left)
-		ath12k_warn(ab, "time out while waiting for get fw stats\n");
-
-	return ret;
-}
-
 static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 					 struct ieee80211_vif *vif,
 					 struct ieee80211_sta *sta,
@@ -10431,6 +10514,7 @@ static const struct ieee80211_ops ath12k_ops = {
 	.assign_vif_chanctx		= ath12k_mac_op_assign_vif_chanctx,
 	.unassign_vif_chanctx		= ath12k_mac_op_unassign_vif_chanctx,
 	.switch_vif_chanctx		= ath12k_mac_op_switch_vif_chanctx,
+	.get_txpower			= ath12k_mac_op_get_txpower,
 	.set_rts_threshold		= ath12k_mac_op_set_rts_threshold,
 	.set_frag_threshold		= ath12k_mac_op_set_frag_threshold,
 	.set_bitrate_mask		= ath12k_mac_op_set_bitrate_mask,
@@ -11178,11 +11262,10 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 			goto err_unregister_hw;
 		}
 
+		ath12k_fw_stats_init(ar);
 		ath12k_debugfs_register(ar);
 	}
 
-	init_completion(&ar->fw_stats_complete);
-
 	return 0;
 
 err_unregister_hw:
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 1acaf3f68292..af0d3c6a2a6c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -33,6 +33,9 @@ struct ath12k_generic_iter {
 #define ATH12K_KEEPALIVE_MAX_IDLE		3895
 #define ATH12K_KEEPALIVE_MAX_UNRESPONSIVE	3900
 
+#define ATH12K_PDEV_TX_POWER_INVALID		(-1)
+#define ATH12K_PDEV_TX_POWER_REFRESH_TIME_MSECS	5000 /* msecs */
+
 /* FIXME: should these be in ieee80211.h? */
 #define IEEE80211_VHT_MCS_SUPPORT_0_11_MASK	GENMASK(23, 16)
 #define IEEE80211_DISABLE_VHT_MCS_SUPPORT_0_11	BIT(24)
-- 
2.34.1


