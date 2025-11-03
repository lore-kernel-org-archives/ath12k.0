Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2018CCFA06
	for <ath12k@archiver.kernel.org>; Mon,  3 Nov 2025 11:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UAJ0r4Dh3Y5odpgNZTqa92fvyfmapMRBvRn+bCycC8=; b=y36gwc6IRTP3tiqSb0QJ01Ciso
	DoU19fIMV7E1d4SZB94B9Z1hkfLwFvoVU2SoaJgH09aRzEXDQSPuyTZND7elOKQRtGXIna9pKhwyA
	bonTVannMPsxQbq4QqFc2G0WB2gaI0TsQh5VK3y+8h5MXvBliFxDG+OCmvpO0EbFka/8p0dUPXtQY
	egf7Z/CpT6dYNVP7jsKiq7ikxd4ipzhMxwnTItohm2s0LYW7urkX40I2jU8nZH0OzvhghkXHLLe9j
	vYP0AJtZpW2Te1LqycZ5qR6h5LHHEkorqJCSyng4jZZav0vhlEcIp3yTM5HFILsIkXTJyyRXD2fjg
	/N0KvA+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsdG-00000009ijW-1sJz;
	Mon, 03 Nov 2025 11:21:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsdE-00000009ihY-2QtQ
	for ath12k@lists.infradead.org;
	Mon, 03 Nov 2025 11:21:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38ofGl2730216;
	Mon, 3 Nov 2025 11:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UAJ0r4Dh3Y5odpgNZTqa92fvyfmapMRBvRn+bCycC8=; b=jDjFLID0mBKdXhOn
	n8ZtZInNo4P3zMyjk/dmDs7oZIMiFaKWAFjKEMO68JY6aMaEXxiNOYoD8cHmpmcX
	JrCahk6B72RKtWHN8cViEKY76lg1ezFZrB8W/aTrq0oSlPgVxlfzDyyjwjD150jv
	ls0fiE9er4ptPXN06oVFwbcon1GQssxNbi1CsnuxBiXqKoJnNwbL54godswr6+4O
	KWgtRy6hhwy4jpJArsJPCESCQfZw6zDKVrrlA7EkpfWT34+p26C9hTmR1u/sD0Y5
	hyS+tzxEMJmCOEPAA/CF5+kA5mKi0ozzxd+UusG2LzcmVHNul+BB2gk3F6nmnrsM
	UPBnCQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6s86ge2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 11:21:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A3BLom4005182
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Nov 2025 11:21:50 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 3 Nov 2025 03:21:49 -0800
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng 09/12] wifi: ath12k: Remove arch-specific HAL dependencies from common DP
Date: Mon, 3 Nov 2025 16:51:08 +0530
Message-ID: <20251103112111.2260639-10-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103112111.2260639-1-quic_rdeuri@quicinc.com>
References: <20251103112111.2260639-1-quic_rdeuri@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwNCBTYWx0ZWRfX83umTIueNNLo
 DDuGaVhSNaY4E0h4kAuBMGBut5mh5euhv6/kgzQbp8Bwn+VCFawbEpcbt8UGwE5PDj2OJDdQkUJ
 crmGfgS1tAYSpbWeL6u2bwD94ycCmiknBdiu0CTrD5+JW3rMavIHfcasopOilw0DfdMOnZhGH0G
 241qNW8A9C2ER8O6r5XrVB7RVv31wo4zZ/FLCEGb4fypFBFfB7+n8mVJfKwmQQzslIrMEQ8egJg
 kFGEVX4ADCEgWwXmnEzZ+IR508tA6sO6nIkVCKhWtwMFEjS7R3CUi/ko9kWNnPWUevK06QWHsWM
 3p+EJnwR0WznNav+AiB+zx9+njrqjUHBmlxPYglBAzk4VVQE86X2lHIqvkCJUSRu61/kABAX1el
 9d05kNqj+rECyyKeV+sHtyjc5cdDoA==
X-Authority-Analysis: v=2.4 cv=Tq/rRTXh c=1 sm=1 tr=0 ts=6908904f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=rUE5D4KvxgApg0GVQCIA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: m7_Hj30SdPHqTGMM_wcWwt1KKT6Qhl2s
X-Proofpoint-ORIG-GUID: m7_Hj30SdPHqTGMM_wcWwt1KKT6Qhl2s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_032152_742261_32785174 
X-CRM114-Status: GOOD (  13.79  )
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

From: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>

Currently common DP includes arch-specific structs from wifi7/hal_desc.h
via dp_mon.h. Store hal_wbm_release_ring_tx size in the HAL object and move
hal_wbm_link_desc to common HAL for this separation.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c             | 3 +--
 drivers/net/wireless/ath/ath12k/hal.h            | 6 +++++-
 drivers/net/wireless/ath/ath12k/wifi7/dp.c       | 1 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.c      | 1 +
 drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h | 4 ----
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index e8f3f396dfde..b65f421d5b83 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -11,7 +11,6 @@
 #include "hal.h"
 #include "debug.h"
 #include "peer.h"
-#include "dp_mon.h"
 #include "dp_cmn.h"
 
 enum ath12k_dp_desc_type {
@@ -1532,7 +1531,7 @@ static int ath12k_dp_setup(struct ath12k_base *ab)
 	if (ret)
 		goto fail_dp_bank_profiles_cleanup;
 
-	size = sizeof(struct hal_wbm_release_ring_tx) *
+	size = ab->hal.hal_wbm_release_ring_tx_size *
 	       DP_TX_COMP_RING_SIZE(ab);
 
 	ret = ath12k_dp_reoq_lut_setup(ab);
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 29bcedca0a3b..071f4897e4cd 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -795,7 +795,10 @@ struct ath12k_buffer_addr {
 struct hal_ce_srng_dest_desc;
 struct hal_ce_srng_dst_status_desc;
 struct hal_ce_srng_src_desc;
-struct hal_wbm_link_desc;
+
+struct hal_wbm_link_desc {
+	struct ath12k_buffer_addr buf_addr_info;
+} __packed;
 
 /* srng flags */
 #define HAL_SRNG_FLAGS_MSI_SWAP			0x00000008
@@ -1202,6 +1205,7 @@ struct ath12k_hal {
 	int num_shadow_reg_configured;
 
 	u32 hal_desc_sz;
+	u32 hal_wbm_release_ring_tx_size;
 
 	const struct ath12k_hal_tcl_to_wbm_rbm_map *tcl_to_wbm_rbm_map;
 };
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp.c b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
index b57e8de05c27..cf7ede27623a 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
@@ -7,6 +7,7 @@
 #include "../debug.h"
 #include "../dp_rx.h"
 #include "../dp_tx.h"
+#include "hal_desc.h"
 #include "../dp_mon.h"
 #include "../dp_cmn.h"
 #include "dp_rx.h"
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.c b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
index 84c0ba2d1fbe..f48adb83599e 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
@@ -55,6 +55,7 @@ int ath12k_wifi7_hal_init(struct ath12k_base *ab)
 	hal->tcl_to_wbm_rbm_map = ath12k_wifi7_hw_ver_map[ab->hw_rev].tcl_to_wbm_rbm_map;
 	hal->regs = ath12k_wifi7_hw_ver_map[ab->hw_rev].hw_regs;
 	hal->hal_params = ath12k_wifi7_hw_ver_map[ab->hw_rev].hal_params;
+	hal->hal_wbm_release_ring_tx_size = sizeof(struct hal_wbm_release_ring_tx);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h
index 81506adf156a..aecbf00ea87b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h
@@ -1592,10 +1592,6 @@ struct hal_tx_rate_stats {
 	__le32 tsf;
 } __packed;
 
-struct hal_wbm_link_desc {
-	struct ath12k_buffer_addr buf_addr_info;
-} __packed;
-
 #define HAL_WBM_COMPL_RX_INFO0_REL_SRC_MODULE		GENMASK(2, 0)
 #define HAL_WBM_COMPL_RX_INFO0_BM_ACTION		GENMASK(5, 3)
 #define HAL_WBM_COMPL_RX_INFO0_DESC_TYPE		GENMASK(8, 6)
-- 
2.34.1


