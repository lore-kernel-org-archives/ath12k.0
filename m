Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC72C47DA9
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 04:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8MLRIM0V9H4lo+2idDVirUtM8DglY576gg0Tcwx57o=; b=RvfJVAMDT82gipcdk4AGw038fX
	vPAuIIBO0rKZzNOva+d25egxijCPOZRHfKDdoXNMgr35tYebdxzqaPhFWRbAl6ToyEFhGh1FfsgQn
	wGoVyhKP1wiS6vrmapEewNRbC/Ohmj+qSvbpbPClh0f6Q3Mxlf+x8qs2gEWCiM47BkFrvBBwLEl1r
	BoR2NvQjZ46qVArywPTpt12EY+6JxDqBuw72Px2yAxPBW/JEj7N4lNS54ifdTzlPV6W2rMqQ2chFC
	GIAMLg4hD9DqaK0ar1okB9WfG2pMqKYYyiWxDLEPfBzlCO37LncqD0OPiEKpsi4nXsb3U94E76ALP
	ufUl2nvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUfLX-0000000FCM9-3mhu
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 04:03:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUfLU-0000000FCJe-3Ooo
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 04:03:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U2qMlg026070;
	Tue, 30 Jan 2024 04:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=I8MLRIM0V9H4lo+2idDVirUtM8DglY576gg0Tcwx57o=; b=PW
	C42JWEs0kXhHbX3jwwiUG+pnBnv8Eh1zGtrm0uvcwOk9Q/a+MnuSv+cAnQsysr/t
	8MpjIu3uUjgk485fAyuXESu5gsPoDsk1lCbdpLUpV1YjLt1h/xPza+eiKdUoJQXT
	QUpzDMEng9+k/xEzgI8Hd0f2GJrMwkbQY29JMmmfFTTvNN5TWnH+rToOWjvMQPUo
	E9Xv9CXRqNRGg9uL6LiNK0YO6XKWMpxGkztf+3XQYmluPjDvvP3NJdtJuxrZHrj/
	01aaRSG3u4mjGRPy4OErOtotm/2uMaxbgilDwdlh2CefMMuKGPtb92MHC6hCAj6g
	aX5tcirBvxoJjXVZfo6A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxrq084ap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 04:03:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40U43YA5005146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 04:03:34 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 29 Jan 2024 20:03:33 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v6 06/11] wifi: ath12k: implement remain on channel for P2P mode
Date: Tue, 30 Jan 2024 12:02:58 +0800
Message-ID: <20240130040303.370590-7-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130040303.370590-1-quic_kangyang@quicinc.com>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kG8EV-Ea0knMIunj2JfzBr_YBkFkIVDg
X-Proofpoint-GUID: kG8EV-Ea0knMIunj2JfzBr_YBkFkIVDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_15,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_200337_143906_89DEAB9C 
X-CRM114-Status: GOOD (  16.69  )
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

Implement remain on channel for p2p mode in ath12k_ops:
        ath12k_mac_op_remain_on_channel
        ath12k_mac_op_cancel_remain_on_channel

P2P device can trigger ROC scan. Then keep listening or sending management
frames on particular channels.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---

v6: no change.
v5: no change.
v4: no change.
v3: use ath12k_ah_to_ar() to get ar.
v2:
    1. add Tested-on tag of QCN9274.
    2. update copyright.

---
 drivers/net/wireless/ath/ath12k/core.c |   1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 119 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.c  |   4 +
 3 files changed, 124 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 1baad3302157..ffe4fd6e36f5 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -950,6 +950,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 		ath12k_mac_drain_tx(ar);
 		complete(&ar->scan.started);
 		complete(&ar->scan.completed);
+		complete(&ar->scan.on_channel);
 		complete(&ar->peer_assoc_done);
 		complete(&ar->peer_delete_done);
 		complete(&ar->install_key_done);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 0cfcf297872d..ec90a21fcd7f 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7391,6 +7391,122 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
 }
 
+static int ath12k_mac_op_cancel_remain_on_channel(struct ieee80211_hw *hw,
+						  struct ieee80211_vif *vif)
+{
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	struct ath12k *ar;
+
+	ar = ath12k_ah_to_ar(ah);
+
+	mutex_lock(&ar->conf_mutex);
+
+	spin_lock_bh(&ar->data_lock);
+	ar->scan.roc_notify = false;
+	spin_unlock_bh(&ar->data_lock);
+
+	ath12k_scan_abort(ar);
+
+	mutex_unlock(&ar->conf_mutex);
+
+	cancel_delayed_work_sync(&ar->scan.timeout);
+
+	return 0;
+}
+
+static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
+					   struct ieee80211_vif *vif,
+					   struct ieee80211_channel *chan,
+					   int duration,
+					   enum ieee80211_roc_type type)
+{
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	struct ath12k *ar;
+	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
+	struct ath12k_wmi_scan_req_arg arg;
+	int ret;
+	u32 scan_time_msec;
+
+	ar = ath12k_ah_to_ar(ah);
+
+	mutex_lock(&ar->conf_mutex);
+	spin_lock_bh(&ar->data_lock);
+	switch (ar->scan.state) {
+	case ATH12K_SCAN_IDLE:
+		reinit_completion(&ar->scan.started);
+		reinit_completion(&ar->scan.completed);
+		reinit_completion(&ar->scan.on_channel);
+		ar->scan.state = ATH12K_SCAN_STARTING;
+		ar->scan.is_roc = true;
+		ar->scan.vdev_id = arvif->vdev_id;
+		ar->scan.roc_freq = chan->center_freq;
+		ar->scan.roc_notify = true;
+		ret = 0;
+		break;
+	case ATH12K_SCAN_STARTING:
+	case ATH12K_SCAN_RUNNING:
+	case ATH12K_SCAN_ABORTING:
+		ret = -EBUSY;
+		break;
+	}
+	spin_unlock_bh(&ar->data_lock);
+
+	if (ret)
+		goto exit;
+
+	scan_time_msec = hw->wiphy->max_remain_on_channel_duration * 2;
+
+	memset(&arg, 0, sizeof(arg));
+	ath12k_wmi_start_scan_init(ar, &arg);
+	arg.num_chan = 1;
+	arg.chan_list = kcalloc(arg.num_chan, sizeof(*arg.chan_list),
+				GFP_KERNEL);
+	if (!arg.chan_list) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	arg.vdev_id = arvif->vdev_id;
+	arg.scan_id = ATH12K_SCAN_ID;
+	arg.chan_list[0] = chan->center_freq;
+	arg.dwell_time_active = scan_time_msec;
+	arg.dwell_time_passive = scan_time_msec;
+	arg.max_scan_time = scan_time_msec;
+	arg.scan_flags |= WMI_SCAN_FLAG_PASSIVE;
+	arg.burst_duration = duration;
+
+	ret = ath12k_start_scan(ar, &arg);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to start roc scan: %d\n", ret);
+
+		spin_lock_bh(&ar->data_lock);
+		ar->scan.state = ATH12K_SCAN_IDLE;
+		spin_unlock_bh(&ar->data_lock);
+		goto free_chan_list;
+	}
+
+	ret = wait_for_completion_timeout(&ar->scan.on_channel, 3 * HZ);
+	if (ret == 0) {
+		ath12k_warn(ar->ab, "failed to switch to channel for roc scan\n");
+		ret = ath12k_scan_stop(ar);
+		if (ret)
+			ath12k_warn(ar->ab, "failed to stop scan: %d\n", ret);
+		ret = -ETIMEDOUT;
+		goto free_chan_list;
+	}
+
+	ieee80211_queue_delayed_work(hw, &ar->scan.timeout,
+				     msecs_to_jiffies(duration));
+
+	ret = 0;
+
+free_chan_list:
+	kfree(arg.chan_list);
+exit:
+	mutex_unlock(&ar->conf_mutex);
+	return ret;
+}
+
 static const struct ieee80211_ops ath12k_ops = {
 	.tx				= ath12k_mac_op_tx,
 	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
@@ -7425,6 +7541,8 @@ static const struct ieee80211_ops ath12k_ops = {
 	.get_survey			= ath12k_mac_op_get_survey,
 	.flush				= ath12k_mac_op_flush,
 	.sta_statistics			= ath12k_mac_op_sta_statistics,
+	.remain_on_channel              = ath12k_mac_op_remain_on_channel,
+	.cancel_remain_on_channel       = ath12k_mac_op_cancel_remain_on_channel,
 };
 
 static void ath12k_mac_update_ch_list(struct ath12k *ar,
@@ -7952,6 +8070,7 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	init_completion(&ar->bss_survey_done);
 	init_completion(&ar->scan.started);
 	init_completion(&ar->scan.completed);
+	init_completion(&ar->scan.on_channel);
 
 	INIT_DELAYED_WORK(&ar->scan.timeout, ath12k_scan_timeout_work);
 	INIT_WORK(&ar->regd_update_work, ath12k_regd_update_work);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index cafe269f9f28..c4fe90b5ff32 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5053,6 +5053,8 @@ static void ath12k_wmi_event_scan_started(struct ath12k *ar)
 		break;
 	case ATH12K_SCAN_STARTING:
 		ar->scan.state = ATH12K_SCAN_RUNNING;
+		if (ar->scan.is_roc)
+			ieee80211_ready_on_channel(ath12k_ar_to_hw(ar));
 		complete(&ar->scan.started);
 		break;
 	}
@@ -5137,6 +5139,8 @@ static void ath12k_wmi_event_scan_foreign_chan(struct ath12k *ar, u32 freq)
 	case ATH12K_SCAN_RUNNING:
 	case ATH12K_SCAN_ABORTING:
 		ar->scan_channel = ieee80211_get_channel(hw->wiphy, freq);
+		if (ar->scan.is_roc && ar->scan.roc_freq == freq)
+			complete(&ar->scan.on_channel);
 		break;
 	}
 }
-- 
2.34.1


