Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0C1CA0EDC
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 19:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bs1RbZlA/EYahwfxqli1eGh9e/Oms66CZCgWp4S1Lmc=; b=mjGwzHVwemeGGnzkSnLhgbClaE
	UqgyWz69AuVQgfBbAE11sexZgj9HIyMs8DaiBv1E4xnfogPn6nHEzFdq917JYeIzv2mJHZJnweM9m
	2L2L59Fc7/03PdTNrh1An9XkFgzC1vmV5tTKxi6LFv0sU/LT1FXDQToauADkcddeQmQFuqo5fH1x6
	4jFP/nMzY5sLnraYvRQqHColzR8A+EqEstHUnyDyx61/Kusn5TunNidnc6tirhlQGr1Rn8uqfv6If
	WW+wm31zD8sPDtG4yNh1G8PEw5oy+rMYGqayLMFcURFk0EC2OBO7ra3T/6IvPoIZhkXJ9hWpXhYbQ
	TBGRVovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulufs-0000000BqaL-03Nk;
	Tue, 12 Aug 2025 19:28:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsYA-0000000BWSa-1rKk
	for ath12k@lists.infradead.org;
	Tue, 12 Aug 2025 17:12:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CH6T0X010796;
	Tue, 12 Aug 2025 17:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bs1RbZlA/EYahwfxqli1eGh9e/Oms66CZCgWp4S1Lmc=; b=PU53TJ1v60VQU08n
	vZKPYxp283SFlIxeMTQbq2U71kyHYuOyG0F/GltJHCwfvdl5aPwTgf0KOlwIrsIa
	ie3KREceq0v0jWpZzAYhJxMt5S3aaoscG9cumhwcXjxYiPuEsUYfze4dWUYlVILm
	SEEg6aXgH2OdCJlpN0+5AV8BdRRjRBkI8tOmldRMtkxWQ/Qrd08I3nZlt34he5Oy
	Tkpz/4lG9rrXhdAavDLfCeq6q55OsnqIRsJEEDK1HGidXhwQ9+v9b/Z3Gv79rnNT
	E0p+rI+Mnpw+8UN8S5lFedIvM9UtLwWBu4f2eCjyUO/58r6ZSRGsOoDQ32QU3Vux
	GDK3GA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9r0gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 17:12:37 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57CHCbPi007923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 17:12:37 GMT
Received: from hu-kiranv-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 10:12:36 -0700
From: Kiran Venkatappa <quic_kiranv@quicinc.com>
Date: Tue, 12 Aug 2025 22:39:28 +0530
Subject: [PATCH ath12k-ng 02/13] wifi: ath12k: Move Copy Engine
 configuration to Wi-Fi 7 specific file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250812-ath12k-mod-v1-2-8c9b0eb9335d@quicinc.com>
References: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
In-Reply-To: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689b7606 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=2g6QTFO8ETIsVP_-wTEA:9 a=ZPAV2fCfWhQG0MlP:21 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pyxxL9W60jWBOikh9ryd1vD40QLp1teb
X-Proofpoint-ORIG-GUID: pyxxL9W60jWBOikh9ryd1vD40QLp1teb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX55hvpGsM81ZA
 aL6s1UF98PwUQpbgPVCtOHXMxcwdkCt3OJcicoeMyAaDe4tor7crwB3tIS3zmECZAPecqBDhqVI
 DxjI+Ag2l1K7PmFoqRcUq2atidkqz9gubIYnAIPDdIMCGbaXH/tqERkctHWgT2jgpmfuJmX6kCJ
 Inq1aE4z9bl6qkZQ38LZMVvqb8qM57zoBbZT+3PcYLqNcQXRv9NVYwnkVKp27mezJiCfYVZiMu1
 S8WF5WF59KMOxxxJ2JPvWfhQBR31zHkjeXQzqTgih0Eq9qBM9U3+KAk+I1Gz7PXoKdxcbY/GuLE
 bxgW9LMCRfb0OSQXgUdzqCD3Q27y3RZzB/oLhu94wUBgaD7JVZO8Wzd6h8pkRHzd64jS6U74KBv
 oQ2TZ1jI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_101238_517437_E0525042 
X-CRM114-Status: GOOD (  17.79  )
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

Relocate Copy Engine (CE) assignment logic from ce.c to a new ce_wifi7.c
file to consolidate Wi-Fi 7 specific CE configuration in one place.
Move CE service map and target configuration from hw.c to ce_wifi7.c.

This reorganization improves code clarity and modularity by isolating
device-specific logic. It is part of a broader effort to separate
common and hardware-specific code into distinct modules.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kiran Venkatappa <quic_kiranv@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/Makefile   |   1 +
 drivers/net/wireless/ath/ath12k/ce.c       | 301 ---------
 drivers/net/wireless/ath/ath12k/ce.h       |   4 -
 drivers/net/wireless/ath/ath12k/ce_wifi7.c | 970 +++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/ce_wifi7.h |  22 +
 drivers/net/wireless/ath/ath12k/hw.c       | 629 +------------------
 6 files changed, 994 insertions(+), 933 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index 1a26e00627b0a3d631ddfa62ef70a9b29b426a3f..e4776887c939ab0d11307e8f616f3728ed39ce71 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -14,6 +14,7 @@ ath12k-y += core.o \
 	    dp_rx.o \
 	    debug.o \
 	    ce.o \
+	    ce_wifi7.o \
 	    peer.o \
 	    dbring.o \
 	    hw.o \
diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index f93a419abf65ec6e9b31e22c78c8c2cdd7bdbc76..6e380b773f05627ddc76541af845f4969a0f206a 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -8,307 +8,6 @@
 #include "debug.h"
 #include "hif.h"
 
-const struct ce_attr ath12k_host_ce_config_qcn9274[] = {
-	/* CE0: host->target HTC control and raw streams */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 16,
-		.src_sz_max = 2048,
-		.dest_nentries = 0,
-	},
-
-	/* CE1: target->host HTT + HTC control */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 0,
-		.src_sz_max = 2048,
-		.dest_nentries = 512,
-		.recv_cb = ath12k_htc_rx_completion_handler,
-	},
-
-	/* CE2: target->host WMI */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 0,
-		.src_sz_max = 2048,
-		.dest_nentries = 128,
-		.recv_cb = ath12k_htc_rx_completion_handler,
-	},
-
-	/* CE3: host->target WMI (mac0) */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 32,
-		.src_sz_max = 2048,
-		.dest_nentries = 0,
-	},
-
-	/* CE4: host->target HTT */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 2048,
-		.src_sz_max = 256,
-		.dest_nentries = 0,
-	},
-
-	/* CE5: target->host pktlog */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 0,
-		.src_sz_max = 2048,
-		.dest_nentries = 512,
-		.recv_cb = ath12k_dp_htt_htc_t2h_msg_handler,
-	},
-
-	/* CE6: target autonomous hif_memcpy */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-
-	/* CE7: host->target WMI (mac1) */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 32,
-		.src_sz_max = 2048,
-		.dest_nentries = 0,
-	},
-
-	/* CE8: target autonomous hif_memcpy */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-
-	/* CE9: MHI */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-
-	/* CE10: MHI */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-
-	/* CE11: MHI */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-
-	/* CE12: CV Prefetch */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-
-	/* CE13: CV Prefetch */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-
-	/* CE14: target->host dbg log */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 0,
-		.src_sz_max = 2048,
-		.dest_nentries = 512,
-		.recv_cb = ath12k_htc_rx_completion_handler,
-	},
-
-	/* CE15: reserved for future use */
-	{
-		.flags = (CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-};
-
-const struct ce_attr ath12k_host_ce_config_wcn7850[] = {
-	/* CE0: host->target HTC control and raw streams */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 16,
-		.src_sz_max = 2048,
-		.dest_nentries = 0,
-	},
-
-	/* CE1: target->host HTT + HTC control */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 0,
-		.src_sz_max = 2048,
-		.dest_nentries = 512,
-		.recv_cb = ath12k_htc_rx_completion_handler,
-	},
-
-	/* CE2: target->host WMI */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 0,
-		.src_sz_max = 2048,
-		.dest_nentries = 64,
-		.recv_cb = ath12k_htc_rx_completion_handler,
-	},
-
-	/* CE3: host->target WMI (mac0) */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 32,
-		.src_sz_max = 2048,
-		.dest_nentries = 0,
-	},
-
-	/* CE4: host->target HTT */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 2048,
-		.src_sz_max = 256,
-		.dest_nentries = 0,
-	},
-
-	/* CE5: target->host pktlog */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-
-	/* CE6: target autonomous hif_memcpy */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-
-	/* CE7: host->target WMI (mac1) */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 0,
-		.src_sz_max = 2048,
-		.dest_nentries = 0,
-	},
-
-	/* CE8: target autonomous hif_memcpy */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-
-};
-
-const struct ce_attr ath12k_host_ce_config_ipq5332[] = {
-	/* CE0: host->target HTC control and raw streams */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 16,
-		.src_sz_max = 2048,
-		.dest_nentries = 0,
-	},
-	/* CE1: target->host HTT + HTC control */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 0,
-		.src_sz_max = 2048,
-		.dest_nentries = 512,
-		.recv_cb = ath12k_htc_rx_completion_handler,
-	},
-	/* CE2: target->host WMI */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 0,
-		.src_sz_max = 2048,
-		.dest_nentries = 128,
-		.recv_cb = ath12k_htc_rx_completion_handler,
-	},
-	/* CE3: host->target WMI */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 32,
-		.src_sz_max = 2048,
-		.dest_nentries = 0,
-	},
-	/* CE4: host->target HTT */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 2048,
-		.src_sz_max = 256,
-		.dest_nentries = 0,
-	},
-	/* CE5: target -> host PKTLOG */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 0,
-		.src_sz_max = 2048,
-		.dest_nentries = 512,
-		.recv_cb = ath12k_dp_htt_htc_t2h_msg_handler,
-	},
-	/* CE6: Target autonomous HIF_memcpy */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-	/* CE7: CV Prefetch */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-	/* CE8: Target HIF memcpy (Generic HIF memcypy) */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-	/* CE9: WMI logging/CFR/Spectral/Radar */
-	{
-		.flags = CE_ATTR_FLAGS,
-		.src_nentries = 0,
-		.src_sz_max = 2048,
-		.dest_nentries = 128,
-	},
-	/* CE10: Unused */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-	/* CE11: Unused */
-	{
-		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 0,
-		.src_sz_max = 0,
-		.dest_nentries = 0,
-	},
-};
-
 static int ath12k_ce_rx_buf_enqueue_pipe(struct ath12k_ce_pipe *pipe,
 					 struct sk_buff *skb, dma_addr_t paddr)
 {
diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
index 57f75899ee03d63479698011fc081936677f8698..f44ce2244bcfdb60d505d51096ed70b3965952c9 100644
--- a/drivers/net/wireless/ath/ath12k/ce.h
+++ b/drivers/net/wireless/ath/ath12k/ce.h
@@ -173,10 +173,6 @@ struct ath12k_ce {
 	struct ath12k_hp_update_timer hp_timer[CE_COUNT_MAX];
 };
 
-extern const struct ce_attr ath12k_host_ce_config_qcn9274[];
-extern const struct ce_attr ath12k_host_ce_config_wcn7850[];
-extern const struct ce_attr ath12k_host_ce_config_ipq5332[];
-
 void ath12k_ce_cleanup_pipes(struct ath12k_base *ab);
 void ath12k_ce_rx_replenish_retry(struct timer_list *t);
 void ath12k_ce_per_engine_service(struct ath12k_base *ab, u16 ce_id);
diff --git a/drivers/net/wireless/ath/ath12k/ce_wifi7.c b/drivers/net/wireless/ath/ath12k/ce_wifi7.c
new file mode 100644
index 0000000000000000000000000000000000000000..cf27259d15a0e85c30268c12f935ad3b7985a22f
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/ce_wifi7.c
@@ -0,0 +1,970 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/types.h>
+#include <linux/bitops.h>
+#include <linux/bitfield.h>
+
+#include "core.h"
+#include "ce.h"
+#include "ce_wifi7.h"
+#include "dp_rx.h"
+
+/* Copy Engine (CE) configs for QCN9274 */
+/* Target firmware's Copy Engine configuration. */
+const struct ce_pipe_config ath12k_target_ce_config_wlan_qcn9274[] = {
+	/* CE0: host->target HTC control and raw streams */
+	{
+		.pipenum = __cpu_to_le32(0),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE1: target->host HTT + HTC control */
+	{
+		.pipenum = __cpu_to_le32(1),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE2: target->host WMI */
+	{
+		.pipenum = __cpu_to_le32(2),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE3: host->target WMI (mac0) */
+	{
+		.pipenum = __cpu_to_le32(3),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE4: host->target HTT */
+	{
+		.pipenum = __cpu_to_le32(4),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(256),
+		.nbytes_max = __cpu_to_le32(256),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE5: target->host Pktlog */
+	{
+		.pipenum = __cpu_to_le32(5),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE6: Reserved for target autonomous hif_memcpy */
+	{
+		.pipenum = __cpu_to_le32(6),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(16384),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE7: host->target WMI (mac1) */
+	{
+		.pipenum = __cpu_to_le32(7),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE8: Reserved for target autonomous hif_memcpy */
+	{
+		.pipenum = __cpu_to_le32(8),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(16384),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE9, 10 and 11: Reserved for MHI */
+
+	/* CE12: Target CV prefetch */
+	{
+		.pipenum = __cpu_to_le32(12),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE13: Target CV prefetch */
+	{
+		.pipenum = __cpu_to_le32(13),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE14: WMI logging/CFR/Spectral/Radar */
+	{
+		.pipenum = __cpu_to_le32(14),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE15: Reserved */
+};
+
+/* Map from service/endpoint to Copy Engine.
+ * This table is derived from the CE_PCI TABLE, above.
+ * It is passed to the Target at startup for use by firmware.
+ * Pipe direction:
+ *      PIPEDIR_OUT = UL = host -> target
+ *      PIPEDIR_IN = DL = target -> host
+ */
+const struct service_to_pipe ath12k_target_service_to_ce_map_wlan_qcn9274[] = {
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(0),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(1),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(0),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(1),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(4),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(1),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC1),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(7),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC1),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_PKT_LOG),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(5),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL_DIAG),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(14),
+	},
+
+	/* (Additions here) */
+
+	{ /* must be last */
+		__cpu_to_le32(0),
+		__cpu_to_le32(0),
+		__cpu_to_le32(0),
+	},
+};
+
+const struct ce_attr ath12k_host_ce_config_qcn9274[] = {
+	/* CE0: host->target HTC control and raw streams */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 16,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+
+	/* CE1: target->host HTT + HTC control */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 512,
+		.recv_cb = ath12k_htc_rx_completion_handler,
+	},
+
+	/* CE2: target->host WMI */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 128,
+		.recv_cb = ath12k_htc_rx_completion_handler,
+	},
+
+	/* CE3: host->target WMI (mac0) */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 32,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+
+	/* CE4: host->target HTT */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 2048,
+		.src_sz_max = 256,
+		.dest_nentries = 0,
+	},
+
+	/* CE5: target->host pktlog */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 512,
+		.recv_cb = ath12k_dp_htt_htc_t2h_msg_handler,
+	},
+
+	/* CE6: target autonomous hif_memcpy */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE7: host->target WMI (mac1) */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 32,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+
+	/* CE8: target autonomous hif_memcpy */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE9: MHI */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE10: MHI */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE11: MHI */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE12: CV Prefetch */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE13: CV Prefetch */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE14: target->host dbg log */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 512,
+		.recv_cb = ath12k_htc_rx_completion_handler,
+	},
+
+	/* CE15: reserved for future use */
+	{
+		.flags = (CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+};
+
+/* Copy Engine (CE) configs for WCN7850 */
+/* Target firmware's Copy Engine configuration. */
+const struct ce_pipe_config ath12k_target_ce_config_wlan_wcn7850[] = {
+	/* CE0: host->target HTC control and raw streams */
+	{
+		.pipenum = __cpu_to_le32(0),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE1: target->host HTT + HTC control */
+	{
+		.pipenum = __cpu_to_le32(1),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE2: target->host WMI */
+	{
+		.pipenum = __cpu_to_le32(2),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE3: host->target WMI */
+	{
+		.pipenum = __cpu_to_le32(3),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE4: host->target HTT */
+	{
+		.pipenum = __cpu_to_le32(4),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(256),
+		.nbytes_max = __cpu_to_le32(256),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE5: target->host Pktlog */
+	{
+		.pipenum = __cpu_to_le32(5),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE6: Reserved for target autonomous hif_memcpy */
+	{
+		.pipenum = __cpu_to_le32(6),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(16384),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE7 used only by Host */
+	{
+		.pipenum = __cpu_to_le32(7),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT_H2H),
+		.nentries = __cpu_to_le32(0),
+		.nbytes_max = __cpu_to_le32(0),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE8 target->host used only by IPA */
+	{
+		.pipenum = __cpu_to_le32(8),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(16384),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+	/* CE 9, 10, 11 are used by MHI driver */
+};
+
+const struct service_to_pipe ath12k_target_service_to_ce_map_wlan_wcn7850[] = {
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(0),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(4),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(1),
+	},
+
+	/* (Additions here) */
+
+	{ /* must be last */
+		__cpu_to_le32(0),
+		__cpu_to_le32(0),
+		__cpu_to_le32(0),
+	},
+};
+
+const struct ce_attr ath12k_host_ce_config_wcn7850[] = {
+	/* CE0: host->target HTC control and raw streams */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 16,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+
+	/* CE1: target->host HTT + HTC control */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 512,
+		.recv_cb = ath12k_htc_rx_completion_handler,
+	},
+
+	/* CE2: target->host WMI */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 64,
+		.recv_cb = ath12k_htc_rx_completion_handler,
+	},
+
+	/* CE3: host->target WMI (mac0) */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 32,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+
+	/* CE4: host->target HTT */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 2048,
+		.src_sz_max = 256,
+		.dest_nentries = 0,
+	},
+
+	/* CE5: target->host pktlog */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE6: target autonomous hif_memcpy */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE7: host->target WMI (mac1) */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+
+	/* CE8: target autonomous hif_memcpy */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+};
+
+/* Copy Engine (CE) configs for IPQ5332 */
+/* Target firmware's Copy Engine configuration. */
+const struct ce_pipe_config ath12k_target_ce_config_wlan_ipq5332[] = {
+	/* CE0: host->target HTC control and raw streams */
+	{
+		.pipenum = __cpu_to_le32(0),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE1: target->host HTT */
+	{
+		.pipenum = __cpu_to_le32(1),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE2: target->host WMI  + HTC control */
+	{
+		.pipenum = __cpu_to_le32(2),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE3: host->target WMI */
+	{
+		.pipenum = __cpu_to_le32(3),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE4: host->target HTT */
+	{
+		.pipenum = __cpu_to_le32(4),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(256),
+		.nbytes_max = __cpu_to_le32(256),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE5: Target -> host PKTLOG */
+	{
+		.pipenum = __cpu_to_le32(5),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE6: Reserved for target autonomous HIF_memcpy */
+	{
+		.pipenum = __cpu_to_le32(6),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(16384),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE7: Reserved for CV Prefetch */
+	{
+		.pipenum = __cpu_to_le32(7),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE8: Reserved for target generic HIF memcpy */
+	{
+		.pipenum = __cpu_to_le32(8),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(16384),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE9: WMI logging/CFR/Spectral/Radar/ */
+	{
+		.pipenum = __cpu_to_le32(9),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE10: Unused TBD */
+	{
+		.pipenum = __cpu_to_le32(10),
+		.pipedir = __cpu_to_le32(PIPEDIR_NONE),
+		.nentries = __cpu_to_le32(0),
+		.nbytes_max = __cpu_to_le32(0),
+		.flags = __cpu_to_le32(0),
+		.reserved = __cpu_to_le32(0),
+	},
+	/* CE11: Unused TBD */
+	{
+		.pipenum = __cpu_to_le32(11),
+		.pipedir = __cpu_to_le32(PIPEDIR_NONE),
+		.nentries = __cpu_to_le32(0),
+		.nbytes_max = __cpu_to_le32(0),
+		.flags = __cpu_to_le32(0),
+		.reserved = __cpu_to_le32(0),
+	},
+};
+
+const struct service_to_pipe ath12k_target_service_to_ce_map_wlan_ipq5332[] = {
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(0),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(1),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(0),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(1),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(4),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(1),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_PKT_LOG),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(5),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL_DIAG),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(9),
+	},
+	/* (Additions here) */
+
+	{ /* must be last */
+		__cpu_to_le32(0),
+		__cpu_to_le32(0),
+		__cpu_to_le32(0),
+	},
+};
+
+const struct ce_attr ath12k_host_ce_config_ipq5332[] = {
+	/* CE0: host->target HTC control and raw streams */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 16,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+
+	/* CE1: target->host HTT + HTC control */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 512,
+		.recv_cb = ath12k_htc_rx_completion_handler,
+	},
+
+	/* CE2: target->host WMI */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 128,
+		.recv_cb = ath12k_htc_rx_completion_handler,
+	},
+
+	/* CE3: host->target WMI */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 32,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+
+	/* CE4: host->target HTT */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 2048,
+		.src_sz_max = 256,
+		.dest_nentries = 0,
+	},
+
+	/* CE5: target -> host PKTLOG */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 512,
+		.recv_cb = ath12k_dp_htt_htc_t2h_msg_handler,
+	},
+
+	/* CE6: Target autonomous HIF_memcpy */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE7: CV Prefetch */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE8: Target HIF memcpy (Generic HIF memcypy) */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE9: WMI logging/CFR/Spectral/Radar */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 128,
+	},
+
+	/* CE10: Unused */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE11: Unused */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+};
diff --git a/drivers/net/wireless/ath/ath12k/ce_wifi7.h b/drivers/net/wireless/ath/ath12k/ce_wifi7.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e211e8c246729897f66c3e468e96ff7dd15e6fd
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/ce_wifi7.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI7_CE_H
+#define ATH12K_WIFI7_CE_H
+
+extern const struct ce_pipe_config ath12k_target_ce_config_wlan_qcn9274[];
+extern const struct ce_pipe_config ath12k_target_ce_config_wlan_wcn7850[];
+extern const struct ce_pipe_config ath12k_target_ce_config_wlan_ipq5332[];
+
+extern const struct service_to_pipe ath12k_target_service_to_ce_map_wlan_qcn9274[];
+extern const struct service_to_pipe ath12k_target_service_to_ce_map_wlan_wcn7850[];
+extern const struct service_to_pipe ath12k_target_service_to_ce_map_wlan_ipq5332[];
+
+extern const struct ce_attr ath12k_host_ce_config_qcn9274[];
+extern const struct ce_attr ath12k_host_ce_config_wcn7850[];
+extern const struct ce_attr ath12k_host_ce_config_ipq5332[];
+
+#endif /* ATH12K_WIFI7_CE_H */
diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 6791ae1d64e50feb96df9add0d8b5f2f76b425e4..dd60e27cc499648e4c6ec95d0a56ec06f4c7c6ae 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -11,6 +11,7 @@
 #include "debug.h"
 #include "core.h"
 #include "ce.h"
+#include "ce_wifi7.h"
 #include "hw.h"
 #include "mhi.h"
 #include "dp_rx.h"
@@ -177,634 +178,6 @@ static const struct ath12k_hw_ops wcn7850_ops = {
 #define ATH12K_RX_MON_STATUS_RING_MASK_1 0x2
 #define ATH12K_RX_MON_STATUS_RING_MASK_2 0x4
 
-/* Target firmware's Copy Engine configuration. */
-static const struct ce_pipe_config ath12k_target_ce_config_wlan_qcn9274[] = {
-	/* CE0: host->target HTC control and raw streams */
-	{
-		.pipenum = __cpu_to_le32(0),
-		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE1: target->host HTT + HTC control */
-	{
-		.pipenum = __cpu_to_le32(1),
-		.pipedir = __cpu_to_le32(PIPEDIR_IN),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE2: target->host WMI */
-	{
-		.pipenum = __cpu_to_le32(2),
-		.pipedir = __cpu_to_le32(PIPEDIR_IN),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE3: host->target WMI (mac0) */
-	{
-		.pipenum = __cpu_to_le32(3),
-		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE4: host->target HTT */
-	{
-		.pipenum = __cpu_to_le32(4),
-		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
-		.nentries = __cpu_to_le32(256),
-		.nbytes_max = __cpu_to_le32(256),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE5: target->host Pktlog */
-	{
-		.pipenum = __cpu_to_le32(5),
-		.pipedir = __cpu_to_le32(PIPEDIR_IN),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE6: Reserved for target autonomous hif_memcpy */
-	{
-		.pipenum = __cpu_to_le32(6),
-		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(16384),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE7: host->target WMI (mac1) */
-	{
-		.pipenum = __cpu_to_le32(7),
-		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE8: Reserved for target autonomous hif_memcpy */
-	{
-		.pipenum = __cpu_to_le32(8),
-		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(16384),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE9, 10 and 11: Reserved for MHI */
-
-	/* CE12: Target CV prefetch */
-	{
-		.pipenum = __cpu_to_le32(12),
-		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE13: Target CV prefetch */
-	{
-		.pipenum = __cpu_to_le32(13),
-		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE14: WMI logging/CFR/Spectral/Radar */
-	{
-		.pipenum = __cpu_to_le32(14),
-		.pipedir = __cpu_to_le32(PIPEDIR_IN),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE15: Reserved */
-};
-
-/* Target firmware's Copy Engine configuration. */
-static const struct ce_pipe_config ath12k_target_ce_config_wlan_wcn7850[] = {
-	/* CE0: host->target HTC control and raw streams */
-	{
-		.pipenum = __cpu_to_le32(0),
-		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE1: target->host HTT + HTC control */
-	{
-		.pipenum = __cpu_to_le32(1),
-		.pipedir = __cpu_to_le32(PIPEDIR_IN),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE2: target->host WMI */
-	{
-		.pipenum = __cpu_to_le32(2),
-		.pipedir = __cpu_to_le32(PIPEDIR_IN),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE3: host->target WMI */
-	{
-		.pipenum = __cpu_to_le32(3),
-		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE4: host->target HTT */
-	{
-		.pipenum = __cpu_to_le32(4),
-		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
-		.nentries = __cpu_to_le32(256),
-		.nbytes_max = __cpu_to_le32(256),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE5: target->host Pktlog */
-	{
-		.pipenum = __cpu_to_le32(5),
-		.pipedir = __cpu_to_le32(PIPEDIR_IN),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE6: Reserved for target autonomous hif_memcpy */
-	{
-		.pipenum = __cpu_to_le32(6),
-		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(16384),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE7 used only by Host */
-	{
-		.pipenum = __cpu_to_le32(7),
-		.pipedir = __cpu_to_le32(PIPEDIR_INOUT_H2H),
-		.nentries = __cpu_to_le32(0),
-		.nbytes_max = __cpu_to_le32(0),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
-		.reserved = __cpu_to_le32(0),
-	},
-
-	/* CE8 target->host used only by IPA */
-	{
-		.pipenum = __cpu_to_le32(8),
-		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(16384),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-	/* CE 9, 10, 11 are used by MHI driver */
-};
-
-/* Map from service/endpoint to Copy Engine.
- * This table is derived from the CE_PCI TABLE, above.
- * It is passed to the Target at startup for use by firmware.
- */
-static const struct service_to_pipe ath12k_target_service_to_ce_map_wlan_qcn9274[] = {
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(3),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(3),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(3),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(3),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(3),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(0),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(1),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(0),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(1),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(4),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(1),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC1),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(7),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC1),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_PKT_LOG),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(5),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL_DIAG),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(14),
-	},
-
-	/* (Additions here) */
-
-	{ /* must be last */
-		__cpu_to_le32(0),
-		__cpu_to_le32(0),
-		__cpu_to_le32(0),
-	},
-};
-
-static const struct service_to_pipe ath12k_target_service_to_ce_map_wlan_wcn7850[] = {
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(3),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(3),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(3),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(3),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(3),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(0),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(4),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(1),
-	},
-
-	/* (Additions here) */
-
-	{ /* must be last */
-		__cpu_to_le32(0),
-		__cpu_to_le32(0),
-		__cpu_to_le32(0),
-	},
-};
-
-static const struct ce_pipe_config ath12k_target_ce_config_wlan_ipq5332[] = {
-	/* host->target HTC control and raw streams */
-	{
-		.pipenum = __cpu_to_le32(0),
-		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-	/* target->host HTT */
-	{
-		.pipenum = __cpu_to_le32(1),
-		.pipedir = __cpu_to_le32(PIPEDIR_IN),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-	/* target->host WMI  + HTC control */
-	{
-		.pipenum = __cpu_to_le32(2),
-		.pipedir = __cpu_to_le32(PIPEDIR_IN),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-	/* host->target WMI */
-	{
-		.pipenum = __cpu_to_le32(3),
-		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-	/* host->target HTT */
-	{
-		.pipenum = __cpu_to_le32(4),
-		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
-		.nentries = __cpu_to_le32(256),
-		.nbytes_max = __cpu_to_le32(256),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
-		.reserved = __cpu_to_le32(0),
-	},
-	/* Target -> host PKTLOG */
-	{
-		.pipenum = __cpu_to_le32(5),
-		.pipedir = __cpu_to_le32(PIPEDIR_IN),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-	/* Reserved for target autonomous HIF_memcpy */
-	{
-		.pipenum = __cpu_to_le32(6),
-		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(16384),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-	/* CE7 Reserved for CV Prefetch */
-	{
-		.pipenum = __cpu_to_le32(7),
-		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-	/* CE8 Reserved for target generic HIF memcpy */
-	{
-		.pipenum = __cpu_to_le32(8),
-		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(16384),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-	/* CE9 WMI logging/CFR/Spectral/Radar/ */
-	{
-		.pipenum = __cpu_to_le32(9),
-		.pipedir = __cpu_to_le32(PIPEDIR_IN),
-		.nentries = __cpu_to_le32(32),
-		.nbytes_max = __cpu_to_le32(2048),
-		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
-		.reserved = __cpu_to_le32(0),
-	},
-	/* Unused TBD */
-	{
-		.pipenum = __cpu_to_le32(10),
-		.pipedir = __cpu_to_le32(PIPEDIR_NONE),
-		.nentries = __cpu_to_le32(0),
-		.nbytes_max = __cpu_to_le32(0),
-		.flags = __cpu_to_le32(0),
-		.reserved = __cpu_to_le32(0),
-	},
-	/* Unused TBD */
-	{
-		.pipenum = __cpu_to_le32(11),
-		.pipedir = __cpu_to_le32(PIPEDIR_NONE),
-		.nentries = __cpu_to_le32(0),
-		.nbytes_max = __cpu_to_le32(0),
-		.flags = __cpu_to_le32(0),
-		.reserved = __cpu_to_le32(0),
-	},
-};
-
-static const struct service_to_pipe ath12k_target_service_to_ce_map_wlan_ipq5332[] = {
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
-		__cpu_to_le32(PIPEDIR_OUT),
-		__cpu_to_le32(3),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
-		__cpu_to_le32(PIPEDIR_IN),
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
-		__cpu_to_le32(PIPEDIR_OUT),
-		__cpu_to_le32(3),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
-		__cpu_to_le32(PIPEDIR_IN),
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
-		__cpu_to_le32(PIPEDIR_OUT),
-		__cpu_to_le32(3),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
-		__cpu_to_le32(PIPEDIR_IN),
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
-		__cpu_to_le32(PIPEDIR_OUT),
-		__cpu_to_le32(3),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
-		__cpu_to_le32(PIPEDIR_IN),
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
-		__cpu_to_le32(PIPEDIR_OUT),
-		__cpu_to_le32(3),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
-		__cpu_to_le32(PIPEDIR_IN),
-		__cpu_to_le32(2),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
-		__cpu_to_le32(PIPEDIR_OUT),
-		__cpu_to_le32(0),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
-		__cpu_to_le32(PIPEDIR_IN),
-		__cpu_to_le32(1),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS),
-		__cpu_to_le32(PIPEDIR_OUT),
-		__cpu_to_le32(0),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS),
-		__cpu_to_le32(PIPEDIR_IN),
-		__cpu_to_le32(1),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
-		__cpu_to_le32(PIPEDIR_OUT),
-		__cpu_to_le32(4),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
-		__cpu_to_le32(PIPEDIR_IN),
-		__cpu_to_le32(1),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_PKT_LOG),
-		__cpu_to_le32(PIPEDIR_IN),
-		__cpu_to_le32(5),
-	},
-	{
-		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL_DIAG),
-		__cpu_to_le32(PIPEDIR_IN),
-		__cpu_to_le32(9),
-	},
-	/* (Additions here) */
-
-	{ /* must be last */
-		__cpu_to_le32(0),
-		__cpu_to_le32(0),
-		__cpu_to_le32(0),
-	},
-};
-
 static const struct ath12k_hw_ring_mask ath12k_hw_ring_mask_qcn9274 = {
 	.tx  = {
 		ATH12K_TX_RING_MASK_0,

-- 
2.34.1


