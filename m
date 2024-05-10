Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB7FC25B77
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 06:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOXCShSy/h3E2fFg04vIkPM4vk3ebhYHa6SlDGS/kOY=; b=MaN+xeqa4utN6Rhi+EdrYGyBwE
	kwF/ysEGrktxl6/YGuHCfkQP2hZPVHeFGAb6wGjkjW+2b3CS+dTIsa58/9qpqNCCMzIEZv5YvcJEf
	MV9ecP2BJjrbllXznJRwCA9QLXg3FlaS+0jt6sPIkcrLCQAqayzc/PIynGAF00qdxLIsOLWRbv1eC
	k4ckIG8/ICLaT+00VMWVQtaNqYX48HaVoWqG5LLtChhrpJ2cmmCiFlFPbVuleXxvhXHfF8VIa/bGM
	wlkaEdfnF4tvPzMxdUGmp8haVD3n7G+wic57Su6LdG538ofR7aWS/np8cyYAz2HmhNr6G1NAjynkM
	6J921JcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5K39-00000004G6i-3K5B
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 06:48:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5K36-00000004G4t-02a4
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 06:48:10 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44A2tpTe025178;
	Fri, 10 May 2024 06:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=WOXCShSy/h3E2fFg04vIkPM4vk3ebhYHa6SlDGS/kOY=; b=R1
	TtGlOqZYXZkQZ4xWXAwKZ9XOQvhdOyhAo73lyzv6RGwQmuOQRC03szJFeRKyYxyr
	V3gGOIDhWvAy8k/JJWPZ25zqmlMcCArc28JFrm89+czqrNZ+6w6GVwS2El7ms4nA
	sSr1M+WktB7w/EN80dj85HpgnhoJ2r6EPnwPKTwDcQd3fLQQmyF7f4A1x2bCXMp5
	u9ghmIV7iS+1uorORDbKPiYaxXBrCTVNUJsIVdYCuGs4ylCe+9IP+SE8GYKDG4/I
	2XouxD78kCAh5FCcA5Z36qJZPdtQASQeMJ69nZYOCcSqUV0eZC/cYuKk2VFhHsS6
	UjOqaxMkgnGH8pKJK1dg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w28sfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 06:48:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44A6m5bf004640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 06:48:05 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 May 2024 23:48:04 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 4/7] wifi: ath12k: implement hardware data filter
Date: Fri, 10 May 2024 14:47:45 +0800
Message-ID: <20240510064748.369452-5-quic_bqiang@quicinc.com>
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
X-Proofpoint-GUID: p2hYX0qjoxkEHacOXWzIiv39BfuAVkW6
X-Proofpoint-ORIG-GUID: p2hYX0qjoxkEHacOXWzIiv39BfuAVkW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_04,2024-05-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0 mlxlogscore=961
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405100046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_234808_370252_C3046381 
X-CRM114-Status: GOOD (  14.68  )
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
---
 drivers/net/wireless/ath/ath12k/wmi.c | 31 +++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h | 21 +++++++++
 drivers/net/wireless/ath/ath12k/wow.c | 66 +++++++++++++++++++++++++++
 3 files changed, 118 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f337f2197578..b59949cc1a93 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7392,6 +7392,37 @@ void ath12k_wmi_detach(struct ath12k_base *ab)
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
index 3d01562a43f6..96460116c072 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -5263,6 +5263,25 @@ struct wmi_wow_nlo_config_cmd {
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
@@ -5426,4 +5445,6 @@ int ath12k_wmi_wow_add_wakeup_event(struct ath12k *ar, u32 vdev_id,
 				    u32 enable);
 int ath12k_wmi_wow_config_pno(struct ath12k *ar, u32 vdev_id,
 			      struct wmi_pno_scan_req_arg  *pno_scan);
+int ath12k_wmi_hw_data_filter_cmd(struct ath12k *ar,
+				  struct wmi_hw_data_filter_arg *arg);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
index 6b61f5da7933..968bd884687f 100644
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


