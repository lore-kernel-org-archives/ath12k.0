Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18772CC6B01
	for <ath12k@archiver.kernel.org>; Thu,  2 Apr 2026 03:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9U7IonkBdkRAhcnL68BzupxStBnxfId1isZHipcKmAE=; b=4MwJs29BnNtY/gSrmFacWXh+Z1
	x9DXT6y+r354y66aPiwIEGOPAlJe3S+CTQueI7ZMH8grTp6YtODY9aie5/ounfvKKpHI8wZWjyF2P
	NcdAOU653+OdP0gFZ8iGV2o31iHV/SiNkv3x0NU0HALORql6xs/OnaQX0ldvmVctjs1OR4c1TQS3c
	AUnyvbQQYvkHy1dE5aRb/UGykixeA/J/TjbJgJnsXi8PbEvN6aBjAiOYrlE51oGqR+MiqPkK4OcMZ
	9gZBy1h5bqjA8/Y54FJjnm14RHTBZaQIIWAIeCiI+H/GXn04rFAEs/1jqLm744ueXe888siYREtHE
	Yx7hpp4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w898d-0000000GglR-3RBc;
	Thu, 02 Apr 2026 03:54:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w898c-0000000GgkQ-1KD5
	for ath12k@lists.infradead.org;
	Thu, 02 Apr 2026 03:54:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4Cf33956007
	for <ath12k@lists.infradead.org>; Thu, 2 Apr 2026 03:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9U7IonkBdkRAhcnL68BzupxStBnxfId1isZHipcKmAE=; b=HP06aR2vP1RfflZH
	YOcYIx778+80cw02ELYTQuvkPLTk/aYvArWH6YchSvU58nVeQkddK4J3TPkfWxST
	4Z/SPjxXgzcdqUftICNbuCVPoRAWAKL9opNQ/eTOSwxGhO9xhW6hdMnTpAXi4GSw
	2YOv0gNsvAjLfCFYcCC50e/DcOYSbteJyP+Grzpm0vgTCk6y8N7N5De7pAcwYdbq
	gt/8CeZ4vsFX3a9mAlp4u2hHgQ9+GKzoxi2BgZQGD4ffsXsJ8V/9grrdna/oI9p0
	IHoS/5PwYFSSKhKNqwa6zAp5y/BCz1n6ySAS92c5sBaPe1VBFxX5zzjbkM5SxHUy
	mCaOdg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5h654-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Apr 2026 03:54:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c70d1f65aso236285b3a.1
        for <ath12k@lists.infradead.org>; Wed, 01 Apr 2026 20:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775102072; x=1775706872; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9U7IonkBdkRAhcnL68BzupxStBnxfId1isZHipcKmAE=;
        b=H0XzJ0xUw2PaJ7aVZMwfQB0160M+6HYAFLwSEUZPP1dvLyK8YtPJDcuXxwzD/xcg+g
         gjab9KvsJS4PcPUjMV7TyToPRlko3R7GrKREwu/CJQqQ2bFi1N5iQQ+aLXLgouQnH/OA
         84uU7+lnWBj09mb9eHaek4ivn+yR9Tb8QHibLGxiDlIM5t9eFOXkNnxV9z3/ZYs6kxmY
         KwJHTCjtDfeqTgZ5XeI7/S1PI+RNE+MCtsS/gtbZ/H0o2xlUN4P9hNK4DJblN89KOPZj
         IWpT4h3rfqWLt1JdoUGV9mzVGavbgbbs/FK3wG6MG4P7HsaQjSG9zcYnvdcyHaloZPiF
         LStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775102072; x=1775706872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9U7IonkBdkRAhcnL68BzupxStBnxfId1isZHipcKmAE=;
        b=FTPhz83AWyG/UequmPhT7626o0NaYXUHR/TOWE0iY+yzDTnyZSqiwpv2c0VdLsw0d6
         GKA11w+OYnhUqTEPXJpdpNDT4JohLZw3VCizCct+Zh/QkWea1PdtGdNMRydVXJx4gcfX
         EN38410DEo+LtnQB8NascYztyYipNSgVRRGtt1OZBWCucASf5G+wbgM3125pE/RSwVVO
         l7GW8Jb0oXaniOfzGNlDX8/PfW4ONteYjrBHkUbg0WRungca/MBTLxyrEl1TaMDmiQbh
         faG1u76uroYZL+YBB+GNpp5ycB2ua6y2AXwVxkI2SEo3HLs9rMmTCy6pZaw+KGV5aJhD
         q+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrShv4VSiIJF+XoCSGVKzfm4oxbxkxZsw+76vHfwoNc5lzx2KsJEyDNbUoYihLqMVSEfH5ILs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyK8/FKwsNJ1JxX3icq5+E5wG7nXzVPF20GdzAuRUxzu7VEcAXd
	5A10yayOPdmxH/L6dCzCKO+fU+X6np6nyo+8bd8FRs89hIvGJBLx36KJQR3LUSZfL57Fs5t7hSR
	mG1rmf2k38vLeAIesajxguEUDDzFdCynr6EefZBiu8ZNNxZ/Pjn2iI/iGGcAyXSXK
X-Gm-Gg: ATEYQzz2rsU3XhQUzvJ35RWECKG3Gl/qhRgbphNsPhcAuYpOrvz+3m775UC+an095sy
	apImIaEOhCSD9/52zEmkhybjfqPyAZ/kWrMuXotps0xcLFWCPWmRMaPWd/MaEuvbCNjrtB9EmvI
	B9kyjiWvIb/i1quDTw16Wx+lZ/BtG6KTxWlqnBUZ6lP92FKM4McItMdiUKaDpK+VtpANbpaoPnl
	4ACWTQ0rc0RnMigzl7zsdt7bC0ohrJl69sfIKRrqwvOY21wq23aU8LoP3kTeLTP8WWC9paVUkyp
	DoolBIPUGSzXPDFlXCvUXYazvyQh4w4fcuXTJx2xN2qj4GLO5n6VpLOseGrqU013t2QbpNgQvWS
	ixOlnKJK8ECFwC6dM1Vnss4hzLwIU9v4ag/iYWmsJRXmeFc9Q8TVJRe3vyWMuz2MeHuoyO1uPUB
	rOW7jZz27m7v7SS1tl5Yuspi8C9MTNg9j99pF58pM=
X-Received: by 2002:aa7:8894:0:b0:82c:e775:d43a with SMTP id d2e1a72fcca58-82ce8ac8ce0mr6535561b3a.35.1775102071781;
        Wed, 01 Apr 2026 20:54:31 -0700 (PDT)
X-Received: by 2002:aa7:8894:0:b0:82c:e775:d43a with SMTP id d2e1a72fcca58-82ce8ac8ce0mr6535543b3a.35.1775102071289;
        Wed, 01 Apr 2026 20:54:31 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm1456189b3a.12.2026.04.01.20.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:54:30 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 09:24:02 +0530
Subject: [PATCH ath-next v4 4/6] wifi: ath12k: add ath12k_hw_regs for
 IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-ath12k-ipq5424-v4-4-cd1e0f0a6c88@oss.qualcomm.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
In-Reply-To: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69cde879 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ZT2xpsdUAhckzUomvuUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qnAXAwWOo9ihiNLfJArOMan-uT32lvKR
X-Proofpoint-ORIG-GUID: qnAXAwWOo9ihiNLfJArOMan-uT32lvKR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzMSBTYWx0ZWRfX3wQOOquUsPja
 LZuGgXrgX5pICKjnWZTCbHKtXwukihPDyo8m2/uGIGmIFTB1yNJFCZzoJyQ6ACNbcLiyiy+xoY4
 /cq4caKy2omBDrvMzGRkT5XFOqzfUj2y8JQoBc1lxlGNyNI2Te9IYiRAT98dTFl3A2aM1PyFh2u
 nzLYEwhnxLT3kYxx/Qf1az5FRe5rsaYdpzne88BpljYUMrDDRGXUCXUkRzxjnqrA09jly27mbjR
 ZUweYeHi0OwjJROBCVv4Sb0Tkg/q8CrXsimfC6BRWn4k9bAi8whEazn2MbUh7i/lUZmRC6l0GI1
 p71INvS1xenvDEx2goioS3odhcHx0vIqxDYd8sPjkUihbJMNkE4+5N+DtzV/1/4VDZTBCK7Kf8L
 qnl1xt/G5r7FYzSqkxRjRfKuNhyDTHXMlWm2uIz+9bgq0pjioPt5mGAtaTJ47InLekmchNH4gmh
 wGe72LSLeH1PM7S8tow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_205434_473000_1B01977C 
X-CRM114-Status: GOOD (  14.16  )
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

Add register addresses (ath12k_hw_regs) for ath12k AHB based
WiFi 7 device IPQ5424.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  2 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
 4 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.c b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
index c2cc99a83f09..a0a1902fb491 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
@@ -55,7 +55,7 @@ static const struct ath12k_hw_version_map ath12k_wifi7_hw_ver_map[] = {
 		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9274_compact),
 		.tcl_to_wbm_rbm_map = ath12k_hal_tcl_to_wbm_rbm_map_qcn9274,
 		.hal_params = &ath12k_hw_hal_params_ipq5332,
-		.hw_regs = NULL,
+		.hw_regs = &ipq5424_regs,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.h b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
index 9337225a5253..3d9386198893 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
@@ -364,6 +364,9 @@
 #define HAL_IPQ5332_CE_WFSS_REG_BASE	0x740000
 #define HAL_IPQ5332_CE_SIZE		0x100000
 
+#define HAL_IPQ5424_CE_WFSS_REG_BASE	0x200000
+#define HAL_IPQ5424_CE_SIZE		0x100000
+
 #define HAL_RX_MAX_BA_WINDOW	256
 
 #define HAL_DEFAULT_BE_BK_VI_REO_TIMEOUT_USEC	(100 * 1000)
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 41c918eb1767..ba9ce1e718e8 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -484,6 +484,94 @@ const struct ath12k_hw_regs ipq5332_regs = {
 		HAL_IPQ5332_CE_WFSS_REG_BASE,
 };
 
+const struct ath12k_hw_regs ipq5424_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.tcl1_ring_id = 0x00000918,
+	.tcl1_ring_misc = 0x00000920,
+	.tcl1_ring_tp_addr_lsb = 0x0000092c,
+	.tcl1_ring_tp_addr_msb = 0x00000930,
+	.tcl1_ring_consumer_int_setup_ix0 = 0x00000940,
+	.tcl1_ring_consumer_int_setup_ix1 = 0x00000944,
+	.tcl1_ring_msi1_base_lsb = 0x00000958,
+	.tcl1_ring_msi1_base_msb = 0x0000095c,
+	.tcl1_ring_base_lsb = 0x00000910,
+	.tcl1_ring_base_msb = 0x00000914,
+	.tcl1_ring_msi1_data = 0x00000960,
+	.tcl2_ring_base_lsb = 0x00000988,
+	.tcl_ring_base_lsb = 0x00000b68,
+
+	/* TCL STATUS ring address */
+	.tcl_status_ring_base_lsb = 0x00000d48,
+
+	/* REO DEST ring address */
+	.reo2_ring_base = 0x00000578,
+	.reo1_misc_ctrl_addr = 0x00000b9c,
+	.reo1_sw_cookie_cfg0 = 0x0000006c,
+	.reo1_sw_cookie_cfg1 = 0x00000070,
+	.reo1_qdesc_lut_base0 = 0x00000074,
+	.reo1_qdesc_lut_base1 = 0x00000078,
+	.reo1_ring_base_lsb = 0x00000500,
+	.reo1_ring_base_msb = 0x00000504,
+	.reo1_ring_id = 0x00000508,
+	.reo1_ring_misc = 0x00000510,
+	.reo1_ring_hp_addr_lsb = 0x00000514,
+	.reo1_ring_hp_addr_msb = 0x00000518,
+	.reo1_ring_producer_int_setup = 0x00000524,
+	.reo1_ring_msi1_base_lsb = 0x00000548,
+	.reo1_ring_msi1_base_msb = 0x0000054C,
+	.reo1_ring_msi1_data = 0x00000550,
+	.reo1_aging_thres_ix0 = 0x00000B28,
+	.reo1_aging_thres_ix1 = 0x00000B2C,
+	.reo1_aging_thres_ix2 = 0x00000B30,
+	.reo1_aging_thres_ix3 = 0x00000B34,
+
+	/* REO Exception ring address */
+	.reo2_sw0_ring_base = 0x000008c0,
+
+	/* REO Reinject ring address */
+	.sw2reo_ring_base = 0x00000320,
+	.sw2reo1_ring_base = 0x00000398,
+
+	/* REO cmd ring address */
+	.reo_cmd_ring_base = 0x000002A8,
+
+	/* REO status ring address */
+	.reo_status_ring_base = 0x00000aa0,
+
+	/* WBM idle link ring address */
+	.wbm_idle_ring_base_lsb = 0x00000d3c,
+	.wbm_idle_ring_misc_addr = 0x00000d4c,
+	.wbm_r0_idle_list_cntl_addr = 0x00000240,
+	.wbm_r0_idle_list_size_addr = 0x00000244,
+	.wbm_scattered_ring_base_lsb = 0x00000250,
+	.wbm_scattered_ring_base_msb = 0x00000254,
+	.wbm_scattered_desc_head_info_ix0 = 0x00000260,
+	.wbm_scattered_desc_head_info_ix1	= 0x00000264,
+	.wbm_scattered_desc_tail_info_ix0 = 0x00000270,
+	.wbm_scattered_desc_tail_info_ix1 = 0x00000274,
+	.wbm_scattered_desc_ptr_hp_addr = 0x0000027c,
+
+	/* SW2WBM release ring address */
+	.wbm_sw_release_ring_base_lsb = 0x0000037c,
+
+	/* WBM2SW release ring address */
+	.wbm0_release_ring_base_lsb = 0x00000e08,
+	.wbm1_release_ring_base_lsb = 0x00000e80,
+
+	/* PPE release ring address */
+	.ppe_rel_ring_base = 0x0000046c,
+
+	/* CE address */
+	.umac_ce0_src_reg_base = 0x00200000 -
+		HAL_IPQ5424_CE_WFSS_REG_BASE,
+	.umac_ce0_dest_reg_base = 0x00201000 -
+		HAL_IPQ5424_CE_WFSS_REG_BASE,
+	.umac_ce1_src_reg_base = 0x00202000 -
+		HAL_IPQ5424_CE_WFSS_REG_BASE,
+	.umac_ce1_dest_reg_base = 0x00203000 -
+		HAL_IPQ5424_CE_WFSS_REG_BASE,
+};
+
 static inline
 bool ath12k_hal_rx_desc_get_first_msdu_qcn9274(struct hal_rx_desc *desc)
 {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
index 08c0a0469474..03cf3792d523 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
@@ -17,6 +17,7 @@ extern const struct hal_ops hal_qcn9274_ops;
 extern const struct ath12k_hw_regs qcn9274_v1_regs;
 extern const struct ath12k_hw_regs qcn9274_v2_regs;
 extern const struct ath12k_hw_regs ipq5332_regs;
+extern const struct ath12k_hw_regs ipq5424_regs;
 extern const struct ath12k_hal_tcl_to_wbm_rbm_map
 ath12k_hal_tcl_to_wbm_rbm_map_qcn9274[DP_TCL_NUM_RING_MAX];
 extern const struct ath12k_hw_hal_params ath12k_hw_hal_params_qcn9274;

-- 
2.34.1


