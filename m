Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42A3C4345F
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 06:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfinA+RjmJYLiSYf80MMLc8RUHdGXfGNjQXUk4Uhj2E=; b=GMOB/iWD9O2yL8bUTZ6Pf3HjIT
	TB3GJ8EMxvX7tKcBmgIQTwYv1pod1nitJ0OiozW94IubcSiSOocXAjhmEfdh+VQXZfBZFJDlO1ngt
	1l94+LqVJSpSbh35MoHHBTL5SzdNDHTo8G48r8RPQjUAJwreM4ag9xa8C08JqaLivxl/i+4QNMs4y
	O0XI+BTKfmRrAKTKfygSeW/072H0s6UtH/oR8lZhfrbWyodAJdwjM20G1hM6yi9EPUts0rx7zvNl0
	MD4vZD3joh85yqcwE/Yw9RuBcPEIrwIP5jBUhfVxTwoBsKo/uIpPyWAm+jR2wlBgS26Ad9SzAuld9
	lKCRhLcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3o-0000000FV7e-0qrd
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 06:06:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3i-0000000FV3I-1374
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 06:06:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C65roZ020307;
	Fri, 12 Apr 2024 06:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=gfinA+RjmJYLiSYf80MMLc8RUHdGXfGNjQXUk4Uhj2E=; b=MX
	6YAscyWrNV/RBsPryrT541d+ISyLx9KzW92evztwGU6GdsvhR3e1LUz9YfRwi43A
	HUqEGAMU6ZA+wFu9AXFbtbF2Cs8Wk25fkTXHgE41fcRU8kz9/gM+81ThJlmRWx37
	QGAfwWDqLe5EiF/I5xm72BwE7BToF8aaoIKPt2m/DlTq9xLTscggyys2U4u6ldaS
	BExZ7eqWzr7m0EjMXRrUyhTYozt+LR7f6WwDoe9dLI2kFA57DyBcu8/zuQTALArj
	veVMDH9j/d3743AUOSXXOXuVbOJlR5wUzH+5HPzdIZ6QTiDgST3rH9vLgLwtgUjw
	7QLnaVbyaQRvv723asSQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xesjbrnea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43C66iBX007189
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:44 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 11 Apr 2024 23:06:43 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 06/10] wifi: ath12k: flush all packets before suspend
Date: Fri, 12 Apr 2024 14:06:16 +0800
Message-ID: <20240412060620.27519-7-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412060620.27519-1-quic_bqiang@quicinc.com>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UXbAuaG1nRJ-i5GvzHDECuJppor5B4rw
X-Proofpoint-GUID: UXbAuaG1nRJ-i5GvzHDECuJppor5B4rw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_230646_356876_B804FE97 
X-CRM114-Status: GOOD (  16.91  )
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

In order to send out all packets before going to suspend, current code
adds a 500ms delay as a workaround. It is a rough estimate and may not
work.

Fix this by checking packet counters, if counters become zero, then all
packets are sent out or dropped.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 20 +++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.c  | 28 ++++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/mac.h  |  1 +
 3 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 28663cf4db30..dfec390b66c6 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -44,15 +44,25 @@ static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 
 int ath12k_core_suspend(struct ath12k_base *ab)
 {
-	int ret;
+	struct ath12k *ar;
+	int ret, i;
 
 	if (!ab->hw_params->supports_suspend)
 		return -EOPNOTSUPP;
 
-	/* TODO: there can frames in queues so for now add delay as a hack.
-	 * Need to implement to handle and remove this delay.
-	 */
-	msleep(500);
+	rcu_read_lock();
+	for (i = 0; i < ab->num_radios; i++) {
+		ar = ath12k_mac_get_ar_by_pdev_id(ab, i);
+		if (!ar)
+			continue;
+		ret = ath12k_mac_wait_tx_complete(ar);
+		if (ret) {
+			ath12k_warn(ab, "failed to wait tx complete: %d\n", ret);
+			rcu_read_unlock();
+			return ret;
+		}
+	}
+	rcu_read_unlock();
 
 	ret = ath12k_dp_rx_pktlog_stop(ab, true);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f15dcd75157d..69c5fd9d2612 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7356,22 +7356,38 @@ static int ath12k_mac_op_set_frag_threshold(struct ieee80211_hw *hw, u32 value)
 	return -EOPNOTSUPP;
 }
 
-static void ath12k_mac_flush(struct ath12k *ar)
+static int ath12k_mac_flush(struct ath12k *ar)
 {
 	long time_left;
+	int ret = 0;
 
 	time_left = wait_event_timeout(ar->dp.tx_empty_waitq,
 				       (atomic_read(&ar->dp.num_tx_pending) == 0),
 				       ATH12K_FLUSH_TIMEOUT);
-	if (time_left == 0)
-		ath12k_warn(ar->ab, "failed to flush transmit queue %ld\n", time_left);
+	if (time_left == 0) {
+		ath12k_warn(ar->ab,
+			    "failed to flush transmit queue, data pkts pending %d\n",
+			    atomic_read(&ar->dp.num_tx_pending));
+		ret = -ETIMEDOUT;
+	}
 
 	time_left = wait_event_timeout(ar->txmgmt_empty_waitq,
 				       (atomic_read(&ar->num_pending_mgmt_tx) == 0),
 				       ATH12K_FLUSH_TIMEOUT);
-	if (time_left == 0)
-		ath12k_warn(ar->ab, "failed to flush mgmt transmit queue %ld\n",
-			    time_left);
+	if (time_left == 0) {
+		ath12k_warn(ar->ab,
+			    "failed to flush mgmt transmit queue, mgmt pkts pending %d\n",
+			    atomic_read(&ar->num_pending_mgmt_tx));
+		ret = -ETIMEDOUT;
+	}
+
+	return ret;
+}
+
+int ath12k_mac_wait_tx_complete(struct ath12k *ar)
+{
+	ath12k_mac_drain_tx(ar);
+	return ath12k_mac_flush(ar);
 }
 
 static void ath12k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 3f5e1be0dff9..f826822d30c8 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -78,4 +78,5 @@ enum ath12k_supported_bw ath12k_mac_mac80211_bw_to_ath12k_bw(enum rate_info_bw b
 enum hal_encrypt_type ath12k_dp_tx_get_encrypt_type(u32 cipher);
 int ath12k_mac_rfkill_enable_radio(struct ath12k *ar, bool enable);
 int ath12k_mac_rfkill_config(struct ath12k *ar);
+int ath12k_mac_wait_tx_complete(struct ath12k *ar);
 #endif
-- 
2.25.1


