Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373EFE77188
	for <ath12k@archiver.kernel.org>; Wed, 18 Dec 2024 03:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2a8oRMcfhoHgmYqLWousneWiOscrYBtaYv08MrX9mk=; b=04XypkWXdiU0qAjJgiAIOXbipW
	YYTSk8qtwtRa1iyjB502n+vTb2B9dRxW+d8+QcN6VwpO+fW4nBJQhN+5vy2LgYke7pJWl63sSHKQO
	9b0bk47gwAYmx18Ymy99pxQZkH9Di/NyL7lZh9LKW3mjXTPK0aUQkJ1Dz6YeQcyCkkj+CaSB2i8Nw
	nzieGsZmEUiIheRO0ZisiKZw2339rXuAxWhXqkj8GsgMYHZP2pgQjV6D66HbckQMsGL64JmGw/Q/2
	e5KN6CoN/JCOl+aSuw3K/2rn0iFRIDF5SBg8TEXdtrIeKGwNv44R7rOFtSNxHHzorkoj6aM0G2U81
	f2veSZ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNkwc-0000000FUye-3ha7
	for ath12k@archiver.kernel.org;
	Wed, 18 Dec 2024 03:41:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNkwZ-0000000FUxP-3pUR
	for ath12k@lists.infradead.org;
	Wed, 18 Dec 2024 03:41:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHIJgQi013146;
	Wed, 18 Dec 2024 03:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2a8oRMcfhoHgmYqLWousneWiOscrYBtaYv08MrX9mk=; b=KVMsXxJ5Uv1DUGKM
	wWSEM6za7AuLvU1rZ9O4EnNOYY8bld+t42T7973C9yYOlfk7haroQwCKULMhGS60
	KGUVfnBMeQKOcA7wB6z1cmJSp/SkYlCdrtUu3wfE4HgEga/1QIZ/Sj6IpmHw1MCD
	8EyAppIhj1UHVfS2Ky6f7w0GxiVR1F03h6DrIq79P7Dp7OPJt+3XPINzUi6WOAmf
	1So1Dvh8tmDNkHrdsdf3RsvhGYOczGrSUQq/dHEANLVnlua9VMcCeu3Z1+1ULFxV
	QkB9ysOvYn0FRiC7JxAr8FKVbe65eaqRqM2BkDfb8/ZlvtMrzK1tpeESVo9zbMUA
	OjOd9Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kefxh248-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 03:41:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI3flN1021648
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 03:41:47 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 19:41:45 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Wed, 18 Dec 2024 09:11:32 +0530
Subject: [PATCH 1/3] wifi: ath12k: rename CAC_RUNNING flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241218-ath12k_mlo_dfs-v1-1-058e783bcfc7@quicinc.com>
References: <20241218-ath12k_mlo_dfs-v1-0-058e783bcfc7@quicinc.com>
In-Reply-To: <20241218-ath12k_mlo_dfs-v1-0-058e783bcfc7@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tU8eNnKILtiAGuYHhP37uT_SvZ2z0xPl
X-Proofpoint-ORIG-GUID: tU8eNnKILtiAGuYHhP37uT_SvZ2z0xPl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_194151_963196_E9B45757 
X-CRM114-Status: GOOD (  12.67  )
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

Rename the flag ATH12K_CAC_RUNNING to ATH12K_FLAG_CAC_RUNNING to correct
the naming inconsistency in the enum ath12k_dev_flags.

No functionality changes.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h  | 2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c | 6 +++---
 drivers/net/wireless/ath/ath12k/mac.c   | 8 ++++----
 drivers/net/wireless/ath/ath12k/wmi.c   | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index ec61ad3d82c3bb9237cf327976e9f68e8c8f9cc7..f988c8b2490e699c29f3495dfc9fe4381574cc01 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -223,7 +223,7 @@ enum ath12k_hw_group_flags {
 };
 
 enum ath12k_dev_flags {
-	ATH12K_CAC_RUNNING,
+	ATH12K_FLAG_CAC_RUNNING,
 	ATH12K_FLAG_CRASH_FLUSH,
 	ATH12K_FLAG_RAW_MODE,
 	ATH12K_FLAG_HW_CRYPTO_DISABLED,
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 5c5a3aae393be52a241c048c5a60c57d1f8cea92..dad35bfd83f6271253361c618534933e83e7f7fb 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2632,7 +2632,7 @@ static void ath12k_dp_rx_process_received_packets(struct ath12k_base *ab,
 			continue;
 		}
 
-		if (test_bit(ATH12K_CAC_RUNNING, &ar->dev_flags)) {
+		if (test_bit(ATH12K_FLAG_CAC_RUNNING, &ar->dev_flags)) {
 			dev_kfree_skb_any(msdu);
 			continue;
 		}
@@ -3484,7 +3484,7 @@ ath12k_dp_process_rx_err_buf(struct ath12k *ar, struct hal_reo_dest_ring *desc,
 		goto exit;
 	}
 
-	if (test_bit(ATH12K_CAC_RUNNING, &ar->dev_flags)) {
+	if (test_bit(ATH12K_FLAG_CAC_RUNNING, &ar->dev_flags)) {
 		dev_kfree_skb_any(msdu);
 		goto exit;
 	}
@@ -4037,7 +4037,7 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
 			continue;
 		}
 
-		if (test_bit(ATH12K_CAC_RUNNING, &ar->dev_flags)) {
+		if (test_bit(ATH12K_FLAG_CAC_RUNNING, &ar->dev_flags)) {
 			dev_kfree_skb_any(msdu);
 			continue;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 186765fa95f5302b8188419cbf6073624413a774..c61b1519cc91c6a476e1510b4cf13f80c89a793a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1323,8 +1323,8 @@ int ath12k_mac_vdev_stop(struct ath12k_link_vif *arvif)
 	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "vdev %pM stopped, vdev_id %d\n",
 		   ahvif->vif->addr, arvif->vdev_id);
 
-	if (test_bit(ATH12K_CAC_RUNNING, &ar->dev_flags)) {
-		clear_bit(ATH12K_CAC_RUNNING, &ar->dev_flags);
+	if (test_bit(ATH12K_FLAG_CAC_RUNNING, &ar->dev_flags)) {
+		clear_bit(ATH12K_FLAG_CAC_RUNNING, &ar->dev_flags);
 		ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "CAC Stopped for vdev %d\n",
 			   arvif->vdev_id);
 	}
@@ -7463,7 +7463,7 @@ static void ath12k_mac_stop(struct ath12k *ar)
 		ath12k_err(ar->ab, "failed to clear rx_filter for monitor status ring: (%d)\n",
 			   ret);
 
-	clear_bit(ATH12K_CAC_RUNNING, &ar->dev_flags);
+	clear_bit(ATH12K_FLAG_CAC_RUNNING, &ar->dev_flags);
 
 	cancel_delayed_work_sync(&ar->scan.timeout);
 	wiphy_work_cancel(ath12k_ar_to_hw(ar)->wiphy, &ar->scan.vdev_clean_wk);
@@ -8782,7 +8782,7 @@ ath12k_mac_vdev_start_restart(struct ath12k_link_vif *arvif,
 	if (arvif->ahvif->vdev_type == WMI_VDEV_TYPE_AP &&
 	    chandef->chan->dfs_cac_ms &&
 	    chandef->chan->dfs_state == NL80211_DFS_USABLE) {
-		set_bit(ATH12K_CAC_RUNNING, &ar->dev_flags);
+		set_bit(ATH12K_FLAG_CAC_RUNNING, &ar->dev_flags);
 		ath12k_dbg(ab, ATH12K_DBG_MAC,
 			   "CAC Started in chan_freq %d for vdev %d\n",
 			   arg.freq, arg.vdev_id);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 562b0615ed065d094f5d7709cafeb22c41f02d17..d0ae7f142c11ab4720bf95c0c95990ff40bd2815 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6212,7 +6212,7 @@ static void ath12k_mgmt_rx_event(struct ath12k_base *ab, struct sk_buff *skb)
 		goto exit;
 	}
 
-	if ((test_bit(ATH12K_CAC_RUNNING, &ar->dev_flags)) ||
+	if ((test_bit(ATH12K_FLAG_CAC_RUNNING, &ar->dev_flags)) ||
 	    (rx_ev.status & (WMI_RX_STATUS_ERR_DECRYPT |
 			     WMI_RX_STATUS_ERR_KEY_CACHE_MISS |
 			     WMI_RX_STATUS_ERR_CRC))) {

-- 
2.34.1


