Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150B3C83F15
	for <ath12k@archiver.kernel.org>; Tue,  8 Jul 2025 19:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtaRafnT4SLofo+kxnbIQyg617OEyZPWweMS75eYPyY=; b=KypXBcUgPn4S+E+cU7AX7ie/qP
	W1zz7lTjTQJSgRWwOzdIKWSkpQ1veFAKdtYI6KqhRbjwibU7tbIUcLwAMuut/aaxQs/XXJBelNxz2
	besW0/0958fDcVcTInjF0m49ZdkEocMTFqkeW92/zqY3jEu68HS3Xq4WYy+enbXuXRl9yGrcJpxQG
	wuCR6qNtLg+OeLlVEXuOWgh9quX2nb1cvHdxuY+N7E5dbFxBELPnZuWiIcJyK60VEHyFdqTAxduUj
	sLBY0JgSrlWznpd8xK+VAMCLvlXQ6vpQIxez9cd+qN4lHbQ9B63H58n2csbefDE83EUbu0Q0lq63A
	xIg+zPpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAl-00000006Nns-1v6g;
	Tue, 08 Jul 2025 19:40:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCmg-00000006DGI-3x7X
	for ath12k@lists.infradead.org;
	Tue, 08 Jul 2025 18:11:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAcxK031850
	for <ath12k@lists.infradead.org>; Tue, 8 Jul 2025 18:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BtaRafnT4SL
	ofo+kxnbIQyg617OEyZPWweMS75eYPyY=; b=OEduSNQP5mhA2okoCJ/5TrKmYkq
	qRIUclxLv5cNCqCCXg+BdizkBrn5IuFL+b4rKE0ENYP8DFLNwVZXqoHK0a1MnnYm
	Vk5A4iFYmJ76FxzkGrEj8f+SyCBVxpQz6mGJ+P7HfbwwsaUVC6pb9PItayrj1adr
	/sTsHgYoMe6OPjljNhRMs+pAglUGLEqU3nI702UmEx4N/hy6LN8lRllzZx6qGvjt
	JRqJlSawg9EoiDxdsjGQ+9hC8ZbKvNsatWTpTpk//0mSIKMZMCTd3tEQ/kGK5+DM
	zOSRYZiMKlGbf3O9dzievCjOgBed+KiB+7VSoyznBxjz4T75bSo89EA+sBQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qr8wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 18:11:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234f1acc707so33220545ad.3
        for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 11:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751998272; x=1752603072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtaRafnT4SLofo+kxnbIQyg617OEyZPWweMS75eYPyY=;
        b=sGQrA+mHBnXYMGJb01GcF4PrOqX1bgVdO9hIE9JapiANyJRlIE9W4Pq6Hpm2UexMwI
         qwqR7qVaRna80RakTtOlP4Ajy9Uzz9VoQ5KgEF9+9eOFchJPMIcoBY1TS8ABROaUxzGA
         p+8swcSGD2Lf5gH4FMqqfY1x1D/wPsdLEJs8IgzvqMeRlwf+xpxhqdexnqD6uL7JBg7f
         wdlW05Xcz+aYN/7TLDkUsbEp9HG6IoYEK4ij+OCyo/LccFuG4MSwiJY7LD1mn2utFgWN
         TfJK90dQJhHsmcRNkT8DoQolaqF9S9GfBwvSoXG9CHKXom8l9zXMgSyODgo/ApC4LkTB
         UugQ==
X-Gm-Message-State: AOJu0YxoiTgP1VY3Tj9dWX4QtJevq0SlIY/CgZ3epSL3nMx6VZ1/6Gzh
	/+g5fGli7qVSROGw1dddIBmLQdzonRJ0UyY90yu8qTG1vm1ppY+NeaXhzFBvF5j0TWorzJZl8+V
	ZSDVnjRS5NHRmawOA4K1tACeLyHv01bgPwCDoeUufJwPnUEQrq2AdsCsx0DleUaMN9CWL+kZr
X-Gm-Gg: ASbGncuCG6/pQIDbFWsTZQxYZz60bXYj/75V9QCPhf/RkXK66BeJWIZHuHji/wUtYMr
	ngF6Btm7ZiG57NW2Dy3SMdKGDv287DHtw6pBVtRK6QpukUema3yjM6EHO+swVjgiw3aMis5Suh4
	PP8RyfAWDY8dJAAA58oMnpDV5MOgO9Cau/Pl+y3XdQ9nVF6wygWdq1TlR02L/23CsQUIkxFLg69
	jYM4ImKu6Sw0eIbEZSZoBqmLhvGzXHqjeSwgxJUeoYIGE17XXktQetU7bxObGg3yDkTJvqF0YJJ
	7tzq8IpLPhSLtfq+yG/W5IiNh1a6WaLHxHcHRJNV+Y2T/aSpii1Q7pFvq75nDbJ6Zzpm1W2oy2X
	8TEbsDBAR6ssj2C+2jNhifvNv7pSJ3OH21sukoZICkJwu5w==
X-Received: by 2002:a17:902:cf05:b0:21f:4649:fd49 with SMTP id d9443c01a7336-23c875db9d1mr247269315ad.49.1751998271894;
        Tue, 08 Jul 2025 11:11:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH64uIvd5da/OCOiagpE5GseRqXCxPYzYvQFtD4jDxOvMjCP0jI6ai+dMg6dFTvRtQfRKYZuA==
X-Received: by 2002:a17:902:cf05:b0:21f:4649:fd49 with SMTP id d9443c01a7336-23c875db9d1mr247268895ad.49.1751998271383;
        Tue, 08 Jul 2025 11:11:11 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455d0a9sm115980425ad.95.2025.07.08.11.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:11:11 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 1/4] wifi: ath12k: Add a table of parameters entries impacting memory consumption
Date: Tue,  8 Jul 2025 23:40:59 +0530
Message-Id: <20250708181102.4111054-2-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708181102.4111054-1-aaradhana.sahu@oss.qualcomm.com>
References: <20250708181102.4111054-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE1MiBTYWx0ZWRfX44YzjRJR5VG5
 JInl1Nox44Khn8zPUDkZCkHIHHeuzOlq5Tz114M53aRqvOW3cOxyroTAQeUl5tobVDKRq6n3OHQ
 oVCc9b0wuVPDDiPyEjlDzLvyZbf7juRHknbXwddHL8JyajMa4FYkiKtvABbqAH766M/PyZIXy6W
 ZmvHnOsAapk9T2u56+8JNEi/gPNOPsOxh1duTkkKmqQWDU1PlvEp+P0WgrwC0RNVTxNJGqgLwm6
 DlVXGMSONzCMb8rdt/gGG/8Hsu+UvJKStqtK4LVHTVujAWH/eZosIFoECwr+niUkuOv6cwKP8dm
 FPHH+uoI+cD8/ncgrYYD5uB+wPqSrQjza+Pjcz2tS7WK75e1uUYCp+0O3klxOSyCxbQwMBdWMxQ
 E/rQMyTICkRAD9YGio2urCxIMvShIMwLr2ZByBE/Ht3tP9VnSEBDVdpSGKIpT3mDsepviMxj
X-Proofpoint-GUID: m0fxlYfm7CL0NI9xDdaDY1W3ngZijTb6
X-Proofpoint-ORIG-GUID: m0fxlYfm7CL0NI9xDdaDY1W3ngZijTb6
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686d5f41 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=stCEmeMjHWlYZu10FZ0A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_111114_984841_C246213F 
X-CRM114-Status: GOOD (  21.13  )
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

Introduce ath12k_mem_profile_based_param structure to define
configuration parameters for both default and low-memory profiles.

Add support for enabling the low-memory profile in the follow-up
patch by making the following changes:
- Reduce sizes for transmit, receive, and monitor descriptor rings.
- Reduce transmit and receive descriptor count.
- Limit the maximum number of virtual devices (vdevs) to 9.
- Reduce the maximum number of client support per radio.

Centralize these parameters in the ath12k_mem_profile_based_param
structure to simplify switching between memory profiles.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 33 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/core.h | 17 +++++++++++++
 drivers/net/wireless/ath/ath12k/qmi.c  |  2 +-
 drivers/net/wireless/ath/ath12k/qmi.h  |  6 ++++-
 4 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index ffc19a6b9485..8b0c67735171 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -37,6 +37,36 @@ static struct list_head ath12k_hw_group_list = LIST_HEAD_INIT(ath12k_hw_group_li
 
 static DEFINE_MUTEX(ath12k_hw_group_mutex);
 
+static const struct
+ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
+[ATH12K_QMI_MEMORY_MODE_DEFAULT] = {
+		.num_vdevs = 17,
+		.max_client_single = 512,
+		.max_client_dbs = 128,
+		.max_client_dbs_sbs = 128,
+		.dp_params = {
+			.tx_comp_ring_size = 32768,
+			.rxdma_monitor_buf_ring_size = 4096,
+			.rxdma_monitor_dst_ring_size = 8092,
+			.num_pool_tx_desc = 32768,
+			.rx_desc_count = 12288,
+		},
+	},
+[ATH12K_QMI_MEMORY_MODE_LOW_512_M] = {
+		.num_vdevs = 9,
+		.max_client_single = 128,
+		.max_client_dbs = 64,
+		.max_client_dbs_sbs = 64,
+		.dp_params = {
+			.tx_comp_ring_size = 16384,
+			.rxdma_monitor_buf_ring_size = 256,
+			.rxdma_monitor_dst_ring_size = 512,
+			.num_pool_tx_desc = 16384,
+			.rx_desc_count = 6144,
+		},
+	},
+};
+
 static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 {
 	struct ath12k *ar;
@@ -1713,6 +1743,7 @@ static void ath12k_core_reset(struct work_struct *work)
 
 int ath12k_core_pre_init(struct ath12k_base *ab)
 {
+	const struct ath12k_mem_profile_based_param *param;
 	int ret;
 
 	ret = ath12k_hw_init(ab);
@@ -1721,6 +1752,8 @@ int ath12k_core_pre_init(struct ath12k_base *ab)
 		return ret;
 	}
 
+	param = &ath12k_mem_profile_based_param[ATH12K_QMI_MEMORY_MODE_DEFAULT];
+	ab->profile_param = param;
 	ath12k_fw_map(ab);
 
 	return 0;
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index afc8329980c8..b2dcb979dc75 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1010,6 +1010,22 @@ struct ath12k_wsi_info {
 	u32 hw_link_id_base;
 };
 
+struct ath12k_dp_profile_params {
+	u32 tx_comp_ring_size;
+	u32 rxdma_monitor_buf_ring_size;
+	u32 rxdma_monitor_dst_ring_size;
+	u32 num_pool_tx_desc;
+	u32 rx_desc_count;
+};
+
+struct ath12k_mem_profile_based_param {
+	u32 num_vdevs;
+	u32 max_client_single;
+	u32 max_client_dbs;
+	u32 max_client_dbs_sbs;
+	struct ath12k_dp_profile_params dp_params;
+};
+
 /* Master structure to hold the hw data which may be used in core module */
 struct ath12k_base {
 	enum ath12k_hw_rev hw_rev;
@@ -1213,6 +1229,7 @@ struct ath12k_base {
 	struct ath12k_reg_freq reg_freq_2ghz;
 	struct ath12k_reg_freq reg_freq_5ghz;
 	struct ath12k_reg_freq reg_freq_6ghz;
+	const struct ath12k_mem_profile_based_param *profile_param;
 
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 99e1fb2910d0..5e8943060443 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3856,7 +3856,7 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	memset(&ab->qmi.target_mem, 0, sizeof(struct target_mem_chunk));
 	ab->qmi.ab = ab;
 
-	ab->qmi.target_mem_mode = ATH12K_QMI_TARGET_MEM_MODE_DEFAULT;
+	ab->qmi.target_mem_mode = ATH12K_QMI_MEMORY_MODE_DEFAULT;
 	ret = qmi_handle_init(&ab->qmi.handle, ATH12K_QMI_RESP_LEN_MAX,
 			      &ath12k_qmi_ops, ath12k_qmi_msg_handlers);
 	if (ret < 0) {
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 96e6c3daecfe..abdaade3b542 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -37,7 +37,6 @@
 
 #define QMI_WLANFW_MAX_DATA_SIZE_V01		6144
 #define ATH12K_FIRMWARE_MODE_OFF		4
-#define ATH12K_QMI_TARGET_MEM_MODE_DEFAULT	0
 
 #define ATH12K_BOARD_ID_DEFAULT	0xFF
 
@@ -602,6 +601,11 @@ struct qmi_wlanfw_wlan_ini_resp_msg_v01 {
 	struct qmi_response_type_v01 resp;
 };
 
+enum ath12k_qmi_mem_mode {
+	ATH12K_QMI_MEMORY_MODE_DEFAULT = 0,
+	ATH12K_QMI_MEMORY_MODE_LOW_512_M,
+};
+
 static inline void ath12k_qmi_set_event_block(struct ath12k_qmi *qmi, bool block)
 {
 	lockdep_assert_held(&qmi->event_lock);
-- 
2.34.1


