Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC4DFB5192
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 05:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJkK0ZHv7xgx186MXNY2Y9ThbdU6PTv+CGfvbKzd/Mw=; b=rBX02UGoX94rTK8eiiWADdQ862
	qULIxU8Er/c+Ys38NMpc324yVDvsdVnqh3S8oWRiETxqTHquq5/q3rj/+utBChvsn/LdqK8VK1Hkl
	MXJU+hJYqi9kfgijEbrZ85o4RZY92oDqUAudWqA6Y4mViDGbB6kQMX+9Adlt2CuyKciDJcPrsS2ir
	KhXpd/tl18o1V59VePbT/xj4C7Ht+FBW37tbjbCJnOoIfljFCrWXw08d2au9Bp1X2LUxKxrQgYf8M
	/wrF/e8XJ4Fj2ax+g3hwktslkTy+JFX9MPL6rnWtDiVq1rVNzHyEIEPjhQzao8ncPv5KTwbJ3LykH
	VChzSJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yxm-00000005uxi-1eda;
	Tue, 07 Apr 2026 05:26:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yxi-00000005uuV-2S3k
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 05:26:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LPgFG3815288
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 05:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJkK0ZHv7xgx186MXNY2Y9ThbdU6PTv+CGfvbKzd/Mw=; b=YpUeFZJBzKyFGMXu
	0g9Mwa/HeH4u5zNr9pYCj3EhQsdVCV5BO5fITaP0TdxL371Uc6YBReOrESEDOM5Q
	0bZsUTnB9I59xR2DfQtJ7KX7wWHdiAte8j72dR/Bv9zRPrEHvkoXmVY4DPed+udG
	yzT4BslcMXP0YvJ0qKEegyDPYPsy93dCF63bxyUXSAE8HSzXNCVL4tMvcPAhSnc0
	nfEtcTRXC5VEdh2xd9Prgx4IsUjQ7cPm5wRl2EVlV7cY5Ei5KdrV8/JCkgl1/HKQ
	vvk7Fn+bNPVuKp9xGQVHfCllv53WIXtdwBocjuj8o/RzDM/UOJ0roAqn3AyTijN7
	pANnUw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4s5u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 05:26:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76c62eb15bso1856854a12.0
        for <ath12k@lists.infradead.org>; Mon, 06 Apr 2026 22:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775539612; x=1776144412; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJkK0ZHv7xgx186MXNY2Y9ThbdU6PTv+CGfvbKzd/Mw=;
        b=PqRvyfHCuyrbY0d8nkZ9/bYevv2oXtDYHjYDGeO4x2yzaMgwM+1R1dGLV35ANqKb5a
         3iyXBpusK5Je1PpRKI20ggun1ijDKEEzaOcA+MI/gO0zB2rIrpVcBWDxZABxQpIjqASx
         ILfTWPnA66rRCOW2q5PLvCMk7T8mnqiyl8JV1/PM9AVvKhYugxFyT8wcEpq7+tJKp0+g
         8vE5USdWFcEK8b+c34pUDEAU/EePOpGs+edmhOY3Iwt9HaJglbL3WAjJ8OD6SHHDDj0d
         /k+JcfYp7ZNiKA77i7NdmpVYiwpiRmgu/Mdqs/xDEU9YxPPACtWbSuYjCyQlgKWed4Zq
         H06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775539612; x=1776144412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJkK0ZHv7xgx186MXNY2Y9ThbdU6PTv+CGfvbKzd/Mw=;
        b=EXh9VlxWB4r3VRA+7rcRsf8MZ3HpWa2kwgwCNEmTBAdliKIWGsUWIonxjBAtGN0PEj
         hlicrE5dEu9GF5nU1B/SFfFIA/bfGnGfT6U2lZjkCoBJBzTmLIQA96Gd8E4CkzHZo/bn
         QC/5bO5StpRapHKQQ3URBcInhP50OckwKtXkHzlWZfznFHybiRoyLP3GrMvtaaF03mbI
         e9CjS+xVapbuHT/c0F8619+6ZIohuZEO2WrUh1aVyMIqQ0QrKqCacvQEun6ZWizZFnr0
         0mzE6tDZAUIzB2EfklW1K2HtEWgbUJHlS6gI05O7VwAsVDnbZRHCs6xxHKMkCW/s6euZ
         68Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXstVjr8HAAxFXgRNxyVSP16mVseiaYmhjLEoVmtSC8XXmU0qtLAOdMQZkNxTVq2WAB5doyypw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeDfhFecNVIgg7rvcX9NBN9DNrDUiZypXixWMn23+yt787Or2J
	vNjR9AfS1o6HzNA7mH9+TD3aFHeLCI5cFYoe4sDnPXGwkMffir6Yriyq5b2V6bjtCZwsEeL0Z67
	cvXxjgeiEABdKCJFkOLuL8Ky5FDhVvT0pYaMN7wE5Ty6DIvfaKYdlLl0XCX3152Vp
X-Gm-Gg: AeBDietB/E/U3fkELFhCjHz7FCvsE7hySax/EY5itepzkCoyBPTOZ+VFWDi0EjnWUds
	3L8+Sr64NA2sMtIhVngmF4yK5Czr87d2zTqu3Zt6HKqc4C15gV55pgiIQdQcuq8LC4LeftFZvGu
	egLYCWLuTTnHi3SBiGL4hSxvYGzEGQMXfOySi/M94bvUEw7OTZEdwUshSSg8SH/eJjDidHnPeYS
	IdrjZmskAPwNCgnB4psVvAhQ8bU4K0WvkQ+8ccNwXf9zQDQZafjVcOZ2tXcDZonp8kXjOOwP075
	+jyVTlo98K/sXhvpi1lIV0UYSEfvewNLIhu7uPQ5rTLY3VPKhGTRWeyxRAGqqcQfGgspia0xWMm
	7t905OQtvSYr7TjEDDG0W5AvQyTztT3ZoJOOjwMEqM6mYy8sW8VHc5Rcz/wJYcg5GHnsaWf915U
	mwFXkgIxGA+LYkLC1eJn5rNy/606AJmktMp35vxxU=
X-Received: by 2002:a05:6a00:2e85:b0:82c:a048:30da with SMTP id d2e1a72fcca58-82d0da3e057mr14821986b3a.8.1775539611940;
        Mon, 06 Apr 2026 22:26:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e85:b0:82c:a048:30da with SMTP id d2e1a72fcca58-82d0da3e057mr14821954b3a.8.1775539611345;
        Mon, 06 Apr 2026 22:26:51 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm19897219b3a.41.2026.04.06.22.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 22:26:50 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 10:56:31 +0530
Subject: [PATCH ath-next v5 4/6] wifi: ath12k: add ath12k_hw_regs for
 IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ath12k-ipq5424-v5-4-8e96aa660ec4@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d4959d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ZT2xpsdUAhckzUomvuUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3Svh7Tmhs6X8ySO-P_zN2SftEgXeg-T0
X-Proofpoint-ORIG-GUID: 3Svh7Tmhs6X8ySO-P_zN2SftEgXeg-T0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0OSBTYWx0ZWRfX1SXCmukOfF+a
 CWqhaTW6UTDIYf34ka/jxPcH0dhC3F/lLG4jr/v5+RHamV+KTIgKkn4w4/LrehpeORfgvWCC7j6
 1Ybf2Vq+yfKtPXa8PYyFokKKgN+FlW3SZHIUWOtnm9TyfGoJzgFBgbeDZ85F1omVG5kWJB5L7vK
 4MwZHG72vjVo5NNNyKNDktbYI0P4PP5ND9gc/vWzJnEmsenFTfhxXhVWU/uiP0eypB2n9VQfnzO
 eAXA1qBgAv8ViqriYPl6lg0RamBkX41plG4p6u6t+gp7mLa8UgvFmZ1T2g5Psr5blPUi3IfF5sJ
 Ila/KxdFAgoF42YUfchUrM3Z4ovKijEHHw4PsqC1GTvmJqXNnKNivKaEzONwpdurVvjGy5AMRGA
 gJFJlH0ii4J3Tk9wSWwSOjp7OljaY2KAIzBzKj4arOGedNJsbiwk7zbPp+Jn2WYBYyv/VhjHdBe
 mTH49QFumb+O0co+Vaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_222654_813513_2D52BE3E 
X-CRM114-Status: GOOD (  13.82  )
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
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
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


