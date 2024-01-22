Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2FAC47DAF
	for <ath12k@archiver.kernel.org>; Mon, 22 Jan 2024 11:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=955ENI/v172A5+QEJTHcaiyn9W+17q3OueWXK8oLj+M=; b=I+qPy1eMr5ZNG0LklzQ2ST64rl
	imVThOWhGLc1mK22FKS8NE0nR7nDuSA84ETYC33O0T8BOJUwqQxgW8SH4jbkEhNVdYTWgMPhAlMmW
	5dokgRQq7u2Hi65GkaZ2K/U+m33fCoiwiw+krBPetR57Rd1X42zoJ00vT8GNgefomsQLaCPtdRnpE
	tf/eowVM4j2LNKMyDYR/KTyGfQ/jcP4dFXfIcGj6pQZdwhoTEt9G/xAtPu5Lv6EHITfm7ZVgAht4J
	cqOCEPhLVF/35KsBRS6tzpLKVQt/+yi5hFVrDcCSQczAzAG7nVThwjR4tKc9pfuJ0JGksAT9Pj7K6
	WxuxfNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRseT-00BovW-0I
	for ath12k@archiver.kernel.org;
	Mon, 22 Jan 2024 11:39:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRseP-00Bost-1P
	for ath12k@lists.infradead.org;
	Mon, 22 Jan 2024 11:39:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M5ma7B000337;
	Mon, 22 Jan 2024 11:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=955ENI/v172A5+QEJTHcaiyn9W+17q3OueWXK8oLj+M=; b=IJ
	SKF3kn6qgLVV6j5DPNZcwP2D3KDwWlaKH4R9Zj3xwT4zL5UHVjhgAKaEdAQEojOe
	Xk0xObPdoRpYt+kvfM+4ZUNXtYU21ptozV/zKfeZqFOfvv/GzsW+GCPFSZk2MK2s
	iTfSrdRp8yWFQnj0g6fKOTwPHMyZqNbqf97llKmvU7CL7vnvmA+ei6YxR6q8/lgQ
	qwXY6rpbQkxUqPB4PilzlNWu+rqruQFGza6GRmasNX4zTpa35ejKVuZaIANYAK/p
	EIgdpHlHiUbsKfdRldbPfpcq1EQlUCsG77ERfUDmEF1evXt+f5kby/JWKKUib1DN
	ACQ8ScARDUZCmhsEsA7w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vr7bqknc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 11:39:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40MBdab9025412
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 11:39:36 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 22 Jan 2024 03:39:34 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v3 08/10] wifi: ath12k: move peer delete after vdev stop of station for WCN7850
Date: Mon, 22 Jan 2024 19:39:02 +0800
Message-ID: <20240122113904.8938-9-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122113904.8938-1-quic_kangyang@quicinc.com>
References: <20240122113904.8938-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mkHN_K2ErH6zm51LvgEBNaC4PfPFWdVF
X-Proofpoint-ORIG-GUID: mkHN_K2ErH6zm51LvgEBNaC4PfPFWdVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_02,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_033937_515387_147533FC 
X-CRM114-Status: GOOD (  14.99  )
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

In current code, when STA/P2P Client connect to AP/P2P GO, the WMI
command sequence is:

peer_create->vdev_start->vdev_up

And sequence of STA/P2P Client disconnect from AP/P2P GO is:

peer_delete->vdev_down->vdev_stop

This sequence of disconnect is not opposite of connect. For STA or P2P
GO, bss peer is not needed by firmware during handling vdev stop
command. So with this sequence, STA and P2P GO can work normally.

But for P2P Client, firmware needs bss peer in some functions during
handling vdev stop command. The opposite sequence of disconnect should
be:

vdev_down->vdev_stop->peer_delete

So change the sequence of disconnect as above opposite sequence for
WCN7850.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---

v3: no change.
v2: add Tested-on tag of QCN9274.

---
 drivers/net/wireless/ath/ath12k/mac.c | 99 +++++++++++++++------------
 1 file changed, 54 insertions(+), 45 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 65ac1d0b52a4..10aa8b20ef7a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1083,6 +1083,46 @@ static int ath12k_mac_monitor_stop(struct ath12k *ar)
 	return ret;
 }
 
+static int ath12k_mac_vdev_stop(struct ath12k_vif *arvif)
+{
+	struct ath12k *ar = arvif->ar;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	reinit_completion(&ar->vdev_setup_done);
+
+	ret = ath12k_wmi_vdev_stop(ar, arvif->vdev_id);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to stop WMI vdev %i: %d\n",
+			    arvif->vdev_id, ret);
+		goto err;
+	}
+
+	ret = ath12k_mac_vdev_setup_sync(ar);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to synchronize setup for vdev %i: %d\n",
+			    arvif->vdev_id, ret);
+		goto err;
+	}
+
+	WARN_ON(ar->num_started_vdevs == 0);
+
+	ar->num_started_vdevs--;
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "vdev %pM stopped, vdev_id %d\n",
+		   arvif->vif->addr, arvif->vdev_id);
+
+	if (test_bit(ATH12K_CAC_RUNNING, &ar->dev_flags)) {
+		clear_bit(ATH12K_CAC_RUNNING, &ar->dev_flags);
+		ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "CAC Stopped for vdev %d\n",
+			   arvif->vdev_id);
+	}
+
+	return 0;
+err:
+	return ret;
+}
+
 static int ath12k_mac_config(struct ath12k *ar, u32 changed)
 {
 	struct ieee80211_hw *hw = ath12k_ar_to_hw(ar);
@@ -3905,6 +3945,13 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 				    sta->addr, arvif->vdev_id);
 	} else if ((old_state == IEEE80211_STA_NONE &&
 		    new_state == IEEE80211_STA_NOTEXIST)) {
+		if (arvif->vdev_type == WMI_VDEV_TYPE_STA) {
+			ath12k_bss_disassoc(ar, arvif);
+			ret = ath12k_mac_vdev_stop(arvif);
+			if (ret)
+				ath12k_warn(ar->ab, "failed to stop vdev %i: %d\n",
+					    arvif->vdev_id, ret);
+		}
 		ath12k_dp_peer_cleanup(ar, arvif->vdev_id, sta->addr);
 
 		ret = ath12k_peer_delete(ar, arvif->vdev_id, sta->addr);
@@ -6336,46 +6383,6 @@ ath12k_mac_vdev_start_restart(struct ath12k_vif *arvif,
 	return 0;
 }
 
-static int ath12k_mac_vdev_stop(struct ath12k_vif *arvif)
-{
-	struct ath12k *ar = arvif->ar;
-	int ret;
-
-	lockdep_assert_held(&ar->conf_mutex);
-
-	reinit_completion(&ar->vdev_setup_done);
-
-	ret = ath12k_wmi_vdev_stop(ar, arvif->vdev_id);
-	if (ret) {
-		ath12k_warn(ar->ab, "failed to stop WMI vdev %i: %d\n",
-			    arvif->vdev_id, ret);
-		goto err;
-	}
-
-	ret = ath12k_mac_vdev_setup_sync(ar);
-	if (ret) {
-		ath12k_warn(ar->ab, "failed to synchronize setup for vdev %i: %d\n",
-			    arvif->vdev_id, ret);
-		goto err;
-	}
-
-	WARN_ON(ar->num_started_vdevs == 0);
-
-	ar->num_started_vdevs--;
-	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "vdev %pM stopped, vdev_id %d\n",
-		   arvif->vif->addr, arvif->vdev_id);
-
-	if (test_bit(ATH12K_CAC_RUNNING, &ar->dev_flags)) {
-		clear_bit(ATH12K_CAC_RUNNING, &ar->dev_flags);
-		ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "CAC Stopped for vdev %d\n",
-			   arvif->vdev_id);
-	}
-
-	return 0;
-err:
-	return ret;
-}
-
 static int ath12k_mac_vdev_start(struct ath12k_vif *arvif,
 				 struct ieee80211_chanctx_conf *ctx)
 {
@@ -6742,11 +6749,13 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 		arvif->is_started = false;
 	}
 
-	ret = ath12k_mac_vdev_stop(arvif);
-	if (ret)
-		ath12k_warn(ab, "failed to stop vdev %i: %d\n",
-			    arvif->vdev_id, ret);
-
+	if (arvif->vdev_type != WMI_VDEV_TYPE_STA) {
+		ath12k_bss_disassoc(ar, arvif);
+		ret = ath12k_mac_vdev_stop(arvif);
+		if (ret)
+			ath12k_warn(ab, "failed to stop vdev %i: %d\n",
+				    arvif->vdev_id, ret);
+	}
 	arvif->is_started = false;
 
 	if (ab->hw_params->vdev_start_delay &&
-- 
2.34.1


