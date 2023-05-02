Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7DEC77B73
	for <ath12k@archiver.kernel.org>; Tue,  2 May 2023 14:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nz5F+0Hb+0kxCHCZzjkl+oqsNtVeWB7QGXdusP8gK68=; b=xzxqnJOKapPMLB
	hxwBdrLMrR/RoaJ/gdcfFCFjWDMD8D3pwR1nedG1Hq+9CLC/DIkmBaRwQCRWGAX8bXwDTbq52g74V
	3VQvsmBiejjIWdOs3szQ+dW2S8/5Y2b1tWTbnHfSj5WRvs/ARAF6w4vSQMrwdGdBE7sw/r0EKmVLX
	jgxojeQY/i/mREAt2wLPqzOVxiIQpgL7ynQavdXFCqYfMrLlqpBRvkCGi/EkK0kEQ07nnydRWR0Ur
	rYreZV3NzzvacliPf/3Lc0uK4zzOhVnK0TaFEM5sE+y7TUxVRZ9q5KQokfrkB6EaRu4eahKxxeAQa
	QTGTELApTUB3lil8eAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptqrq-001nuv-0S
	for ath12k@archiver.kernel.org;
	Tue, 02 May 2023 14:20:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptqrm-001ntA-0G
	for ath12k@lists.infradead.org;
	Tue, 02 May 2023 14:20:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 342Cf1nc002956;
	Tue, 2 May 2023 14:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=igYnEbqouOca/khF5lBjPXOrEjknq3yuc6tNWZXMYpE=;
 b=TFN0IhFjRPdLiScPSIWksQyfCUVkWdFIdatf15/IUaHvr/w1FExptqzOvo1DmpHxSxM9
 aqHvbJac5lC8en+t/usqxTW0IUjGwF+7Sm7UXhIyVbJMCzV3OoLdu7bOI6UlKwJN3N5u
 vs4e2h6GsQUWJ7cyK+vHoJkaouQD3mH7JXcG7qtUnNuEk15X9TGNQCNNjMooUYrGJUfk
 b5C4nih5ROjsHaTOVICEjzbUYcAqTaJ1X9Yq2Mn298C6V2B2iG+6BJdMCZ0Yat6XmncK
 Eo1eckLDX+SESd+yf2LgceMEIutvIBoX1GT7De8BR2+QLJ2OV4nYmVRPAu8qhG+2m8/Z JA== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qajdp28r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 May 2023 14:20:26 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 342EKMTp007604;
	Tue, 2 May 2023 14:20:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3q8vakummn-1;
	Tue, 02 May 2023 14:20:22 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 342EKMHC007596;
	Tue, 2 May 2023 14:20:22 GMT
Received: from rgnanase-linux.qualcomm.com (rgnanase-linux.qualcomm.com [10.201.162.135])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 342EKM8u007595;
	Tue, 02 May 2023 14:20:22 +0000
Received: by rgnanase-linux.qualcomm.com (Postfix, from userid 2378837)
	id 7EEF41100068; Tue,  2 May 2023 19:50:21 +0530 (IST)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <quic_ppranees@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH] wifi: ath12k: Add support to parse new WMI event for 6 GHz regulatory
Date: Tue,  2 May 2023 19:50:18 +0530
Message-Id: <20230502142018.20301-1-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iuGAyZ4t90fimvLkRQHwh02nTgtlHbbR
X-Proofpoint-ORIG-GUID: iuGAyZ4t90fimvLkRQHwh02nTgtlHbbR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_08,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_072030_267284_1AD34C1A 
X-CRM114-Status: GOOD (  18.88  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: P Praneesh <quic_ppranees@quicinc.com>

In order to support different power levels of 6 GHz AP and client,
new WMI event for regulatory (WMI_REG_CHAN_LIST_CC_EXT_EVENTID) has been
added in firmware to provide new parameters required for 6 GHz regulatory rules.

Firmware advertises its capability of handling new event in WMI service ready
event. Based on that, host needs to set host_service_flags in WMI init command
to indicate that host supports processing of this WMI event.
Based on advertised host capability, firmware sends event (WMI_REG_CHAN_LIST_CC_EXT_EVENTID).
This new event contains 2G/5G/6G reg rules with additional power value
fields for 6GHz and regd is built accordingly.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 95 +++++++++++++++++----------
 drivers/net/wireless/ath/ath12k/wmi.h |  8 ++-
 2 files changed, 68 insertions(+), 35 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 03fbe078ebe7..d972df7f21a5 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -3194,8 +3194,8 @@ ath12k_wmi_copy_resource_config(struct ath12k_wmi_resource_config_params *wmi_cf
 	wmi_cfg->sched_params = cpu_to_le32(tg_cfg->sched_params);
 	wmi_cfg->twt_ap_pdev_count = cpu_to_le32(tg_cfg->twt_ap_pdev_count);
 	wmi_cfg->twt_ap_sta_count = cpu_to_le32(tg_cfg->twt_ap_sta_count);
-	wmi_cfg->host_service_flags =
-		cpu_to_le32(1 << WMI_RSRC_CFG_HOST_SVC_FLAG_REG_CC_EXT_SUPPORT_BIT);
+	wmi_cfg->host_service_flags = cpu_to_le32(tg_cfg->is_reg_cc_ext_event_supported <<
+				WMI_RSRC_CFG_HOST_SVC_FLAG_REG_CC_EXT_SUPPORT_BIT);
 }
 
 static int ath12k_init_cmd_send(struct ath12k_wmi_pdev *wmi,
@@ -3403,6 +3403,10 @@ int ath12k_wmi_cmd_init(struct ath12k_base *ab)
 	struct ath12k_wmi_base *wmi_sc = &ab->wmi_ab;
 	struct ath12k_wmi_init_cmd_arg arg = {};
 
+	if (test_bit(WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT,
+		     ab->wmi_ab.svc_map))
+		arg.res_cfg.is_reg_cc_ext_event_supported = 1;
+
 	ab->hw_params->wmi_init(ab, &arg.res_cfg);
 
 	arg.num_mem_chunks = wmi_sc->num_mem_chunks;
@@ -6011,47 +6015,72 @@ static void ath12k_vdev_install_key_compl_event(struct ath12k_base *ab,
 	rcu_read_unlock();
 }
 
-static void ath12k_service_available_event(struct ath12k_base *ab, struct sk_buff *skb)
+static int ath12k_wmi_tlv_services_parser(struct ath12k_base *ab,
+					  u16 tag, u16 len,
+					  const void *ptr,
+					  void *data)
 {
-	const void **tb;
 	const struct wmi_service_available_event *ev;
-	int ret;
+	u32 *wmi_ext2_service_bitmap;
 	int i, j;
+	u16 expected_len;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
-	if (IS_ERR(tb)) {
-		ret = PTR_ERR(tb);
-		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
-		return;
+	expected_len = WMI_SERVICE_SEGMENT_BM_SIZE32 * sizeof(u32);
+	if (len < expected_len) {
+		ath12k_warn(ab, "invalid len %d for the tag 0x%x\n",
+			    len, tag);
+		return -EINVAL;
 	}
 
-	ev = tb[WMI_TAG_SERVICE_AVAILABLE_EVENT];
-	if (!ev) {
-		ath12k_warn(ab, "failed to fetch svc available ev");
-		kfree(tb);
-		return;
-	}
+	switch (tag) {
+	case WMI_TAG_SERVICE_AVAILABLE_EVENT:
+		ev = (struct wmi_service_available_event *)ptr;
+		for (i = 0, j = WMI_MAX_SERVICE;
+		     i < WMI_SERVICE_SEGMENT_BM_SIZE32 && j < WMI_MAX_EXT_SERVICE;
+		     i++) {
+			do {
+				if (le32_to_cpu(ev->wmi_service_segment_bitmap[i]) &
+				    BIT(j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32))
+					set_bit(j, ab->wmi_ab.svc_map);
+			} while (++j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32);
+		}
 
-	/* TODO: Use wmi_service_segment_offset information to get the service
-	 * especially when more services are advertised in multiple service
-	 * available events.
-	 */
-	for (i = 0, j = WMI_MAX_SERVICE;
-	     i < WMI_SERVICE_SEGMENT_BM_SIZE32 && j < WMI_MAX_EXT_SERVICE;
-	     i++) {
-		do {
-			if (le32_to_cpu(ev->wmi_service_segment_bitmap[i]) &
-			    BIT(j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32))
-				set_bit(j, ab->wmi_ab.svc_map);
-		} while (++j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32);
+		ath12k_dbg(ab, ATH12K_DBG_WMI,
+			   "wmi_ext_service_bitmap 0:0x%x, 1:0x%x, 2:0x%x, 3:0x%x",
+			   ev->wmi_service_segment_bitmap[0],
+			   ev->wmi_service_segment_bitmap[1],
+			   ev->wmi_service_segment_bitmap[2],
+			   ev->wmi_service_segment_bitmap[3]);
+		break;
+	case WMI_TAG_ARRAY_UINT32:
+		wmi_ext2_service_bitmap = (u32 *)ptr;
+		for (i = 0, j = WMI_MAX_EXT_SERVICE;
+		     i < WMI_SERVICE_SEGMENT_BM_SIZE32 && j < WMI_MAX_EXT2_SERVICE;
+		     i++) {
+			do {
+				if (wmi_ext2_service_bitmap[i] &
+				    BIT(j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32))
+					set_bit(j, ab->wmi_ab.svc_map);
+			} while (++j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32);
+		}
+
+		ath12k_dbg(ab, ATH12K_DBG_WMI,
+			   "wmi_ext2_service_bitmap  0:0x%04x, 1:0x%04x, 2:0x%04x, 3:0x%04x",
+			   wmi_ext2_service_bitmap[0], wmi_ext2_service_bitmap[1],
+			   wmi_ext2_service_bitmap[2], wmi_ext2_service_bitmap[3]);
+		break;
 	}
+	return 0;
+}
 
-	ath12k_dbg(ab, ATH12K_DBG_WMI,
-		   "wmi_ext_service_bitmap 0:0x%x, 1:0x%x, 2:0x%x, 3:0x%x",
-		   ev->wmi_service_segment_bitmap[0], ev->wmi_service_segment_bitmap[1],
-		   ev->wmi_service_segment_bitmap[2], ev->wmi_service_segment_bitmap[3]);
+static int ath12k_service_available_event(struct ath12k_base *ab, struct sk_buff *skb)
+{
+	int ret;
 
-	kfree(tb);
+	ret = ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
+				  ath12k_wmi_tlv_services_parser,
+				  NULL);
+	return ret;
 }
 
 static void ath12k_peer_assoc_conf_event(struct ath12k_base *ab, struct sk_buff *skb)
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index a8b972493fbb..43a7eef3f3f9 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2148,7 +2148,10 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_FREQINFO_IN_METADATA = 219,
 	WMI_TLV_SERVICE_EXT2_MSG = 220,
 
-	WMI_MAX_EXT_SERVICE
+	WMI_MAX_EXT_SERVICE = 256,
+
+	WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT = 281,
+	WMI_MAX_EXT2_SERVICE,
 };
 
 enum {
@@ -2333,6 +2336,7 @@ struct ath12k_wmi_resource_config_arg {
 	u32 sched_params;
 	u32 twt_ap_pdev_count;
 	u32 twt_ap_sta_count;
+	bool is_reg_cc_ext_event_supported;
 };
 
 struct ath12k_wmi_init_cmd_arg {
@@ -4665,7 +4669,7 @@ struct ath12k_wmi_base {
 
 	struct completion service_ready;
 	struct completion unified_ready;
-	DECLARE_BITMAP(svc_map, WMI_MAX_EXT_SERVICE);
+	DECLARE_BITMAP(svc_map, WMI_MAX_EXT2_SERVICE);
 	wait_queue_head_t tx_credits_wq;
 	const struct wmi_peer_flags_map *peer_flags;
 	u32 num_mem_chunks;
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
