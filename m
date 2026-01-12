Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BE6D25042
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRYX8YVK4IhobYJuFw94CAvEwbDe36ncjXdGfdxpUb0=; b=Ogk0bziD2Iuv+D+EYeQU5doSYo
	1y+XcQJD4Iyu+XQTgyTw0c+DDMXh69xnC6aTrHe6PwejB9P1Ao29hPpUoQqjbTXgIWr1j8+aZiPHk
	tfPn3cTZ6WsZTbc7Kq+Wp9wFvURxqpo2cDVOtFEXqXJaGPaHSvfCQZ2CYbeU7bc5/3Z+8Syq9jcLz
	VzoJVcYDZtbp21ap9tDJJDQZNWqPTh92zBy5UEJm2Jg4hOlEzZ8qNN+xOElpNbQ0i4CqT1L637iV9
	qwc2uuEx/jCeF79GdRZaAj6orXnk+hmJRljp2M8pGewZViWKEe2sPUhiP6QQjDM5F+2ngvSz82Mcv
	vbuXuyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUd-00000004tzX-0lvM;
	Mon, 12 Jan 2026 07:37:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUQ-00000004tiV-32L1
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:37:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BN04TW3032336
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gRYX8YVK4IhobYJuFw94CAvEwbDe36ncjXdGfdxpUb0=; b=Cv2aVyKh3mNG97p2
	QaJLfCSXKimwJhFv6yrJpUTtyJi7TQbO0kfIhL3E0slkkVrYOG0AnxrZimHL+wYc
	U+3+vSOGHyhCq/xchX7Pqf2+OjtZcjm/n6X6YdAoPfr2/hemikRJ/zuDk3kBsBfI
	iafYMEHJfYdhk43lS0Koas5B9ouIsK39ZlOJB5ClMtk06s+ipc3kbeMagSeIb4Zq
	lvdyQfEvuVz1avfOx4Ui1TGdybDY4yI3UhjYIDlD184whzmMbdUjUm8XjpypY1HI
	c6d33rsm59ujmzDpQL6kneF3oS8SjJ658Oyo62xDYG4Hb03Kfk0kfTwVQY3WcqDv
	gsRDrQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmkk416yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c5539b9adc3so1745128a12.1
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203444; x=1768808244; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRYX8YVK4IhobYJuFw94CAvEwbDe36ncjXdGfdxpUb0=;
        b=EVSN0w9HkK8JJgAzeki3OklOIF2DyXcMGYICMvY8mVGFQe4PdKKqf/o4lwtBRn8pyh
         6ySfMuk6nv1G5O1y/Z4JIpc/zdUbQ7WKp0qpowlREJpIMA6rEF0+2ie21EiKc2tnqpo0
         l/n3dbgtByzm6gADgvaSomTgyL+/20IGDaNwh97ZWy+FSCKZjpjrK5rrO4kZ+Sdfhtly
         Hbl+tE3CC3g8FLg+1GeqGAQSQ/IKd7XcCE35yHVGxYm8RlfpQP6DZtmt/AFidbqytOrz
         eQIUzI9PMNEVOIyGJQzRFcwGEDbzPGHK8yNUDwkY8uuyiACtnWLTNRJHzfXoiEknRz3i
         iwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203444; x=1768808244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gRYX8YVK4IhobYJuFw94CAvEwbDe36ncjXdGfdxpUb0=;
        b=aAngTHTJ/SWVt59lHXkzUb/dwgZ2QC4sYXMxDNzbIxVvyb5xqhvHI2R+RoU5Zm7b38
         3p5bO86CLsMk6B4or+dHiPgcTwXIVvHRC0sbpWldDP1p6maRHZXwD3azAiHMJvCp1gtp
         wKL0KtJS74aFuUxraDm7HwRyDiPV6ZUFISLlt23mT+ONBLlg/YF0XRTLdQUdY1YYRKd+
         kbJvYE94hI4RhfKZC7fr4naVPJYUt0D8O4qZebjdsICyjsztbab99LK2oBlcqlafKBAl
         17CObVlBbEILcNDAZCfauad3usp4oK14pr1a0Qy+Aw1YqdKQR0bhmxZJghY9jDP+4HQP
         1eMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV++m3krF1K0mkOaKG9c5uNipwPG8G/uyMkDYSpeh9rHzdS/bvXRuYLUVIRmiq8Bjh0roudaN4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAt3XAaPhDptxPWbtlANnqhc3v/VnipSL+ay7sAtT/h6J4skKL
	o6FUHt5+EQ0T8yu+klbA78R0uwx5aEckH2nCYma11SLk7YDi2FhRan31FKbP13aeGMghPT7FNH9
	53nEJ6VvyW345MbsaDVuDRZr2wt24afObSFY79jcLD7wtPHwFypWtGbq3gqQTWGpLyC7peEbeAI
	4=
X-Gm-Gg: AY/fxX5QX4k099L6WImep9Z4L6S6C9TCffeKUT9qfjCSYZvGTTGRLobhtc6Okm75O+a
	lLWkUU5I2v5RqKgtWV2P7PqtB1ql8UDLW99uTjYA8ltBi8St1SpOBJzfD9IawCVCSCdIi3f7Ueh
	UpJkdAquZVtlbNia5i6e6umFJ3JYZB2qhaV8wcLM1oA2YbjbKGqXPiipY6qv/ostxNX39buqpoO
	W+8mJ+4WIajaFH1QlTmvRRe4jzZkm24UBl4JNl9SWA3Jhcmtk9cLbYb0Rz+7yJzXvcUOJxF6hwc
	NSBaPGxL++S0zANevLzp9BiIVWkNTM/LULLRAuG7gFxpDBNfn3pinb0DY/65BpvT8pwzo+6zLwI
	1u+zlKCFQvGaH0Dhn1eaM4ZqPL+5aCv31lQUXV2j/nO6cVLwnL25IzNqLnucn7EQ=
X-Received: by 2002:a05:6a21:6da1:b0:33e:eb7a:4465 with SMTP id adf61e73a8af0-3898f8cc022mr16140623637.22.1768203444500;
        Sun, 11 Jan 2026 23:37:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNBp3ADETjybZc8krnk+zrEAINBJ30KbTMvu7SVE2uIOY0qEet+yZXYtaJi6JHidGbHLeaYQ==
X-Received: by 2002:a05:6a21:6da1:b0:33e:eb7a:4465 with SMTP id adf61e73a8af0-3898f8cc022mr16140602637.22.1768203443998;
        Sun, 11 Jan 2026 23:37:23 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:37:23 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:37 +0800
Subject: [PATCH ath-next v2 17/18] wifi: ath12k: fix
 PCIE_LOCAL_REG_QRTR_NODE_ID definition for QCC2072
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-17-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: w6SIUNRzkmOAFVB1HHzQdGu2_Ue_xowT
X-Proofpoint-ORIG-GUID: w6SIUNRzkmOAFVB1HHzQdGu2_Ue_xowT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfXymsccbM9g9m/
 Q9QmIsXQK+Ps0YpCPpLKX9z0k/aLM4icRKc/5VVREHbPFfWfeepYiJSMs/+Jep8wuNPyzoNkzQ+
 uAYcgUbrsAhZWDBtTn5L8hLt1ZVNuZIIBcZ16/VDD8rRpXnmpjjw7gLP7/PoF9XUKUyfJ7eOWJr
 ZFT8xDGo1y2Tu4fp3D6TokVW9zrgAMDM9yg+En6bgrROO+qEHjAplxdIu8zvORT1KdeplAcMLYu
 EMQs5NYRbuAdeY4dlsjk+EjO7yaF5t3uZANO8IEHNgh2K9QSa46Ky/wQoFyd1y7SOrf/02Z5dUT
 itiRHsUzEbZ7Rj5FWLYABjh5i0LuU3NCKGpYdLBKr41GqxXSNbusq6TNQNQiHqdKWRnH32+VhJY
 Vd1FPmVrUeaQ7bRJc7JYSfUzcEz534M7YvTTa7QBb2rgvkHklrl0ZbacPNfM+9nXU6Hxy7uX/CQ
 AGlL8X+kqw1HUOb7AbA==
X-Authority-Analysis: v=2.4 cv=cs2WUl4i c=1 sm=1 tr=0 ts=6964a4b5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YBsQQ0GhBToZ_qaIIOwA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_233726_973094_81C6DB94 
X-CRM114-Status: GOOD (  18.11  )
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


