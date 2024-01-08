Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D27C3DA6E
	for <ath12k@archiver.kernel.org>; Mon,  8 Jan 2024 08:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15OfW7WDBGiMjqO0FV0oiHBSk/EoDAjRearoYzFVgAY=; b=H++t6aY4op2EAiAZ7LTRYY8nIX
	6OZFiXOsjwVGVeTibJr2Q1D1rfj1GZYYIcddSagMAcuk+bfeRVgbeYrAnssOQ/eajWZyGwLS0/6M0
	EHLaECaQXb/2MOA4GZwY8LfcHzt7mB62wBnhH7nX789owZmhYd+pSJiWe+O3ye21G5+r40PrClT6b
	FsyTkHytz0WtrdIiayymnj+mJUY0D4h7G4sTFlWuMmwad/cu4UXaabFZbXY71lfaesH5p6/fuTjDf
	bdMp1u6MaxO235x8gUFwUtoohS8LKrQcAEm7UQYiGQjoOKt8SKnzHQNqkuLUcopi5AgjLVtOlwdro
	udkjZyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMky1-004IXz-2c
	for ath12k@archiver.kernel.org;
	Mon, 08 Jan 2024 08:26:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMkxz-004IWK-0w
	for ath12k@lists.infradead.org;
	Mon, 08 Jan 2024 08:26:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4087H9Ln002091;
	Mon, 8 Jan 2024 08:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=15OfW7WDBGiMjqO0FV0oiHBSk/EoDAjRearoYzFVgAY=; b=LD
	hXZS9H1Qm2dPpajtu72ej2F/inacWyR/upES6x6zIjOu0cshLzGjfHGO2jcBqC3j
	29M+iHY1orOZFXL0TC6og7uDGfwzbEyIoBK8MsBIEYed8ftkocaqMmOyq8/V81YX
	Flmba2d05wcsYPRHjpFjIP8D2b/ecOUiVS0+RI7yn3HJp8Rpmjwyko4bHH6HKCqf
	iWjQG3o1oV8DAkuw2/tzBMJlwUiJrBdq6cePiER0IjJLGY2yYXyyC8wvjhV/yDHV
	L1fk0gazaaIxljZf7umUvqlgJ7/s1J3tLZXSPv8lg8v++vtCsG8bYr7qoL3MIFOb
	GlOxtnFrHQFMpj5OjSgA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vgch503q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 08:26:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4088QcNO018475
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jan 2024 08:26:38 GMT
Received: from yk-E5440.local (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Jan
 2024 00:26:36 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 08/10] wifi: ath12k: move peer delete after vdev stop of station for WCN7850
Date: Mon, 8 Jan 2024 16:25:50 +0800
Message-ID: <20240108082552.7227-9-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240108082552.7227-1-quic_kangyang@quicinc.com>
References: <20240108082552.7227-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IL_60wwponOxAby7tkfujqrp0mUC4OgL
X-Proofpoint-GUID: IL_60wwponOxAby7tkfujqrp0mUC4OgL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401080070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_002639_341712_2FA40A18 
X-CRM114-Status: GOOD (  14.43  )
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

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 99 +++++++++++++++------------
 1 file changed, 54 insertions(+), 45 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 6632d5266c1a..7e2e88ad9d66 100644
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
 static int ath12k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
 {
 	struct ath12k *ar = hw->priv;
@@ -3856,6 +3896,13 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 				    sta->addr, arvif->vdev_id);
 	} else if ((old_state == IEEE80211_STA_NONE &&
 		    new_state == IEEE80211_STA_NOTEXIST)) {
+		if (arvif->vdev_type == WMI_VDEV_TYPE_STA) {
+			ath12k_bss_disassoc(hw, vif);
+			ret = ath12k_mac_vdev_stop(arvif);
+			if (ret)
+				ath12k_warn(ar->ab, "failed to stop vdev %i: %d\n",
+					    arvif->vdev_id, ret);
+		}
 		ath12k_dp_peer_cleanup(ar, arvif->vdev_id, sta->addr);
 
 		ret = ath12k_peer_delete(ar, arvif->vdev_id, sta->addr);
@@ -6176,46 +6223,6 @@ ath12k_mac_vdev_start_restart(struct ath12k_vif *arvif,
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
@@ -6571,11 +6578,13 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 		arvif->is_started = false;
 	}
 
-	ret = ath12k_mac_vdev_stop(arvif);
-	if (ret)
-		ath12k_warn(ab, "failed to stop vdev %i: %d\n",
-			    arvif->vdev_id, ret);
-
+	if (arvif->vdev_type != WMI_VDEV_TYPE_STA) {
+		ath12k_bss_disassoc(hw, vif);
+		ret = ath12k_mac_vdev_stop(arvif);
+		if (ret)
+			ath12k_warn(ab, "failed to stop vdev %i: %d\n",
+				    arvif->vdev_id, ret);
+	}
 	arvif->is_started = false;
 
 	if (ab->hw_params->vdev_start_delay &&
-- 
2.34.1


