Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9248C761AF
	for <ath12k@archiver.kernel.org>; Mon,  3 Apr 2023 22:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrGvPTwagJB1mfmtw4TVo0bP/tGuLxX0FLlpxE5U70A=; b=sAP0OI1DUlKwnZ
	+f2sZVL9pGUa8LfSPw9LcvNF0du9Jcr3deymaMoTzUFULj7WgQqktRZIs3YidhUvO+nmkmvahTu/t
	gDzA3ED4gdzmBIZ75s0eWjoYoGnFZds82ga/IFGTeBr06j/JMennNhVxbRPSnRHIfqLAl1hnzegCw
	BKJkNnUpYRlQpVm1niO5Ph5iljZsue22NOphBzLZMCt0MjA/svI2NeN7QXoxa5+OSZVgfNXAki5jF
	a7oleL0JQoL/6tjC/+ztO37+esxQBpeWLbWrzfHEG5KtC4cd8d7axzv3dLyQNTBU3RYkLl8QvsCJ3
	6fN7Q2HnpGhNklL7SA1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjT1w-00H7o8-11
	for ath12k@archiver.kernel.org;
	Mon, 03 Apr 2023 22:52:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjT1t-00H7kv-0g
	for ath12k@lists.infradead.org;
	Mon, 03 Apr 2023 22:52:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 333LGlEq029763;
	Mon, 3 Apr 2023 22:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=v/tSsueQpqNvx4MpTSYTTpPCS7cYemCFa6c/pOJafGo=;
 b=md8+pvVtGELbgShkFJHJKGPe7tNibBHjVoyBBTTK75xuU5EKtAkn73T83N0lmKfZZ3S0
 ifjdrYqn53yVmaKDRIKi+LeBn1xW+kX39bgKq+G9DAd168gsZ2Gb33JDjcLTEgooqLa6
 YvJyeERJtsMCBVh8eajWiWCKZLkWR0V3FOTeBov9j5vqTwpwbfxW5p+cQPmbiEnA5dXc
 1/E/KmFJq3a9JGhHhk6XRQKp4OCWmhFs46ERgAj5CQ4sfrXopb8XJVctnydU1sPlGyvG
 ggtZ7NiYIXlE0dg0QNpwVmIxPgagHfvMUL5yCu254UIJNzUbzgikRXvqzTg5nsQTEZmH Uw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqteea1ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 22:52:00 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 333Mq0DZ027796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Apr 2023 22:52:00 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 3 Apr 2023 15:51:59 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH v2 10/11] wifi: ath12k: parse WMI service ready ext2 event
Date: Mon, 3 Apr 2023 15:51:45 -0700
Message-ID: <20230403225146.14139-11-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230403225146.14139-1-quic_alokad@quicinc.com>
References: <20230403225146.14139-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6F-XwOBbWHczHhqgujTMVRlRL-7B6XyD
X-Proofpoint-ORIG-GUID: 6F-XwOBbWHczHhqgujTMVRlRL-7B6XyD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_17,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_155201_253591_92BC53E5 
X-CRM114-Status: GOOD (  17.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Parse WMI service ready ext2 event.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
v2: No change from v1.

 drivers/net/wireless/ath/ath12k/wmi.c | 48 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h | 16 +++++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 319a2def5529..9634d90c559b 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -62,7 +62,23 @@ struct ath12k_wmi_svc_rdy_ext_parse {
 	bool dma_ring_cap_done;
 };
 
+struct ath12k_wmi_svc_rdy_ext2_arg {
+	u32 reg_db_version;
+	u32 hw_min_max_tx_power_2ghz;
+	u32 hw_min_max_tx_power_5ghz;
+	u32 chwidth_num_peer_caps;
+	u32 preamble_puncture_bw;
+	u32 max_user_per_ppdu_ofdma;
+	u32 max_user_per_ppdu_mumimo;
+	u32 target_cap_flags;
+	u32 eht_cap_mac_info[WMI_MAX_EHTCAP_MAC_SIZE];
+	u32 max_num_linkview_peers;
+	u32 max_num_msduq_supported_per_tid;
+	u32 default_num_msduq_supported_per_tid;
+};
+
 struct ath12k_wmi_svc_rdy_ext2_parse {
+	struct ath12k_wmi_svc_rdy_ext2_arg arg;
 	struct ath12k_wmi_dma_ring_caps_parse dma_caps_parse;
 	bool dma_ring_cap_done;
 	bool spectral_bin_scaling_done;
@@ -4085,6 +4101,26 @@ static int ath12k_service_ready_ext_event(struct ath12k_base *ab,
 	return ret;
 }
 
+static int ath12k_pull_svc_ready_ext2(struct ath12k_wmi_pdev *wmi_handle,
+				      const void *ptr,
+				      struct ath12k_wmi_svc_rdy_ext2_arg *arg)
+{
+	const struct wmi_service_ready_ext2_event *ev = ptr;
+
+	if (!ev)
+		return -EINVAL;
+
+	arg->reg_db_version = le32_to_cpu(ev->reg_db_version);
+	arg->hw_min_max_tx_power_2ghz = le32_to_cpu(ev->hw_min_max_tx_power_2ghz);
+	arg->hw_min_max_tx_power_5ghz = le32_to_cpu(ev->hw_min_max_tx_power_5ghz);
+	arg->chwidth_num_peer_caps = le32_to_cpu(ev->chwidth_num_peer_caps);
+	arg->preamble_puncture_bw = le32_to_cpu(ev->preamble_puncture_bw);
+	arg->max_user_per_ppdu_ofdma = le32_to_cpu(ev->max_user_per_ppdu_ofdma);
+	arg->max_user_per_ppdu_mumimo = le32_to_cpu(ev->max_user_per_ppdu_mumimo);
+	arg->target_cap_flags = le32_to_cpu(ev->target_cap_flags);
+	return 0;
+}
+
 static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
 				      __le32 cap_mac_info[],
 				      __le32 cap_phy_info[],
@@ -4184,10 +4220,22 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 					 u16 tag, u16 len,
 					 const void *ptr, void *data)
 {
+	struct ath12k_wmi_pdev *wmi_handle = &ab->wmi_ab.wmi[0];
 	struct ath12k_wmi_svc_rdy_ext2_parse *parse = data;
 	int ret;
 
 	switch (tag) {
+	case WMI_TAG_SERVICE_READY_EXT2_EVENT:
+		ret = ath12k_pull_svc_ready_ext2(wmi_handle, ptr,
+						 &parse->arg);
+		if (ret) {
+			ath12k_warn(ab,
+				    "failed to extract wmi service ready ext2 parameters: %d\n",
+				    ret);
+			return ret;
+		}
+		break;
+
 	case WMI_TAG_ARRAY_STRUCT:
 		if (!parse->dma_ring_cap_done) {
 			ret = ath12k_wmi_dma_ring_caps(ab, len, ptr,
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index f348ea9e325d..d457a087dc39 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -1925,6 +1925,7 @@ enum wmi_tlv_tag {
 	/* TODO add all the missing cmds */
 	WMI_TAG_PDEV_PEER_PKTLOG_FILTER_CMD = 0x301,
 	WMI_TAG_PDEV_PEER_PKTLOG_FILTER_INFO,
+	WMI_TAG_SERVICE_READY_EXT2_EVENT = 0x334,
 	WMI_TAG_FILS_DISCOVERY_TMPL_CMD = 0x344,
 	WMI_TAG_MAC_PHY_CAPABILITIES_EXT = 0x36F,
 	WMI_TAG_REGULATORY_RULE_EXT_STRUCT = 0x3A9,
@@ -2608,6 +2609,21 @@ struct ath12k_wmi_soc_hal_reg_caps_params {
 #define WMI_EHT_MCS_NSS_10_11  GENMASK(11, 8)
 #define WMI_EHT_MCS_NSS_12_13  GENMASK(15, 12)
 
+struct wmi_service_ready_ext2_event {
+	__le32 reg_db_version;
+	__le32 hw_min_max_tx_power_2ghz;
+	__le32 hw_min_max_tx_power_5ghz;
+	__le32 chwidth_num_peer_caps;
+	__le32 preamble_puncture_bw;
+	__le32 max_user_per_ppdu_ofdma;
+	__le32 max_user_per_ppdu_mumimo;
+	__le32 target_cap_flags;
+	__le32 eht_cap_mac_info[WMI_MAX_EHTCAP_MAC_SIZE];
+	__le32 max_num_linkview_peers;
+	__le32 max_num_msduq_supported_per_tid;
+	__le32 default_num_msduq_supported_per_tid;
+} __packed;
+
 struct ath12k_wmi_mac_phy_caps_ext_params {
 	__le32 hw_mode_id;
 	union {
-- 
2.39.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
