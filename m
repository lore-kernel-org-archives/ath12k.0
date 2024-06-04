Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8B3C27C52
	for <ath12k@archiver.kernel.org>; Tue,  4 Jun 2024 05:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8ZfzLEwaq1TqSG8g9eXG5crOaKz9DhOdNgKoWvm/xQ=; b=c/0rQK6Xwm+SoJnD41nuCVSrU0
	R+afVQSgICj3KxQVx7iN3K+ZMd997JqLS7k9TJxkm1Sy50F8U34xiBZV029LG8TQgsf0JruRWUsbk
	xDmcJA9TnRPzIyNnPKdPfs/UIOuk5gVb2PuBCviARudWf5iegcaknj+9Mgs7ftzScL3Jiq5grYhn+
	26SiGa0VT2yGhXW1S7nRMHj1yWWpZqU5849mFAi9UYGD9l7yKFLYHcL3gSHOpISyhWZVD2m6epSY7
	PzOv4Ubwa/0BUFF0I4R/MpeM1OHFD2cXLjXNi5Vc9x2/RmxU76lpltzkpKM0z/Os/MbsZh0Enhn0P
	yGCZpVdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEN7z-00000001Jq2-04D3
	for ath12k@archiver.kernel.org;
	Tue, 04 Jun 2024 05:54:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEN7s-00000001Jlf-04fq
	for ath12k@lists.infradead.org;
	Tue, 04 Jun 2024 05:54:31 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453MFf1Q008539;
	Tue, 4 Jun 2024 05:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F8ZfzLEwaq1TqSG8g9eXG5crOaKz9DhOdNgKoWvm/xQ=; b=Zp12Z/qQt3c5+iSj
	T57h4pxgYSGR3sbqwIOkcXHVdc2agOVpkIS7OUH7xpuTRz+cFBl7QYfvX5tXrANl
	eE6tNRIchElQX2NtctxyKFgpnv0cHcvGIiVAb6E5qyxN+QFVnIgFPZJqzzGqZHVy
	3XbqCV/P6kPhbWrTTM8uzuHYO5UhSLdtVb2e61F2oP7JgQrFx1LxhQ5GGR+ymzLq
	DRQed7vLHdm9E+C3+YcJE6NvGZ99bvjCi23JLA6S5X+/Sq6CG7a0ZaJzfs1bRKNq
	lsrHZ7UN/IfdQ6OWoaxFxpu94ukTfkllP0khc7yqJWDtWI4FezYhoKIcr+jMO+bb
	RmarTw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5kp26y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 05:54:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4545sQsu016763
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 05:54:26 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 22:54:25 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH v4 5/8] wifi: ath12k: implement hardware data filter
Date: Tue, 4 Jun 2024 13:54:04 +0800
Message-ID: <20240604055407.12506-6-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240604055407.12506-1-quic_bqiang@quicinc.com>
References: <20240604055407.12506-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eLubjdsuGNgR8WRNqCwJCOF71tAUZUDj
X-Proofpoint-ORIG-GUID: eLubjdsuGNgR8WRNqCwJCOF71tAUZUDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_02,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 mlxlogscore=968 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_225428_207318_E278DF04 
X-CRM114-Status: GOOD (  15.17  )
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

Host needs to set hardware data filter before entering WoW to
let firmware drop needless broadcast/multicast frames to avoid
frequent wakeup. Host clears hardware data filter when leaving WoW.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 31 +++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h | 21 +++++++++
 drivers/net/wireless/ath/ath12k/wow.c | 66 +++++++++++++++++++++++++++
 3 files changed, 118 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 1e96f3bd7774..be9cf360262c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7423,6 +7423,37 @@ void ath12k_wmi_detach(struct ath12k_base *ab)
 	ath12k_wmi_free_dbring_caps(ab);
 }
 
+int ath12k_wmi_hw_data_filter_cmd(struct ath12k *ar, struct wmi_hw_data_filter_arg *arg)
+{
+	struct wmi_hw_data_filter_cmd *cmd;
+	struct sk_buff *skb;
+	int len;
+
+	len = sizeof(*cmd);
+	skb = ath12k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
+
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_hw_data_filter_cmd *)skb->data;
+	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_HW_DATA_FILTER_CMD,
+						 sizeof(*cmd));
+	cmd->vdev_id = cpu_to_le32(arg->vdev_id);
+	cmd->enable = cpu_to_le32(arg->enable ? 1 : 0);
+
+	/* Set all modes in case of disable */
+	if (arg->enable)
+		cmd->hw_filter_bitmap = cpu_to_le32(arg->hw_filter_bitmap);
+	else
+		cmd->hw_filter_bitmap = cpu_to_le32((u32)~0U);
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
+		   "wmi hw data filter enable %d filter_bitmap 0x%x\n",
+		   arg->enable, arg->hw_filter_bitmap);
+
+	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_HW_DATA_FILTER_CMDID);
+}
+
 int ath12k_wmi_wow_host_wakeup_ind(struct ath12k *ar)
 {
 	struct wmi_wow_host_wakeup_cmd *cmd;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 6e5d9a25255e..477e2a37eb9c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -5297,6 +5297,25 @@ struct wmi_wow_nlo_config_cmd {
 	 */
 } __packed;
 
+/* Definition of HW data filtering */
+enum hw_data_filter_type {
+	WMI_HW_DATA_FILTER_DROP_NON_ARP_BC = BIT(0),
+	WMI_HW_DATA_FILTER_DROP_NON_ICMPV6_MC = BIT(1),
+};
+
+struct wmi_hw_data_filter_cmd {
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 enable;
+	__le32 hw_filter_bitmap;
+} __packed;
+
+struct wmi_hw_data_filter_arg {
+	u32 vdev_id;
+	bool enable;
+	u32 hw_filter_bitmap;
+};
+
 void ath12k_wmi_init_qcn9274(struct ath12k_base *ab,
 			     struct ath12k_wmi_resource_config_arg *config);
 void ath12k_wmi_init_wcn7850(struct ath12k_base *ab,
@@ -5460,4 +5479,6 @@ int ath12k_wmi_wow_add_wakeup_event(struct ath12k *ar, u32 vdev_id,
 				    u32 enable);
 int ath12k_wmi_wow_config_pno(struct ath12k *ar, u32 vdev_id,
 			      struct wmi_pno_scan_req_arg  *pno_scan);
+int ath12k_wmi_hw_data_filter_cmd(struct ath12k *ar,
+				  struct wmi_hw_data_filter_arg *arg);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
index 330bd39f75c0..77658a01bb41 100644
--- a/drivers/net/wireless/ath/ath12k/wow.c
+++ b/drivers/net/wireless/ath/ath12k/wow.c
@@ -538,6 +538,59 @@ static int ath12k_wow_nlo_cleanup(struct ath12k *ar)
 	return 0;
 }
 
+static int ath12k_wow_set_hw_filter(struct ath12k *ar)
+{
+	struct wmi_hw_data_filter_arg arg;
+	struct ath12k_vif *arvif;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	list_for_each_entry(arvif, &ar->arvifs, list) {
+		if (arvif->vdev_type != WMI_VDEV_TYPE_STA)
+			continue;
+
+		arg.vdev_id = arvif->vdev_id;
+		arg.enable = true;
+		arg.hw_filter_bitmap = WMI_HW_DATA_FILTER_DROP_NON_ICMPV6_MC;
+		ret = ath12k_wmi_hw_data_filter_cmd(ar, &arg);
+		if (ret) {
+			ath12k_warn(ar->ab, "failed to set hw data filter on vdev %i: %d\n",
+				    arvif->vdev_id, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int ath12k_wow_clear_hw_filter(struct ath12k *ar)
+{
+	struct wmi_hw_data_filter_arg arg;
+	struct ath12k_vif *arvif;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	list_for_each_entry(arvif, &ar->arvifs, list) {
+		if (arvif->vdev_type != WMI_VDEV_TYPE_STA)
+			continue;
+
+		arg.vdev_id = arvif->vdev_id;
+		arg.enable = false;
+		arg.hw_filter_bitmap = 0;
+		ret = ath12k_wmi_hw_data_filter_cmd(ar, &arg);
+
+		if (ret) {
+			ath12k_warn(ar->ab, "failed to clear hw data filter on vdev %i: %d\n",
+				    arvif->vdev_id, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 int ath12k_wow_op_suspend(struct ieee80211_hw *hw,
 			  struct cfg80211_wowlan *wowlan)
 {
@@ -567,6 +620,13 @@ int ath12k_wow_op_suspend(struct ieee80211_hw *hw,
 		goto cleanup;
 	}
 
+	ret = ath12k_wow_set_hw_filter(ar);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to set hw filter: %d\n",
+			    ret);
+		goto cleanup;
+	}
+
 	ret = ath12k_wow_enable(ar);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to start wow: %d\n", ret);
@@ -634,6 +694,12 @@ int ath12k_wow_op_resume(struct ieee80211_hw *hw)
 		goto exit;
 	}
 
+	ret = ath12k_wow_clear_hw_filter(ar);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to clear hw filter: %d\n", ret);
+		goto exit;
+	}
+
 exit:
 	if (ret) {
 		switch (ah->state) {
-- 
2.25.1


