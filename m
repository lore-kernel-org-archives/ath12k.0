Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2022CCF9F8
	for <ath12k@archiver.kernel.org>; Mon,  3 Nov 2025 11:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgri3PEG9OBxX7AfSLEUO6OGncle5ZvcdyUB/D0XnM0=; b=PRS0lWFiu6NF24iEX6xaRYWBSM
	7T9gTylkpXnI4s3znCOhCtuEL1TDxqa5anN7/f8DpDYHRN47D/sG61gHfPvQ7KcgEueVIz3KFj6+y
	16vFpO8w4HKxaz6tcWBkP8ktMIE9+FZ/3ZR/973SpN5Yu+NBr60pX2wgdb3i4nr6l6DjHhdwWEZ1r
	tXRqIVglBHrJiO1FxHyNQvp2v0tGUGCYZwIPpu4IGfG4Ci1mNLjMA3omMWuH4sWuBo4pD3UmA5th1
	cUgiV3BC+UjiPvGPnQMxNlqP3Ic0oGgVwD6t5UwlwVmxDWkMdxPdFbh9GJMk7ywXrXwbjBo0cuomN
	QvoDNh8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsdO-00000009irp-1Ofo;
	Mon, 03 Nov 2025 11:22:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsdK-00000009in2-195B
	for ath12k@lists.infradead.org;
	Mon, 03 Nov 2025 11:22:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38OCN61108817;
	Mon, 3 Nov 2025 11:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wgri3PEG9OBxX7AfSLEUO6OGncle5ZvcdyUB/D0XnM0=; b=Ay1evVXRsI4nD8yd
	NtOMukdPHOMri24TwCFyrwEusHRp7tU/hEOqkNrQy7KoMbgT5qiVwWFMkp/iHMLS
	FrgOUvuG1xycTmHs/Q8DGS8W8G9TYpAvzSLjds8+5hirMYhksi7aWKaaYf7gWM/H
	MXtThLtU4mN0NlvvzcVxFR61QgJXrYGRI7kuZExnDknfa5VNu6oUZ7fLQW64L1tn
	wvf12zy4eglYWt9s5wylqjEFKBf9Jj3e9DHiiL0b7A2YzzODp9nqidDT9dEhcdZJ
	u487UuC257hsEgYc95XaxUTVM6OUNj1/wVZDMX8MrDyX4cr1Ypn6aFjxHXNH5CvL
	26eIew==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ak8me2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 11:21:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A3BLtkf005223
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Nov 2025 11:21:55 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 3 Nov 2025 03:21:54 -0800
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng 12/12] wifi: ath12k: Replace lock/unlock with guard()
Date: Mon, 3 Nov 2025 16:51:11 +0530
Message-ID: <20251103112111.2260639-13-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103112111.2260639-1-quic_rdeuri@quicinc.com>
References: <20251103112111.2260639-1-quic_rdeuri@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YfqJqtj_uNmuMCZhmAXO6JdikQctTTVE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwMyBTYWx0ZWRfX7NGU5DKedeKW
 FMCPLWEaWkzdiIYDddUo5qhijhjOSl/SHXm9xV8zDhGQAHBfY19zBlbfF+j8RJlwFkNrtkggKk6
 pyesJh+QNKIZ6n5lbg0yTFIWj+nZ6rlT58Rm8Gx3OSqgL2NXQk+m3i57E1Rl/IZaxbyXQaIw7Yn
 3F1WO5tFBEbJrCWAEBd3BMgQu0Ns4t1vMVQMS3cTUK+cNjSXhtU+cLvNj2MSyNHVNDiryLrJiGp
 Bf+pIfjZ7+EELocrmS2aVgLb/sHz90/LJjh4Bisq8YZjyYS6hlb8C7nq6WocbLIyPRFbaxSdsG1
 05ZKVg9mgm/o4WkbuUJuQdhB+He6Y2hrnqOwbNfS5ZQVBin/ApakYOvBaTTtyCFDBOTMcUg30PN
 MZkGt2BLIYU7RV5THjdnBRsvowpUDw==
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=69089055 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=vRo11cHgEgMZMzEvRbsA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YfqJqtj_uNmuMCZhmAXO6JdikQctTTVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_032158_432593_52F2DF45 
X-CRM114-Status: GOOD (  12.54  )
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

Use guard(wiphy)(...) and guard(spinlock_bh)(...) in:

ath12k_dbg_sta_dump_rx_stats()
ath12k_mac_op_link_sta_statistics()

The guard() API ensures locks are automatically released when the scope
exits, reducing the risk of missing unlocks in error paths and improving
code readability.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/debugfs_sta.c | 36 ++++++-------------
 drivers/net/wireless/ath/ath12k/mac.c         |  7 ++--
 2 files changed, 13 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_sta.c b/drivers/net/wireless/ath/ath12k/debugfs_sta.c
index dde3efed4b60..585c40bd2951 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_sta.c
@@ -153,41 +153,32 @@ static ssize_t ath12k_dbg_sta_dump_rx_stats(struct file *file,
 	bool he_rates_avail;
 	struct ath12k *ar;
 
-	wiphy_lock(ah->hw->wiphy);
+	guard(wiphy)(ah->hw->wiphy);
 
-	if (!(BIT(link_id) & ahsta->links_map)) {
-		wiphy_unlock(ah->hw->wiphy);
+	if (!(BIT(link_id) & ahsta->links_map))
 		return -ENOENT;
-	}
 
 	arsta = wiphy_dereference(ah->hw->wiphy, ahsta->link[link_id]);
-	if (!arsta || !arsta->arvif->ar) {
-		wiphy_unlock(ah->hw->wiphy);
+	if (!arsta || !arsta->arvif->ar)
 		return -ENOENT;
-	}
 
 	ar = arsta->arvif->ar;
 
 	u8 *buf __free(kfree) = kzalloc(size, GFP_KERNEL);
-	if (!buf) {
-		ret = -ENOENT;
-		goto out;
-	}
+	if (!buf)
+		return -ENOMEM;
 
 	dp = ath12k_ab_to_dp(ar->ab);
-	spin_lock_bh(&dp->dp_lock);
+
+	guard(spinlock_bh)(&dp->dp_lock);
 
 	link_peer = ath12k_dp_link_peer_find_by_addr(dp, arsta->addr);
-	if (!link_peer) {
-		ret = -ENOENT;
-		goto unlock;
-	}
+	if (!link_peer)
+		return -ENOENT;
 
 	rx_stats = link_peer->peer_stats.rx_stats;
-	if (!rx_stats) {
-		ret = -ENOENT;
-		goto unlock;
-	}
+	if (!rx_stats)
+		return -ENOENT;
 
 	len += scnprintf(buf + len, size - len, "RX peer stats:\n\n");
 	len += scnprintf(buf + len, size - len, "Num of MSDUs: %llu\n",
@@ -247,13 +238,8 @@ static ssize_t ath12k_dbg_sta_dump_rx_stats(struct file *file,
 	len += ath12k_dbg_sta_dump_rate_stats(buf, len, size, he_rates_avail,
 					      &rx_stats->byte_stats);
 
-unlock:
-	spin_unlock_bh(&dp->dp_lock);
-
 	if (len)
 		ret = simple_read_from_buffer(user_buf, count, ppos, buf, len);
-out:
-	wiphy_unlock(ah->hw->wiphy);
 	return ret;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4647c555cb48..aa80afebb69e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12792,12 +12792,10 @@ void ath12k_mac_op_link_sta_statistics(struct ieee80211_hw *hw,
 	db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
 			  ar->ab->wmi_ab.svc_map);
 
-	spin_lock_bh(&ar->ab->dp->dp_lock);
+	guard(spinlock_bh)(&ar->ab->dp->dp_lock);
 	peer = ath12k_dp_link_peer_find_by_addr(ar->ab->dp, arsta->addr);
-	if (!peer) {
-		spin_unlock_bh(&ar->ab->dp->dp_lock);
+	if (!peer)
 		return;
-	}
 
 	link_sinfo->rx_duration = peer->rx_duration;
 	link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_DURATION);
@@ -12853,7 +12851,6 @@ void ath12k_mac_op_link_sta_statistics(struct ieee80211_hw *hw,
 	link_sinfo->tx_failed = peer->tx_retry_failed;
 	link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
 	link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_FAILED);
-	spin_unlock_bh(&ar->ab->dp->dp_lock);
 }
 EXPORT_SYMBOL(ath12k_mac_op_link_sta_statistics);
 
-- 
2.34.1


