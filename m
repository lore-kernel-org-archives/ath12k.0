Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516C0C369D7
	for <ath12k@archiver.kernel.org>; Wed, 23 Apr 2025 05:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mfeaAyPbqKzUrxGK0601OHrueXF6aP8Xdg7+bNpyXU=; b=MYHDSql/Go1y2DQaFPoJSao82Z
	8gZeOCOp+WUPVULpwZbff6nWliNCjFoKSvBBdU0/ZzVGQWME5llmGwcevl2MFC6wwAfMK4fd81y1h
	Pmz/ysA7JrflhAMMi4F+aHthfUPJbzSlhtCkDmUqY8/y31HxwETbel3CzExNPLGctmdEM04iknrJa
	gxl8somaJq/D7QtU4I5HENS6G+oCNm8kMe8ZdZbwIoNxKynTxYbD1SBcdqnREpFWf16dBKJ/fIzvo
	bYD7PuTwflsp3RVwfpW3d+YNAYd78a8vL7uQ+cH4Y8cN9kIg3+xLJyDifYNtD607w5lZYdV6rEhmo
	PmR8kTPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7T6e-00000009HA5-0KJY;
	Wed, 23 Apr 2025 05:57:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7T6b-00000009H8W-1hSC
	for ath12k@lists.infradead.org;
	Wed, 23 Apr 2025 05:57:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0inNu016690;
	Wed, 23 Apr 2025 05:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2mfeaAyPbqKzUrxGK0601OHrueXF6aP8Xdg7+bNpyXU=; b=FPI3b1ngZHK1iRwI
	b6TwxGNSY7io1xqJn53ABTemZPNinusrOOSDfMFCc097JD1/Di0xg8jpkx9DHJgO
	DnXftoKgZgL8XAs1SYqJWnG7O7ouNWCYj0OanbqkWd4cW7iygUa0L4sJ711Gqekr
	9o8cBx9Q0QLE8V7o/lfoCAL+cUIQIHux6crHYQ/IvPnIlP01uI8KaG2c/oLGlnJo
	i/HpSci3QQ+YyzYvJ4rkwbQOWt3YcUTZ7bpOSiOhzeiDHErgmtvd5/5vf6FrYah2
	33svT3xSDUlHHcizJESm/PBdH93P/efWA/teGJSDbnPnwN+0/vnbkU2Wbs72R9lR
	3OHQzw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0914a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 05:57:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N5v764006011
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 05:57:07 GMT
Received: from hu-yintang-sha.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 22:57:06 -0700
From: Yingying Tang <quic_yintang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_yintang@quicinc.com>
Subject: [PATCH ath-next 1/2] wifi: ath12k: Reorder and relocate the release of resources in ath12k_core_deinit()
Date: Wed, 23 Apr 2025 11:26:49 +0530
Message-ID: <20250423055650.16230-2-quic_yintang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423055650.16230-1-quic_yintang@quicinc.com>
References: <20250423055650.16230-1-quic_yintang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ydYbEXHIqgt2lyOev-2wxuAow10E-nrR
X-Proofpoint-ORIG-GUID: ydYbEXHIqgt2lyOev-2wxuAow10E-nrR
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=68088133 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=3O-he4wki0ZGDEUKdesA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAzOCBTYWx0ZWRfX/dm/DITBd9uv X39BeZSF7rMOwLfUFFcsd2erquCMIH57i+gONCXjsrPFYKOwwnZvtGLxYG46dPZ/oTBgVzn+tFv FbJe4ghULnyf51w5dIT0afEdPxlvYNPt9V4K+7EdrzUHUatwCQCVFAx0YVAZEHcMgw5IJxvp93A
 XrBJ0eUWG+xhrluZ7xGYEjWuy4Fpxz5KMEp8JXsP8cfJ7tfJdYOw5G5Xob1y2UzI36lY9kPrRmE bQUodB8XoCqj8bnBnnRNY5dWyFuUDmG6gggFZ/x+g9qqLwV6vkVfC9Sv4vzL09hH7Jv9DnrbWoL WV86D6qD2A9E4C6FTnVFhuFdroT27EaOtjQKhyBcGu1gNaFx4dqfNO8GSKlBTbjdyjCUKI2yPZ7
 jwwCvqDXyM/rSqP5aJtU/vDjTbofvONfrAzNPElO8cNpVMApKP2hfGEFwEnXqzQJMJ3vf7XV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_03,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=507 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_225709_451443_3A35806A 
X-CRM114-Status: GOOD (  13.36  )
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

Ath12k panic notifier is registered in driver loading process. But it is not
unregistered if ATH12K_FLAG_QMI_FAIL is set(e.g. load BDF failed) and unload
driver. It causes a dirty node in panic notifier list since ath12k panic
notifier is not unregistered from list but the buffer of this node is freed
in driver unloading process. If load driver again there will be a page fault
error due to this dirty node in panic notifier list.

This issue is caused by asymmetry between ath12k_core_init() and
ath12k_core_deinit(). Reorder and relocate the release of resources in
ath12k_core_deinit() to avoid this asymmetry issue.

Call Trace:
<TASK>
? show_regs+0x67/0x70
? __die_body+0x20/0x70
? __die+0x2b/0x40
? page_fault_oops+0x15d/0x500
? search_bpf_extables+0x63/0x90
? notifier_chain_register+0x21/0xe0
? search_exception_tables+0x5f/0x70
? kernelmode_fixup_or_oops.isra.0+0x61/0x80
? __bad_area_nosemaphore+0x179/0x240
? bad_area_nosemaphore+0x16/0x20
? do_user_addr_fault+0x312/0x7f0
? prb_read_valid+0x1c/0x30
? exc_page_fault+0x78/0x180
? asm_exc_page_fault+0x27/0x30
? notifier_chain_register+0x21/0xe0
? notifier_chain_register+0x55/0xe0
atomic_notifier_chain_register+0x2c/0x50
ath12k_core_init+0x7e/0x110 [ath12k]
ath12k_pci_probe+0xaba/0xba0 [ath12k]

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
Tested-on: QCN8750 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 809055628bce8 ("wifi: ath12k: add panic handler")
Signed-off-by: Yingying Tang <quic_yintang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 5 ++---
 drivers/net/wireless/ath/ath12k/core.h | 1 +
 drivers/net/wireless/ath/ath12k/pci.c  | 5 ++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0e71935b2720..ef8a2b993560 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1890,7 +1890,7 @@ static void ath12k_core_hw_group_destroy(struct ath12k_hw_group *ag)
 	}
 }
 
-static void ath12k_core_hw_group_cleanup(struct ath12k_hw_group *ag)
+void ath12k_core_hw_group_cleanup(struct ath12k_hw_group *ag)
 {
 	struct ath12k_base *ab;
 	int i;
@@ -2038,10 +2038,9 @@ int ath12k_core_init(struct ath12k_base *ab)
 
 void ath12k_core_deinit(struct ath12k_base *ab)
 {
-	ath12k_core_panic_notifier_unregister(ab);
-	ath12k_core_hw_group_cleanup(ab->ag);
 	ath12k_core_hw_group_destroy(ab->ag);
 	ath12k_core_hw_group_unassign(ab);
+	ath12k_core_panic_notifier_unregister(ab);
 }
 
 void ath12k_core_free(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index e8d2a0c859f6..93625610b6cf 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1219,6 +1219,7 @@ struct ath12k_fw_stats_pdev {
 };
 
 int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab);
+void ath12k_core_hw_group_cleanup(struct ath12k_hw_group *ag);
 int ath12k_core_pre_init(struct ath12k_base *ab);
 int ath12k_core_init(struct ath12k_base *ath12k);
 void ath12k_core_deinit(struct ath12k_base *ath12k);
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 7f1bb150f326..75ea6ef425f0 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1730,8 +1730,6 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
 
 	if (test_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags)) {
 		ath12k_pci_power_down(ab, false);
-		ath12k_qmi_deinit_service(ab);
-		ath12k_core_hw_group_unassign(ab);
 		goto qmi_fail;
 	}
 
@@ -1739,9 +1737,10 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
 
 	cancel_work_sync(&ab->reset_work);
 	cancel_work_sync(&ab->dump_work);
-	ath12k_core_deinit(ab);
+	ath12k_core_hw_group_cleanup(ab->ag);
 
 qmi_fail:
+	ath12k_core_deinit(ab);
 	ath12k_fw_unmap(ab);
 	ath12k_mhi_unregister(ab_pci);
 
-- 
2.25.1


