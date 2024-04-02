Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CD6C6FD1F
	for <ath12k@archiver.kernel.org>; Tue,  2 Apr 2024 22:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOA9QMPXMDBPsg/wVYYykdki7RCcvRd1EDPM2dq7wsw=; b=yrkzo3jKNdtZ62bBG5zupuIlaI
	Hg7B33KpQQjK86ABXVN65nfMHt1IRctOKjBG2Xj6xVVzSwhUBUs/LYcvzTI/DyKar7Y/bQ74lIaoA
	LCjMb1Rzqek7cSxz/EFOTUuAJyLW5hGG06wpbNzA3TBL1mZH62XxZu1ED4opB1TlT5Te9GXMQzk90
	gSYOJGKIXHREGnH5EhbGw+pDirUr+OTi8usaAbWGwBfZuooYZ8CulQdOWN3zC3xJYb/rbh8LkXzHO
	a6BeHpOTkqNm/HltS5ZUK/7/dToS7D8kqiAwkph5v3ig9mI6jt+qUMuMOTsPcJvW+h3Md+ruK3pxP
	wnusc+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrmSz-0000000D0Gt-3YLC
	for ath12k@archiver.kernel.org;
	Tue, 02 Apr 2024 22:18:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrlKJ-0000000CohH-2M9q
	for ath12k@lists.infradead.org;
	Tue, 02 Apr 2024 21:05:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 432KQBOs020742;
	Tue, 2 Apr 2024 21:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=zOA9QMPXMDBPsg/wVYYykdki7RCcvRd1EDPM2dq7wsw=; b=Vf
	hUbZ5Un+vMcpgXDxjiKuPvsIejhyWyhsIWYxlxFyPSMB7OJQhyw7rePPBMucxnY6
	N5Kx2MoH21TSVXFLpJWLS2f+tV4v8U59l9NCYJGImf6M7CTU6BqM5wtCPl4s+j6t
	nL1w24E2f0cmgksIIb13BStb/Cr3NRjo74rCvdF7MPd6v7rsAscye52i7Irl+k6o
	5c9DYt8QcE6HJH7Xi8JASuZ15LkyLYQTJBfXD3IqoFbBLt3/6+8XFfg5dw3QXa7z
	o0bqsqlfHbtn/D/jDjUAo/Jj+X6FUVdz5SJMWWTulS/QeOHS9oVF1V7KJ/d+CIcZ
	0w5tk7GRyMrfrUzFFpmw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8cm5j9bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 21:05:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 432L5o5w031818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 21:05:50 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 2 Apr 2024 14:05:50 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH 5/9] wifi: ath12k: configure MBSSID parameters in AP mode
Date: Tue, 2 Apr 2024 14:05:34 -0700
Message-ID: <20240402210538.7308-6-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240402210538.7308-1-quic_alokad@quicinc.com>
References: <20240402210538.7308-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BxdojqwTb7cGaDcPdYDI4qS5TYl8kazw
X-Proofpoint-ORIG-GUID: BxdojqwTb7cGaDcPdYDI4qS5TYl8kazw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_14,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=968 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404020157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_140551_667129_24904CBB 
X-CRM114-Status: GOOD (  14.58  )
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

Include MBSSID parameters in WMI vdev up operation.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 15 ++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.c |  6 ++++++
 drivers/net/wireless/ath/ath12k/wmi.h |  3 +++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 39d1660a78bc..01422fcfa760 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1342,6 +1342,11 @@ static void ath12k_control_beaconing(struct ath12k_vif *arvif,
 	params.vdev_id = arvif->vdev_id;
 	params.aid = arvif->aid;
 	params.bssid = arvif->bssid;
+	if (arvif->vif->mbssid_tx_vif) {
+		params.tx_bssid = ath12k_vif_to_arvif(arvif->vif->mbssid_tx_vif)->bssid;
+		params.nontx_profile_idx = info->bssid_index;
+		params.nontx_profile_cnt = 1 << info->bssid_indicator;
+	}
 	ret = ath12k_wmi_vdev_up(arvif->ar, &params);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to bring up vdev %d: %i\n",
@@ -6576,6 +6581,7 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 {
 	struct ath12k_wmi_vdev_up_params params = {};
 	struct ath12k_base *ab = ar->ab;
+	struct ieee80211_vif *vif;
 	struct ath12k_vif *arvif;
 	int ret;
 	int i;
@@ -6618,7 +6624,8 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 	/* TODO: Update ar->rx_channel */
 
 	for (i = 0; i < n_vifs; i++) {
-		arvif = ath12k_vif_to_arvif(vifs[i].vif);
+		vif = vifs[i].vif;
+		arvif = ath12k_vif_to_arvif(vif);
 
 		if (WARN_ON(!arvif->is_started))
 			continue;
@@ -6655,9 +6662,15 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 			ath12k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
 				    ret);
 
+		memset(&params, 0, sizeof(params));
 		params.vdev_id = arvif->vdev_id;
 		params.aid = arvif->aid;
 		params.bssid = arvif->bssid;
+		if (vif->mbssid_tx_vif) {
+			params.tx_bssid = ath12k_vif_to_arvif(vif->mbssid_tx_vif)->bssid;
+			params.nontx_profile_idx = vif->bss_conf.bssid_index;
+			params.nontx_profile_cnt = 1 << vif->bss_conf.bssid_indicator;
+		}
 		ret = ath12k_wmi_vdev_up(arvif->ar, &params);
 		if (ret) {
 			ath12k_warn(ab, "failed to bring vdev up %d: %d\n",
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 429263d5a8b7..09a9fc13e747 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1123,6 +1123,12 @@ int ath12k_wmi_vdev_up(struct ath12k *ar, struct ath12k_wmi_vdev_up_params *para
 
 	ether_addr_copy(cmd->vdev_bssid.addr, params->bssid);
 
+	if (params->tx_bssid) {
+		ether_addr_copy(cmd->tx_vdev_bssid.addr, params->tx_bssid);
+		cmd->nontx_profile_idx = cpu_to_le32(params->nontx_profile_idx);
+		cmd->nontx_profile_cnt = cpu_to_le32(params->nontx_profile_cnt);
+	}
+
 	ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
 		   "WMI mgmt vdev up id 0x%x assoc id %d bssid %pM\n",
 		   params->vdev_id, params->aid, params->bssid);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 2ad32a717d83..b0697c348f54 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2744,6 +2744,9 @@ struct ath12k_wmi_vdev_up_params {
 	u32 vdev_id;
 	u32 aid;
 	const u8 *bssid;
+	const u8 *tx_bssid;
+	u32 nontx_profile_idx;
+	u32 nontx_profile_cnt;
 };
 
 struct wmi_vdev_up_cmd {
-- 
2.39.0


