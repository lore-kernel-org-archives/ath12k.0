Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE1AC25B10
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 06:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RvVw1UoaxJXbDd58jg1MUaaXeAgzn7oYTbjGctScTI=; b=cGkKQwkg8S8kx/SkrJwZvSZctp
	rt1S294Qy6dID167wcWmcJTLIlvDWWuIivCDLIYX9cNS6EQuI+MuD6nLqi6UuAjkp/01h8X+wejAf
	VjIyqcteZqM+F2QFL4e1Dt1mHzaE67XauD5nYgZFU5HpaOzffzOLU6PZGGhckMntaSlw4lkfBKzUQ
	V1U6G2hsXn0eyl9d+12jK7gzcgm/XUqoYm/e2h7Det2LAByae77+ryWZ8hg4W9BrrnFMrtWpymW8b
	PygMAl/m1nLMCqHQNtmtFc92/pycmlgtbN3dAjEu+FljeNnZ1Txt5cm6uz/Jr8Zw70susm55KCBaE
	OcYBpX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5K3E-00000004G9h-1SXQ
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 06:48:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5K3A-00000004G6Q-0YYw
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 06:48:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44A2tguD019365;
	Fri, 10 May 2024 06:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=4RvVw1UoaxJXbDd58jg1MUaaXeAgzn7oYTbjGctScTI=; b=Fm
	bTUOPRz2xvEOfEjAa2avxoYgesFMr+A3GAXBmmJoyT4vxurEyWhzkL0rQ3Ap/cd/
	8+/HNJULC+3ndQ4JTHmFCeEK+9tFchWBYsLFq5ADe1LxLUpFuKFoFurNmk8sjUhk
	soe2X7BUoMbUDoTXtKnKyKUVDxJghoFdO3/N/SzQYxk2IOKXKWrVZ78d7vKp61hG
	IbRiFeVGb3FqAeLXWMNntCxNngpwZiL+OdZ89WZR4kKR/c0eMSXG/sgv8j9C4Z2X
	/ayRY8Dg6xw/nnwtHWbA9OIgUmL9OgSyp0xSC5trz5nteJeGUIUO9ywiNNE2L9I8
	zHaJVk4MOlWbO6hYfSqg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w1gstu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 06:48:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44A6m95j006080
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 06:48:10 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 May 2024 23:48:08 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 7/7] wifi: ath12k: handle keepalive during WoWLAN suspend and resume
Date: Fri, 10 May 2024 14:47:48 +0800
Message-ID: <20240510064748.369452-8-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240510064748.369452-1-quic_bqiang@quicinc.com>
References: <20240510064748.369452-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mgWQezjttNu0sL4K7trxIGTT_TQuxoYQ
X-Proofpoint-GUID: mgWQezjttNu0sL4K7trxIGTT_TQuxoYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_04,2024-05-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405100047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_234812_418303_8CCED82E 
X-CRM114-Status: GOOD (  20.05  )
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

With WoWLAN enabled and after sleeping for a rather long time,
we are seeing that with some APs, it is not able to wake up
the STA though the correct wake up pattern has been configured.
This is because the host doesn't send keepalive command to
firmware, thus firmware will not send any packet to the AP and
after a specific time the AP kicks out the STA.

So enable keepalive before going to suspend and disable it after
resume back.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 31 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/mac.h |  4 +++
 drivers/net/wireless/ath/ath12k/wmi.c | 38 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h | 46 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wow.c | 34 ++++++++++++++++++++
 5 files changed, 153 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index e6c63414f912..dfcd945ac2e2 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9227,3 +9227,34 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
 
 	return ret;
 }
+
+int ath12k_mac_vif_set_keepalive(struct ath12k_vif *arvif,
+				 enum wmi_sta_keepalive_method method,
+				 u32 interval)
+{
+	struct wmi_sta_keepalive_arg arg = {};
+	struct ath12k *ar = arvif->ar;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (arvif->vdev_type != WMI_VDEV_TYPE_STA)
+		return 0;
+
+	if (!test_bit(WMI_TLV_SERVICE_STA_KEEP_ALIVE, ar->ab->wmi_ab.svc_map))
+		return 0;
+
+	arg.vdev_id = arvif->vdev_id;
+	arg.enabled = 1;
+	arg.method = method;
+	arg.interval = interval;
+
+	ret = ath12k_wmi_sta_keepalive(ar, &arg);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to set keepalive on vdev %i: %d\n",
+			    arvif->vdev_id, ret);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 69fd282b9dd3..2c6cb144827a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -9,6 +9,7 @@
 
 #include <net/mac80211.h>
 #include <net/cfg80211.h>
+#include "wmi.h"
 
 struct ath12k;
 struct ath12k_base;
@@ -81,5 +82,8 @@ int ath12k_mac_rfkill_config(struct ath12k *ar);
 int ath12k_mac_wait_tx_complete(struct ath12k *ar);
 void ath12k_mac_handle_beacon(struct ath12k *ar, struct sk_buff *skb);
 void ath12k_mac_handle_beacon_miss(struct ath12k *ar, u32 vdev_id);
+int ath12k_mac_vif_set_keepalive(struct ath12k_vif *arvif,
+				 enum wmi_sta_keepalive_method method,
+				 u32 interval);
 
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index cb4ce3bca94a..3e56ee2cfaa2 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -8009,3 +8009,41 @@ int ath12k_wmi_gtk_rekey_getinfo(struct ath12k *ar,
 		   arvif->vdev_id);
 	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
 }
+
+int ath12k_wmi_sta_keepalive(struct ath12k *ar,
+			     const struct wmi_sta_keepalive_arg *arg)
+{
+	struct wmi_sta_keepalive_arp_resp_params *arp;
+	struct ath12k_wmi_pdev *wmi = ar->wmi;
+	struct wmi_sta_keepalive_cmd *cmd;
+	struct sk_buff *skb;
+	size_t len;
+
+	len = sizeof(*cmd) + sizeof(*arp);
+	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_sta_keepalive_cmd *)skb->data;
+	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_STA_KEEPALIVE_CMD, sizeof(*cmd));
+	cmd->vdev_id = cpu_to_le32(arg->vdev_id);
+	cmd->enabled = cpu_to_le32(arg->enabled);
+	cmd->interval = cpu_to_le32(arg->interval);
+	cmd->method = cpu_to_le32(arg->method);
+
+	arp = (struct wmi_sta_keepalive_arp_resp_params *)(cmd + 1);
+	arp->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_STA_KEEPALVE_ARP_RESPONSE,
+						 sizeof(*arp));
+	if (arg->method == WMI_STA_KEEPALIVE_METHOD_UNSOLICITED_ARP_RESPONSE ||
+	    arg->method == WMI_STA_KEEPALIVE_METHOD_GRATUITOUS_ARP_REQUEST) {
+		arp->src_ip4_addr = cpu_to_le32(arg->src_ip4_addr);
+		arp->dest_ip4_addr = cpu_to_le32(arg->dest_ip4_addr);
+		ether_addr_copy(arp->dest_mac_addr.addr, arg->dest_mac_addr);
+	}
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
+		   "wmi sta keepalive vdev %d enabled %d method %d interval %d\n",
+		   arg->vdev_id, arg->enabled, arg->method, arg->interval);
+
+	return ath12k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
+}
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 527bf925e603..5004f3b75aac 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -5361,6 +5361,50 @@ struct wmi_gtk_rekey_offload_cmd {
 	u8 replay_ctr[GTK_REPLAY_COUNTER_BYTES];
 } __packed;
 
+struct wmi_sta_keepalive_cmd {
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 enabled;
+
+	/* WMI_STA_KEEPALIVE_METHOD_ */
+	__le32 method;
+
+	/* in seconds */
+	__le32 interval;
+
+	/* following this structure is the TLV for struct
+	 * wmi_sta_keepalive_arp_resp_params
+	 */
+} __packed;
+
+struct wmi_sta_keepalive_arp_resp_params {
+	__le32 tlv_header;
+	__le32 src_ip4_addr;
+	__le32 dest_ip4_addr;
+	struct ath12k_wmi_mac_addr_params dest_mac_addr;
+} __packed;
+
+struct wmi_sta_keepalive_arg {
+	u32 vdev_id;
+	u32 enabled;
+	u32 method;
+	u32 interval;
+	u32 src_ip4_addr;
+	u32 dest_ip4_addr;
+	const u8 dest_mac_addr[ETH_ALEN];
+};
+
+enum wmi_sta_keepalive_method {
+	WMI_STA_KEEPALIVE_METHOD_NULL_FRAME = 1,
+	WMI_STA_KEEPALIVE_METHOD_UNSOLICITED_ARP_RESPONSE = 2,
+	WMI_STA_KEEPALIVE_METHOD_ETHERNET_LOOPBACK = 3,
+	WMI_STA_KEEPALIVE_METHOD_GRATUITOUS_ARP_REQUEST = 4,
+	WMI_STA_KEEPALIVE_METHOD_MGMT_VENDOR_ACTION = 5,
+};
+
+#define WMI_STA_KEEPALIVE_INTERVAL_DEFAULT	30
+#define WMI_STA_KEEPALIVE_INTERVAL_DISABLE	0
+
 void ath12k_wmi_init_qcn9274(struct ath12k_base *ab,
 			     struct ath12k_wmi_resource_config_arg *config);
 void ath12k_wmi_init_wcn7850(struct ath12k_base *ab,
@@ -5532,5 +5576,7 @@ int ath12k_wmi_gtk_rekey_offload(struct ath12k *ar,
 				 struct ath12k_vif *arvif, bool enable);
 int ath12k_wmi_gtk_rekey_getinfo(struct ath12k *ar,
 				 struct ath12k_vif *arvif);
+int ath12k_wmi_sta_keepalive(struct ath12k *ar,
+			     const struct wmi_sta_keepalive_arg *arg);
 
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
index 5a9a4357ae2d..bb1e3d2c425a 100644
--- a/drivers/net/wireless/ath/ath12k/wow.c
+++ b/drivers/net/wireless/ath/ath12k/wow.c
@@ -671,6 +671,24 @@ static int ath12k_wow_protocol_offload(struct ath12k *ar, bool enable)
 	return 0;
 }
 
+static int ath12k_wow_set_keepalive(struct ath12k *ar,
+				    enum wmi_sta_keepalive_method method,
+				    u32 interval)
+{
+	struct ath12k_vif *arvif;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	list_for_each_entry(arvif, &ar->arvifs, list) {
+		ret = ath12k_mac_vif_set_keepalive(arvif, method, interval);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 int ath12k_wow_op_suspend(struct ieee80211_hw *hw,
 			  struct cfg80211_wowlan *wowlan)
 {
@@ -715,6 +733,14 @@ int ath12k_wow_op_suspend(struct ieee80211_hw *hw,
 		goto cleanup;
 	}
 
+	ret = ath12k_wow_set_keepalive(ar,
+				       WMI_STA_KEEPALIVE_METHOD_NULL_FRAME,
+				       WMI_STA_KEEPALIVE_INTERVAL_DEFAULT);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to enable wow keepalive: %d\n", ret);
+		goto cleanup;
+	}
+
 	ret = ath12k_wow_enable(ar);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to start wow: %d\n", ret);
@@ -795,6 +821,14 @@ int ath12k_wow_op_resume(struct ieee80211_hw *hw)
 		goto exit;
 	}
 
+	ret = ath12k_wow_set_keepalive(ar,
+				       WMI_STA_KEEPALIVE_METHOD_NULL_FRAME,
+				       WMI_STA_KEEPALIVE_INTERVAL_DISABLE);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to disable wow keepalive: %d\n", ret);
+		goto exit;
+	}
+
 exit:
 	if (ret) {
 		switch (ah->state) {
-- 
2.25.1


