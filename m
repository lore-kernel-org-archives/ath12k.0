Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EF2C25B78
	for <ath12k@archiver.kernel.org>; Thu, 30 May 2024 07:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBN+fVqAItuKnCGlMNtU49sdo2swJDQQdUObtZYsByA=; b=0rS00W3RSLdN+GVj8FzlhFOXRA
	pz/xYsLPzJJd5xsWTvhoyui1MK3zNVZwYsMZZ46gDcLsA189xNS1UV2Dp9ku0hs5D7gN5Xg2PlzJU
	O073qm0lNigpY6zlj5WSl9rEue8rpRhHvA8k3eg3gQpfpCcWBkEiRGNOMHFJYgb500hNZZZwf7akH
	+YAaLrQ562j6iDcDXVKjtzN0x4K/5y/mTjOjkQOz6twOpzYaSZhQz+dT1+AH2L71FbPgQ8piC83eu
	sMKDdkAWGauK2iaOJlDrkju7BaWIoNDE5uCIfvKVEZG3zVaUleYrCMhFVvPjdcOQ3UzzH2GFIxKJs
	O1idssrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCaCP-00000006Vu6-3SJy
	for ath12k@archiver.kernel.org;
	Thu, 30 May 2024 07:27:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCaCE-00000006VlO-1PQN
	for ath12k@lists.infradead.org;
	Thu, 30 May 2024 07:27:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TK66l0026099;
	Thu, 30 May 2024 07:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NBN+fVqAItuKnCGlMNtU49sdo2swJDQQdUObtZYsByA=; b=b/EEu3ibfqQdQmF7
	/Ie/VKolbm1XIzgBtWv1oNkllAuYPodAVQ2w+8dXyFg9hjK+6LauhBm2xDsm8BiX
	evJgbec1x0Es+WKoZmQFq13kHMeKkFWsGyFeS3guo3afhSDp+hJyg0obYT5adJQA
	pY97dzoUAMUF1VLr1h7zn//h8+KsdNGgPwoJE+rqMfgtphhwVI0OZVQ4ZP5Xp+Bz
	EeFTbWj2grQSD4ZMzH4suE4yLF7xWc+ciSt16NK8EdXel0MwhHhweE+kIQXaycDv
	UKXZC8cWqhm4n+42fn4rnVWgmPiVEeYrOGwGw0j5/VfjcfR9rNQUDFo+5KGJfcvz
	bBgm5w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yjbda7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 07:27:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44U7RWoY024983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 07:27:32 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 30 May 2024 00:27:30 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH v3 5/8] wifi: ath12k: implement hardware data filter
Date: Thu, 30 May 2024 15:27:11 +0800
Message-ID: <20240530072714.25671-6-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240530072714.25671-1-quic_bqiang@quicinc.com>
References: <20240530072714.25671-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hcEjlX4lnr7V4XyqhzjXew7mdhg-x93l
X-Proofpoint-ORIG-GUID: hcEjlX4lnr7V4XyqhzjXew7mdhg-x93l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_05,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=967 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_002734_736177_B196BA8F 
X-CRM114-Status: GOOD (  15.41  )
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
index 63ce1c76b82c..851f320e73c7 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7422,6 +7422,37 @@ void ath12k_wmi_detach(struct ath12k_base *ab)
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


