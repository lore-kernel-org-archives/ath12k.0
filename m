Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16978C282D1
	for <ath12k@archiver.kernel.org>; Thu,  6 Mar 2025 11:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bm+M08QcUsma3a9OX8W1coQMheXXA78lhDFz4xX+IF0=; b=28F8zL1Z5zGP809lxbjXPOyUPS
	/hs4DCKHN++gh/7RBaOUCu0H8dbgYFzs6cDeQYgjXvPLVHeUF6qOVIIM9TPA406ALM2YU0zIitsNr
	p18IhkagFgnGczaqqj5BeVFNUkFLiHTmx7cPPaoQozlkkocuzGW1h5HHmE27MrY323MRqQEYvKQqF
	nfzmTFLZiPkMfBiYV4FsKfkJ1m+qJC75vuFFrJdXYXIPo6k31Kqem28K2uJtA2pVfSaEd5LWCw1SA
	DE2pNMA2QKZeLO0F3tBp+3Sm1dGUjI5T1Bak6mKBBdoqmucGgKyrSPzdbaqreDW4Jg43fWVb4ukM1
	uZbE9jQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9UB-0000000AnKl-3Wco
	for ath12k@archiver.kernel.org;
	Thu, 06 Mar 2025 11:33:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8NI-0000000Adh8-0w1U
	for ath12k@bombadil.infradead.org;
	Thu, 06 Mar 2025 10:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Bm+M08QcUsma3a9OX8W1coQMheXXA78lhDFz4xX+IF0=; b=YaTPWuWltUPSHIiSVyOSD80/FI
	/aoECPjPf1WOY59RWl0YHJaIRTMxQrC52hdiJngAvkUTmwm1h4comdGfLrbFov1PmCHD0RLnu2p1a
	9rfd4bnoY3rvgj9jxbVzpeSXmmxTrv/O9rXEjCX61zkOKpk8Hov9j4uQoLBJoYv9ot8RMEpZ4BsIf
	GDtHO+xzfrSrN6CR+RuSDN/dSGp9K1p/62WPBsuOte9KwG2KwDPzkp8yQzQHRolgfDyW8vCNbSKna
	TGaF8HJp01DNu4Ilt8KMYJYF5iPhyujlfCL2qHjvh7dCWLT64+R8F/bYfesJEvkqFLYPtR0bDAEKS
	FTJDgzJw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8NE-0000000114M-3Cuh
	for ath12k@lists.infradead.org;
	Thu, 06 Mar 2025 10:22:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267uWvH028697
	for <ath12k@lists.infradead.org>; Thu, 6 Mar 2025 10:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bm+M08QcUsm
	a3a9OX8W1coQMheXXA78lhDFz4xX+IF0=; b=UxmMNGMiFrE1mjb9mi4ny8hZkqV
	ANSqqXczLxXKpPeSS9HsLhD5ZU+MRQQfRDyssLOeafhiaf2+NAxXbVarzwHI6CBI
	162gLOyt5H4mzTY6+LqfTnZYNfGs6A0W6+SVGsojaEiotlnFifRGNSse7OvYRAjg
	RdrKTF08kL+6VXe2rsQ4QkHY3XFaO+8/IxLfoebP1mWUIVYRb+25R8tED3eV+VEa
	RJxXdZJ2bQ/OtheNh8HEWLxh85lE+LEXJCbpP0nkFxOoKo9RFaV8g9/fETu2LaVH
	A78ECNLnvSJDYAk2LmW+GeJh0s7WCayeJsTXkYLOUnSvB1jSwEGkARMsnRQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577rpgdvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Mar 2025 10:22:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2feb47c6757so1117485a91.3
        for <ath12k@lists.infradead.org>; Thu, 06 Mar 2025 02:22:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741256553; x=1741861353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bm+M08QcUsma3a9OX8W1coQMheXXA78lhDFz4xX+IF0=;
        b=PQTkP/u5quz32atZW6hZyegK17sCAIY3j5w45oE77ZvxRRg54EGKfOKFSO7/klOkxF
         2kJib/BWGptBXOf5PA6hlJr176dEfja/O/nNBlBLRC+6hiubfc9NDn4iAaq2/edkTx1f
         ZL8NuRb9N1CjO1GQ2nZqVPedfeDRThmxzhBIbPgMGwswMZn4DOpMB62SgB1S9EWqDY6Y
         4e6fdidmij11EglMCZsuWSAvwKx4SWObTYQy0VG2F6nstnzCzI2F9A9vU27QNBSlGSC4
         04tm1fA8fcKY9pvyI7+54OegjbCcC/K+PGvPYbN0yQ9pxuePLPJ8zTxLke/XalZhj0Xf
         13gQ==
X-Gm-Message-State: AOJu0YwXJEA5blbvvf/X/Bsdyca7/CCnfM9u6+4NGutRvirjJ9L9GJIr
	ea5+LAYmCTkX/o+NL7Ypy6qs25xezhAxSe+KhfreWEV+XippLHWbcTRYLPZpae5oa0WzFzqNGM8
	HZHowniauzhZwm0pBckeJbYpuPBd+oqo7uSZcolLnJ1gzZiCMKYkmCOJ4GtBAzVZTCesp
X-Gm-Gg: ASbGncvDHbAFV/zsKgrp2+c8WJrVdGU5hexm6zG9inare0qX9TuNHk8ELYV9NoBda98
	f3pmjO6GgQRGVF1KVibjN3iolkkqmLKZKCJ9p2BLHCY/XJbIsxOaux9jUgYz4Yy9tWjPtqYedtv
	gqZ6upgWgYgq5dJZHbqY1DDsxsFUqMRxQf7EIehJyIG2hGmTUoQsG2FbzvTlvTDcFAb6lmMzq7v
	+JRngGSJhpXXPrbnCeluHYBkdDw17AfvYdLdoX7wmWU/Zs+vCFpfSIDrqP4oGnC9XIArN70iU6b
	TyYpBKtr4ViuhNlQcw3e9zUnQyg5F8H0FEHBqIYcVpLUGOhKaZ3bENQypYYzj/HveUSpxxsWv9s
	otydFlJ22yyyMr0CfLyeSakgGFthGHJRITz4ixViPDWMq
X-Received: by 2002:a17:90b:5288:b0:2ff:6f8a:3a12 with SMTP id 98e67ed59e1d1-2ff6f8a3b41mr1006970a91.33.1741256553092;
        Thu, 06 Mar 2025 02:22:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUgyiJTiG8ZI0LBA/cdtJE70jhhZ/ZtyuMiiMezf57AUP6o0Egi6S2BzjAO/lkaF7lVh4b1A==
X-Received: by 2002:a17:90b:5288:b0:2ff:6f8a:3a12 with SMTP id 98e67ed59e1d1-2ff6f8a3b41mr1006929a91.33.1741256552604;
        Thu, 06 Mar 2025 02:22:32 -0800 (PST)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddfa6sm8814785ad.33.2025.03.06.02.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:22:32 -0800 (PST)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Mahendran P <quic_mahep@quicinc.com>
Subject: [PATCH ath-next v3 2/2] wifi: ath12k: add get_txpower mac ops
Date: Thu,  6 Mar 2025 15:52:15 +0530
Message-Id: <20250306102215.1300522-3-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306102215.1300522-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250306102215.1300522-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EYQyQOmC c=1 sm=1 tr=0 ts=67c9776a cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=sLhe4TfMZRWB3Ch9S-IA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tQnGo9B3L-JGCBtgV55jJenZ4jcFScRJ
X-Proofpoint-GUID: tQnGo9B3L-JGCBtgV55jJenZ4jcFScRJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_102241_128777_E5DC4A1C 
X-CRM114-Status: GOOD (  30.41  )
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
Reviewed-by: Mahendran P <quic_mahep@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |   1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 208 +++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/mac.h  |   3 +
 3 files changed, 148 insertions(+), 64 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index d07b55a4dd4a..bed996919f04 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -743,6 +743,7 @@ struct ath12k {
 	u32 mlo_setup_status;
 	u8 ftm_msgref;
 	struct ath12k_fw_stats fw_stats;
+	unsigned long last_tx_power_update;
 };
 
 struct ath12k_hw {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index edd440ced9d8..9cb68a351263 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4376,6 +4376,145 @@ static int ath12k_start_scan(struct ath12k *ar,
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
@@ -7600,6 +7739,7 @@ static int ath12k_mac_start(struct ath12k *ar)
 	ar->num_created_vdevs = 0;
 	ar->num_peers = 0;
 	ar->allocated_vdev_map = 0;
+	ar->chan_tx_pwr = ATH12K_PDEV_TX_POWER_INVALID;
 
 	/* Configure monitor status ring with default rx_filter to get rx status
 	 * such as rssi, rx_duration.
@@ -8798,6 +8938,7 @@ static int ath12k_mac_op_add_chanctx(struct ieee80211_hw *hw,
 	 */
 	ar->rx_channel = ctx->def.chan;
 	spin_unlock_bh(&ar->data_lock);
+	ar->chan_tx_pwr = ATH12K_PDEV_TX_POWER_INVALID;
 
 	return 0;
 }
@@ -8826,6 +8967,7 @@ static void ath12k_mac_op_remove_chanctx(struct ieee80211_hw *hw,
 	 */
 	ar->rx_channel = NULL;
 	spin_unlock_bh(&ar->data_lock);
+	ar->chan_tx_pwr = ATH12K_PDEV_TX_POWER_INVALID;
 }
 
 static enum wmi_phy_mode
@@ -10267,68 +10409,6 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
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
@@ -10627,6 +10707,7 @@ static const struct ieee80211_ops ath12k_ops = {
 	.assign_vif_chanctx		= ath12k_mac_op_assign_vif_chanctx,
 	.unassign_vif_chanctx		= ath12k_mac_op_unassign_vif_chanctx,
 	.switch_vif_chanctx		= ath12k_mac_op_switch_vif_chanctx,
+	.get_txpower			= ath12k_mac_op_get_txpower,
 	.set_rts_threshold		= ath12k_mac_op_set_rts_threshold,
 	.set_frag_threshold		= ath12k_mac_op_set_frag_threshold,
 	.set_bitrate_mask		= ath12k_mac_op_set_bitrate_mask,
@@ -11379,11 +11460,10 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
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
index 5e88b511ff8a..468992a2f712 100644
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


