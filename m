Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D901C5DF81
	for <ath12k@archiver.kernel.org>; Thu, 20 Aug 2026 05:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LI+zMU/xwwj59NCF/N4Oobwx22bmI/6oZGvoHLMIKXY=; b=wUGDWXIcn/TzucXP8Dgv0RUxdC
	1Wb6Uxkd//Q8zsRHRUGs06fcQHPBbIi13PkG4yF5RIsL4HmZTubKgBhZxChOhdTGuCFkQOOScD0k3
	6oFIahJDqlf33LD1787xswpDpmDgjKNoz7SOaxaCxROjmZSIKgDwJ7U7Z2nn8UwMZ18bI7dRe+LL1
	3hdDAMSTPVPPeX3b4Bx7LuMG2A1p4tf4FCHhI82QnXZ9qf3/vmojcsobDWZZueNFHHNS++urqybq9
	/gG0fKDVXIXdQU75voVoJ5oT0lU3cqklp7jQymJjWTxfsK5M2E1KBsfAjxwG7MZP0fIKGuWTs0zIl
	uhc97Q4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvdW-0000000ArTV-1NyL;
	Thu, 20 Aug 2026 05:48:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvdT-0000000ArSB-1uA4
	for ath12k@lists.infradead.org;
	Thu, 20 Aug 2026 05:48:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL8WsW1988686
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LI+zMU/xwwj
	59NCF/N4Oobwx22bmI/6oZGvoHLMIKXY=; b=fNmel1eMMxyZX2bGYKrER51K8Ih
	ZPAL6Rd+wBT7ojGN1ZNhCIgLsiPEW3/4pxZZlWTxeDOz0rU1kFOwvf9Y2g1M9B9e
	qMd3CwN2Ni6f39rPNIOcUKDd+xHJoxTllpbNTCWoZ9A/8gWCI6E2G1+W6fLwlWVm
	AiKbbKxIvUnmvTKG87U+tsIcGcfSVv/xCWfHTBX2UzKlze21GEAYSr4DWCKHLO/b
	dmtuUSUP0FLx7EqByUIxt8WK6X0MIeHuNktmXCx/NJFYhXCPmziesWa3U3/xGlee
	bwnLBlYRtkZjVBv+O/YNpxQaycxq7oiOB+uGQIApdpR0EivfPR4krCkekhw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esj3a75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:48:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so717073a91.0
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 22:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787204898; x=1787809698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LI+zMU/xwwj59NCF/N4Oobwx22bmI/6oZGvoHLMIKXY=;
        b=Ty4pazKE5KAOt/nBhgXZsRVntDT1SZuEf9vX4m4Z4Uemg6gXcBGIHrIwxIU7lYr1kK
         y7nUsNNdbJR3yXcqavQ0O3dPErPonK3mjEABSFV6gZPw+NdB+MTUI6WuBC4E0Bp9p7Ld
         cr7/3221xIrNMPRPceHrGMzEsVA7VORiec07lu+Wut2GULYsjvmIDkSl8Koy+CQnFX5M
         xXbYkK+I7ZzHAMYBiFnUjpyX41QAg16HzkydCQPeNOROxr4ie673SM821Yb2NE7nT0bG
         2Tugd01UeMaVuCXEOMghgq3aY14Q67iMbzvvSb6EU/3I9mHx4lwBx0Qtqddjs7AJDU8k
         nmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204898; x=1787809698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LI+zMU/xwwj59NCF/N4Oobwx22bmI/6oZGvoHLMIKXY=;
        b=EzzaAAUg6JtQ/sEEgoqBIQu3nflIa7lwAU+VAJEjPLmkpSZLTwFDiPcO67tIiwjSKd
         mAxTeyCiifu0aY/5FjxB6WYtWB0r63kYmewkgRYLL+Typ+IKEcM1iUzPNkTFSVutYSSG
         vLVUPGD5qQPjU4QAEE4OQr7Alfomr1i/04bbank41Tb79+F4lo3ZoVfwuHeGN+cx+EQg
         0QGJ8FJwFULIGqx6GN87Y/yMohcIfxeo+wnDluL+rpM/DRYjoDsr1Gye06Cz2q5Je9O3
         MINTKuQlx3voQ/8fkKg9jwdg12eVgWY9gQQVlbAjKWmgDuJwpjqX4juJIxS2CezZKFeK
         ul5w==
X-Gm-Message-State: AFuF++ml9Bt06POpH9oHtPg4axw65q3BnLQlpnZp8HmKoSzWrV803CsO
	3HCilP6w5LmG8FUpJWm9KIIKwwKGaliW6MhjLDEEfPpENu3ScXdsKBcStrhzGlZr5SFn8mqeXKK
	gM3SA03flEA0N/kURm4LEPzu/7FZ+kcBh625WOqrkGrDnq50tuUXZTqnQkDKo8N7dAwQldh8T
X-Gm-Gg: AR+sD12PqwYJQRuWCZC6gh/bTWZGtqAlxRDVgkaWar5b+S7hSMz4l+N6H2ELzVlNRXJ
	A40D/5c1/w2KEH7RdnvT0RUxVfz8TVOe/dwwJ60Qa5QihHdXUrdi0K/WF6drAapyAW0mMVfaaIS
	87J1uskzVymwZuiRKJtFOFBODvlM2iwy0WspLl83iYG9+UiZwZ9HYN7u7e3XWld/8/Du1UA/lI8
	ev+GuNWx085ToKBQUCITn2LTC6JIDrBfhn8T1rwVN0mMFzwRn8WiDpscSCksV9oyQHBjgEMe7pb
	YzfrvC4q8Nnq16GzKBuSTYUAF1w5Zga0SowbNLexxFIVLFIRjjUO0WRN3+V3nuBE6dZDJvAA95g
	/TbDnDnXu5atyvpFllLEyDhrR5pLzxp+jp4KkYQGF6uGj8XD4Nea5zHv4QPyEQCMEyu64NFw3kE
	3ZOnszsfxRPIyleTqteGVg0bw=
X-Received: by 2002:a17:90b:5104:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-395a04e3ff5mr4570181a91.2.1787204898242;
        Wed, 19 Aug 2026 22:48:18 -0700 (PDT)
X-Received: by 2002:a17:90b:5104:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-395a04e3ff5mr4570141a91.2.1787204897733;
        Wed, 19 Aug 2026 22:48:17 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fbf3dc2sm5440931a91.17.2026.08.19.22.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:48:17 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com, quic_periyasa@quicinc.com,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 2/7] wifi: ath12k: convert DP_TX_COMP_RING_SIZE to inline helper
Date: Thu, 20 Aug 2026 11:17:59 +0530
Message-Id: <20260820054804.3222296-3-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4C8Jy7h3QH_t6IRBWUi1JpV76DQMM63B
X-Authority-Analysis: v=2.4 cv=EaL4hvmC c=1 sm=1 tr=0 ts=6a869522 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=DFbXMaSh9_sXDkJ5NroA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfXxHXEpdPvoD0X
 fnquy6LGYATbvd/R0Pnub1wiVtzV05Blninjog+Dn+9ZhyI5GHFZ8bbMSWV0uj30ohE6bzPzxWg
 nec2Aj4nkLLVmO2F1OvLZxAp7qrgXsW31e8//Wnk1vnQNrTMcZ5+BZoYCa3EUSsdKFLTL7zGr88
 M2t++Q4/WhdodtH5AkJSGok9SjvUrqhbyu4FMtA8LTT9XhivFLgUNU3LkkGXSpPsqs3b11MtZNu
 oJiGw4iCs5YD3nLUCP7F7+XjK92CCcb5h+au0gIcy4yLzhbv7ZBSseSOb8YAaIKx10f+zYCvX2Q
 wzoRUSaqx8GbZhI4NArhUp3WNbR22LE8vudINBjsS6B1/TImhv2XB1Zck0K4L2IFdZQ/uc6uU5B
 hn9t3euaYFzfuu5ScjMDn8h4npQKKOMt0UXHHuCcCaZxEL5AbxmwgcdQp9yHxbJuWfjw+2NrR5Q
 Ok3EIl2++jZUEQorlHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfX62LWqRCWl+pk
 CDe+SxoHIbbrSMvwQV//ZPSpB0jBYicc59of7Huli0is5Mt+JV2OOdcCwktQ9bx8C84G/foZlyS
 LuLMt2cvAx2HRVzI/B44bmH9PBHSziY=
X-Proofpoint-ORIG-GUID: 4C8Jy7h3QH_t6IRBWUi1JpV76DQMM63B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_224819_512559_6CBC0486 
X-CRM114-Status: GOOD (  17.40  )
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

Replace DP_TX_COMP_RING_SIZE macro with ath12k_dp_tx_comp_ring_size()
static inline helper. Pass the DP profile parameters explicitly to
improve type safety and make the interface explicit.

Update code using ATH12K_TX_COMPL_NEXT to pass ring size directly rather
than deriving it from the ath12k_base structure.
Also remove the unused DP_TX_IDR_SIZE macro.

No functional change intended.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.c          | 10 +++++++---
 drivers/net/wireless/ath/ath12k/dp.h          | 11 +++++++----
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 12 +++++++-----
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index f9b37d75956d..5980946d1e82 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -439,6 +439,7 @@ static void ath12k_dp_srng_common_cleanup(struct ath12k_base *ab)
 
 static int ath12k_dp_srng_common_setup(struct ath12k_base *ab)
 {
+	const struct ath12k_dp_profile_params *dp_params = &ab->profile_param->dp_params;
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 	const struct ath12k_hal_tcl_to_wbm_rbm_map *map;
 	struct hal_srng *srng;
@@ -469,7 +470,7 @@ static int ath12k_dp_srng_common_setup(struct ath12k_base *ab)
 
 		ret = ath12k_dp_srng_setup(ab, &dp->tx_ring[i].tcl_comp_ring,
 					   HAL_WBM2SW_RELEASE, tx_comp_ring_num, 0,
-					   DP_TX_COMP_RING_SIZE(ab));
+					   ath12k_dp_tx_comp_ring_size(dp_params));
 		if (ret) {
 			ath12k_warn(ab, "failed to set up tcl_comp ring (%d) :%d\n",
 				    tx_comp_ring_num, ret);
@@ -1465,6 +1466,7 @@ static int ath12k_dp_reoq_lut_setup(struct ath12k_base *ab)
 
 static int ath12k_dp_setup(struct ath12k_base *ab)
 {
+	const struct ath12k_dp_profile_params *dp_params;
 	struct ath12k_dp *dp;
 	struct hal_srng *srng = NULL;
 	size_t size = 0;
@@ -1474,6 +1476,7 @@ static int ath12k_dp_setup(struct ath12k_base *ab)
 
 	dp = ath12k_ab_to_dp(ab);
 	dp->ab = ab;
+	dp_params = &ab->profile_param->dp_params;
 
 	INIT_LIST_HEAD(&dp->reo_cmd_list);
 	INIT_LIST_HEAD(&dp->reo_cmd_cache_flush_list);
@@ -1528,7 +1531,7 @@ static int ath12k_dp_setup(struct ath12k_base *ab)
 		goto fail_dp_bank_profiles_cleanup;
 
 	size = ab->hal.hal_wbm_release_ring_tx_size *
-	       DP_TX_COMP_RING_SIZE(ab);
+	       ath12k_dp_tx_comp_ring_size(dp_params);
 
 	ret = ath12k_dp_reoq_lut_setup(ab);
 	if (ret) {
@@ -1540,7 +1543,8 @@ static int ath12k_dp_setup(struct ath12k_base *ab)
 		dp->tx_ring[i].tcl_data_ring_id = i;
 
 		dp->tx_ring[i].tx_status_head = 0;
-		dp->tx_ring[i].tx_status_tail = DP_TX_COMP_RING_SIZE(ab) - 1;
+		dp->tx_ring[i].tx_status_tail =
+			ath12k_dp_tx_comp_ring_size(dp_params) - 1;
 		dp->tx_ring[i].tx_status = kmalloc(size, GFP_KERNEL);
 		if (!dp->tx_ring[i].tx_status) {
 			ret = -ENOMEM;
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 72d3de2db5d8..6540b3453cc6 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -61,7 +61,7 @@ struct dp_rxdma_ring {
 	int bufs_max;
 };
 
-#define ATH12K_TX_COMPL_NEXT(ab, x)	(((x) + 1) % DP_TX_COMP_RING_SIZE(ab))
+#define ATH12K_TX_COMPL_NEXT(ring_size, x)	(((x) + 1) % (ring_size))
 
 struct dp_tx_ring {
 	u8 tcl_data_ring_id;
@@ -201,9 +201,6 @@ struct ath12k_pdev_dp {
 
 #define DP_WBM_RELEASE_RING_SIZE	64
 #define DP_TCL_DATA_RING_SIZE		512
-#define DP_TX_COMP_RING_SIZE(ab) \
-	((ab)->profile_param->dp_params.tx_comp_ring_size)
-#define DP_TX_IDR_SIZE(ab)		DP_TX_COMP_RING_SIZE(ab)
 #define DP_TCL_CMD_RING_SIZE		32
 #define DP_TCL_STATUS_RING_SIZE		32
 #define DP_REO_DST_RING_MAX		8
@@ -689,6 +686,12 @@ ath12k_dp_to_pdev_dp(struct ath12k_dp *dp, u8 pdev_idx)
 	return rcu_dereference(dp->dp_pdevs[pdev_idx]);
 }
 
+static inline u32
+ath12k_dp_tx_comp_ring_size(const struct ath12k_dp_profile_params *p)
+{
+	return p->tx_comp_ring_size;
+}
+
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
 void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 587d58eeccfa..e14f1d190ba8 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -922,12 +922,14 @@ void ath12k_wifi7_dp_tx_completion_handler(struct ath12k_dp *dp, int ring_id)
 	u64 desc_va;
 	enum hal_wbm_rel_src_module buf_rel_source;
 	enum hal_wbm_tqm_rel_reason rel_status;
+	u32 ring_size;
 
 	spin_lock_bh(&status_ring->lock);
 
+	ring_size = ath12k_dp_tx_comp_ring_size(&ab->profile_param->dp_params);
 	ath12k_hal_srng_access_begin(ab, status_ring);
 
-	while (ATH12K_TX_COMPL_NEXT(ab, tx_ring->tx_status_head) !=
+	while (ATH12K_TX_COMPL_NEXT(ring_size, tx_ring->tx_status_head) !=
 	       tx_ring->tx_status_tail) {
 		desc = ath12k_hal_srng_dst_get_next_entry(ab, status_ring);
 		if (!desc)
@@ -936,11 +938,11 @@ void ath12k_wifi7_dp_tx_completion_handler(struct ath12k_dp *dp, int ring_id)
 		memcpy(&tx_ring->tx_status[tx_ring->tx_status_head],
 		       desc, sizeof(*desc));
 		tx_ring->tx_status_head =
-			ATH12K_TX_COMPL_NEXT(ab, tx_ring->tx_status_head);
+			ATH12K_TX_COMPL_NEXT(ring_size, tx_ring->tx_status_head);
 	}
 
 	if (ath12k_hal_srng_dst_peek(ab, status_ring) &&
-	    (ATH12K_TX_COMPL_NEXT(ab, tx_ring->tx_status_head) ==
+	    (ATH12K_TX_COMPL_NEXT(ring_size, tx_ring->tx_status_head) ==
 	     tx_ring->tx_status_tail)) {
 		/* TODO: Process pending tx_status messages when kfifo_is_full() */
 		ath12k_warn(ab, "Unable to process some of the tx_status ring desc because status_fifo is full\n");
@@ -950,13 +952,13 @@ void ath12k_wifi7_dp_tx_completion_handler(struct ath12k_dp *dp, int ring_id)
 
 	spin_unlock_bh(&status_ring->lock);
 
-	while (ATH12K_TX_COMPL_NEXT(ab, tx_ring->tx_status_tail) !=
+	while (ATH12K_TX_COMPL_NEXT(ring_size, tx_ring->tx_status_tail) !=
 	       tx_ring->tx_status_head) {
 		struct hal_wbm_completion_ring_tx *tx_status;
 		u32 desc_id;
 
 		tx_ring->tx_status_tail =
-			ATH12K_TX_COMPL_NEXT(ab, tx_ring->tx_status_tail);
+			ATH12K_TX_COMPL_NEXT(ring_size, tx_ring->tx_status_tail);
 		tx_status = &tx_ring->tx_status[tx_ring->tx_status_tail];
 		ath12k_wifi7_dp_tx_status_parse(dp, tx_status, &ts);
 
-- 
2.34.1


