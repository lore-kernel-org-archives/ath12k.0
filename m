Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205B0D68BC9
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 01:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRYX8YVK4IhobYJuFw94CAvEwbDe36ncjXdGfdxpUb0=; b=VVtmavmLoa/NihtW/NkQJgJcDQ
	ngaN7syHP3iffpITvKo4lIXr1mULV6zWDnfsMCfVRnCghbXTJc/MzpRjRvCxhCn0sCH1hWD1Iif8v
	6OG6KbV7Ql4R2BA0qz+g9VjKlhz8WTPp7Dv5wPMGfKOKPl0p3vubyE1/NKw2Pp8+w/J+1VEWNmkxn
	5zP0TMl5McEg0ltbboTPUZSkEp01b+blbmp/pK45pgf+4MlOvT7F+OeLMapGCxTVII8/F/eM0FvcK
	8w43Z0FWiJDLeFirU9xJdHkSJ9O4sjpmsNYvluuwCLe8L6J/4z4oyf9LJCLV4qM7DHO5J+4eV9Aic
	ZC6lkI7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3FA-00000007gNm-2w13;
	Thu, 18 Dec 2025 01:55:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Ez-00000007gCh-3S5l
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:55:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YjpB3717113
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gRYX8YVK4IhobYJuFw94CAvEwbDe36ncjXdGfdxpUb0=; b=csMKhYk0+XhXmGhe
	DHBeZ7zGNIrJIyQY0n4qMyNUgxQlnjn8kI0lyQHZiChz9Mxr6dituKTDGnP0am+G
	rYZnj5HwmPi+cDm3E1TRSdKLD/cooGJrYRpsAFDow+Du0bODQn7bsZiIPVOKvWGv
	K+hUnZGPUds+B+6AxP5nECTop41WcvNGnoQs6JZPviLg399jOcnEWZqEroYap3pG
	9cIIgE56dlRkpzYLqV+GrC5/NxP8Gl9O/AlD//5PEX1Og8XNRfE58HN8imNqEQFk
	Or8E6RWNWM77Zo3Mg61t8OP8MNICgKH7uVD9UlTtw8tQmoEfV7DcprW11FrUqrnL
	YAEqDQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40n79av8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1f79d6afso2419435ad.0
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022940; x=1766627740; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRYX8YVK4IhobYJuFw94CAvEwbDe36ncjXdGfdxpUb0=;
        b=ULhODItxaTQLACf7YB8b3YzE7PAP6/Q2S6WAWwnvw9mVmloMKdzBE9xLKLahDLhA2J
         ZWRl/yMJTPeD4R41V5wt/L3whZO+A+n8x7bgfqpmhA92z28Zq4nPY2Xhe6WfvoW65qSe
         bfrWBE3n9c/XJnyrtjJgbgVjSRVlAw/PS9lHiM/8BMK4hQXvo7ShtWFDxZC45xg+mUhR
         hwMKITEgo4/+RaZYowpCcUADPvksZegff62SgJLkYrcNBztS9Xs9NbdACIegF/BXfc+j
         Fgmhlkw4v2716gn/wHnHlMyChfdfICd2EPFMm6h4DQ0XnZJwKdX4Qth40t+e5JFtpkeL
         /4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022940; x=1766627740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gRYX8YVK4IhobYJuFw94CAvEwbDe36ncjXdGfdxpUb0=;
        b=Ka/UVoRhxhShIeYyip5i2igOacyx6dV7ivebbUi2IaTPrzbiNInJwmamnOV0LiIMr+
         mkWGb2jSU4hGT6OUEkcxvXCW9EW9rIuBMwIqxll+q27vpHkVzS37its4QOMbQN6zkCeb
         huf9R+chQySe9arfGghSuVG0jCQ5U7TII8oZjtYSsmQjzh2FxF+7BQ9hLYeU2QZ2ekqD
         q73+VgJqgGODn4UYC3T1AciBCje1wWlG3fGiIe6pG0+qtLLegwne7Tlf6gXKcle6L7V3
         nYCscICLj5Y5FknDSAwFaNKp7UdFz3vVYA1KvyrTQd08Qx7XS4q3zWGAI0FhKnFQ4O4k
         hs1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVE/pzDaMCETAD7GDxC+xsuR5hLmiKmuPZ15eg6bSZhtWc+/51prc1cQzi+ff+GmDnEbBSdEvc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyY8CJdghYDjzephNCTQxiPHqpnYNaElQXTDj0mm9V1oFOTWw7C
	laBnVtMn01467f5YOB5X1d7eOuddC3kX/FMVUHbpM7i6oP8C9rKHeYXWVC/ArtVje3ueY5aVhUG
	70ng5uOauKp5O+bIG5DlB2QfCEa0naS94zrEIH2kTiVBcYcDfI9mqafiFTenIo/CSJuRUxuyIDR
	k=
X-Gm-Gg: AY/fxX7/86mfaq46DuocI0Ehliye7v7uCpvKDRxW9J8sPsON30raJ61GB0Zi8MoexyO
	Ri9D8K/7diQsZjdJJSsk0xLM5MSoPimMFwbI7iaNENVUDEUgcrquleNbconwSiqGCgetj9+cmTh
	+fPmBudhbyI6Uqj+9d3+Nsf0YWgtCX5Yflne4tTTUNz8ZQ4qgb2enF/FnP5ZdfB6d+mAd5Z4P8a
	RnjGmbPvcPasVwvERcTx9CBtT9PB6UdEeqibdm7CTKs7UKhwKgIVInxUCeYU00/ggLET4TAnZoV
	cLM6gcZYgKgdnVPezYPJ/nH3EnmDdJ7AQ8s3aSF1SuRJ3E2Mv2CnpQbCQ5IGgkAzfdHIpTMru42
	bS8+mlP1iKobvZX0e0wXRcNSIiespfu80ugEqosAi9JC2HdN3hw+Z8XcqgY6YC78=
X-Received: by 2002:a17:903:9ce:b0:2a0:8be7:e3d0 with SMTP id d9443c01a7336-2a08be7e921mr171448435ad.10.1766022940562;
        Wed, 17 Dec 2025 17:55:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZWWpOqXptoEU6HXFRxsWArqZch+yr3Q3+04pMRPU9jE2HV5wA7WbSCo+tFkBd61X569Iugg==
X-Received: by 2002:a17:903:9ce:b0:2a0:8be7:e3d0 with SMTP id d9443c01a7336-2a08be7e921mr171448215ad.10.1766022940082;
        Wed, 17 Dec 2025 17:55:40 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:39 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:32 +0800
Subject: [PATCH ath-next 18/19] wifi: ath12k: fix
 PCIE_LOCAL_REG_QRTR_NODE_ID definition for QCC2072
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-18-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 8X_9y-4pPF4r7RPZ1dWOY4_WGKYUgsXP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfX79TvPKErrflH
 Ute3V5stFUAKP+T26dRs4N/dpik7MQL0f4JSlgIrWJABAQPb5VUoYAoy4rxosbn4NrBnX0tRvdI
 grjzszHPbTJOqsUnwRXeVcqgCo51IDNjBfzLVx7v5dI9cONQjA4RnRTLWWOrnPH9y3VlUXkBf+z
 Jf9KDGxZXS9FqrsDdTI9R28vxAg74QFXS7a5cQQuGSOzToec/8CrTLrpWGRA3u87ErHFUM8AVzH
 V1mgpSsenoTt3LbZpdvmDQoXRiU1+ZFKdF1BeBhbtI4dbjphjgf7JJK3g1aTfv14F365qHYfKGO
 0ZoWWIcH5iQpMJKnDhbaPRHiNIDISsXzHBYGBsPWK+0Cbnv43MldCznZ2zbXGFJxPj0IzUIcfeq
 VWMChUy0H5Zkb0f9WPSzNA1ZZOYGQQ==
X-Authority-Analysis: v=2.4 cv=TZebdBQh c=1 sm=1 tr=0 ts=69435f1d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YBsQQ0GhBToZ_qaIIOwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 8X_9y-4pPF4r7RPZ1dWOY4_WGKYUgsXP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_175541_924742_8807FDEA 
X-CRM114-Status: GOOD (  18.42  )
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

From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>

The definition of PCIE_LOCAL_REG_QRTR_NODE_ID in QCC2072 is
incorrect, which causes the QMI connection to fail when
ATH12K_FW_FEATURE_MULTI_QRTR_ID is enabled. To resolve this
issue, move it to the hardware register table.

Note IPQ5332 is not affected as it is not PCIe based device.

Tested-on: QCC2072 hw1.0 PCI CI_WLAN.COL.1.0-01668.1-QCACOLSWPL_V1_TO_SILICONZ-9

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h               | 2 ++
 drivers/net/wireless/ath/ath12k/pci.c               | 6 +-----
 drivers/net/wireless/ath/ath12k/pci.h               | 5 +++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c | 2 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c | 4 ++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c | 2 ++
 6 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 520587305dfa..43e3880f8257 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1201,6 +1201,8 @@ struct ath12k_hw_regs {
 	u32 reo_status_ring_base;
 
 	u32 gcc_gcc_pcie_hot_rst;
+
+	u32 qrtr_node_id;
 };
 
 /* HAL context to be used to access SRNG APIs (currently used by data path
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 4bc30d86c1a7..fb597f063614 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -34,10 +34,6 @@
  */
 #define ACCESS_ALWAYS_OFF 0xFE0
 
-#define PCIE_LOCAL_REG_QRTR_NODE_ID	0x1E03164
-#define DOMAIN_NUMBER_MASK		GENMASK(7, 4)
-#define BUS_NUMBER_MASK			GENMASK(3, 0)
-
 static struct ath12k_pci_driver *ath12k_pci_family_drivers[ATH12K_DEVICE_FAMILY_MAX];
 static const struct ath12k_msi_config msi_config_one_msi = {
 	.total_vectors = 1,
@@ -918,7 +914,7 @@ static void ath12k_pci_update_qrtr_node_id(struct ath12k_base *ab)
 	 * writes to the given register, it is available for firmware when the QMI service
 	 * is spawned.
 	 */
-	reg = PCIE_LOCAL_REG_QRTR_NODE_ID & WINDOW_RANGE_MASK;
+	reg = PCIE_LOCAL_REG_QRTR_NODE_ID(ab) & WINDOW_RANGE_MASK;
 	ath12k_pci_write32(ab, reg, ab_pci->qmi_instance);
 
 	ath12k_dbg(ab, ATH12K_DBG_PCI, "pci reg 0x%x instance 0x%x read val 0x%x\n",
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index a74b09d23a6a..0e0e2020c6ae 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -59,6 +59,11 @@
 #define QCN9274_QFPROM_RAW_RFA_PDET_ROW13_LSB	0x1E20338
 #define OTP_BOARD_ID_MASK			GENMASK(15, 0)
 
+#define PCIE_LOCAL_REG_QRTR_NODE_ID(ab) \
+	((ab)->hal.regs->qrtr_node_id)
+#define DOMAIN_NUMBER_MASK			GENMASK(7, 4)
+#define BUS_NUMBER_MASK				GENMASK(3, 0)
+
 #define PCI_BAR_WINDOW0_BASE	0x1E00000
 #define PCI_BAR_WINDOW0_END	0x1E7FFFC
 #define PCI_SOC_RANGE_MASK	0x3FFF
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index ee2427fadfc1..1eefb931a853 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -92,6 +92,8 @@ const struct ath12k_hw_regs qcc2072_regs = {
 	.umac_ce1_dest_reg_base = 0x01b83000,
 
 	.gcc_gcc_pcie_hot_rst = 0x1e65304,
+
+	.qrtr_node_id = 0x1e03300,
 };
 
 static void ath12k_hal_rx_desc_set_msdu_len_qcc2072(struct hal_rx_desc *desc, u16 len)
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 95850e6dc6c7..41c918eb1767 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -297,6 +297,8 @@ const struct ath12k_hw_regs qcn9274_v1_regs = {
 	.umac_ce1_dest_reg_base = 0x01b83000,
 
 	.gcc_gcc_pcie_hot_rst = 0x1e38338,
+
+	.qrtr_node_id = 0x1e03164,
 };
 
 const struct ath12k_hw_regs qcn9274_v2_regs = {
@@ -390,6 +392,8 @@ const struct ath12k_hw_regs qcn9274_v2_regs = {
 	.umac_ce1_dest_reg_base = 0x01b83000,
 
 	.gcc_gcc_pcie_hot_rst = 0x1e38338,
+
+	.qrtr_node_id = 0x1e03164,
 };
 
 const struct ath12k_hw_regs ipq5332_regs = {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index 88f51a3828aa..e64e512cac7d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -256,6 +256,8 @@ const struct ath12k_hw_regs wcn7850_regs = {
 	.umac_ce1_dest_reg_base = 0x01b83000,
 
 	.gcc_gcc_pcie_hot_rst = 0x1e40304,
+
+	.qrtr_node_id = 0x1e03164,
 };
 
 static inline

-- 
2.25.1


