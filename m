Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F38D606A32C
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RhV549O9;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f32Ods8E;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F9FwD3nS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ROhIVQAuyVsm7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=; b=RhV549O96GjLmy
	vBUqdIZ74cOkxrMpf82UBmmwc7Y9RtUic5miPkxb0Xn+dk++ZyL+f8kI647328pQRTyNP08RWDnG0
	VeKcBy+v9g9Hft/oX5lQhotYxDA2ZRTazc953dEdE839YQXZn/Vmf3x8gsoPmAeXiCeYfzCYauyfs
	n5Atd5xwcfdcCwCPFtqE6xihed0XabeA9kJhg/kjbCPnHhKkzfbZTJCNx7E7z1YAy8fmXtLHxYy1z
	w45e4n/ImJMShGFqs9NUxVuc0p8e5ELoNLSnfRmdMPUvu6VmGYZhTgyJ7XVLT91GaWGiFmKpqBIQD
	T0lLAk/n/Qj8D9LTzgMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVez-0000000CWxP-39as;
	Thu, 26 Nov 2026 09:20:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVex-0000000CWwa-20ku
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 09:20:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7j0f0131121
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ROhIVQAuyVs
	m7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=; b=f32Ods8EqZ9wWXvLIcEQY/s0Ep9
	zmtHqX0CQv5Pve4zAV+PLcsL6iv3vdT/bdYT3BosuRL6+9tssBi7jwFtycFNCoa6
	BskUfIHUaonhpRQBSS/3vzv5L4Iuxfkx9jqZOg7IJUBcS9BO1qFIMyL8qmPfLLF0
	K+JFyhlhlIyP5O+ltd9Xc+jHV9u7fUC4qMjQmhvQnqE2f+CqRCVbz+qNl5fOTVEG
	L8RJ3jlivggNXCQrvveXoXJIdnoGSt9y9o5D2ySFSdXevH8l30rtmg7/sh+25sve
	h6sv29Rf/+7+SLVkSQNnYrkZnmCE+1t/0QHgb2a2a4nlxLwqkngNJ1wzt0w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne0bt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:20:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso5800325b3a.0
        for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 01:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684853; x=1796289653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROhIVQAuyVsm7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=;
        b=F9FwD3nSSAux9u4SfK4O2jRkRWzMazv0ZqjBuWdPw43E334RkE6TYWep+1T15EuaEK
         k+OSr/lAs3rnoY8QTITBi68FqHG+e8FMZU7S5pXCYvSeAGf3IGoH+I8w/kScrlAaYovY
         EoZqGCz8XCfI6Ydy1GGS1FBOFaOtcfODeetIKoWplhY6VuniN+qDPGVloLoT3ft0IBVe
         XTmTipC53WMgOkb9aH9OVNKI42E3LTN1UvymQ0egyKGUyxVy0WXm7/ksVs8tfAl4IEzK
         heh/3QATUJ21gu+TGuehbc9sVnm16zQNz/Y0VMb6+JvtXf72gcMC/K3agZU1+Pcg5d2Z
         3nhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684853; x=1796289653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ROhIVQAuyVsm7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=;
        b=mRiPpDyox8Tr3jEpmYdeiKdU8mBBu/LmkZyKtenD1y/jMl7JkgSAT5XtYnDJZjtq2b
         v+EK+1YKPPt+CgzIIFjldAq52Q4LnUpaNnnU3c1OFfc/ymO+vuPXG/N2NY57ppMVA+JI
         RpXU7LLL70rJQHH6L16h1gf5CDrKqMLU4uR+kIBFoAKxHC15v+uICD/dhR1APsiNXRec
         lAuBzWCBd5fDUqxkEHRml6GUk6o3cmIEoW2Ean8Ceruhl6FPw5H7eTQo7M13cUFGwFdl
         EMiLE4KWTrOc+2/AGpZOLRJQJKnhthja4EPlG4srHwvCn/TizB9ZamD3b+WWHF4416a4
         j6TQ==
X-Gm-Message-State: APuU4Z/7JoKVk1Wi2rH4dx+63ud07BCPldyCegNVYv07wmgGcfQhL4Dc
	944I9ztHCPMuggRM1XWO1yBDZcEqBg+hXvamFZq10dDIE79zbWFpvdpozyv7ekz4xSL14q8j622
	/48k2ks5xgNnOvtBfPzTiNQbsa21Mp84Zz7uH1qQg1oEIzuY+rUMM5urDveI2mP1+
X-Gm-Gg: AZFdTZfQhpCtJ3e8QA7u9TjvK2NYAntZKaEwqLkHQdaMsFifVffR8DIvDw9+B62aZRx
	3fZJSFM018CltW61qQa9KiTo4ld7Gy5wMqKk73UzUW0AbplXxvMuFnq6X5Qz0KOOBeo4Tkofw5V
	c2bpLuGufVlLD5d2xy3+KCSWCV8KzrIXmb46hsrFxgHVTJTfGQyrdIw43dOmMXkkUbE8SP2qYHN
	q7pStARZJi7ncmfPFHxh9kVgXhKzC3Nfg42EK95KjmzMNZxglRQNiJSnwLOEQYi3bris/u/JAB6
	rwBV1Aes8EAALgKM1FfQsXRuK8qMl1UejIMANlY9uAAjZzGepNBkWVeW2icmmYE9Mn1bDT/lmyT
	3IUtljoerLdybOplVFIWRpwL34wkxfW4ASELtrYtZiBAo1GUl2npKD6chiR8vgo6s9sW/go5ieF
	JewoBnydJp7m4vJL4kh5muf80dJytrprc=
X-Received: by 2002:aa7:9066:0:b0:890:9f61:6b21 with SMTP id d2e1a72fcca58-8c7de19fcd8mr15137990b3a.37.1795684853349;
        Thu, 26 Nov 2026 01:20:53 -0800 (PST)
X-Received: by 2002:aa7:9066:0:b0:890:9f61:6b21 with SMTP id d2e1a72fcca58-8c7de19fcd8mr15137963b3a.37.1795684852817;
        Thu, 26 Nov 2026 01:20:52 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:20:52 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 1/7] wifi: ath12k: add WMI response handling for MLO link set active command
Date: Thu, 26 Nov 2026 17:20:31 +0800
Message-Id: <20261126092037.462830-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
References: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b07f9f6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=se8-P38KO_-aJsBOcBAA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNSBTYWx0ZWRfX0ggw9JyurFAy
 moEEeZW9I7d2eQulYDQS64kuiW0Ltfl2uXLSSqr/IjkkphCLhP5c4R9t7dpSXaw6tbD4I17ycIN
 pVe6gTc8Kd+Jpw70x5bZt7WSsem9ay6IkGFH4gsDlwjarRKY77uiq40gLL4v4Z0IyBlir6iY4jw
 MlwcTpQL0qmXbz6+2evg8935kBC50ld5Nr6Tas61b3pnrQvL/GlpNn+prLCvs+EsXybBRrpxK6o
 j+YsHFebKojH4SyaxYhzxXZ3GazRmOd7L7p580TPY1ZqRWFo9CaJGGjrEuyHooIZ30hGmzdtDRA
 lla1MlNTVWlDdLKz9Rz/nxIHdP0vWvrzVho3b8rF90wulkSo7pTOdsfZhycrFlenrXNXu6EOyM0
 nhVvG91P6q8pg41vUiE7CiyXmJLZmwq0SEp7tuf3tYJXXAKZ5YeE0BS5FsirNrmsDinDUztM5WD
 2pnMcFCGY7WvWWz4FRQ==
X-Proofpoint-GUID: hceHyoJacyhYfOOAvjfGNkFOKWDb0sc_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNSBTYWx0ZWRfX3Xiiunt5XPFw
 olvaf+mrBMbWtV3kGi12Il45bHS3ffCHK7cxAfaNvqAV21DosJCFm1u7ZzMPRNksIxP8eseTTRs
 UzT0ngUJ3oKVGB4AnAticPK7W3ISN7o=
X-Proofpoint-ORIG-GUID: hceHyoJacyhYfOOAvjfGNkFOKWDb0sc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_012055_638909_6E2075DE 
X-CRM114-Status: GOOD (  14.64  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

WMI_MLO_LINK_SET_ACTIVE_CMDID allows the driver to tell firmware which
MLO links should be active or inactive. Add parsing and logging of the
corresponding firmware response event. Delivery of the response to the
sender is added in a subsequent patch.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 36 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h |  6 +++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f41138a7c68e..dde7721182af 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -209,6 +209,8 @@ static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_obss_color_collision_event) },
 	[WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT] = {
 		.min_len = sizeof(struct ath12k_wmi_pdev_csa_event) },
+	[WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT] = {
+		.min_len = sizeof(struct wmi_mlo_link_set_active_resp_event) },
 };
 
 __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
@@ -9710,6 +9712,37 @@ static void ath12k_wmi_gtk_offload_status_event(struct ath12k_base *ab,
 	rcu_read_unlock();
 }
 
+static void ath12k_wmi_event_mlo_link_set_active(struct ath12k_base *ab,
+						 struct sk_buff *skb)
+{
+	const struct wmi_mlo_link_set_active_resp_event *ev;
+	u32 status, use_ieee;
+	const void **tb;
+	int ret;
+
+	tb = ath12k_wmi_tlv_parse(ab, skb);
+	if (IS_ERR(tb)) {
+		ret = PTR_ERR(tb);
+		ath12k_warn(ab, "failed to parse mlo link set active resp: %d\n", ret);
+		return;
+	}
+
+	ev = tb[WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT];
+	if (!ev) {
+		ath12k_warn(ab, "mlo link set active resp event tag not found\n");
+		return;
+	}
+
+	status = le32_to_cpu(ev->status);
+	use_ieee = le32_to_cpu(ev->use_ieee_link_id_bitmap);
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI,
+		   "mlo link set active resp status %u use_ieee 0x%x\n",
+		   status, use_ieee);
+
+	/* Response delivery to waiters will be wired up in a subsequent patch */
+}
+
 static void ath12k_wmi_event_mlo_setup_complete(struct ath12k_base *ab,
 						struct sk_buff *skb)
 {
@@ -10504,6 +10537,9 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 	case WMI_GTK_OFFLOAD_STATUS_EVENTID:
 		ath12k_wmi_gtk_offload_status_event(ab, skb);
 		break;
+	case WMI_MLO_LINK_SET_ACTIVE_RESP_EVENTID:
+		ath12k_wmi_event_mlo_link_set_active(ab, skb);
+		break;
 	case WMI_MLO_SETUP_COMPLETE_EVENTID:
 		ath12k_wmi_event_mlo_setup_complete(ab, skb);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 843f1d11f9c8..68dd13cafe51 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2016,6 +2016,7 @@ enum wmi_tlv_tag {
 	WMI_TAG_VDEV_SET_TPC_POWER_CMD = 0x3B5,
 	WMI_TAG_VDEV_CH_POWER_INFO,
 	WMI_TAG_MLO_LINK_SET_ACTIVE_CMD = 0x3BE,
+	WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT,
 	WMI_TAG_EHT_RATE_SET = 0x3C4,
 	WMI_TAG_DCS_INCUMBENT_SIGNAL_INTERFERENCE_TYPE = 0x3C5,
 	WMI_TAG_MLO_TX_SEND_PARAMS,
@@ -6496,6 +6497,11 @@ struct wmi_mlo_link_set_active_arg {
 	struct wmi_ml_disallow_mode_bmap_arg disallow_bmap[WMI_ML_MAX_DISALLOW_BMAP_COMB];
 };
 
+struct wmi_mlo_link_set_active_resp_event {
+	__le32 status;
+	__le32 use_ieee_link_id_bitmap;
+} __packed;
+
 #define ATH12K_MAX_20MHZ_SEGMENTS	16
 #define ATH12K_MAX_NUM_ANTENNA		8
 #define ATH12K_MAX_NUM_NF_HW_DBM	32
-- 
2.34.1


