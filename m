Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AA3606D819
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 01:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tElqQAlw;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmZ/OYXV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=enVJvZ/t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3iz3Cx1junU5AKH67YJX4/Pd0NUTUZq/2Hnk10krITE=; b=tElqQAlw2YhzUO
	qHH62ZbHXDd9Ue8CvBCgrh4+9DNy3EI+Oke1nPWryAnfLqfA5qtZ3mMhNriRWsaMo9T07HEiVq8H+
	h07o353AdBkBgMJ2Fqf4QlLu17HC/4hFxR3tQYAI+xlxMK5Qjv4IXkXN7/z5uBwsv4GyFGclvK6LD
	EhgA1j8amAwnXo/mb2XqHNUB0b+00aiTjyj3QDrOz5+No8ZVDkPrNeH2aDnR3eIyYomo5l0qXgKxN
	g1nINRKjiqaTWS0Hc3xJ9EyR+tGs6g740PQc5JsZ7kMa92lJ+WzipJSKu7Ad7bmYjqZrGh1RRtztf
	+iqqUCDeDvnH2aZ7zuxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWg-000000042rt-2QAI;
	Wed, 04 Nov 2026 01:10:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWd-000000042qX-3tMd
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 01:10:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RQvt809416
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 01:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3iz3Cx1junU5AKH67YJX4/Pd0NUTUZq/2Hnk10krITE=; b=NmZ/OYXV8kl/llRx
	dGrpnN95QBk8Y3ULkyl8OkQpfGrZjNnPR/kW8ZQKbiTA7uSkxeewTwOlgpTRafTE
	mbsZlQ8rKErPtTn+c+3zWRFLiug7OzCzGoNnbA9Vh5pcwZlGhLyKJWjXZmW/u30V
	hqZwL4lLWBPUM/E77uHBIvLpSCNdteihX5t028XhQ+dMZt2DSeibN5g3V0NA/CAp
	Q2Z8FZKLuz0TvMz/1xdLO/887qScbIUUgfhj3vutN0crvsP9uD3TtewkoLGT16ge
	hNd3rCpuGzxB+FT01tsSQWkmPTi9i9qeaOjKb47mDSu1sLr/khm9aH3F89JkoEx3
	iDB04g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgp9vqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 01:10:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ca254ca2cso264735eec.0
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 17:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754649; x=1794359449; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3iz3Cx1junU5AKH67YJX4/Pd0NUTUZq/2Hnk10krITE=;
        b=enVJvZ/tDRPC49f5qlAZn4U57i1zyUMjrzgsXyCx8roKX2WPl7hLyziXnf2R9oBSsb
         Of67yotMem99Tw4DLSe3G0CMDHmCn1StWJfqfOLMZinDhNpAcI81OLy2Ax1lG0stzFqD
         +B1lio14ifmJgFHM0WqB38TZ2kByAjDFeyoxj/BCPu2TChiCZUnI5IIqO/FZabNyt5kC
         98ZEZS2bs3SsLMuj+MHocoMb29xfBWPy3djdgR0BgeBgeTvw1pwmxj4xCkPsRpIMxAkZ
         u+cOvr1VOSvDP4zBR8Yx2bTysm5Skw4DsIeZTIL7CqUnJMLZpA1c9zLGf2XReGHfLfj4
         KD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754649; x=1794359449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3iz3Cx1junU5AKH67YJX4/Pd0NUTUZq/2Hnk10krITE=;
        b=sO1ir3P25Rmo5DnsZrwH3UiKxG5asQrmIfDXy6MMAvzQ1ItWb38/YqALCmeogWOlQr
         atROzNn3O0u9/EvuoqdFfT++yIiJ5503tGvB1RCqx5ABcNXwgN4GLkssPXWTnX3ZKGsA
         z6ZoPx+z/tAqM3hprqec2trdQLejCRRgrnN30TUvRNqElIkty5stY28Y/KBiO/BJLhXa
         iABvFHWKQVKGkPNTk06ThipX0DbA9fxNvXbWVIX3Yo+J/D+KzFBd3CJf1CAREBetsBiF
         fA+EIktAqzmObsU1qKXLEKkBXP4LTptr6bmA+NXQ0DisZ5Xka5f3qiJqNyPJvD4R2HHJ
         AMMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlj49T05xtAYFw44HQUvnlfPflPtHC8zWDd6ybGMYc8VP6SGKmcvTj37b53YL1JPiN7v5+RrI=@lists.infradead.org
X-Gm-Message-State: APuU4Z+IMp5AHDVrAYfkqikCysu4+DY1MHSYRHfmeKEAj4XD0lwlWF0S
	ea+fhAQqKkuHTobpsnoi8wPF/Tq+z0Tjt06hwSK1eFsFkHAcFVbTVM/MgUyHANgXhEqjK8GTKhB
	ECbCzsBrPA5R/x3r06XoROTjdKDIQmdM5JfQ/fY952rCUsBm95JYqPyTN+XCiYDJR
X-Gm-Gg: AYBFou2o/meRZg3Bv+eZgxJLlx4MW1Us+l07+N//p3R0z85DpunOxeoInMm9m299ct8
	jmnsuWg5sGS3DaUmsHPXiQAF1tHP1GmYjCOt7T2AXhYo1UbCdsNGVJw9HXHuXf4y+jZxKZgFx0j
	iMhYpQwFSJvrSWRXB0MeY1Toit6vD6H5hBaPvZd0DeI+aMN5ieOLWDr0x0Xc9oVkBYGGYksOFM6
	5ucwyHf3GXa5U/hLFWk9lHvc79p2jVEZQZegY7Aa76mSx9KMnpD2/DGVCI3ovQCYZlP+CkxG0tm
	3NtnT1zIYvqCsQeYZNPEhhxzGomGu+z81jV0a7RWTuoS5iNOL2Ev0gCdLobbmcVLsYNOETF8TvE
	YVMLpXkegFeJVt/jxFf1T9uVJ6mfPYA+jEieydENTHsGQdedpQocLGQE4hsEvCSP7Cbz/aNX3p2
	ekRemV7lyDdipZ0eEh3zOJ9GNkjpp6AWo/6R+1
X-Received: by 2002:a05:693c:414f:20b0:369:e930:6bc4 with SMTP id 5a478bee46e88-36a423f6f4amr22540060eec.30.1793754648893;
        Tue, 03 Nov 2026 17:10:48 -0800 (PST)
X-Received: by 2002:a05:693c:414f:20b0:369:e930:6bc4 with SMTP id 5a478bee46e88-36a423f6f4amr22540010eec.30.1793754648180;
        Tue, 03 Nov 2026 17:10:48 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:47 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:45 -0800
Subject: [PATCH ath-next v3 02/13] wifi: ath12k: ng: add high-priority REO
 command ring
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reo-cmd-b4-posting-v3-2-861adf04b516@oss.qualcomm.com>
References: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
In-Reply-To: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX8abAxYipKUHo
 RPS75CVrZdWVIhbVwtRqbuElcj36Ce/yFArRmBcmruMO2gTOdy/3lZP5UGacRXp0OlDNW9dj1W/
 v7JxGe9pO0ecxU+LeDAsYaXWzmuf7CATsPv2MTt4bcKTXtIyHnd6y/qZ7zlRjmwpBHPhD5pW4UZ
 hnXmYHLnx+COcPrYvLL35L7obHtIbhJl0fHLWxKSfTkPhM4DJIh93qGi4s6mbch5LcZ2FIE0uAT
 Yt+UvApADODyp8b5/ow2ePO+mqa+dPzeIpxhYGBCun6Yn1fOvpu2g7NtN6la7czd2Y1Xwqb56PM
 QgvgGrVYxILytwmGHNBVl/x8ciGDugP9C/UrVSp1KxuZT4RQFiOcVS9GIPS7e9LEt8qLY9ZgWHS
 1e5xijo3Pn9o7YVrwHVTPr9HDd8sCYQj12o3KK2AH0WHGKO08/h5a++4Y8TFYaKQdyKd6ulpUHH
 N/tmnOC5y5L8uaUFTRQ==
X-Proofpoint-GUID: hd69ATExl2WLXZ7J9rdcxHaXbPGGWN2V
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aea861a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ATb32olPAYJCz0g8maoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfXzqFdkrDGRqIj
 dTEWXXzUiVgX3grg72SA3hKCuv2mlImPoIGbUSap44OM2v/1XGjH9JCMTLAi34p0noivIdM0dH6
 VLrpFxBKWylxCMGQS8PFAhzkvBFd4MU=
X-Proofpoint-ORIG-GUID: hd69ATExl2WLXZ7J9rdcxHaXbPGGWN2V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_171052_092409_6D9768DF 
X-CRM114-Status: GOOD (  21.88  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

REO commands currently share one ring, so latency-sensitive queue
statistics and update requests can wait behind normal command traffic.

Wi-Fi 8 hardware provides a second REO command ring for priority traffic.
Represent it as ring index 1 of the existing HAL_REO_CMD type, allocate
and initialize it in the Wi-Fi 8 datapath, and expose a separate
high-priority send callback. Reserve a distinct command-number range so
completions from both command rings remain unambiguous.

The existing REO command ring and common send callback are unchanged.
Only Wi-Fi 8 installs the high-priority callback and allocates the
additional ring.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k

Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.h       |   4 +
 drivers/net/wireless/ath/ath12k/wifi8/dp.c    |   2 +
 drivers/net/wireless/ath/ath12k/wifi8/dp.h    |   1 +
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c | 109 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h |  13 +++
 drivers/net/wireless/ath/ath12k/wifi8/hal.c   |  13 ++-
 drivers/net/wireless/ath/ath12k/wifi8/hal.h   |   3 +
 7 files changed, 142 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index d369d68620ed..3a369dfc8ea5 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -11,6 +11,8 @@
 
 #define DP_MAX_NWIFI_HDR_LEN	30
 
+struct hal_reo_status;
+
 struct ath12k_reoq_buf {
 	void *vaddr;
 	dma_addr_t paddr_aligned;
@@ -61,6 +63,8 @@ struct ath12k_dp_rx_reo_cmd {
 	int cmd_num;
 	void (*handler)(struct ath12k_dp *dp, void *ctx,
 			enum hal_reo_cmd_status status);
+	void (*status_handler)(struct ath12k_dp *dp, void *ctx,
+			       struct hal_reo_status *status);
 };
 
 #define ATH12K_DP_RX_FRAGMENT_TIMEOUT_MS (2 * HZ)
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp.c b/drivers/net/wireless/ath/ath12k/wifi8/dp.c
index ff44b8be9534..dee73473cea9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp.c
@@ -245,6 +245,8 @@ static int ath12k_wifi8_dp_umac_init(struct ath12k_dp *dp)
 	INIT_LIST_HEAD(&dp->reo_cmd_list);
 	INIT_LIST_HEAD(&dp->reo_cmd_cache_flush_list);
 	INIT_LIST_HEAD(&dp->reo_cmd_update_rx_queue_list);
+	spin_lock_init(&dp->reo_cmd_lock);
+	spin_lock_init(&dp->reo_rxq_flush_lock);
 	INIT_LIST_HEAD(&dp->tqm_cmd_list);
 	spin_lock_init(&dp->tqm_cmd_lock);
 	atomic_set(&dp->tqm_cmd_num, 0);
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp.h b/drivers/net/wireless/ath/ath12k/wifi8/dp.h
index 4b773dca0483..3d1ce8f31ee8 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp.h
@@ -42,6 +42,7 @@ struct ath12k_dp_wifi8 {
 	struct dp_srng tx_exception;
 	struct dp_srng tcl_cmd_ring;
 	struct dp_srng tcl_status_ring;
+	struct dp_srng reo_high_prio_cmd_ring;
 	struct dp_rxdma_ring wbm_refill_ring[DP_WBM_REFILL_RING_MAX];
 	struct dp_rxdma_ring wbm_idle_ring;
 	struct dp_srng tqm_cmd_ring;
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
index ca82f9ac0e44..0eea810f68fe 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
@@ -15,6 +15,8 @@
 #include "hw.h"
 #include "../hal.h"
 
+#define ATH12K_WIFI8_REO_CMD_HIGHPRI_START_NUM	(DP_REO_CMD_RING_SIZE + 1)
+
 /* Wi-Fi 8 uses cookie-conversion: the chip writes the SW descriptor VA
  * directly into buf_addr_info[63:0] of the REO destination ring entry.
  * info0 holds VA[31:0], info1[7:0] holds VA[39:32].
@@ -48,6 +50,99 @@ ath12k_wifi8_get_sw_desc(struct ath12k_dp *dp, const struct hal_reo_dest_ring *d
 	return ath12k_dp_get_rx_desc(dp, cookie);
 }
 
+static int ath12k_wifi8_dp_reo_cmd_send_ring(struct ath12k_base *ab,
+					     struct hal_srng *cmd_ring,
+					     void *data, size_t len,
+					     enum hal_reo_cmd_type type,
+					     struct ath12k_hal_reo_cmd *cmd,
+					     void (*cb)(struct ath12k_dp *dp, void *ctx,
+							struct hal_reo_status *status))
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp_rx_reo_cmd *dp_cmd;
+	int cmd_num;
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct ath12k_base *central_ab = central_dp->ab;
+
+	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &central_ab->dev_flags) ||
+	    test_bit(ATH12K_FLAG_RECOVERY, &central_ab->dev_flags))
+		return -ESHUTDOWN;
+
+	if (!cb) {
+		dp_cmd = NULL;
+	} else {
+		if (WARN_ON(len > sizeof(dp_cmd->data)))
+			return -EINVAL;
+
+		dp_cmd = kzalloc_obj(*dp_cmd, GFP_ATOMIC);
+		if (!dp_cmd)
+			return -ENOMEM;
+
+		INIT_LIST_HEAD(&dp_cmd->list);
+		memcpy(&dp_cmd->data, data, len);
+		dp_cmd->status_handler = cb;
+	}
+
+	cmd_num = ath12k_wifi8_hal_reo_cmd_send(central_ab, cmd_ring, type, cmd);
+	if (cmd_num < 0) {
+		kfree(dp_cmd);
+		return cmd_num;
+	}
+
+	if (cmd_num == 0) {
+		kfree(dp_cmd);
+		return -EINVAL;
+	}
+
+	if (!dp_cmd)
+		return 0;
+
+	dp_cmd->cmd_num = cmd_num;
+
+	spin_lock_bh(&central_dp->reo_cmd_lock);
+	list_add_tail(&dp_cmd->list, &central_dp->reo_cmd_list);
+	spin_unlock_bh(&central_dp->reo_cmd_lock);
+
+	return 0;
+}
+
+int ath12k_wifi8_dp_reo_cmd_send(struct ath12k_base *ab,
+				 void *data, size_t len,
+				 enum hal_reo_cmd_type type,
+				 struct ath12k_hal_reo_cmd *cmd,
+				 void (*cb)(struct ath12k_dp *dp, void *ctx,
+					    struct hal_reo_status *status))
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct hal_srng *cmd_ring;
+
+	cmd_ring = &central_dp->ab->hal.srng_list[central_dp->reo_cmd_ring.ring_id];
+
+	return ath12k_wifi8_dp_reo_cmd_send_ring(ab, cmd_ring, data, len,
+						 type, cmd, cb);
+}
+
+int ath12k_wifi8_dp_reo_cmd_send_highprio(struct ath12k_base *ab,
+					  void *data, size_t len,
+					  enum hal_reo_cmd_type type,
+					  struct ath12k_hal_reo_cmd *cmd,
+					  void (*cb)(struct ath12k_dp *dp, void *ctx,
+						     struct hal_reo_status *status))
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct ath12k_dp_wifi8 *dp_wifi8 = ath12k_get_dp_wifi8(central_dp);
+	struct hal_srng *cmd_ring;
+	u32 ring_id;
+
+	ring_id = dp_wifi8->reo_high_prio_cmd_ring.ring_id;
+	cmd_ring = &central_dp->ab->hal.srng_list[ring_id];
+
+	return ath12k_wifi8_dp_reo_cmd_send_ring(ab, cmd_ring, data, len,
+						 type, cmd, cb);
+}
+
 /**
  * ath12k_wifi8_rx_spd_buf_alloc - allocate per-ring SPD scratch-pad arrays
  * @dp_hw_grp_wifi8: Wi-Fi 8 hardware-group private data
@@ -915,6 +1010,7 @@ int ath12k_wifi8_dp_rx_ring_setup(struct ath12k_base *ab)
 {
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 	struct ath12k_dp_wifi8 *dp_wifi8 = ath12k_get_dp_wifi8(dp);
+	struct hal_srng *srng;
 	int i, ret;
 
 	ret = ath12k_dp_rx_pdev_reo_setup(ab);
@@ -949,6 +1045,17 @@ int ath12k_wifi8_dp_rx_ring_setup(struct ath12k_base *ab)
 
 	ath12k_wifi8_dp_wbm_idle_ring_buf_setup(ab, &dp_wifi8->wbm_idle_ring);
 
+	ret = ath12k_dp_srng_setup(ab, &dp_wifi8->reo_high_prio_cmd_ring,
+				   HAL_REO_CMD, 1, 0, DP_REO_CMD_RING_SIZE);
+	if (ret) {
+		ath12k_warn(ab, "failed to set up reo_high_prio_cmd ring :%d\n", ret);
+		goto err_wbm_refill_cleanup;
+	}
+
+	srng = &ab->hal.srng_list[dp_wifi8->reo_high_prio_cmd_ring.ring_id];
+	ath12k_wifi8_hal_reo_init_cmd_ring_offset(ab, srng,
+						  ATH12K_WIFI8_REO_CMD_HIGHPRI_START_NUM);
+
 	return 0;
 
 err_wbm_refill_cleanup:
@@ -964,6 +1071,8 @@ int ath12k_wifi8_dp_rx_ring_free(struct ath12k_base *ab)
 	struct ath12k_dp_wifi8 *dp_wifi8 = ath12k_get_dp_wifi8(dp);
 	int i;
 
+	ath12k_dp_srng_cleanup(ab, &dp_wifi8->reo_high_prio_cmd_ring);
+
 	for (i = 0; i < DP_WBM_REFILL_RING_MAX; i++)
 		ath12k_dp_srng_cleanup(ab, &dp_wifi8->wbm_refill_ring[i].refill_buf_ring);
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
index 9ef1474b1a7e..a05ab2f4495c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
@@ -11,6 +11,7 @@
 #include "hal_desc.h"
 
 struct ath12k_dp_hw_group_wifi8;
+struct hal_reo_status;
 
 struct hal_rx_mpdu_desc_info {
 	union {
@@ -146,6 +147,18 @@ int ath12k_wifi8_dp_pdev_alloc(struct ath12k_base *ab);
 void ath12k_wifi8_dp_pdev_free(struct ath12k_base *ab);
 void ath12k_wifi8_dp_wbm_idle_ring_buf_setup(struct ath12k_base *ab,
 					     struct dp_rxdma_ring *rx_ring);
+int ath12k_wifi8_dp_reo_cmd_send(struct ath12k_base *ab,
+				 void *data, size_t len,
+				 enum hal_reo_cmd_type type,
+				 struct ath12k_hal_reo_cmd *cmd,
+				 void (*cb)(struct ath12k_dp *dp, void *ctx,
+					    struct hal_reo_status *status));
+int ath12k_wifi8_dp_reo_cmd_send_highprio(struct ath12k_base *ab,
+					  void *data, size_t len,
+					  enum hal_reo_cmd_type type,
+					  struct ath12k_hal_reo_cmd *cmd,
+					  void (*cb)(struct ath12k_dp *dp, void *ctx,
+						     struct hal_reo_status *status));
 int ath12k_wifi8_dp_rx_ring_setup(struct ath12k_base *ab);
 int ath12k_wifi8_dp_rx_ring_free(struct ath12k_base *ab);
 int ath12k_wifi8_dp_rxdma_ring_sel_config_qcn9625(struct ath12k_base *ab);
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.c b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
index 036c04cbbf16..af51ee3cd7e7 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
@@ -565,13 +565,14 @@ void ath12k_wifi8_hal_set_link_desc_addr(struct hal_wbm_link_desc *desc,
 		le32_encode_bits(cookie, BUFFER_ADDR_INFO1_SW_COOKIE);
 }
 
-void ath12k_wifi8_hal_reo_init_cmd_ring(struct ath12k_base *ab,
-					struct hal_srng *srng)
+void ath12k_wifi8_hal_reo_init_cmd_ring_offset(struct ath12k_base *ab,
+					       struct hal_srng *srng,
+					       u16 cmd_num)
 {
 	struct hal_srng_params params;
 	struct hal_tlv_64_hdr *tlv;
 	struct hal_reo_get_queue_stats *desc;
-	int i, cmd_num = 1;
+	int i;
 	int entry_size;
 	u8 *entry;
 
@@ -589,6 +590,12 @@ void ath12k_wifi8_hal_reo_init_cmd_ring(struct ath12k_base *ab,
 	}
 }
 
+void ath12k_wifi8_hal_reo_init_cmd_ring(struct ath12k_base *ab,
+					struct hal_srng *srng)
+{
+	ath12k_wifi8_hal_reo_init_cmd_ring_offset(ab, srng, 1);
+}
+
 #define HAL_RDI_MAPPING_MAX	32
 
 int ath12k_wifi8_hal_get_rdi_source_cfg(struct ath12k_base *ab, int source)
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
index d30ee1242122..fc5df78be051 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
@@ -1045,6 +1045,9 @@ void ath12k_wifi8_hal_set_link_desc_addr(struct hal_wbm_link_desc *desc,
 					 u32 cookie, dma_addr_t paddr, u8 rbm);
 void ath12k_wifi8_hal_reo_init_cmd_ring(struct ath12k_base *ab,
 					struct hal_srng *srng);
+void ath12k_wifi8_hal_reo_init_cmd_ring_offset(struct ath12k_base *ab,
+					       struct hal_srng *srng,
+					       u16 cmd_num);
 int ath12k_wifi8_hal_get_rdi_source_cfg(struct ath12k_base *ab, int source);
 void ath12k_wifi8_hal_hw_ase_init(struct ath12k_base *ab,
 				  struct ath12k_hal_ast_param *ast_param);

-- 
2.43.0


