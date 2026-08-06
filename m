Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0EDC56208
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 13:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSGzh9lPVIOX0gxfEZMJTF4LJynlHT+NQszGI18tGyg=; b=o5v9KSBi+91rsRzYYivinE69tX
	m03fXj8UJBASh3KW9iDhU9PUom81LhP0u8J5FfpiBmWw1D6P8WFoIZg/xRGZ7JKU2jsetiWcgfhwE
	2hEPm24zkGh8EZDDJAELb9+O05aK65/5afytwPja9XA42sXmLmZYG1DGiO7qm3SNqGaolPi4jqy7M
	ODI31FtS/1qZ1fy6D85qcphdR4oUCMPAmERD5o0cvB/A4lYgao1FV/9c3qwusgwEd58CuIQVRnA0Y
	2nvFaD/0c8+c6+NIAwy7v8gyGBw2hK6JVHyjUIJWdk12JrIND4PgrTs/HGeS7W+pNSGbaDrTIc7Pq
	RtquPm0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry5n-00000005spj-0vb1;
	Thu, 06 Aug 2026 13:25:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry5k-00000005smp-0YPx
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 13:25:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nfCo1580758
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 13:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XSGzh9lPVIO
	X0gxfEZMJTF4LJynlHT+NQszGI18tGyg=; b=S+1wLObuK3tU0iSh+K5dzgAZjus
	o1bO34UmuO0TBDqi2m1RGFaoFu7SOZ/XU+lwxeh1fw0Ht0SPVOe89Bw2l1TLKvb4
	ZyOYvdXXRC7MoMMugKTOCO7viHI5S4uDhXhGERvtxTsamTPOQZOj0TxlWZQdO4Yg
	X4unXj/dYNJtHctlUV6nRhYhLz1h9ZFX3hNZpDQWgmHo6qC/NiF1GOuhmnLZzqG6
	UPIiaztcIrO7/Txs8D+fKlAeFBQhM9pXRs2J4vezH+T9Il+nE9QPLbVPqoAN8QYz
	m2wKhhDbSCg3d90to5hUKOrby7jdHj3jR3V5875Qg1y+F8RCTCMcQ1l2w8Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvmrjhvq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 13:24:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848860def2cso2587734b3a.2
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 06:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786022698; x=1786627498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XSGzh9lPVIOX0gxfEZMJTF4LJynlHT+NQszGI18tGyg=;
        b=PGT03ti6eoA+mUUDMxrBRM7XuF0GxG5QTQoad67OXLFn497iNI3R8riTXB5Sgkio+N
         ALwEXR3UnVseHVO5tTDEI8cK9llynNOh4pRvxNABZAwfdurxi95QQr6T0CHgXIfmwhQ+
         0w352S3x0tQ4f+X5mQPE+Pk4nVrCnyWh6AjkGsnIhAQ6/XXbFfUi2LfVk3gK1J2tq/dd
         lhR0CPUcc7GW4Wz1vcgv5Qkm8/e8jn+APj+S6L3J2gjABCxZ173j/GUSg0JKdq1tY8UN
         cEf0srzzMO4vEy+e2gR++tgvJE8w4IeEhS5vWISRcp11D5vtOkXDiYnIIro3Eavcge1j
         db5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786022698; x=1786627498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XSGzh9lPVIOX0gxfEZMJTF4LJynlHT+NQszGI18tGyg=;
        b=sm2BkqQK//qiCqJDeEKoz5KUijlECnvpT5GaWVEzeI6mXYMPpLr/MX8xou23KfVm1Y
         HEYRhzkJa+n/xIvPkNbAyaVimzqOlYqaV55xNa0BFqrgRkA3zP7AM5fXo3bS6fmzVx1P
         ySMaBkvP2UfcTzE/M+eFKRp9O/BY5cjBGePtev5efpxbvlwQ+qkO8iNkqiRGKiNEAMoF
         WpCl0YNc4Z3UKsfB0hPjExAmwqq+UZZDTFw+R6hykhIf4hPlshoBxwyRVFGFZvjx0gLX
         D4hqysV/79Zp98fngKJylaxJnX5J2G9A+kW06fzYb1fgCoHHPsqKxUBu1+vHOWqM3wbi
         uB6w==
X-Gm-Message-State: AOJu0YxX5DoSMq+ZqJra92EYgrou8BCsj6sxnD7kJJ+nidmcg/RDTrlo
	EhLbe0iEKoAiDXgSMHpjl7noH+EPMvKVX2tsF/A3LpGXDj4fL5Dqxh6I6Zz8+z+5H0dg6yRxnYU
	afwXWgSTRx3WAeyfb/PgILdfO87gBPWFsNxp9AGQKekJu2E8ry4LK9vcJ/zNcBl1S4vweYubj
X-Gm-Gg: AR+sD11X15jjwqPor4n7rOllFTIiUSVj5bAAJJ29ZogQDe8RqLn2lJJ2Y5gQwuIKOKK
	GN17KRwC0osKEXeVJrM/4VgUw96oIOsfBve6Bj/AtPNrj0BSsPnWlOvN5QOUByr81ErRA5Xj7oZ
	szxFxRBjRvLig4gsimSfuOTWNbS9DC0lXw4zf0T3CySbLDX/XhPmP+4UoD4h6LgvliOPi6djhlR
	SrJjv8MTyq4GGH+GfQnC2l9skurIDjFPh/8D6IZ0XJOtuXkS5qXo4XBD8N9Joy1XOSoaFwiZS4U
	PXJNaGj/p/UlndmpRqAeJVkyuKTzSuLKpfeghqWVdrE27HCYuNyIBbr2Z8npiD7FQNSddQSKl3G
	o79PkUOYd9ro6ydd2T0jRXAQlyPItUn87W18uCfUF9YQAb4YHMmt4
X-Received: by 2002:a05:6a00:800a:b0:848:46a0:3d74 with SMTP id d2e1a72fcca58-84f2e0226d2mr17453275b3a.9.1786022697573;
        Thu, 06 Aug 2026 06:24:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:800a:b0:848:46a0:3d74 with SMTP id d2e1a72fcca58-84f2e0226d2mr17453208b3a.9.1786022696965;
        Thu, 06 Aug 2026 06:24:56 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b785dsm1411637b3a.36.2026.08.06.06.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:24:56 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v2 5/8] wifi: ath12k: add WBM RX error drop statistics
Date: Thu,  6 Aug 2026 18:54:24 +0530
Message-Id: <20260806132427.3704828-6-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VNPtWdPX c=1 sm=1 tr=0 ts=6a748b2a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=njqguKqIJykaDPTg3YMA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: J9LBxRwZ-LCD6zMaXNnuSB6PJPqX2dZR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfX8VdEhdDC57lr
 p/C9hTRWanx2sipCciWncnT4q0hZxKjkY1oSLQpX3EqQ7O5SVYQeKROkA1ddea98YynKhYeqB4d
 JP1hKvzONPgFBHsNUTxUqbUb47lhZrQ=
X-Proofpoint-GUID: J9LBxRwZ-LCD6zMaXNnuSB6PJPqX2dZR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfX3PsihMiQpE/L
 CAoHt5OidPB3jBg1jk8ZQ4Q2pRsneV6Ga6Co6HzY1wauZE8UIGm73MdTfEkeE4D1siYWtvKEJBh
 4SZ/AicFEAartJWYNH6qsw4YDa0yVX2IzPUPsLALPlsTVwZ2dw85zYWMtylk1PYQaKLWQADrJZr
 0BeR7jZQz2uwWynQXXohiBRxsuDxxROLYbrE08O8jOLM/9YcrOUs7nTOOf5oZhN9+5MHsT7xurN
 YAWmkff4SE1GEKFhohzjC93C9L+MSYlakShRDjReGQL48DlFfLkcZjGGQfX9qVJ1kRoDXXCx8C4
 tKD6NULoQcuFF79xH2WXXuI5yI21wuz3jDqwv1JUWLJcCBcuCJRsKhGeTK5EAIRvJ2zFXuTBjXY
 HU+IPlafFg5/DG3wSx+ez/4Rc51amkMRYNc2b0FLMZ7cFWMJmllpn5BjxBKu+MOqpZrdbMFbWmm
 OeQt0Dg6GjL3EoFQBHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_062500_310184_1B45BD64 
X-CRM114-Status: GOOD (  23.58  )
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

From: Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>

Without fine-grained drop counters, diagnosing RX failures in the
WBM error path requires intrusive debugging. Introduce per-drop-reason
counters to track exactly where and why packets are dropped during
WBM RX error handling.

Introduce a new dp_stats.h header and define ath12k_wbm_err_drop_reason
enum there covering all drop points in the WBM RX error path: descriptor
parse failures, SW descriptor retrieval errors, null partner DP,
invalid HW link ID, null pdev/ar, CAC running, scatter-gather drops,
and invalid NWifi header length. The new header is included by dp.h
which is already included by all consumers.

Add ath12k_device_dp_rx_wbm_err_stats struct grouping rxdma_error[],
reo_error[], and the new drop[] counters, replacing the flat arrays
previously in ath12k_device_dp_stats.

Add bounds checks before indexing rxdma_error[] and reo_error[] with
hardware-supplied err_code values to prevent out-of-bounds writes, using
the same likely/WARN_ON_ONCE pattern as the TX stats bounds fixes.

Add ath12k_wifi7_dp_rx_wbm_err_free_skb() helper to combine drop stat
increment and skb free at each drop site, reducing repetition. Define
the helper at the top of dp_rx.c before its first use.

Increment WBM_ERR_DROP_RXDMA_GENERIC only inside rxdma_err()'s
default: branch so it counts only unhandled RXDMA errors, not every
RXDMA drop - consistent with how WBM_ERR_DROP_REO_GENERIC is counted.

Expose WBM RX drop counts in the device_dp_stats debugfs file under a
new 'WBM Rx Drop Count' section.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c     | 23 +++++++++-
 drivers/net/wireless/ath/ath12k/dp.h          | 10 +++-
 drivers/net/wireless/ath/ath12k/dp_stats.h    | 25 ++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 46 +++++++++++++++----
 .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |  5 +-
 5 files changed, 95 insertions(+), 14 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/dp_stats.h

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 0e446a666f4c..f9653fb7b038 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1071,6 +1071,20 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 		[HAL_REO_DEST_RING_ERROR_CODE_PN_ERR_FLAG_SET] = "PN err",
 		[HAL_REO_DEST_RING_ERROR_CODE_DESC_BLOCKED] = "Desc blocked"};
 
+	static const char *wbm_rx_drop[WBM_ERR_DROP_MAX] = {
+		[WBM_ERR_GET_SW_DESC] = "SW desc error",
+		[WBM_ERR_DESC_PARSE] = "Desc parse error",
+		[WBM_ERR_DROP_INV_HW_ID] = "Invalid hw id",
+		[WBM_ERR_DROP_NULL_PRTNR_DP] = "Null Partner dp",
+		[WBM_ERR_DROP_NULL_PROC_DP] = "Process Null Partner dp",
+		[WBM_ERR_DROP_NULL_PDEV] = "Null Pdev",
+		[WBM_ERR_DROP_NULL_AR] = "Null ar",
+		[WBM_ERR_DROP_CAC_RUNNING] = "CAC Running",
+		[WBM_ERR_DROP_SG] = "Scatter Gather",
+		[WBM_ERR_DROP_INV_NWIFI_HDR] = "Invalid NWifi Hdr len",
+		[WBM_ERR_DROP_REO_GENERIC]  = "REO Generic",
+		[WBM_ERR_DROP_RXDMA_GENERIC] = "RXDMA Generic"};
+
 	static const char *wbm_rel_src[HAL_WBM_REL_SRC_MODULE_MAX] = {
 		[HAL_WBM_REL_SRC_MODULE_TQM] = "TQM",
 		[HAL_WBM_REL_SRC_MODULE_RXDMA] = "Rxdma",
@@ -1095,13 +1109,18 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 
 	for (i = 0; i < HAL_REO_ENTR_RING_RXDMA_ECODE_MAX; i++)
 		len += scnprintf(buf + len, size - len, "%s: %u\n",
-				 rxdma_err[i], device_stats->rxdma_error[i]);
+				 rxdma_err[i], device_stats->wbm_err.rxdma_error[i]);
 
 	len += scnprintf(buf + len, size - len, "\nREO errors:\n");
 
 	for (i = 0; i < HAL_REO_DEST_RING_ERROR_CODE_MAX; i++)
 		len += scnprintf(buf + len, size - len, "%s: %u\n",
-				 reo_err[i], device_stats->reo_error[i]);
+				 reo_err[i], device_stats->wbm_err.reo_error[i]);
+
+	len += scnprintf(buf + len, size - len, "\nWBM Rx Drop Count:\n");
+	for (i = 0; i < WBM_ERR_DROP_MAX; i++)
+		len += scnprintf(buf + len, size - len, "%s: %u\n",
+				 wbm_rx_drop[i], device_stats->wbm_err.drop[i]);
 
 	len += scnprintf(buf + len, size - len, "\nHAL REO errors:\n");
 
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 16675210806a..9b57b2170b60 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -7,6 +7,7 @@
 #ifndef ATH12K_DP_H
 #define ATH12K_DP_H
 
+#include "dp_stats.h"
 #include "hw.h"
 #include "dp_htt.h"
 #include "dp_cmn.h"
@@ -437,13 +438,18 @@ struct ath12k_device_dp_tx_err_stats {
 	atomic_t misc_fail;
 };
 
+struct ath12k_device_dp_rx_wbm_err_stats {
+	u32 rxdma_error[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX];
+	u32 reo_error[HAL_REO_DEST_RING_ERROR_CODE_MAX];
+	u32 drop[WBM_ERR_DROP_MAX];
+};
+
 struct ath12k_device_dp_stats {
 	u32 err_ring_pkts;
 	u32 invalid_rbm;
-	u32 rxdma_error[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX];
-	u32 reo_error[HAL_REO_DEST_RING_ERROR_CODE_MAX];
 	u32 hal_reo_error[DP_REO_DST_RING_MAX];
 	struct ath12k_device_dp_tx_err_stats tx_err;
+	struct ath12k_device_dp_rx_wbm_err_stats wbm_err;
 	u32 reo_rx[DP_REO_DST_RING_MAX][ATH12K_MAX_DEVICES];
 	u32 rx_wbm_rel_source[HAL_WBM_REL_SRC_MODULE_MAX][ATH12K_MAX_DEVICES];
 	u32 tqm_rel_reason[MAX_TQM_RELEASE_REASON];
diff --git a/drivers/net/wireless/ath/ath12k/dp_stats.h b/drivers/net/wireless/ath/ath12k/dp_stats.h
new file mode 100644
index 000000000000..04d3892acff3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/dp_stats.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_DP_STATS_H
+#define ATH12K_DP_STATS_H
+
+enum ath12k_wbm_err_drop_reason {
+	WBM_ERR_GET_SW_DESC,
+	WBM_ERR_DESC_PARSE,
+	WBM_ERR_DROP_INV_HW_ID,
+	WBM_ERR_DROP_NULL_PRTNR_DP,
+	WBM_ERR_DROP_NULL_PROC_DP,
+	WBM_ERR_DROP_NULL_PDEV,
+	WBM_ERR_DROP_NULL_AR,
+	WBM_ERR_DROP_CAC_RUNNING,
+	WBM_ERR_DROP_SG,
+	WBM_ERR_DROP_INV_NWIFI_HDR,
+	WBM_ERR_DROP_REO_GENERIC,
+	WBM_ERR_DROP_RXDMA_GENERIC,
+	WBM_ERR_DROP_MAX,
+};
+
+#endif /* ATH12K_DP_STATS_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 95d87dd67872..b203513d63cc 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -12,6 +12,15 @@
 #include "hal_wcn7850.h"
 #include "hal_qcc2072.h"
 
+static void
+ath12k_wifi7_dp_rx_wbm_err_free_skb(struct ath12k_dp *dp,
+				    struct sk_buff *msdu,
+				    enum ath12k_wbm_err_drop_reason drop_reason)
+{
+	dp->device_stats.wbm_err.drop[drop_reason]++;
+	dev_kfree_skb_any(msdu);
+}
+
 static u16 ath12k_wifi7_dp_rx_get_peer_id(struct ath12k_dp *dp,
 					  enum ath12k_peer_metadata_version ver,
 					  __le32 peer_metadata)
@@ -1614,6 +1623,7 @@ static int ath12k_wifi7_dp_rx_h_null_q_desc(struct ath12k_pdev_dp *dp_pdev,
 		/* First buffer will be freed by the caller, so deduct it's length */
 		msdu_len = msdu_len - (DP_RX_BUFFER_SIZE - hal_rx_desc_sz);
 		ath12k_wifi7_dp_rx_null_q_desc_sg_drop(dp, msdu_len, msdu_list);
+		dp->device_stats.wbm_err.drop[WBM_ERR_DROP_SG]++;
 		return -EINVAL;
 	}
 
@@ -1649,8 +1659,10 @@ static int ath12k_wifi7_dp_rx_h_null_q_desc(struct ath12k_pdev_dp *dp_pdev,
 		skb_put(msdu, hal_rx_desc_sz + l3pad_bytes + msdu_len);
 		skb_pull(msdu, hal_rx_desc_sz + l3pad_bytes);
 	}
-	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu, rx_info)))
+	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu, rx_info))) {
+		dp->device_stats.wbm_err.drop[WBM_ERR_DROP_INV_NWIFI_HDR]++;
 		return -EINVAL;
+	}
 
 	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
 	ret = ath12k_wifi7_dp_rx_h_mpdu(dp_pdev, msdu, rx_info);
@@ -1763,7 +1775,10 @@ static bool ath12k_wifi7_dp_rx_h_rxdma_err(struct ath12k_pdev_dp *dp_pdev,
 	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
 	bool drop = false;
 
-	dp->device_stats.rxdma_error[rxcb->err_code]++;
+	if (likely(rxcb->err_code < HAL_REO_ENTR_RING_RXDMA_ECODE_MAX))
+		dp->device_stats.wbm_err.rxdma_error[rxcb->err_code]++;
+	else
+		WARN_ON_ONCE(1);
 
 	switch (rxcb->err_code) {
 	case HAL_REO_ENTR_RING_RXDMA_ECODE_UNAUTH_WDS_ERR:
@@ -1780,6 +1795,7 @@ static bool ath12k_wifi7_dp_rx_h_rxdma_err(struct ath12k_pdev_dp *dp_pdev,
 		/* TODO: Review other rxdma error code to check if anything is
 		 * worth reporting to mac80211
 		 */
+		dp->device_stats.wbm_err.drop[WBM_ERR_DROP_RXDMA_GENERIC]++;
 		drop = true;
 		break;
 	}
@@ -1796,7 +1812,10 @@ static bool ath12k_wifi7_dp_rx_h_reo_err(struct ath12k_pdev_dp *dp_pdev,
 	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
 	bool drop = false;
 
-	dp->device_stats.reo_error[rxcb->err_code]++;
+	if (likely(rxcb->err_code < HAL_REO_DEST_RING_ERROR_CODE_MAX))
+		dp->device_stats.wbm_err.reo_error[rxcb->err_code]++;
+	else
+		WARN_ON_ONCE(1);
 
 	switch (rxcb->err_code) {
 	case HAL_REO_DEST_RING_ERROR_CODE_DESC_ADDR_ZERO:
@@ -1813,6 +1832,7 @@ static bool ath12k_wifi7_dp_rx_h_reo_err(struct ath12k_pdev_dp *dp_pdev,
 		/* TODO: Review other errors and process them to mac80211
 		 * as appropriate.
 		 */
+		dp->device_stats.wbm_err.drop[WBM_ERR_DROP_REO_GENERIC]++;
 		drop = true;
 		break;
 	}
@@ -1935,6 +1955,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		ret = ath12k_wifi7_hal_wbm_desc_parse_err(dp, rx_desc,
 							  &err_info);
 		if (ret) {
+			dp->device_stats.wbm_err.drop[WBM_ERR_DESC_PARSE]++;
 			ath12k_warn(ab, "failed to parse rx error in wbm_rel ring desc %d\n",
 				    ret);
 			continue;
@@ -1946,6 +1967,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		if (!desc_info) {
 			desc_info = ath12k_dp_get_rx_desc(dp, err_info.cookie);
 			if (!desc_info) {
+				dp->device_stats.wbm_err.drop[WBM_ERR_GET_SW_DESC]++;
 				ath12k_warn(ab, "Invalid cookie in DP WBM rx error descriptor retrieval: 0x%x\n",
 					    err_info.cookie);
 				continue;
@@ -1961,7 +1983,8 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		device_id = desc_info->device_id;
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		if (unlikely(!partner_dp)) {
-			dev_kfree_skb_any(msdu);
+			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
+							    WBM_ERR_DROP_NULL_PRTNR_DP);
 
 			/* In any case continuation bit is set
 			 * in the previous record, cleanup scatter_msdu_list
@@ -2007,7 +2030,8 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		hw_link_id = ath12k_dp_rx_get_msdu_src_link(partner_dp->hal,
 							    msdu_data);
 		if (hw_link_id >= ATH12K_GROUP_MAX_RADIO) {
-			dev_kfree_skb_any(msdu);
+			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
+							    WBM_ERR_DROP_INV_HW_ID);
 
 			/* In any case continuation bit is set
 			 * in the previous record, cleanup scatter_msdu_list
@@ -2068,7 +2092,8 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 			ath12k_dbg(ab, ATH12K_DBG_DATA,
 				   "Unable to process WBM error msdu due to invalid hw link id %d device id %d\n",
 				   hw_link_id, device_id);
-			dev_kfree_skb_any(msdu);
+			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
+							    WBM_ERR_DROP_NULL_PROC_DP);
 			continue;
 		}
 
@@ -2077,18 +2102,21 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 
 		dp_pdev = ath12k_dp_to_pdev_dp(partner_dp, pdev_idx);
 		if (!dp_pdev) {
-			dev_kfree_skb_any(msdu);
+			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
+							    WBM_ERR_DROP_NULL_PDEV);
 			continue;
 		}
 		ar = ath12k_pdev_dp_to_ar(dp_pdev);
 
 		if (!ar || !rcu_dereference(ar->ab->pdevs_active[pdev_idx])) {
-			dev_kfree_skb_any(msdu);
+			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
+							    WBM_ERR_DROP_NULL_AR);
 			continue;
 		}
 
 		if (test_bit(ATH12K_FLAG_CAC_RUNNING, &ar->dev_flags)) {
-			dev_kfree_skb_any(msdu);
+			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
+							    WBM_ERR_DROP_CAC_RUNNING);
 			continue;
 		}
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c
index 49c693289709..60e7a36097f1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c
@@ -329,7 +329,10 @@ int ath12k_wifi7_hal_desc_reo_parse_err(struct ath12k_dp *dp,
 				    HAL_REO_DEST_RING_INFO0_PUSH_REASON);
 	err_code = le32_get_bits(desc->info0,
 				 HAL_REO_DEST_RING_INFO0_ERROR_CODE);
-	dp->device_stats.reo_error[err_code]++;
+	if (likely(err_code < HAL_REO_DEST_RING_ERROR_CODE_MAX))
+		dp->device_stats.wbm_err.reo_error[err_code]++;
+	else
+		WARN_ON_ONCE(1);
 
 	if (push_reason != HAL_REO_DEST_RING_PUSH_REASON_ERR_DETECTED &&
 	    push_reason != HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION) {
-- 
2.34.1


