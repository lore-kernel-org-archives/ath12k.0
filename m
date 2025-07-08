Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A4EC83F0F
	for <ath12k@archiver.kernel.org>; Tue,  8 Jul 2025 19:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDQQPlyVXHeTjS0woDlYKuu2qKMss3vgvb8MQtjuQHw=; b=BYwYGeVx2Uf6tmmOHW8J5qrIvp
	gDZ3K+oduVDuPzn2qpiQi5Q2RgiJPnxOUJKZXglB0e5+v+L4VXlpTfFymV6qfi4rhqJ24XB5m0zxa
	8P/hgqpVMF5rvjsxwiFR6jAWwgKem1ThEpMr2kznF57ppB/WNeyqPEh9rzopGxfCuTRZ2woNj6bAU
	3n9aAu8YgcPka37OMO9Z1o8omxBLY4+BVwHmwzxPf9YBsiyU3/9zOPcsUIF7huKCrsFlOC+W8iKpg
	yHaciuLI7zuH2oFBCuRmhKKACiyK92DARNVNts7EbxmbYa51D3dAoJcgq97QnIe2cPLQHwG0GpMbv
	EGPVnWMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAn-00000006NsS-3gd1;
	Tue, 08 Jul 2025 19:40:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCmm-00000006DJ9-05Uk
	for ath12k@lists.infradead.org;
	Tue, 08 Jul 2025 18:11:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568ERLIh027382
	for <ath12k@lists.infradead.org>; Tue, 8 Jul 2025 18:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PDQQPlyVXHe
	TjS0woDlYKuu2qKMss3vgvb8MQtjuQHw=; b=I4sBTt+O7CVW0clC3AfMWaoZPaJ
	gT+NLiNgFVp7B3jUr4mNpyW5QUvQyNdFTPdgzy3aJ0L9VZZJFAy4WabPFBLkuPEu
	6B/FxHN7SwtXDFeDwFv1SPNkrHrX/qd2JOw1CO7mJe9dLrDgAahOcpUtEleedHBD
	UpE4gDarMeF3a10veLOWcGmS7ganWLGPTju0+KlDCUAudm51K2CRRvsglFQvrrtN
	G0lF7H3lH9QnyhMHiyYtVy4qqqegzwjnltFGMEJkxwPvkLzuSvE1uNgyt6+eH9ig
	JePmiJ8YqUjb4s8P62bmZJZloer1gSKJvawztELTHq1oVYycbW5FtH/MqHw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdr1bva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 18:11:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23638e1605dso37631855ad.0
        for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 11:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751998277; x=1752603077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDQQPlyVXHeTjS0woDlYKuu2qKMss3vgvb8MQtjuQHw=;
        b=Hn1N2yWm1jTUIIF4hb4DqW4Gl/ctAVYwWhSybDOD/c8vUF5GFoklPTjmkkVE2562zs
         0znKhQevE/p5xxdup6ob89hHoC84khWjW4FR+sQl32bNLaG0FL+GF9m33vv98tPiuTLJ
         /8pIl9ViVJhUfBNsR7uF8uPdzDavHbJxzJrNlwNeXkg3jV/TAmR3SzlWa99gIMte0qU5
         wZKy+x61ku5G64ToPBkIaJGA+cYnk1BiVQjQVfDscqsMhd5TuiNUM+gYsBUDvft+Wgak
         h/13eaTjC1qBuq/9rP9tzkuSJ29m5Cvsz1Dxj8eEW/kUHUaKrVlVVrZAj2IPph+9AtTf
         Zg7A==
X-Gm-Message-State: AOJu0YzrV/BPMDbJSi4m4SbodNq7o06RD/fcgBZXUNn/E6pvkxHtjaLV
	NVBPzIPK+c7HbIHonsRKrAIuD0lK5DLo+VBMDROfZlSNEDvup6BkU4ax41f4lBY+vauH8bPLzAx
	JbGTY42uqNerpN2zlgko2bmJV5PhFFpBUAgZDsxKGUlv+WpoI012wpVq0JHLuOpeiItwEuaQN
X-Gm-Gg: ASbGncukBQMlfusxk7f8GDGysLGWTDpIIKlFH32DsKeesDSByyvkLVMDoUJ0yWFpwr+
	fsPqDWYeQNWrXXlwcgj27QtZYBoZK0CHid5hLoexlvIHg6IWrSL3onMptry8OKziW7937CzfSpO
	CNraGBlYIr1o7v5Q+6kIfSuRcbPVF5DLDmPGhpIdP1GOVmq/k5vcdTcPcmO1++SDGrRWL6O3/7O
	UNrl/UTdhZAVoz5zvoz6zAGjVO4O2Y2bgpITi1Sg0t5zt0Gfq2soU9JY0YQMj2QKxX1i6m/LnYo
	zYbpZMR/OuL0Uo1hGTGxcbdUQOoXXdBVh9W3gIrb7P1hPe/69jH80oM9Kyn4bxrIIjmIeJihN3M
	I9iNCVCbTnH/GFHk/pLEJOq7K73ArpLdxeqn7nYAHkPrcpA==
X-Received: by 2002:a17:903:11c8:b0:234:c2e7:a102 with SMTP id d9443c01a7336-23c875acb4bmr302714175ad.43.1751998277489;
        Tue, 08 Jul 2025 11:11:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMyeSXllmP6m2/JdAhcJhqK49ek9KKCbovVDSPqQI+Y6lC8k1G7S2GMhzpPyUXaWnSfqUxiA==
X-Received: by 2002:a17:903:11c8:b0:234:c2e7:a102 with SMTP id d9443c01a7336-23c875acb4bmr302713865ad.43.1751998277053;
        Tue, 08 Jul 2025 11:11:17 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455d0a9sm115980425ad.95.2025.07.08.11.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:11:16 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 4/4] wifi: ath12k: Enable memory profile selection for QCN9274
Date: Tue,  8 Jul 2025 23:41:02 +0530
Message-Id: <20250708181102.4111054-5-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708181102.4111054-1-aaradhana.sahu@oss.qualcomm.com>
References: <20250708181102.4111054-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686d5f47 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=RydBrGAMdIcuIQtkkqMA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 8CtgKJ5MUsvw9fqi9Is60OuIEHTj189B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE1MiBTYWx0ZWRfX5hl720wuoOoy
 Fa15Zy2rMRpPNzMZzMtcsT4npXs68k4rDjLKzG6wFBZDHlpSxXogZl2KmXcE/g48VS6cXbSF1tf
 iZ9SWmdTsI3s0zZQvcd3EDokY2pVj+patwd2XQ8taIni8qbaPjn01IZm9kyWN06PJfpKY3Z1ZuC
 1cZq17eGL6gWuQCdbmhqXG+VCtBNjE//NJyDjtQIdNAVPrNSzqYwwHdqOW6BDF4qdTgs2asnBz7
 DTNFU1ZS2di8FYoszkvaxiBaM+hN1Docjkr22RAMAre5s9rYTRU+G5jCelrrFklT8rZ0WbewBQi
 EiUseED+GPknxKWkyzzfpv9Lww7JFpKk9GUtR3FwqfcmS1oGQN3MlWApT6sJfCeDyPFBZfDpTeL
 bFJhFh/ApdIqsqFxzY1frWvs+jHrEeA7R0apbsMQmgGIC7oJy3kUaC4E27W0cLdpQDNlAAjJ
X-Proofpoint-GUID: 8CtgKJ5MUsvw9fqi9Is60OuIEHTj189B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_111120_178384_8ADE8CB5 
X-CRM114-Status: GOOD (  18.85  )
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

The QCN9274 supports two memory profiles: a default profile and a
low-memory profile. The driver signals the firmware to enable
low-memory optimizations using the QMI initialization service.

Add support to select the low-memory profile on system with less than
512 MB RAM.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c  |  1 +
 drivers/net/wireless/ath/ath12k/core.c | 16 +++++++++++++++-
 drivers/net/wireless/ath/ath12k/core.h |  2 ++
 drivers/net/wireless/ath/ath12k/pci.c  |  2 ++
 drivers/net/wireless/ath/ath12k/qmi.c  |  2 +-
 5 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 8d1a86e420a4..3b983f4e3268 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -1022,6 +1022,7 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
 	ab->hif.ops = hif_ops;
 	ab->pdev = pdev;
 	ab->hw_rev = hw_rev;
+	ab->target_mem_mode = ATH12K_QMI_MEMORY_MODE_DEFAULT;
 	platform_set_drvdata(pdev, ab);
 	ab_ahb = ath12k_ab_to_ahb(ab);
 	ab_ahb->ab = ab;
diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 53e60dba3bf8..bf46acb54268 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1728,6 +1728,20 @@ static void ath12k_core_reset(struct work_struct *work)
 	mutex_unlock(&ag->mutex);
 }
 
+enum ath12k_qmi_mem_mode ath12k_core_get_memory_mode(struct ath12k_base *ab)
+{
+	unsigned long total_ram;
+	struct sysinfo si;
+
+	si_meminfo(&si);
+	total_ram = si.totalram * si.mem_unit;
+
+	if (total_ram < SZ_512M)
+		return ATH12K_QMI_MEMORY_MODE_LOW_512_M;
+
+	return ATH12K_QMI_MEMORY_MODE_DEFAULT;
+}
+
 int ath12k_core_pre_init(struct ath12k_base *ab)
 {
 	const struct ath12k_mem_profile_based_param *param;
@@ -1739,7 +1753,7 @@ int ath12k_core_pre_init(struct ath12k_base *ab)
 		return ret;
 	}
 
-	param = &ath12k_mem_profile_based_param[ATH12K_QMI_MEMORY_MODE_DEFAULT];
+	param = &ath12k_mem_profile_based_param[ab->target_mem_mode];
 	ab->profile_param = param;
 	ath12k_fw_map(ab);
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 272b7e9822ea..996753d794f0 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1230,6 +1230,7 @@ struct ath12k_base {
 	struct ath12k_reg_freq reg_freq_5ghz;
 	struct ath12k_reg_freq reg_freq_6ghz;
 	const struct ath12k_mem_profile_based_param *profile_param;
+	enum ath12k_qmi_mem_mode target_mem_mode;
 
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
@@ -1364,6 +1365,7 @@ void ath12k_fw_stats_free(struct ath12k_fw_stats *stats);
 void ath12k_fw_stats_reset(struct ath12k *ar);
 struct reserved_mem *ath12k_core_get_reserved_mem(struct ath12k_base *ab,
 						  int index);
+enum ath12k_qmi_mem_mode ath12k_core_get_memory_mode(struct ath12k_base *ab);
 
 static inline const char *ath12k_scan_state_str(enum ath12k_scan_state state)
 {
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 1f3cfd9b89fd..b4e7e77518dd 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1595,6 +1595,7 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 		ab->hal_rx_ops = &hal_rx_qcn9274_ops;
 		ath12k_pci_read_hw_version(ab, &soc_hw_version_major,
 					   &soc_hw_version_minor);
+		ab->target_mem_mode = ath12k_core_get_memory_mode(ab);
 		switch (soc_hw_version_major) {
 		case ATH12K_PCI_SOC_HW_VERSION_2:
 			ab->hw_rev = ATH12K_HW_QCN9274_HW20;
@@ -1618,6 +1619,7 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 		ab->hal_rx_ops = &hal_rx_wcn7850_ops;
 		ath12k_pci_read_hw_version(ab, &soc_hw_version_major,
 					   &soc_hw_version_minor);
+		ab->target_mem_mode = ATH12K_QMI_MEMORY_MODE_DEFAULT;
 		switch (soc_hw_version_major) {
 		case ATH12K_PCI_SOC_HW_VERSION_2:
 			ab->hw_rev = ATH12K_HW_WCN7850_HW20;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 5e8943060443..7c611a1fd6d0 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3856,7 +3856,7 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	memset(&ab->qmi.target_mem, 0, sizeof(struct target_mem_chunk));
 	ab->qmi.ab = ab;
 
-	ab->qmi.target_mem_mode = ATH12K_QMI_MEMORY_MODE_DEFAULT;
+	ab->qmi.target_mem_mode = ab->target_mem_mode;
 	ret = qmi_handle_init(&ab->qmi.handle, ATH12K_QMI_RESP_LEN_MAX,
 			      &ath12k_qmi_ops, ath12k_qmi_msg_handlers);
 	if (ret < 0) {
-- 
2.34.1


