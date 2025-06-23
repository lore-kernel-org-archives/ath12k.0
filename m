Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5306DC7EE32
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 19:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dY2iBeR61OBxUMOOm9i5pg5kmlYKjGntt7EejaG3mvw=; b=IuAFyJNUoTI0kpDMlneKfRjqPi
	QdbiHo/DX8RDKneCtcrWv+vwwY3yMObPyj8MERESa3R6w5SL82QSZcNAieJinw5s1MUaYqvcQYZJy
	XiiS/DKd1AG6cNCDkRznJ02j9I5qzB06wvx15WGmwxEUGKvsSjKuxnFwL4gJFMSOM9yTstu6Q7+LT
	7uEPq3nJiYejItoWpPX5ZBgc5r15KNrzPSywBc/7nZIvzKcLu+VNHmj3784q2IiPEPJd8ETiWWudz
	aoS02W3mUBjT+u/JjdAK/Vn8mkbrjScEWxCjBiR9NTYOt7B8Jevu7qJB1oa3Hq2bhAv8bj2ZdSAx2
	Lz1zgk6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTn3Y-00000003pQ6-2j6o;
	Mon, 23 Jun 2025 19:42:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjQJ-00000003J3I-0XHD
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 15:49:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N92fq2014950
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 15:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dY2iBeR61OBxUMOOm9i5pg5kmlYKjGntt7EejaG3mvw=; b=E1SShn2IzYWsr3wV
	I2/uQZfd4JaOMpZRH1KTMAB3y5iskEdSNIwX8+CPQHIJFCjfmUUlEb6mAfsH48tt
	oLNFfuRXcN++RmbEbjTN13gkgzul6vSbf5/U+jxzwgZtqlGhdZUjX1dm+Qkr4/Ue
	tJntu5cI6U6eVNI7rTzrCW9e6r7eCf6DEWgFdnpDc60b+Gci/Q9uYm9Lu6RJUtVc
	EUpqO61qf4ptCJiF5LerPJfUnm6CW0q4HNp6g599KTSrnFTMqYIfDAATwUDHaLEE
	FrUCZHqcTrlbnYTcX+TMNmnMs0ousvH/dBGGoAd2xqRdr0p6GuxNatYznBXR1ArY
	l7IZ6A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3xu16qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 15:49:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23507382e64so40283535ad.2
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 08:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750693769; x=1751298569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dY2iBeR61OBxUMOOm9i5pg5kmlYKjGntt7EejaG3mvw=;
        b=a061JJvMfQ8hFs3j1g3G6R9GvoriYRwjXq8FtfdRpBrs3dpIgWd9QUcEWrLHChRd2a
         MYXzJv/0rOANcTDWeuJ2X53H/naofv0l67RFqeM3DzrRChPPcW6ORc49xd2SZzL/1sqT
         kOzJS/xheuz91ePB+SCMfBeOFh3QqZoFDlpN4Aq343jlUzCtXKfZ+rtd5C3SiHKphZro
         Wg174HRj9jCXvuH2S1v+B4chyG0iAi0atGeHDvj6+TZhYoWJXHlGzOY1nLqcV6OKebv7
         gcD3eRSC9xUVamuCNu0FTVOKrPCI3FYsuGCu/4yDfMcGsC9wbD7yH/DFROX7fuSXvEOf
         ezcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRsA/35jsZnz26RtJRVDd1NNOtTM9b1QEvkGgnO3NahsAWy/hrCwHkSDNEXsyZTUQeaQIVnOw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXjCK/VHAnef0mx+f36FQzuL++ShwtExGi7hyoMUXhgdg8R2N0
	0JKlHlxeS63DMirsmV5+yKy70f1MLNaVjmmWowyayiFvetdHfqdBqg1eCPaTRtXd8XYT9B9En9D
	4m6M5bj2S6HSWWl3m0o0yw0F2wmCEsG3lMoJxziP9etAEny3SpjVmf+eAJkSZcJ2f
X-Gm-Gg: ASbGncuMGkJjbRWimbFgZDQdetDOyZSVdOJZI7uci4fYf2DtbphAWCD5XaCiwAgyjtL
	ym62b5JOpVG2C15MHQq8MUBJOPkHm8IZAuF/mlLyZtUDoJbRa6AeOazJb0sXLVf5uwVh4pKg4mP
	t2nsxLVne/OIqEDyBELDGq8klbqJrkPOTyUCEP+3o6M2lTamV3lyDF/BYX+iDkJ/k/WMHXkqUzF
	Mph/veFrrnN0tzG+LTPq/R8bR/7dBEQaUlupGoRqCEpkeZsfz/bdM10JDF7U0uJrAkkNGnTmCso
	KF/ClE4anzWm8s+fRp3XbEZqUTzTajM8gsoseld7L8nZl7D7AsyjKfxmoYxzL003TSWgg1+Ex6W
	THrl+zOaX5jg6wmWHKF0XGw0b27Le3mV1qqyCUBx/aGFZphI=
X-Received: by 2002:a17:902:d2c6:b0:234:bca7:2920 with SMTP id d9443c01a7336-237d9a45d5bmr252743795ad.24.1750693768468;
        Mon, 23 Jun 2025 08:49:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/oH12cwaPkvmfeFVFTf/XJtYH+EDgRCq+1+OrH0ZjlJZV8Q+lKJAVR/+kF/W3jSZjOfXfuQ==
X-Received: by 2002:a17:902:d2c6:b0:234:bca7:2920 with SMTP id d9443c01a7336-237d9a45d5bmr252743295ad.24.1750693767968;
        Mon, 23 Jun 2025 08:49:27 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83f14a2sm88447095ad.80.2025.06.23.08.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:49:27 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 21:19:09 +0530
Subject: [PATCH ath-next v2 1/2] wifi: ath12k: handle WMI event for real
 noise floor calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-support_real_noise_floor-v2-1-974bbafa317e@oss.qualcomm.com>
References: <20250623-support_real_noise_floor-v2-0-974bbafa317e@oss.qualcomm.com>
In-Reply-To: <20250623-support_real_noise_floor-v2-0-974bbafa317e@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA5NSBTYWx0ZWRfX2c5NEz3EwAGD
 HYZMDfJiPLR8pnOUx6jTSiIhNS9N27yElloVRQqkj+w9GfVoBuwXSh905Oe49UmgyR3m82lZ3gf
 g+U/tucEZll+nMmipXLpKVRvOyZGPsuNWlSDUVtHapPgrBNmQMuxkyvKHgIhzwCysE/lUXIOLJT
 I3DPOci/78w+5HrHPbYF1FwH4t3YYELyX3RLAXOza3dorbYYtZ2oQd6QOg5BDJ6ZxovHPrxTsI5
 DG4Jbc7wTLKhAqBxy0lwxSGXE9ynZ8kmfPHLlPHkewFoBHRmhyWI3MZO/Iv9u/NKWRWSuaxfh8c
 DJpHYEPIusq9xOorWeok6pD96curIjN3NbTiNQtND6RVGdVxwFgUHhok0Njdnrzx1Zm9wdMC+Mg
 p91BMsbcfSfOAQXoxi6ii2vW4zF7HkS3ypd+mu708ZOTQZydzJscIXmswJnL9BmPQbED2i6R
X-Authority-Analysis: v=2.4 cv=SvuQ6OO0 c=1 sm=1 tr=0 ts=6859778a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Ep9LWTjdhutGVinXlyQA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HYHPSrdXN3Iis0PaL67y3uvFx6ndOfQ9
X-Proofpoint-GUID: HYHPSrdXN3Iis0PaL67y3uvFx6ndOfQ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_084931_306972_D89FFD01 
X-CRM114-Status: GOOD (  27.58  )
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

From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

At present, the ATH12K_DEFAULT_NOISE_FLOOR (-95) is used to calculate RSSI
value, providing an estimated noise floor value. Consequently, the RSSI
value is also approximate. This works but however, using actual noise floor
value will enable the reporting of the true RSSI value.

The firmware possesses the necessary data to determine the actual noise
floor. This data is provided to the host via the WMI event
WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID, which includes the
runtime parameters needed for calculating the real noise floor in dBm. This
event is triggered by the firmware during channel changes, temperature
offset adjustments, and hardware chainmask modifications. The individual
TLVs may not always be present in each event. For instance, temperature
information might only appear if there is a change in offset due to
temperature variation.

Add support to handle and parse this WMI event. Use the received values to
calculate and store the noise floor value.

A subsequent change will use this noise floor value in the actual RSSI
calculation.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Co-developed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  17 +++
 drivers/net/wireless/ath/ath12k/mac.c  |   4 +
 drivers/net/wireless/ath/ath12k/wmi.c  | 226 +++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h  |  42 ++++++
 4 files changed, 289 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 0c1a6df7a02e7d269e47dc214099f274ff0761a5..3c10d7eb9669da603c2c4a42fd39bfc508515641 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -674,6 +674,15 @@ struct ath12k_per_peer_tx_stats {
 	bool is_ampdu;
 };
 
+struct ath12k_pdev_rssi_offsets {
+	s32 temp_offset;
+	s8 min_nf_dbm;
+	/* Cache the sum here to avoid calculating it every time in hot path
+	 * noise_floor = min_nf_dbm + temp_offset
+	 */
+	s32 noise_floor;
+};
+
 #define ATH12K_FLUSH_TIMEOUT (5 * HZ)
 #define ATH12K_VDEV_DELETE_TIMEOUT_HZ (5 * HZ)
 
@@ -827,6 +836,7 @@ struct ath12k {
 	unsigned long last_tx_power_update;
 
 	s8 max_allowed_tx_power;
+	struct ath12k_pdev_rssi_offsets rssi_info;
 };
 
 struct ath12k_hw {
@@ -1467,4 +1477,11 @@ static inline struct ath12k_base *ath12k_ag_to_ab(struct ath12k_hw_group *ag,
 	return ag->ab[device_id];
 }
 
+static inline s32 ath12k_pdev_get_noise_floor(struct ath12k *ar)
+{
+	lockdep_assert_held(&ar->data_lock);
+
+	return ar->rssi_info.noise_floor;
+}
+
 #endif /* _CORE_H_ */
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8a1b0c5599783808fed2f962bcdf3e6e9c5a258e..6ee1113aafcfc0873b8e6997951c8f53f9ccbbd9 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12525,6 +12525,10 @@ static int ath12k_mac_setup_register(struct ath12k *ar,
 	ar->max_num_stations = ath12k_core_get_max_station_per_radio(ar->ab);
 	ar->max_num_peers = ath12k_core_get_max_peers_per_radio(ar->ab);
 
+	ar->rssi_info.min_nf_dbm = ATH12K_DEFAULT_NOISE_FLOOR;
+	ar->rssi_info.temp_offset = 0;
+	ar->rssi_info.noise_floor = ar->rssi_info.min_nf_dbm + ar->rssi_info.temp_offset;
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index b38f22118d732aa182f9fd6dda376b0d41de65e2..3ec58feab7559e3fcd1cb9891a8ebc0084264334 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -9319,6 +9319,229 @@ static void ath12k_wmi_process_tpc_stats(struct ath12k_base *ab,
 }
 #endif
 
+static int
+ath12k_wmi_rssi_dbm_conv_info_evt_subtlv_parser(struct ath12k_base *ab,
+						u16 tag, u16 len,
+						const void *ptr, void *data)
+{
+	const struct ath12k_wmi_rssi_dbm_conv_temp_info_params *temp_info;
+	const struct ath12k_wmi_rssi_dbm_conv_info_params *param_info;
+	struct ath12k_wmi_rssi_dbm_conv_info_arg *rssi_info = data;
+	struct ath12k_wmi_rssi_dbm_conv_param_arg param_arg;
+	s32 nf_hw_dbm[ATH12K_MAX_NUM_NF_HW_DBM];
+	u8 num_20mhz_segments;
+	s8 min_nf, *nf_ptr;
+	int i, j;
+
+	switch (tag) {
+	case WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO:
+		if (len < sizeof(*param_info)) {
+			ath12k_warn(ab,
+				    "RSSI dbm conv subtlv 0x%x invalid len %d rcvd",
+				    tag, len);
+			return -EINVAL;
+		}
+
+		param_info = ptr;
+
+		param_arg.curr_bw = le32_to_cpu(param_info->curr_bw);
+		param_arg.curr_rx_chainmask = le32_to_cpu(param_info->curr_rx_chainmask);
+
+		/* The received array is actually a 2D byte-array for per chain,
+		 * per 20MHz subband. Convert to 2D byte-array
+		 */
+		nf_ptr = &param_arg.nf_hw_dbm[0][0];
+
+		for (i = 0; i < ATH12K_MAX_NUM_NF_HW_DBM; i++) {
+			nf_hw_dbm[i] = a_sle32_to_cpu(param_info->nf_hw_dbm[i]);
+
+			for (j = 0; j < 4; j++) {
+				*nf_ptr = (nf_hw_dbm[i] >> (j * 8)) & 0xFF;
+				nf_ptr++;
+			}
+		}
+
+		switch (param_arg.curr_bw) {
+		case WMI_CHAN_WIDTH_20:
+			num_20mhz_segments = 1;
+			break;
+		case WMI_CHAN_WIDTH_40:
+			num_20mhz_segments = 2;
+			break;
+		case WMI_CHAN_WIDTH_80:
+			num_20mhz_segments = 4;
+			break;
+		case WMI_CHAN_WIDTH_160:
+			num_20mhz_segments = 8;
+			break;
+		case WMI_CHAN_WIDTH_320:
+			num_20mhz_segments = 16;
+			break;
+		default:
+			ath12k_warn(ab, "Invalid current bandwidth %d in RSSI dbm event",
+				    param_arg.curr_bw);
+			/* In error case, still consider the primary 20 MHz segment since
+			 * that would be much better than instead of dropping the whole
+			 * event
+			 */
+			num_20mhz_segments = 1;
+		}
+
+		min_nf = ATH12K_DEFAULT_NOISE_FLOOR;
+
+		for (i = 0; i < ATH12K_MAX_NUM_ANTENNA; i++) {
+			if (!(param_arg.curr_rx_chainmask & BIT(i)))
+				continue;
+
+			for (j = 0; j < num_20mhz_segments; j++) {
+				if (param_arg.nf_hw_dbm[i][j] < min_nf)
+					min_nf = param_arg.nf_hw_dbm[i][j];
+			}
+		}
+
+		rssi_info->min_nf_dbm = min_nf;
+		rssi_info->nf_dbm_present = true;
+		break;
+	case WMI_TAG_RSSI_DBM_CONVERSION_TEMP_OFFSET_INFO:
+		if (len < sizeof(*temp_info)) {
+			ath12k_warn(ab,
+				    "RSSI dbm conv subtlv 0x%x invalid len %d rcvd",
+				    tag, len);
+			return -EINVAL;
+		}
+
+		temp_info = ptr;
+		rssi_info->temp_offset = a_sle32_to_cpu(temp_info->offset);
+		rssi_info->temp_offset_present = true;
+		break;
+	default:
+		ath12k_dbg(ab, ATH12K_DBG_WMI,
+			   "Unknown subtlv 0x%x in RSSI dbm conversion event\n", tag);
+	}
+
+	return 0;
+}
+
+static int
+ath12k_wmi_rssi_dbm_conv_info_event_parser(struct ath12k_base *ab,
+					   u16 tag, u16 len,
+					   const void *ptr, void *data)
+{
+	int ret = 0;
+
+	switch (tag) {
+	case WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO_FIXED_PARAM:
+		/* Fixed param is already processed*/
+		break;
+	case WMI_TAG_ARRAY_STRUCT:
+		/* len 0 is expected for array of struct when there
+		 * is no content of that type inside that tlv
+		 */
+		if (len == 0)
+			return 0;
+
+		ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+					  ath12k_wmi_rssi_dbm_conv_info_evt_subtlv_parser,
+					  data);
+		break;
+	default:
+		ath12k_dbg(ab, ATH12K_DBG_WMI,
+			   "Received invalid tag 0x%x for RSSI dbm conv info event\n",
+			   tag);
+		break;
+	}
+
+	return ret;
+}
+
+static int
+ath12k_wmi_rssi_dbm_conv_info_process_fixed_param(struct ath12k_base *ab, u8 *ptr,
+						  size_t len, int *pdev_id)
+{
+	struct ath12k_wmi_rssi_dbm_conv_info_fixed_params *fixed_param;
+	const struct wmi_tlv *tlv;
+	u16 tlv_tag;
+
+	if (len < (sizeof(*fixed_param) + TLV_HDR_SIZE)) {
+		ath12k_warn(ab, "invalid RSSI dbm conv event size %zu\n", len);
+		return -EINVAL;
+	}
+
+	tlv = (struct wmi_tlv *)ptr;
+	tlv_tag = le32_get_bits(tlv->header, WMI_TLV_TAG);
+	ptr += sizeof(*tlv);
+
+	if (tlv_tag != WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO_FIXED_PARAM) {
+		ath12k_warn(ab, "RSSI dbm conv event received without fixed param tlv\n");
+		return -EINVAL;
+	}
+
+	fixed_param = (struct ath12k_wmi_rssi_dbm_conv_info_fixed_params *)ptr;
+	*pdev_id = le32_to_cpu(fixed_param->pdev_id);
+
+	return 0;
+}
+
+static void
+ath12k_wmi_update_rssi_offsets(struct ath12k *ar,
+			       struct ath12k_wmi_rssi_dbm_conv_info_arg *rssi_info)
+{
+	struct ath12k_pdev_rssi_offsets *info = &ar->rssi_info;
+
+	lockdep_assert_held(&ar->data_lock);
+
+	if (rssi_info->temp_offset_present)
+		info->temp_offset = rssi_info->temp_offset;
+
+	if (rssi_info->nf_dbm_present)
+		info->min_nf_dbm = rssi_info->min_nf_dbm;
+
+	info->noise_floor = info->min_nf_dbm + info->temp_offset;
+}
+
+static void
+ath12k_wmi_rssi_dbm_conversion_params_info_event(struct ath12k_base *ab,
+						 struct sk_buff *skb)
+{
+	struct ath12k_wmi_rssi_dbm_conv_info_arg rssi_info;
+	struct ath12k *ar;
+	s32 noise_floor;
+	u32 pdev_id;
+	int ret;
+
+	ret = ath12k_wmi_rssi_dbm_conv_info_process_fixed_param(ab, skb->data, skb->len,
+								&pdev_id);
+	if (ret) {
+		ath12k_warn(ab, "failed to parse fixed param in RSSI dbm conv event: %d\n",
+			    ret);
+		return;
+	}
+
+	rcu_read_lock();
+	ar = ath12k_mac_get_ar_by_pdev_id(ab, pdev_id);
+	/* If pdev is not active, ignore the event */
+	if (!ar)
+		goto out_unlock;
+
+	ret = ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
+				  ath12k_wmi_rssi_dbm_conv_info_event_parser,
+				  &rssi_info);
+	if (ret) {
+		ath12k_warn(ab, "unable to parse RSSI dbm conversion event\n");
+		goto out_unlock;
+	}
+
+	spin_lock_bh(&ar->data_lock);
+	ath12k_wmi_update_rssi_offsets(ar, &rssi_info);
+	noise_floor = ath12k_pdev_get_noise_floor(ar);
+	spin_unlock_bh(&ar->data_lock);
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI,
+		   "RSSI noise floor updated, new value is %d dbm\n", noise_floor);
+out_unlock:
+	rcu_read_unlock();
+}
+
 static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_cmd_hdr *cmd_hdr;
@@ -9450,6 +9673,9 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 	case WMI_11D_NEW_COUNTRY_EVENTID:
 		ath12k_reg_11d_new_cc_event(ab, skb);
 		break;
+	case WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID:
+		ath12k_wmi_rssi_dbm_conversion_params_info_event(ab, skb);
+		break;
 	/* add Unsupported events (rare) here */
 	case WMI_TBTTOFFSET_EXT_UPDATE_EVENTID:
 	case WMI_PEER_OPER_MODE_CHANGE_EVENTID:
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 8627154f1680fabb75d646e27a353a0b45733f08..ccf43016471752812830b02039404df6f981acd7 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -734,6 +734,8 @@ enum wmi_tlv_event_id {
 	WMI_SERVICE_READY_EXT2_EVENTID,
 	WMI_PDEV_GET_HALPHY_CAL_STATUS_EVENTID =
 					WMI_SERVICE_READY_EXT2_EVENTID + 4,
+	WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID =
+				WMI_PDEV_GET_HALPHY_CAL_STATUS_EVENTID + 5,
 	WMI_VDEV_START_RESP_EVENTID = WMI_TLV_CMD(WMI_GRP_VDEV),
 	WMI_VDEV_STOPPED_EVENTID,
 	WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID,
@@ -1992,6 +1994,9 @@ enum wmi_tlv_tag {
 	WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD = 0x3D8,
 	WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD = 0x3D9,
 	WMI_TAG_PDEV_SET_BIOS_INTERFACE_CMD = 0x3FB,
+	WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO_FIXED_PARAM = 0x427,
+	WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO,
+	WMI_TAG_RSSI_DBM_CONVERSION_TEMP_OFFSET_INFO,
 	WMI_TAG_HALPHY_CTRL_PATH_CMD_FIXED_PARAM = 0x442,
 	WMI_TAG_HALPHY_CTRL_PATH_EVENT_FIXED_PARAM,
 	WMI_TAG_MAX
@@ -6176,6 +6181,43 @@ struct wmi_mlo_link_set_active_arg {
 	struct wmi_ml_disallow_mode_bmap_arg disallow_bmap[WMI_ML_MAX_DISALLOW_BMAP_COMB];
 };
 
+#define ATH12K_MAX_20MHZ_SEGMENTS	16
+#define ATH12K_MAX_NUM_ANTENNA		8
+#define ATH12K_MAX_NUM_NF_HW_DBM	32
+
+struct ath12k_wmi_rssi_dbm_conv_info_fixed_params {
+	__le32 pdev_id;
+} __packed;
+
+struct ath12k_wmi_rssi_dbm_conv_info_params {
+	__le32 curr_bw;
+	__le32 curr_rx_chainmask;
+	__le32 xbar_config;
+	a_sle32 xlna_bypass_offset;
+	a_sle32 xlna_bypass_threshold;
+	a_sle32 nf_hw_dbm[ATH12K_MAX_NUM_NF_HW_DBM];
+} __packed;
+
+struct ath12k_wmi_rssi_dbm_conv_temp_info_params {
+	a_sle32 offset;
+} __packed;
+
+struct ath12k_wmi_rssi_dbm_conv_param_arg {
+	u32 curr_bw;
+	u32 curr_rx_chainmask;
+	u32 xbar_config;
+	s32 xlna_bypass_offset;
+	s32 xlna_bypass_threshold;
+	s8 nf_hw_dbm[ATH12K_MAX_NUM_ANTENNA][ATH12K_MAX_20MHZ_SEGMENTS];
+};
+
+struct ath12k_wmi_rssi_dbm_conv_info_arg {
+	bool temp_offset_present;
+	s32 temp_offset;
+	bool nf_dbm_present;
+	s8 min_nf_dbm;
+};
+
 void ath12k_wmi_init_qcn9274(struct ath12k_base *ab,
 			     struct ath12k_wmi_resource_config_arg *config);
 void ath12k_wmi_init_wcn7850(struct ath12k_base *ab,

-- 
2.34.1


