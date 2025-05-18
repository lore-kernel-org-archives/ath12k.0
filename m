Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEC6C3ABD8
	for <ath12k@archiver.kernel.org>; Sun, 18 May 2025 18:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnc37N2e3+pJ2Ag2byaRp/fTFyiZrRf6d4dkcepCPEo=; b=hDE/j06qtHx9L+Fu+WKNJihbaW
	KV8KVPpZJizdjNsktYwT/lWNmBszhC+qg4xZGKQjQOo9ol1k9lRKbiH8NF7+XYAVwf3sjeYMr6bUF
	MD2DC++Ise2S/0IH/WXE+yWvvl+nWH41nDO0xeM5WqZx5yP0EgGNTTkCVs/JFFF9AWeXReYW5M/kT
	EFZVaipwUajVjoZ+ABj4VKJs4xTh8uWhsmF2E3IIGUrP0VlmEkjsW4zDmBtQdvWJSMcTiNxHbY3Pe
	zN3Fx4DCoyZOWM/cPjTB5ItfCkd7QqSsuH8bTycdzv36p0elTftgsG0LOcfb5RYHPaCPsaaf4TCAm
	z9oU/rzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGifO-00000007PZ8-14TV;
	Sun, 18 May 2025 18:23:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGifL-00000007PX6-0cRH
	for ath12k@lists.infradead.org;
	Sun, 18 May 2025 18:23:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IGCThw024885;
	Sun, 18 May 2025 18:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cnc37N2e3+pJ2Ag2byaRp/fTFyiZrRf6d4dkcepCPEo=; b=i4350nT4/Y990wIC
	mJMlij2ZzYzWfsqVLz6ueklPSNEA0EJQem+Thq2mJonlZ+028M8bt26xCrcrL+W/
	Ir6JHXhjiAL7tGawYbcFYJCVzme5a59bABFLegzdlHymiTMyO8nrMRe3Ng5XCNVf
	8rxoZlDZrPabfCOtyZXIoI7EXpPOXBEyr5ALzWxpWc3WLQTo0JAu+sWzj2VuQTG1
	suRPU1zJjmRdRvk5NwRufhs/iSsGtsv2LVXlcPc9ND9DwQEY69NlxeYPDtW9aOXR
	dRovEI+lEvyFXc4NB033oNtaSFqGChxhlzMc3XvPDbkVEp/jlfHzJYndoZ/5uwYK
	FCwHSg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9t8ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 18:23:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54IIN5WA002265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 18:23:05 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 18 May 2025 11:23:01 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Date: Sun, 18 May 2025 23:52:30 +0530
Subject: [PATCH ath-next v2 3/5] wifi: ath12k: add ath12k_hw_regs for
 IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250518-ath12k-ipq5424-v2-3-ef81b833dc97@quicinc.com>
References: <20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com>
In-Reply-To: <20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
        "Saravanakumar
 Duraisamy" <quic_saradura@quicinc.com>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5jWUGo-1Ya7FOopAuNQkvKZSnF2Z7moF
X-Proofpoint-ORIG-GUID: 5jWUGo-1Ya7FOopAuNQkvKZSnF2Z7moF
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682a2589 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=dagU3uUzHk6l2Oo7QSMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDE3OSBTYWx0ZWRfX62/7zr5odhPC
 a7278YGaIEwjh0VVuqxFFeIXP9D/IDvzPDxDgMKe7Fb6vQXC7JCxGSSjlw08tb0ljBnNI8HXElN
 y26TDLKatNroJP0uAe7jsxj/VQRidC0nMY96c2p7z3KmOqUaszRjyhWqR1uK0Sqr4J3XDn3N7o1
 NBGny19OUKKiMlJzkNltpDGvBSZ2DjOhCqO5dw6BHNmVii/A/bx11Qm1oiRlw50AeTr5Io3RvMR
 fCumP5KuBcI4KkQ3p/cb49hSNb2TbzeYYFhBdsYH0IcToWUxZbAjj6hl3PEnsWCqNDvKQFndhO4
 giI3NG5t5yLhJ1O6NL2MPDbIRAUs807ry88NfCNX81HrFnUU5YIH0qoCWPW7wZLTmm69BKkzXH+
 LVHRJXlr+F5/QqReb8cOY14kCbB1yjamP18Ji4az9qlO+L9C5QUciRDfct7JaHwy1zRc1gNo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_09,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=940 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_112315_204499_6D898729 
X-CRM114-Status: GOOD (  11.45  )
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

From: Saravanakumar Duraisamy <quic_saradura@quicinc.com>

Add register addresses (ath12k_hw_regs) for new ath12k AHB based
WiFi device IPQ5424.

Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.5-01053-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1

Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal.h |  3 ++
 drivers/net/wireless/ath/ath12k/hw.c  | 87 ++++++++++++++++++++++++++++++++++-
 2 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 0ee9c6b26dab4ef597c95fea6fdb58d9cf1a0941..3239f3a7526b510ca94c2a4ce0e9a26b77cdf914 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -383,6 +383,9 @@ struct ath12k_base;
 #define HAL_IPQ5332_CE_WFSS_REG_BASE	0x740000
 #define HAL_IPQ5332_CE_SIZE		0x100000
 
+#define HAL_IPQ5424_CE_WFSS_REG_BASE	0x200000
+#define HAL_IPQ5424_CE_SIZE		0x100000
+
 enum hal_srng_ring_id {
 	HAL_SRNG_RING_ID_REO2SW0 = 0,
 	HAL_SRNG_RING_ID_REO2SW1,
diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 866de53f37bb5af94e16c796a0052fda39eb4ea8..05e2010173340bc3c0481aadf710a6894efd92bb 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1132,6 +1132,91 @@ static const struct ath12k_hw_regs ipq5332_regs = {
 		HAL_IPQ5332_CE_WFSS_REG_BASE,
 };
 
+static const struct ath12k_hw_regs ipq5424_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.hal_tcl1_ring_id = 0x00000918,
+	.hal_tcl1_ring_misc = 0x00000920,
+	.hal_tcl1_ring_tp_addr_lsb = 0x0000092c,
+	.hal_tcl1_ring_tp_addr_msb = 0x00000930,
+	.hal_tcl1_ring_consumer_int_setup_ix0 = 0x00000940,
+	.hal_tcl1_ring_consumer_int_setup_ix1 = 0x00000944,
+	.hal_tcl1_ring_msi1_base_lsb = 0x00000958,
+	.hal_tcl1_ring_msi1_base_msb = 0x0000095c,
+	.hal_tcl1_ring_base_lsb = 0x00000910,
+	.hal_tcl1_ring_base_msb = 0x00000914,
+	.hal_tcl1_ring_msi1_data = 0x00000960,
+	.hal_tcl2_ring_base_lsb = 0x00000988,
+	.hal_tcl_ring_base_lsb = 0x00000b68,
+
+	/* TCL STATUS ring address */
+	.hal_tcl_status_ring_base_lsb = 0x00000d48,
+
+	/* REO DEST ring address */
+	.hal_reo2_ring_base = 0x00000578,
+	.hal_reo1_misc_ctrl_addr = 0x00000b9c,
+	.hal_reo1_sw_cookie_cfg0 = 0x0000006c,
+	.hal_reo1_sw_cookie_cfg1 = 0x00000070,
+	.hal_reo1_qdesc_lut_base0 = 0x00000074,
+	.hal_reo1_qdesc_lut_base1 = 0x00000078,
+	.hal_reo1_ring_base_lsb = 0x00000500,
+	.hal_reo1_ring_base_msb = 0x00000504,
+	.hal_reo1_ring_id = 0x00000508,
+	.hal_reo1_ring_misc = 0x00000510,
+	.hal_reo1_ring_hp_addr_lsb = 0x00000514,
+	.hal_reo1_ring_hp_addr_msb = 0x00000518,
+	.hal_reo1_ring_producer_int_setup = 0x00000524,
+	.hal_reo1_ring_msi1_base_lsb = 0x00000548,
+	.hal_reo1_ring_msi1_base_msb = 0x0000054C,
+	.hal_reo1_ring_msi1_data = 0x00000550,
+	.hal_reo1_aging_thres_ix0 = 0x00000B28,
+	.hal_reo1_aging_thres_ix1 = 0x00000B2C,
+	.hal_reo1_aging_thres_ix2 = 0x00000B30,
+	.hal_reo1_aging_thres_ix3 = 0x00000B34,
+
+	/* REO Exception ring address */
+	.hal_reo2_sw0_ring_base = 0x000008c0,
+
+	/* REO Reinject ring address */
+	.hal_sw2reo_ring_base = 0x00000320,
+	.hal_sw2reo1_ring_base = 0x00000398,
+
+	/* REO cmd ring address */
+	.hal_reo_cmd_ring_base = 0x000002A8,
+
+	/* REO status ring address */
+	.hal_reo_status_ring_base = 0x00000aa0,
+
+	/* WBM idle link ring address */
+	.hal_wbm_idle_ring_base_lsb = 0x00000d3c,
+	.hal_wbm_idle_ring_misc_addr = 0x00000d4c,
+	.hal_wbm_r0_idle_list_cntl_addr = 0x00000240,
+	.hal_wbm_r0_idle_list_size_addr = 0x00000244,
+	.hal_wbm_scattered_ring_base_lsb = 0x00000250,
+	.hal_wbm_scattered_ring_base_msb = 0x00000254,
+	.hal_wbm_scattered_desc_head_info_ix0 = 0x00000260,
+	.hal_wbm_scattered_desc_head_info_ix1	= 0x00000264,
+	.hal_wbm_scattered_desc_tail_info_ix0 = 0x00000270,
+	.hal_wbm_scattered_desc_tail_info_ix1 = 0x00000274,
+	.hal_wbm_scattered_desc_ptr_hp_addr = 0x0000027c,
+
+	/* SW2WBM release ring address */
+	.hal_wbm_sw_release_ring_base_lsb = 0x0000037c,
+
+	/* WBM2SW release ring address */
+	.hal_wbm0_release_ring_base_lsb = 0x00000e08,
+	.hal_wbm1_release_ring_base_lsb = 0x00000e80,
+
+	/* CE relative address */
+	.hal_umac_ce0_src_reg_base = 0x00200000 -
+		HAL_IPQ5424_CE_WFSS_REG_BASE,
+	.hal_umac_ce0_dest_reg_base = 0x00201000 -
+		HAL_IPQ5424_CE_WFSS_REG_BASE,
+	.hal_umac_ce1_src_reg_base = 0x00202000 -
+		HAL_IPQ5424_CE_WFSS_REG_BASE,
+	.hal_umac_ce1_dest_reg_base = 0x00203000 -
+		HAL_IPQ5424_CE_WFSS_REG_BASE,
+};
+
 static const struct ath12k_hw_regs wcn7850_regs = {
 	/* SW2TCL(x) R0 ring configuration address */
 	.hal_tcl1_ring_id = 0x00000908,
@@ -1607,7 +1692,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.internal_sleep_clock = false,
 
 		.hw_ops = &qcn9274_ops,
-		.regs = NULL,
+		.regs = &ipq5424_regs,
 		.ring_mask = &ath12k_hw_ring_mask_ipq5332,
 
 		.host_ce_config = ath12k_host_ce_config_ipq5332,

-- 
2.34.1


