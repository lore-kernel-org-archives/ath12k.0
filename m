Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A354D25032
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/upX7u/ox6ptfKPVj84C91zINBCjJs8pyXWX07cFxbM=; b=OFEgvmQI7mAAhg8JXr31e77pmP
	Sdtkn3DX39q10gh2T4IQpuqqoYpnZY2JPxFUHLz8ItCTJUX/5SGBOlZMI9GGzNosRij97MRSm8nxz
	HAm9T4rdAgrf4mheGB5PO5H68h2CtM610n/i+3WiAfLGC1ar6sXdmcGDLOrqQdRIaMffmfKnHZUvJ
	vO9FX2bfiX3LHLIQYvLZraOqmXoWlLlVfldlr9XfA/8CwkdtSQ5gvcq8aVptzJ/BCMMQtCyqGSQEu
	QzLY1OU51CPq/MWiFguOuO8tUUbEaXdHQ5zdwPSykddgPdBNee/DswXz09hy220PvHDNsAGTN/VDm
	Jcyedh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCTy-00000004tIY-41eb;
	Mon, 12 Jan 2026 07:36:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCTw-00000004tHg-0l7L
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:36:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BLls243072041
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/upX7u/ox6ptfKPVj84C91zINBCjJs8pyXWX07cFxbM=; b=RLsdF8yOHnjTSNGz
	24bX/pc/X8co+SniaR2gGSCtCOWZpJ1DgEldEvmr6Ovw8r5POPvHo8hJj+mGVoib
	30Z0NTPIbuNb09AfaasdpnZt7MmcVZjGjJH4vkyzMRxHn/bgZDXXf7Vw5oHKeAq1
	zPA6gM5klA7Dw91BkuvXX62IQytDevs16boYsP3gRXgcPUZGb01as5d12X0KKofy
	weIpUjk83Yc3j3slra9DU6vU/NoGsM/wnty94ZAhoGqycKI2aGNffRyEorGgNXep
	DBP20oLUxuZzlJUG0dqZjGeqZjdz9OYa3Okfp9kVlrZatsLa7oPj+jHneFZR5G85
	WoGsxA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntukdbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:36:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c48a76e75so6515119a91.1
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203415; x=1768808215; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/upX7u/ox6ptfKPVj84C91zINBCjJs8pyXWX07cFxbM=;
        b=JIg6nQ1h3NdOAwqmyzr7YUc9tGy6qyQyJ/MgJZd3XPf+OCksDaMNyt2Txiu+96MI0I
         AfKgBQNYuBNJ1uurUtLlGfnYEXSASmZ73Ug7ir6BH6T8EtJLEfaQYG7SCu++0SqzHg0P
         fB9EjCNp9aStUCoF3QfA4k0AH/D7C9SAHuHDObYlp08LuHkujWYp2wnHVA7/5G/UHjm4
         L1q+BHL1NG691iAVKP5VOjAacENW08qKxD9ZcBV6Gbs2nAnBsWvGf5rxoWAwEFNFh17c
         04o2Eiw0mZ3Mdx6PzsFBgjNR9vztZY2+DOhp8gKGq0jYObhEnwqyywu10vSf4AzxQ+Py
         fkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203415; x=1768808215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/upX7u/ox6ptfKPVj84C91zINBCjJs8pyXWX07cFxbM=;
        b=oBuHTuKecMkbsd+kXxVbFfEWHLhDj14QllYHA2qRpewPCDDY/OZJ/9qVdIIBh6AbiW
         kmB4pTpq8uF8funma6tVRRkC0YqCZ/ce+c6XL6BiZwTqAuAlrCxGpqgmYOHL+S7w3Sw0
         3yZaUsgDiLThf66ryy3KPSUc5LLbIrbjmgLUiWQ5UD/Fb0kO0KwMX1T6JCSV84WzQzLN
         UeOJr3db1KJpBZXKjD1+cFXE5glu7jxA75EoW3JMiJeXIOAKV01XPB2o7k5y9UaL65cp
         goji1NxtQxT2Z2uxGRBEFx04YIbOdQwB4j8TpY+4Ou1n6OOWxJlXTMWIp22zEHKVvcuM
         YbDA==
X-Forwarded-Encrypted: i=1; AJvYcCUkYSnXgRmY6julCCN4/fR73oye7c/TOVzLr6dI7wd2ggReIKr1ddAoM0XfO06HGQqfwRcS+B8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPnFuQtzzgqcxF2r+AeE6Rs6y3HlLUREyulbwtltsSBIElAlap
	Q3W9v3JSv9cIkHNxd9vADJrQRFSejAwoB2AmX+JunG5NnKou/mjkO2jLFyfuS/yUSFCNzS7iNqN
	Y7MxITY0V8v9KjSn+YIkVkLKaHoziGqSDDD1Ey9guHOO2LMxFItFz3nTpa28yuAK54+X1xOyLDp
	A=
X-Gm-Gg: AY/fxX5wIAeAs/C+voFsqWCyxh/dP3xg+/CLIxv0a1n/owyLa5tmBAexXGlvOo74Lj4
	UYdBwdtnTsH+YK1HvaDByE02JjV3sdJ1QSHoK4NQxLtKlPZDWjK1H7hV4QoD0EFGwU04Oi3blov
	JS2yvUbAlvxT4pS5ezsskSVdGWXc047eQcXrugAONcFhTbEklMCm1PgrZYtQ8W3VnAr4C6Ydf0J
	Dt6h1zcV4/6XoO/T+XS+i31nNNGG6OMmzj2qAzznnTGH2F9/j8rHa0zN2nW4Od3EgCBVMeiNGO0
	szuGxipTpXqmFzSmnw4c1fcVlSzavHKYv6RySHNsqenONXBoBrWI6jz23aUPl4kxohQHNGVbOLY
	N5/BvkvUBIqRpao8L5kvwR8NThX1SWZmH2ZWeqtKD0OmY60AogEtt1CpHMAPSkl4=
X-Received: by 2002:a17:90b:57f0:b0:341:2b78:61b8 with SMTP id 98e67ed59e1d1-34f68ca4536mr15104172a91.20.1768203414910;
        Sun, 11 Jan 2026 23:36:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKO/IgN3gfVBpIG9a2C5e6ZTDabLs4QW2+nni/OACwLimm9UaLCQW3e7aIs0vh7DN9xeyJrg==
X-Received: by 2002:a17:90b:57f0:b0:341:2b78:61b8 with SMTP id 98e67ed59e1d1-34f68ca4536mr15104160a91.20.1768203414370;
        Sun, 11 Jan 2026 23:36:54 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:36:54 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:21 +0800
Subject: [PATCH ath-next v2 01/18] wifi: ath12k: refactor PCI window
 register access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-1-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX+I1B7QBhiYy4
 3v79cIS7/IJ0cyT/0fy3ZGQvSsuwZv9ISJQpl9brUUfpES3g4I3zml1BfiB2N/uvQWlbIuR/V4L
 SS8jf/jPqEfPFZZO6QYMn4cqpOsAs/1cKA2Yi4ErVZF1CICqh5KUDlU4kSCMwr1a0csNLyGQLRo
 HwKFRGs+7P4RhRzFHPwld0+HB38o6rVXEY2sLl9Ndcl1OoISUXeQXl9uErZAPedj9fodCWWatej
 vbwvf5zM+nVbRLt/47dwF7foRyr5k1Z3g/oanVG76j8CiWGHhI8UAFZlNitkrhRvDIf6FeAF/Iz
 YFeSe6lxsh6QrFnxL/Q94zmNULikuboduQzgGasIZQFQvP61Mlk0UR1dFCi/sHvlCNv1mCzIdfP
 wEJYHgBvaWfYtnY6BshQ1Pb1rdUaZ79jcq9ZKDqPtoRHztcoXjF693cuUD7Tjy+o7wsvfVHwfbR
 wwT0/UhjyozW6A5leQw==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6964a497 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-0iOq_zPj34lsyxnQQ0A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: oeZm6O_NHRUzyt3Q4FWL2k-upAQTdulM
X-Proofpoint-GUID: oeZm6O_NHRUzyt3Q4FWL2k-upAQTdulM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_233656_227565_CB67B402 
X-CRM114-Status: GOOD (  17.25  )
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

Currently offset of PCI window register address is defined as 0x310c which
is same across existing chips. However QCC2072 has a different offset
0x3278.

In order to make the window selection logic work for QCC2072 as well,
change to initialize this parameter per device at the probe time.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c       | 11 +++++------
 drivers/net/wireless/ath/ath12k/pci.h       |  2 ++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c | 12 ++++++++++++
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index a42c4289c6b2..4bc30d86c1a7 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -23,7 +23,6 @@
 #define ATH12K_PCI_IRQ_CE0_OFFSET		3
 
 #define WINDOW_ENABLE_BIT		0x40000000
-#define WINDOW_REG_ADDRESS		0x310c
 #define WINDOW_VALUE_MASK		GENMASK(24, 19)
 #define WINDOW_START			0x80000
 #define WINDOW_RANGE_MASK		GENMASK(18, 0)
@@ -125,8 +124,8 @@ static void ath12k_pci_select_window(struct ath12k_pci *ab_pci, u32 offset)
 
 	if (window != ab_pci->register_window) {
 		iowrite32(WINDOW_ENABLE_BIT | window,
-			  ab->mem + WINDOW_REG_ADDRESS);
-		ioread32(ab->mem + WINDOW_REG_ADDRESS);
+			  ab->mem + ab_pci->window_reg_addr);
+		ioread32(ab->mem + ab_pci->window_reg_addr);
 		ab_pci->register_window = window;
 	}
 }
@@ -145,7 +144,7 @@ static void ath12k_pci_select_static_window(struct ath12k_pci *ab_pci)
 	ab_pci->register_window = window;
 	spin_unlock_bh(&ab_pci->window_lock);
 
-	iowrite32(WINDOW_ENABLE_BIT | window, ab_pci->ab->mem + WINDOW_REG_ADDRESS);
+	iowrite32(WINDOW_ENABLE_BIT | window, ab_pci->ab->mem + ab_pci->window_reg_addr);
 }
 
 static u32 ath12k_pci_get_window_start(struct ath12k_base *ab,
@@ -178,8 +177,8 @@ static void ath12k_pci_restore_window(struct ath12k_base *ab)
 	spin_lock_bh(&ab_pci->window_lock);
 
 	iowrite32(WINDOW_ENABLE_BIT | ab_pci->register_window,
-		  ab->mem + WINDOW_REG_ADDRESS);
-	ioread32(ab->mem + WINDOW_REG_ADDRESS);
+		  ab->mem + ab_pci->window_reg_addr);
+	ioread32(ab->mem + ab_pci->window_reg_addr);
 
 	spin_unlock_bh(&ab_pci->window_lock);
 }
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 1cc4f0e050f9..a74b09d23a6a 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -130,6 +130,8 @@ struct ath12k_pci {
 	u64 dma_mask;
 	const struct ath12k_pci_device_family_ops *device_family_ops;
 	const struct ath12k_pci_reg_base *reg_base;
+
+	u32 window_reg_addr;
 };
 
 struct ath12k_pci_driver {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.c b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
index dedc88858bb0..6c477fe97298 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
@@ -27,6 +27,8 @@
 #define TCSR_SOC_HW_VERSION_MAJOR_MASK	GENMASK(11, 8)
 #define TCSR_SOC_HW_VERSION_MINOR_MASK	GENMASK(7, 4)
 
+#define WINDOW_REG_ADDRESS		0x310c
+
 static const struct pci_device_id ath12k_wifi7_pci_id_table[] = {
 	{ PCI_VDEVICE(QCOM, QCN9274_DEVICE_ID) },
 	{ PCI_VDEVICE(QCOM, WCN7850_DEVICE_ID) },
@@ -104,6 +106,11 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		ab_pci->msi_config = &ath12k_wifi7_msi_config[0];
 		ab->static_window_map = true;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_qcn9274;
+		/*
+		 * init window reg addr before reading hardware version
+		 * as it will be used there
+		 */
+		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS;
 		ath12k_wifi7_pci_read_hw_version(ab, &soc_hw_version_major,
 						 &soc_hw_version_minor);
 		ab->target_mem_mode = ath12k_core_get_memory_mode(ab);
@@ -126,6 +133,11 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		ab_pci->msi_config = &ath12k_wifi7_msi_config[0];
 		ab->static_window_map = false;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_wcn7850;
+		/*
+		 * init window reg addr before reading hardware version
+		 * as it will be used there
+		 */
+		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS;
 		ath12k_wifi7_pci_read_hw_version(ab, &soc_hw_version_major,
 						 &soc_hw_version_minor);
 		ab->target_mem_mode = ATH12K_QMI_MEMORY_MODE_DEFAULT;

-- 
2.25.1


