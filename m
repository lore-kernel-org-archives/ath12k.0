Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E88606A338
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 02:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tPJxkoHl;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwOL1vfC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S4ZGadzo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ROhIVQAuyVsm7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=; b=tPJxkoHl5YqOgU
	ZIEHIWj9gNauJmQXA1eA2YlvWp2KneQB8mrCEm+V4Zq+/BtkAOMqZgUCHZPrk1EXnpg5yobAWi6iM
	buRQ5WJfhmgQO58a86exYhNVVsbUHtqgjEjPCzmef3Gimuxa7+JI14wZJLsgKZecsmSEvkaKO6crB
	T0S0W17UoHr3bHJkHGJJUjcfj1Fj7aHwqHfx90UgxBLYtSG8+ZY/F8d0gtNo4GF7TnbUT+BcNzJdj
	vp/THM9urv/SHcDlHGSROsBbtPLlKoTE9rktsY9qnYWEnTxcoMc2Hjjp2YjLZp6yeYLIL7+g17ARy
	BJLbGz73I101I1l12eag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVq9-00000007ZB9-3FUm;
	Wed, 18 Nov 2026 02:56:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVq7-00000007Z8s-0Zro
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 02:56:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VBQB1990002
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ROhIVQAuyVs
	m7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=; b=YwOL1vfCa7EjncgYmA1gq6QqOcj
	A+JtBQ9mZpVnpNGsz7WHFfSE7eUSGocydHl8g+oJ+Slfy6UshYifok7SG69nHTX8
	LDl9I5Is1wvxc8vBHbHoK2cpBTyBU2YoAkX/0oJWzK+PRM951wEgBFIePTYcqNX5
	LnEo3H3/1TgsoBA1WJ2VWrB62e0t1GZserMxYtCVvn9ojvWKMcV5WzkeouqV8isX
	XmSwqdXfI+mXuSTt8ehmxDUEqBNXBIQ1TueAoXvJiTD8/AU0iAHcTeqSb8xty3WZ
	5gG1keJBmhnlm25FjXEK1kVyBoqlaMUGF7eFipNX8aFc5a4x0rYkrlMPiCg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8gugd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:56:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so4264095ad.0
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 18:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970561; x=1795575361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROhIVQAuyVsm7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=;
        b=S4ZGadzoGXmNHhvV5XK2MxtrTOK8N0a8enGd0uWs04kjrPD9BxrBRXBWGpQrnFc7FK
         x2l5vGoYhrsWtSBgiiSO6j0fgqZczXsujGHkDCU7LKZZ/mTvqxB5v8rEry4zviOKIA3x
         myuFpghMZ9aP6jjTSWi+Z8eN2tpScd5MUSnSWFz28MSVPS1kDRWwpHSSjsi8Iw8k8Iv0
         iVohKPgmQsaC3PNG6AraDB2EefCI9lxZmJChPynxzKW9VY3VWkjf/SxIGROuTPDYHmWT
         tGnvJNTk4kTgJDvWzXfRjszT4AnmCSKbetoaMGFSzNX5dPm7oi8Cm7x+xSfvvTwEG+72
         feNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970561; x=1795575361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ROhIVQAuyVsm7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=;
        b=b0l4FGo2s7yftUwy1tVzxdEl573zs3NGeDpQj0KuJcC0wxWwDH5heD61dNTxLjcyF0
         Mn2UalLgTYPrQ4/Ddld8D45YO4r6VZRAyF7xzqjrzQX5pXT7iAWafXZUMy+PvAHGR6fo
         WIGhHd7ubkRnucpvo/A+8ZTU+P7TK3QZbaLQGd2OgzDI5lt2KkjKaMMcGTbZtwHwas4F
         ciIWyyO3I7TvP7qdR+6Xl2ntMCV/Xeix7BTDrdBMr+lit0Ga4naBf/xAfVI67zdRIz5t
         J2bPoSKmKS8BpbqcQlLeeU4crMTx0tE8p11H3R/bh7LAoQjrZeyQnYYnNzwKbBKGcv61
         GeWw==
X-Gm-Message-State: APuU4Z+RwXDwBDuo0xRKOI80jPCBtnDuJPXHSI2we02ttgUQg2lAirX7
	Qo+xzBdDdPOs0kzQDLOvRnCM+uHPxLMGxAsX6H5KBeOmZtGoJfu7dQs95qnNDRxnHSmNkikG4zj
	hIuS98og67CFn2k/PbEdsufaBfY8ubHv2PFaC/vgsCLAnAiKBpT1/jhUHqLtCpveHHym3xpvRjK
	c=
X-Gm-Gg: AZFdTZdIv45LSkxeRfFmFocLHIn4OASAI0c26AZd/vSeHrPyzy1yxD3B0Py99O20lMi
	sTb4DUvR/JIsyRhXCjGKegUDSOq4IGuVJnCvyHWGlo25v10grZ960rgy3pzdplKYA06mXTGFDyg
	fu81PYjFP2KBwI2YeqrCK2iGKDFC/r6saoFFaqVEyK4BNzlTBBQz/NGfhXTp7UBV1tA3i9FDG0v
	vLxOON985gn+r2NZXDc5Mihky1nsy8g5dqXoOTXVq11Lit6obluIHf9b6wzNl3sdeDcS2mwgm1E
	XTEQ6ekLrWi0N438hzrxhH2v5YjFdb1NhRXwrTNy20RrC7Kf7CFlTBZpS8VpuOzhurci+0yU87t
	cYZuskl/3Kp+53KOUSqO+vAkc0s8EGsAM2krV/lzSpbXT4PYTFLagQQDMQ5YxJScbFkZrW3BWk+
	y0LO2sacPFtBEMDSUsBRrCowm116XdupQ=
X-Received: by 2002:a17:902:ef47:b0:2e9:87a2:b4f8 with SMTP id d9443c01a7336-2eff7403e84mr11546945ad.29.1794970560764;
        Tue, 17 Nov 2026 18:56:00 -0800 (PST)
X-Received: by 2002:a17:902:ef47:b0:2e9:87a2:b4f8 with SMTP id d9443c01a7336-2eff7403e84mr11546725ad.29.1794970560263;
        Tue, 17 Nov 2026 18:56:00 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:55:59 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 1/7] wifi: ath12k: add WMI response handling for MLO link set active command
Date: Wed, 18 Nov 2026 10:55:14 +0800
Message-Id: <20261118025520.39269-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WhA-8oQB8a1E8g-mC0apfm1Mzkhcq3AY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX4H9Xj/n6HXl4
 xVf/v3b765uL84HnpnUX7DhI7ncRPbyNq6vix2D7SQOjycH13hmrNGVxb4DXHbu+viTR7qztisp
 8tlBSGXtz8ZEhdRFtIdPHlp/ThqMLu8=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd13c1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=se8-P38KO_-aJsBOcBAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX+58fwZdssRXd
 EOVpB8dgy70DJdnwZZmKeGrXLVAiOXn/g5U20dcYtUi5NW/3P7JMRz6aILo4ezbT5cCcUGZ2tku
 NfTzt2IZH/FtQO+MgImxFdxIbXdyJw6J0iQcv05bdnSidHaUEezBiqN+muL6ix0+4BcGRAbqAVE
 UBLw3m9N64d7npYnZoVL6bXjQwlYPMcalehMtl8MgV1xUws9RPF4HeZGeprr3o0IULwRTXuNBCK
 S+A7aFUY7V1Erq7levJjXMF1jJtLbAaSi6i4y8csYhWIgwSCWBsPxywh0KGoFHR2f697buBfpVr
 K+m1+QyHlEinSLZSQywhVHA2zkuzBWa4uAmeVeCp+sI9XzGQ7eyT0ioYvaqZR2gzX41qwS7aQNa
 j5aUsY2F0XnS5bfUFZ4rN9rdC1ASxhLTyxqb6f41axbSE+a6XJSbak3jQebgOdSHu6oX1Z8h2w+
 Be+wrvwCfokjJnQGEeA==
X-Proofpoint-ORIG-GUID: WhA-8oQB8a1E8g-mC0apfm1Mzkhcq3AY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_185603_300330_F70DC833 
X-CRM114-Status: GOOD (  14.92  )
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


