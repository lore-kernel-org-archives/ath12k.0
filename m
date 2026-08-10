Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2014C5AD55
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 14:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rAO/WeY4lY3AbDsDNH40jLWpAsEsC4WHKjIwQNx0eE=; b=VBNcBBFpcXMm/S2RugG7nnA4wj
	wynT+Vr/RBjWaiVPrrpiV1VK7GjOrxvIeqn3G95Ip3Iu2do2SXNN15ZN+kEMFFTE6M8MoYHBRBdhu
	9LT6TjQ5ySpW6P/MxBRN/ipy8KcGqMtKzAQb9K1rDo0ukQ9S2TEc6Ce4qA5STp0A2XnyARLzHil7L
	FFbQP5A2cIVi1tsV5RNhmdGxi8R4CZVxCc/WXrvdsq4dCHoJNi8mOqlvzoCAM4POHHccTIE40N8/6
	4TZHbYtTT1MSyVV8NKLzfXB3s302EQ4oEzNO1xzpJEhAL7Rk/yaCBOjcU/HjIAR7S60j60TGRwv2X
	23hiXgBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFa-0000000C3Oa-2P8S;
	Mon, 10 Aug 2026 14:45:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFU-0000000C3L7-1nC6
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 14:45:12 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACiwhW1650226
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6rAO/WeY4lY
	3AbDsDNH40jLWpAsEsC4WHKjIwQNx0eE=; b=LCj2s6XPFg+jPkBSsh2yB5awY4h
	z/fZLMLS0h/YB6hKIqwxH7vNgFsPiGEFjS5JcyHKKlqDjOLdMfW6xxm/a/EkTwxZ
	gA/sI5ItwhC1A9fTQVXPQFZb5ZXJZDJmWkvNihhy1aZKomj6nFtma79pXzgWtfsQ
	eQA7A39klOacAoH6bNuN7s1XVSAXk1KKZqJhKGiRajrqQKEqgvMXB+269MfUzY+G
	cj7u83H5QGDcklILFsoijkk+QBB6sAy3/M2jtGmOYCzn+XuJtAe7K5gTh1De/GrH
	Z+jSSXd5+Y8LLPGl7vowZLMfj9sUuc7bgfgRWtswWQIlwUx8YKYMITN216Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8vhj227-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:45:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811279d51aso3948914a91.1
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 07:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373106; x=1786977906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rAO/WeY4lY3AbDsDNH40jLWpAsEsC4WHKjIwQNx0eE=;
        b=jbH0GIUA8DMBSzZQ7Hl5g4PJUMvBPPxqmMaTwGFMhOT2+xHeHzBvlAVO39qE1aUCya
         mHWgs+XP2HnCBGx8H9fsCcjePk9Bg9lnvQlD1KwvU+vsxGuBFKTAgWA7ebLlPyzxHgAs
         a9RNAy+7dVNYQF8eDggWS8O/aozmcBreODLXZLKPLjq1YMfJlmbVuGUECPqmMIWH6Fk/
         ZxtqcGV47lzTpPWWbexsm6T/OYCMUDGgeU2XUS2Rz/E0iomxbASPGRc6ODqXsZfDbzUU
         MtGiLsg9pXGkTBY9/hdD/Vne//VLh2oTZQd6L+n9AJi4ZN4PIFhNKYydaB4gL2ybE5No
         T0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373106; x=1786977906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rAO/WeY4lY3AbDsDNH40jLWpAsEsC4WHKjIwQNx0eE=;
        b=TYRnv0/v0ScQ2lAlKXjT3h+nOJB6gwLoFvTilYVfpekHrb7SUrOA43Wg51O42uKfNA
         dTckF36FTL2PsQ2cZsXW+9IgdagnH2pCAGeP1xhejwE8Q4oFiOJbSk1ve5q6rpNsnfdq
         bYUsE93L0+2INtJvZvfehMm2oDXgsszwQ9zSRHF+/ts7MIV4OcRamOIe4wgtxWOA9Hga
         tOCIJ9k0QTshBNJaLwZfGCMBiEk7VKiuYLwdmBRLxftMAlRF/6vpSe8cnWt+xMUT3kab
         4Qnai72L353f4wh1vNBQx6z780JLHL9uJ4/nouFKtmLk7xktMZopu19FKXcSTQHOGBmo
         TDfA==
X-Gm-Message-State: AOJu0Yw1RAo0I6VfU96OymD8boycjtUt1Mhg+o8hGXU1g9l+lWYlOz8Q
	Q08lg1oSmM2X+ii1rDiJagO2giuCXdktwgNPBzu9Ssm9UTgZmRjk6Pnk2VEKO03nDL06Q/GCctw
	EDTrdEPKOIcR3GX2JiVe1xJCaulynFATsHDiTnGage3pLAMtFGyXy+ibL+hV4INFm/uxk/yc6
X-Gm-Gg: AR+sD10JBj1YARZKgXyP9pgvbyW6980QoaDIP/6PACI/ReEM75DpSvuCDTKJlYgEZst
	LBQoalxiei+B01rDGawbF8QdRU67G4THw5JfX0ze76wxzdqEpr/LQETp0Lb7cl23g5RS6pWIkwa
	+h0vGXKzSQvKdGuS/8T+sYohQHzeLQr476VaSuzC/F4elqiMlhwb5+NjDQtcJYi7B7cTjY0frKi
	EmD1/b18Y/X3o56nR66a99vXQghTet4eiJNC+YArVNfeom625GjOhzVlIU+ZlJPJMgHLHmFo/vR
	QtgeRIpsriGBi+YjPNsdXorBBUOwX/4N++Wu5gsu7qNMMePJeShVc6ylUrRdRRYQU3kPRMN2he5
	fFj+VpmMbbEv4WhTgBgE1l8qRK95HTrXerN8VuiN0DP76hxhDOG56
X-Received: by 2002:a17:90b:3848:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-39261fb9e0fmr21145044a91.5.1786373105884;
        Mon, 10 Aug 2026 07:45:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3848:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-39261fb9e0fmr21144977a91.5.1786373105303;
        Mon, 10 Aug 2026 07:45:05 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3926254ee45sm12797317a91.2.2026.08.10.07.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:45:04 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v3 5/8] wifi: ath12k: add WBM RX error drop statistics
Date: Mon, 10 Aug 2026 20:14:41 +0530
Message-Id: <20260810144444.2033607-6-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
References: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MMtQXsZl c=1 sm=1 tr=0 ts=6a79e3f3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=njqguKqIJykaDPTg3YMA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: RJZM3yXnCMAX6XC87FlqO2rztrWfMGHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfX+5Lc+xjEqZtg
 mAbqhH1HTzVWk6u3/kROwyBlj1/tROPeGl5+NhSQgMB3MNT/5tAWoX2xqv8OtdnFfZ6+OInjurs
 +EjYXgS0BjRVJ1pu9YgBUYR+QsAsOK2FjUxh9yaGwJWgydKXAY2EpW140w2HQIztWYur2Vz7Jjn
 Lr7ElpwXfYCw+OQi+QbO2SZB7mfk/tFIypIpd5u0QlrN/LDLiU0VVrbBZa0w27j1vgog3ldw0Pi
 84wrjlVVYa/Fr50TEwvCy1SoCHS7ZwP1jMQJuRcQwZobuISgbPv2prL/UTI28DlXrJGibf/xGYG
 P4kmN3IOX7i2x1liYztKphgEwy9ZNFp1RzNNhXyY5BK30B+290vzYk0+Zw7sHPgZn9sMM2W7utn
 WZmgITXv/50M9lHc/tYrS054wxIWC/DKfGmZx+5Lya3hC4hfL3/oabaE9GB48mRtXEjj7xpouWV
 P22teNHa0ygsVV0cikg==
X-Proofpoint-GUID: RJZM3yXnCMAX6XC87FlqO2rztrWfMGHP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfXwRhJRhRbmLRJ
 c4mphmJD3Y4Lrsv+DPkyWJKk3ayokazVX4x+qq4J6LI3+jYmCtQd6jzEmGzPJrrKXVL169//i4f
 JDBOoHUL5Fah2qUVTfXGAM5pHGv8ZQQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074508_608204_01D82D5B 
X-CRM114-Status: GOOD (  23.65  )
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
index cbda754d8656..34c605b609cb 100644
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


