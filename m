Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE46C43458
	for <ath12k@archiver.kernel.org>; Wed,  1 Jul 2026 04:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ycXyi+wv38YvNjsM48RPX109avL7iaPl7sHkupEPGpg=; b=H0JX2TO3YLUTOp+qJ0phlqC3Sg
	7hBy5eV0BlykU08uQe4x/Sueirx/u82UQVqfH57/89wkkkg/wBGr0iq9W4YWYkarEJhHqoHLKK3nb
	+DqL5pDsPPP+MuLbyBEOQ98FPhHoOsTR3VtI/vVNNr5C9h7oKsfbB5toQqmUbvqe+Jy2J1FvBvQlt
	RIlbPe9x2qvGsyclo3MON7Wj0LjIcTAWaaU75tLsuD8tSM7jWigqrQzv7Ipz/gigtnZUalyyt3xyZ
	S8R/CG6PVZo4JYrGSIDgSoYU4K2xlaMeBXXnUUTh8Ai/adEbc9TBRzBJtnw3G4uDvms3KKTRw6IgZ
	MWQYzqJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wemN7-00000000cmJ-0xuF;
	Wed, 01 Jul 2026 04:16:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wemN3-00000000clk-075c
	for ath12k@lists.infradead.org;
	Wed, 01 Jul 2026 04:16:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6612tNLY3933539
	for <ath12k@lists.infradead.org>; Wed, 1 Jul 2026 04:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ycXyi+wv38YvNjsM48RPX109avL7iaPl7sH
	kupEPGpg=; b=kedfVAW9aDSOcYC+Fu+MXXG2ZQtm8sPFKvvsFZ4uTpLb/b92/VP
	IiaL4p328tsJXUiA1z7hd10J1D6lEfZlYNp2baCHvVUIfiOJQm7QmrVUblyFjwXk
	8rY+mtYWzZjxR//KykmTmYKKLK4l/Mjb5mBWN0azp4AdRbyT4B4oq0F3ey8xMg6G
	NR1NRo9ptB5nH13H2PtTDbFEzj3aubTxyXw16PWH0pbeD7qBz5M02kkDK9CzWzqu
	5mJtIh6yxmqB+T3R3xdo/ySZjLI3sbyRN5K/oo/j0eXh4uFk7szR5Py5a4BX7LMN
	3S7ff5BU4WML2XLHjHOTx2cYLdYYyB6sDGw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc0b7mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 01 Jul 2026 04:16:19 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b70ca7e5so523867c88.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782879379; x=1783484179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ycXyi+wv38YvNjsM48RPX109avL7iaPl7sHkupEPGpg=;
        b=O/ZhGdpMifXlnYt/+fCQ/5WjlcyfXmNcRKn2XInCWNLBl/fQN/g4mWR/EqYV5Hl4Ug
         KWfQGeavkD9AvF3ALfZLVv0deqjpYXxOYjDfpkvMRPpGVrJFmTXQZjsD7RgJFhddlbPi
         IXmRCoLVg65o7VNiuB76hhI4IcktUCcmMk7IJQcf+/HjQZjOvRdxzprW6FHyGShGJ/Gy
         EH6pwFFEeoGkH4wyyRbrrXpECGKvYI+tDv9m+zukhDyq+ChTWPpCJgjTwkbRw4nChUNF
         5s3ITQSn/ZnsFGPJVnW3dKYViaU4KrCOIBOb+Sjc9ozQgcYiOyOty+j67t1YBpLimtyU
         tl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782879379; x=1783484179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycXyi+wv38YvNjsM48RPX109avL7iaPl7sHkupEPGpg=;
        b=sb4UwgN7y1pxLNtQy5j1RNhcV0ItoU//dur7A6OC4kYkGCK/OsrbM+FGu9B0E69lDW
         yWaSu2cYGH++cOLHE+ScmbHOJSC9Mjw9QUlq6YCUq0UXMRAdjK4+KFyYKO/rK54oNgYh
         rtnCoNz3FXPkCw7qpaxAsWL/SsCrDWF2JjUNlPaBu2EwFuP69Mf4jjJbmaeWydhEZ3Mf
         /39soHwlJRmiM6wBCKDQJPV7T747zwz9+6cvvj0gJRbZ9gLMqCow3CtSPG23oNcdlT8G
         ThNAQ9LwDntkn8ObScBe4YZQlTMnAMfOxicfT8hzVg0ssNV8+sXZ10v/sXoiZHgS7eaT
         //Vw==
X-Gm-Message-State: AOJu0YyX6hbh3/3QRp6vm3Zq/KLvnBMqM4dFMmJmcceLF8BLAlcV5oBs
	Q9nCr30rQfU9JP2mkIJEQ2ayblQfvSNV6NteWyxHgAsieDyhOik0s4sBirIe8VMs2U9A8O3oj//
	/3lNk3u3xIRnXIL4tA5BaskoIdSf9kVxsCPHnJSXWcFVKVl2UvyOQQoAs3A0IiysGkq3Wik6p
X-Gm-Gg: AfdE7cnusxSnNQaL0UOOmGza8Bl34XHnkUQAffHtq90mWdXghhnwSjnP04LUkTwyE7D
	SObhVJ1zhzVW0MHXMZHgPNFiREX98Ng8KocjZkwskrjybBKV20M4NEN9Z5TG3+bXiAD2d56+HZx
	6W9s1ySK4dMAkpqhQmpAlB0wHjFQSUUsJtd/G/gcDijnHOPNrtxTHC72ZKouKAhjy/vkHk3dgN/
	F0ZDzL16AinHWb2tNJubi6BtWdgrjUpiEfklblXgBFMJhkmZbpBAeeXLwfLByIbVEqsVPMIbk9k
	Us2WKz0g8pAn98Y/h8rmSnXjoQ+kVTv6ZibOmDPG0ld5q6JuzvIM7hv8x72cig5L5izyYS1MQt9
	07ZGkIOa3QHwKksDDX4Rr2Uh+QqhtNZx4F9pG7xp1DT0KJZrmOoWHJipjZ9/YGxbrAA2Wxc4vLd
	zTu8sN1zg9Iw1h0cmZTLrBBEM+zaQ54P2ZSQ==
X-Received: by 2002:a05:701a:c94e:b0:136:da48:5edd with SMTP id a92af1059eb24-13b36d74b44mr140296c88.4.1782879378644;
        Tue, 30 Jun 2026 21:16:18 -0700 (PDT)
X-Received: by 2002:a05:701a:c94e:b0:136:da48:5edd with SMTP id a92af1059eb24-13b36d74b44mr140254c88.4.1782879377882;
        Tue, 30 Jun 2026 21:16:17 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab20921sm11246491c88.4.2026.06.30.21.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 21:16:17 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next v4] wifi: ath12k: add QMI capability negotiation for dynamic memory mode
Date: Wed,  1 Jul 2026 09:46:11 +0530
Message-Id: <20260701041611.3077185-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA0MCBTYWx0ZWRfXyou/zAY+SMzi
 hHy0i7mfCYHGo4ViBOFxRyuK63LCZw/TugnlbR4jbCaaHaJfq1B2ACANCX8N2Z3VFL85ZrDi6FA
 m1MIjIv+p1EkvtXLdnxi8KlWj71mX+asl36fg0+zznnWgo8Jg5j3wjveIofPoHhkSk1qttA4u5i
 7Dc4aJE5JxEeqGjmqS12JqaLoX/LG31A2c3k3IVSAGb78BplkH4u6v3W21wUsNeTXlNN1eh/B4w
 r6Z9pi4S6wlqjV3dJG8eUH4y1icUmNX5glDB1YAV9RlI2wDZ0krPI/9QZpWgrOs4fOZj+2SEru5
 fbzbXzE0yaRJQ5032rNmjYmnJobukXpn8npvrU7WLf0xfXitRNZxSo5k2xa1y5z8PJ81Tzd3Msr
 Hd7tieT5QYFdrU0y6s52suoLU8Iz/T66dEPFvkqpcKbVdNO4KOGlW7l9ZQ3zGQTALk7mtNoQuRM
 7Kc0hkXYorjSxVk7QLg==
X-Proofpoint-GUID: GM6wFtmv6yLSH1OVNza5J-8KauSAQf0I
X-Proofpoint-ORIG-GUID: GM6wFtmv6yLSH1OVNza5J-8KauSAQf0I
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a449493 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9vsdZt7S848NgKRuMzYA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA0MCBTYWx0ZWRfX/Q6NmhvBeNh2
 2xW/ClcOCK1pIpd1KkzAf4qY6qhfl0Ts0TQte8tL0ENCWnYDEFzImR0vBnlKo3ptk/yB1BdntZn
 g/Q8PV6N3A5xK5U8h4uEcY7yWAtmI+I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_211621_301197_62DE6755 
X-CRM114-Status: GOOD (  19.28  )
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

On AHB platforms, firmware operates in two modes: fixed-memory mode where
firmware uses hardcoded addresses for memory regions such as BDF and does
not request HOST_DDR memory from the host, and dynamic-memory mode where
firmware expects the host to provide memory addresses including HOST_DDR
after the Q6 read-only region and relies on host allocation for all memory
types.

Introduce QMI capability negotiation to support both modes. Add a new QMI
PHY capability flag dynamic_ddr_support which is advertised by firmware to
indicate it supports dynamic memory mode. When the host detects this
capability, set the dynamic_mem_support flag in the host capability message
to signal the host is ready to provide dynamic memory allocation. This
triggers firmware to send the HOST_DDR memory request and use the
host-provided address.

For backward compatibility, if firmware doesn't advertise
dynamic_ddr_support, the firmware continues to operate in fixed-memory mode
where firmware uses predefined addresses.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
v4:
  -Rebased on ToT.
v3:
  -Restored QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN change.
v2:
  -Dropped QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN and QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN changes.
  -Used %u instead of %d in the debug log.
---
 drivers/net/wireless/ath/ath12k/qmi.c | 49 +++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/qmi.h |  8 +++--
 2 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 1f3efcc16ac3..cabdd544bbc7 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -506,6 +506,24 @@ static const struct qmi_elem_info qmi_wlanfw_host_cap_req_msg_v01_ei[] = {
 		.offset		= offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
 					   feature_list),
 	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x33,
+		.offset		= offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
+					   dynamic_mem_support_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x33,
+		.offset		= offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
+					   dynamic_mem_support),
+	},
 	{
 		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
@@ -602,6 +620,24 @@ static const struct qmi_elem_info qmi_wlanfw_phy_cap_resp_msg_v01_ei[] = {
 		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
 					   single_chip_mlo_support),
 	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x17,
+		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+					   dynamic_ddr_support_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x17,
+		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+					   dynamic_ddr_support),
+	},
 	{
 		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
@@ -2254,6 +2290,11 @@ int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
 	if (ret < 0)
 		goto out;
 
+	if (ab->qmi.dynamic_ddr_support) {
+		req.dynamic_mem_support_valid = 1;
+		req.dynamic_mem_support = 1;
+	}
+
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
 			   qmi_wlanfw_host_cap_resp_msg_v01_ei, &resp);
 	if (ret < 0)
@@ -2325,11 +2366,15 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 
 	ab->qmi.num_radios = resp.num_phy;
 
+	if (resp.dynamic_ddr_support_valid)
+		ab->qmi.dynamic_ddr_support = resp.dynamic_ddr_support;
+
 	ath12k_dbg(ab, ATH12K_DBG_QMI,
-		   "phy capability resp valid %u single_chip_mlo_support %u valid %u num_phy %u valid %u board_id %u\n",
+		   "phy capability resp valid %u single_chip_mlo_support %u valid %u num_phy %u valid %u board_id %u dynamic_ddr_valid %u dynamic_ddr_support %u\n",
 		   resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support,
 		   resp.num_phy_valid, resp.num_phy,
-		   resp.board_id_valid, resp.board_id);
+		   resp.board_id_valid, resp.board_id, resp.dynamic_ddr_support_valid,
+		   resp.dynamic_ddr_support);
 
 	return;
 
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 80a9b42a2548..cbe5be30053a 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -153,9 +153,10 @@ struct ath12k_qmi {
 	struct m3_mem_region aux_uc_mem;
 	unsigned int service_ins_id;
 	struct dev_mem_info dev_mem[ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01];
+	u8 dynamic_ddr_support;
 };
 
-#define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN		261
+#define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN		265
 #define QMI_WLANFW_HOST_CAP_REQ_V01			0x0034
 #define QMI_WLFW_MAX_NUM_GPIO_V01			32
 #define QMI_WLANFW_MAX_PLATFORM_NAME_LEN_V01		64
@@ -253,7 +254,8 @@ struct qmi_wlanfw_host_cap_req_msg_v01 {
 	struct wlfw_host_mlo_chip_info_s_v01 mlo_chip_info[QMI_WLFW_MAX_NUM_MLO_CHIPS_V01];
 	u8 feature_list_valid;
 	u64 feature_list;
-
+	u8 dynamic_mem_support_valid;
+	u8 dynamic_mem_support;
 };
 
 struct qmi_wlanfw_host_cap_resp_msg_v01 {
@@ -274,6 +276,8 @@ struct qmi_wlanfw_phy_cap_resp_msg_v01 {
 	u32 board_id;
 	u8 single_chip_mlo_support_valid;
 	u8 single_chip_mlo_support;
+	u8 dynamic_ddr_support_valid;
+	u8 dynamic_ddr_support;
 };
 
 #define QMI_WLANFW_IND_REGISTER_REQ_MSG_V01_MAX_LEN		54

base-commit: 68151ce3373843fa89490d2d92f0497c4877c845
-- 
2.34.1


