Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EE9C0218F
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 19:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9GNOAkE6eL6bowCQbZVe3GXyZFPeLl6kYmRQN9+Q4w=; b=NNie1j0f8nX7FkngJ1PDMm+P1x
	5LdyBFiuhMbMI46+k+kkbffxrieL9HDkY4O9QL0yCzwFsZzHqJe/VosNYJGQqEiYQJmcLDmd+6/1S
	IpYasCEfsTNaGUjsof0QNGxA8s7BajhU6cyQilBf5gACTQvlOsfuGT+ev8EmII8vTTXAbGrlhpI8O
	zPZvKiIcfiTI0WDfKhJVV0J09pKmdspZjxtXTf3ol7v/2hiY6HHDSz2Pn+Ec9HeptFfeVj8mK20tf
	/Nyjl9LexSpkDTi77P994ZMoN4RV/1WYfC4edtSMAqQlo0LUSVdsiWG52UsFunHrPvOcGh6vgR+RL
	9ZlY5SJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwpm-0000000BIpw-09sO
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 19:37:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwpi-0000000BIoX-39uE
	for ath12k@lists.infradead.org;
	Fri, 31 Jan 2025 19:37:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VDKclU005807
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 19:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o9GNOAkE6eL
	6bowCQbZVe3GXyZFPeLl6kYmRQN9+Q4w=; b=WH/5HSY22Clszo3pCefVSRBJvVe
	8PvMHCH4f86lReEb1t2wcyJ+LyHB8x5YUFDMFp4tIF4s9s0DIiWq+eFSpTle72f0
	Y8kq1zCCFDydKFlFuhU7u4Y2e36AUCujG6CM/fubQhuU7dgfZlACslTW4MtvC2So
	cqFNCRrpbBERowrUrLi+ueJQ9Ao/1pEhssFRnvpGz91853K2vf+y65oi6xCgmum0
	YGmeteKkhvWO49+t0blrW2ofQ8MaoWrZehGZnDBPqfu89VR9F5a4//JXBpFOtzCm
	KtOyRFYChuXe+7cLkjDLM1PNalK0Uw9kfnsbcE3/ou3El79xGSUIgvCqtqQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gyaqrvhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 19:37:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2165433e229so50315165ad.1
        for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 11:37:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738352260; x=1738957060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9GNOAkE6eL6bowCQbZVe3GXyZFPeLl6kYmRQN9+Q4w=;
        b=WEpcjQKgTHsbzmLz60GwrFOS0HZr1U5vWeLIb1smM8uYmdDPYWTbKmigxkM75MCE2w
         46NPtXCvqJqxmB2xyF7nY2vndOm0ORjYFHZ8oa680HVTFJq/rj4sTSO/KhjhR3J0yQPm
         VsJ/kVqfXMbLFPxIzKOJhL2K21c9W4Pr/9aftfQ+84CBAsnP3Wu27YI7IxvRXDHKJvbd
         UyA4Qb5FpXUV5Ja6yfu3Hfcjpk7XUGcT4RZe8o8AP0JG+JR2H5G++244meMOlP2HpLRm
         GWfaz1ysrclbXaJibbgKtW9r1Lub0oh19NFywmhuwaajPM+80CIhe/idsL42h+601EVd
         8okg==
X-Gm-Message-State: AOJu0YzG2NQmzjwr2BUbSpZrRPv5gIotSpj9JlFUMWYFq0Q0nVHjQbuQ
	kU/n91rSKiJkLXMpMNzWuWyU3W6exDch7PkvxQdvmW+5wWWhQrs833ngjSFqULwoRUvYrtW3ou+
	nwOYgfZihUsnhX1qFiL0RLLUKMASoJwoASfw+dEGYuotaB4MYmpk9dT6cMPxckCvX3cNo
X-Gm-Gg: ASbGncsRF+3xQ+0X93I5ERd8cecuxq67fUNipeNqt3UV/P0AVrP1y5pR5jQ9u7EoMxz
	gAge49SPkG64ql8vYB1zq9zaIQq3yDw0SXQ61uxnZmnBTj1Gek0CX6JqB7zmWWeRfG4nla99DfG
	rx/f9+bWJ2GO5ja+zHYdgTVfqxVbWljek+j79jhEzYxO3d2SghFuA9gp1wWhkMQ8gGX6yJVMFUW
	+UGErHzJESEzmIp9WukU8Hflz/45ewTMLo2u4cbqO5J/pauf2OXP2BX51YhJexKDJMeqyNwNlJb
	D+SQxl5gkb2RGeml7BEJRjGHtlJvTNrzq6o6upa15zOsUtArXerEXMXYNTxuv7Tc3HrDjz4vvBF
	w0LXGSTNxk4BYgTA2vu05FlCRuQ1qb7+BaA==
X-Received: by 2002:a17:903:41c3:b0:215:8809:b3b7 with SMTP id d9443c01a7336-21dd7c4e56amr167565335ad.7.1738352260072;
        Fri, 31 Jan 2025 11:37:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsNhJdYwpVGxr7gZe/JpH+zcfYROCM5zmLxZA9xPuW//dr1Y16PsVWRm56XIAfkJpTQlTwYA==
X-Received: by 2002:a17:903:41c3:b0:215:8809:b3b7 with SMTP id d9443c01a7336-21dd7c4e56amr167565035ad.7.1738352259572;
        Fri, 31 Jan 2025 11:37:39 -0800 (PST)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848acac43sm4019271a91.40.2025.01.31.11.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 11:37:39 -0800 (PST)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH v2 2/2] wifi: ath12k: add get_txpower mac ops
Date: Sat,  1 Feb 2025 01:07:26 +0530
Message-Id: <20250131193726.3568086-3-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131193726.3568086-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250131193726.3568086-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: M7YWrkNBnh1rq9PSuv8df1Gg5kR2q6XI
X-Proofpoint-GUID: M7YWrkNBnh1rq9PSuv8df1Gg5kR2q6XI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_113742_918319_FF79A6C2 
X-CRM114-Status: GOOD (  31.26  )
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
 drivers/net/wireless/ath/ath12k/mac.c  | 208 +++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/mac.h  |   3 +
 3 files changed, 148 insertions(+), 64 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 373e7baf379b..d278e4a8bb08 100644
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
index 8cd33ea75590..efab885bdbb1 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4280,6 +4280,145 @@ static int ath12k_start_scan(struct ath12k *ar,
 	return 0;
 }
 
+int ath12k_mac_get_fw_stats(struct ath12k *ar,
+			    struct ath12k_fw_stats_req_params *param)
+{
+	struct ath12k_base *ab = ar->ab;
+	struct ath12k_hw *ah = ath12k_ar_to_ah(ar);
+	unsigned long timeout, time_left;
+	int ret;
+
+	guard(mutex)(&ah->hw_mutex);
+
+	if (ah->state != ATH12K_HW_STATE_ON)
+		return -ENETDOWN;
+
+	/* FW stats can get split when exceeding the stats data buffer limit.
+	 * In that case, since there is no end marking for the back-to-back
+	 * received 'update stats' event, we keep a 3 seconds timeout in case,
+	 * fw_stats_done is not marked yet
+	 */
+	timeout = jiffies + msecs_to_jiffies(3 * 1000);
+	ath12k_fw_stats_reset(ar);
+
+	reinit_completion(&ar->fw_stats_complete);
+
+	ret = ath12k_wmi_send_stats_request_cmd(ar, param->stats_id,
+						param->vdev_id, param->pdev_id);
+
+	if (ret) {
+		ath12k_warn(ab, "failed to request fw stats: %d\n", ret);
+		return ret;
+	}
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI,
+		   "get fw stat pdev id %d vdev id %d stats id 0x%x\n",
+		   param->pdev_id, param->vdev_id, param->stats_id);
+
+	time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
+
+	if (!time_left) {
+		ath12k_warn(ab, "time out while waiting for get fw stats\n");
+		return -ETIMEDOUT;
+	}
+
+	/* Firmware sends WMI_UPDATE_STATS_EVENTID back-to-back
+	 * when stats data buffer limit is reached. fw_stats_complete
+	 * is completed once host receives first event from firmware, but
+	 * still end might not be marked in the TLV.
+	 * Below loop is to confirm that firmware completed sending all the event
+	 * and fw_stats_done is marked true when end is marked in the TLV.
+	 */
+	for (;;) {
+		if (time_after(jiffies, timeout))
+			break;
+		spin_lock_bh(&ar->data_lock);
+		if (ar->fw_stats.fw_stats_done) {
+			spin_unlock_bh(&ar->data_lock);
+			break;
+		}
+		spin_unlock_bh(&ar->data_lock);
+	}
+	return 0;
+}
+
+static int ath12k_mac_op_get_txpower(struct ieee80211_hw *hw,
+				     struct ieee80211_vif *vif,
+				     unsigned int link_id,
+				     int *dbm)
+{
+	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ath12k_fw_stats_req_params params = {};
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
+	params.pdev_id = ar->pdev->pdev_id;
+	params.vdev_id = arvif->vdev_id;
+	params.stats_id = WMI_REQUEST_PDEV_STAT;
+	ret = ath12k_mac_get_fw_stats(ar, &params);
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
+	/* tx power reported by firmware is in units of 0.5 dBm */
+	ar->chan_tx_pwr = pdev->chan_tx_power / 2;
+	spin_unlock_bh(&ar->data_lock);
+	ar->last_tx_power_update = jiffies;
+
+send_tx_power:
+	*dbm = ar->chan_tx_pwr;
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "txpower fetched from firmware %d dBm\n",
+		   *dbm);
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
@@ -7433,6 +7572,7 @@ static int ath12k_mac_start(struct ath12k *ar)
 	ar->num_created_vdevs = 0;
 	ar->num_peers = 0;
 	ar->allocated_vdev_map = 0;
+	ar->chan_tx_pwr = ATH12K_PDEV_TX_POWER_INVALID;
 
 	/* Configure monitor status ring with default rx_filter to get rx status
 	 * such as rssi, rx_duration.
@@ -8638,6 +8778,7 @@ static int ath12k_mac_op_add_chanctx(struct ieee80211_hw *hw,
 	 */
 	ar->rx_channel = ctx->def.chan;
 	spin_unlock_bh(&ar->data_lock);
+	ar->chan_tx_pwr = ATH12K_PDEV_TX_POWER_INVALID;
 
 	return 0;
 }
@@ -8666,6 +8807,7 @@ static void ath12k_mac_op_remove_chanctx(struct ieee80211_hw *hw,
 	 */
 	ar->rx_channel = NULL;
 	spin_unlock_bh(&ar->data_lock);
+	ar->chan_tx_pwr = ATH12K_PDEV_TX_POWER_INVALID;
 }
 
 static enum wmi_phy_mode
@@ -10109,68 +10251,6 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 	return 0;
 }
 
-int ath12k_mac_get_fw_stats(struct ath12k *ar,
-			    struct ath12k_fw_stats_req_params *param)
-{
-	struct ath12k_base *ab = ar->ab;
-	struct ath12k_hw *ah = ath12k_ar_to_ah(ar);
-	unsigned long timeout, time_left;
-	int ret;
-
-	guard(mutex)(&ah->hw_mutex);
-
-	if (ah->state != ATH12K_HW_STATE_ON)
-		return -ENETDOWN;
-
-	/* FW stats can get split when exceeding the stats data buffer limit.
-	 * In that case, since there is no end marking for the back-to-back
-	 * received 'update stats' event, we keep a 3 seconds timeout in case,
-	 * fw_stats_done is not marked yet
-	 */
-	timeout = jiffies + msecs_to_jiffies(3 * 1000);
-	ath12k_fw_stats_reset(ar);
-
-	reinit_completion(&ar->fw_stats_complete);
-
-	ret = ath12k_wmi_send_stats_request_cmd(ar, param->stats_id,
-						param->vdev_id, param->pdev_id);
-
-	if (ret) {
-		ath12k_warn(ab, "failed to request fw stats: %d\n", ret);
-		return ret;
-	}
-
-	ath12k_dbg(ab, ATH12K_DBG_WMI,
-		   "get fw stat pdev id %d vdev id %d stats id 0x%x\n",
-		   param->pdev_id, param->vdev_id, param->stats_id);
-
-	time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
-
-	if (!time_left) {
-		ath12k_warn(ab, "time out while waiting for get fw stats\n");
-		return -ETIMEDOUT;
-	}
-
-	/* Firmware sends WMI_UPDATE_STATS_EVENTID back-to-back
-	 * when stats data buffer limit is reached. fw_stats_complete
-	 * is completed once host receives first event from firmware, but
-	 * still end might not be marked in the TLV.
-	 * Below loop is to confirm that firmware completed sending all the event
-	 * and fw_stats_done is marked true when end is marked in the TLV.
-	 */
-	for (;;) {
-		if (time_after(jiffies, timeout))
-			break;
-		spin_lock_bh(&ar->data_lock);
-		if (ar->fw_stats.fw_stats_done) {
-			spin_unlock_bh(&ar->data_lock);
-			break;
-		}
-		spin_unlock_bh(&ar->data_lock);
-	}
-	return 0;
-}
-
 static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 					 struct ieee80211_vif *vif,
 					 struct ieee80211_sta *sta,
@@ -10463,6 +10543,7 @@ static const struct ieee80211_ops ath12k_ops = {
 	.assign_vif_chanctx		= ath12k_mac_op_assign_vif_chanctx,
 	.unassign_vif_chanctx		= ath12k_mac_op_unassign_vif_chanctx,
 	.switch_vif_chanctx		= ath12k_mac_op_switch_vif_chanctx,
+	.get_txpower			= ath12k_mac_op_get_txpower,
 	.set_rts_threshold		= ath12k_mac_op_set_rts_threshold,
 	.set_frag_threshold		= ath12k_mac_op_set_frag_threshold,
 	.set_bitrate_mask		= ath12k_mac_op_set_bitrate_mask,
@@ -11210,11 +11291,10 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
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
index a0de0ddf175e..8435bdea904f 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -33,6 +33,9 @@ struct ath12k_generic_iter {
 #define ATH12K_KEEPALIVE_MAX_IDLE		3895
 #define ATH12K_KEEPALIVE_MAX_UNRESPONSIVE	3900
 
+#define ATH12K_PDEV_TX_POWER_INVALID		((u32)-1)
+#define ATH12K_PDEV_TX_POWER_REFRESH_TIME_MSECS	5000 /* msecs */
+
 /* FIXME: should these be in ieee80211.h? */
 #define IEEE80211_VHT_MCS_SUPPORT_0_11_MASK	GENMASK(23, 16)
 #define IEEE80211_DISABLE_VHT_MCS_SUPPORT_0_11	BIT(24)
-- 
2.34.1


