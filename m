Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A9BD68BC9
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 01:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8x6g3YZB2wpQhVgsdcIzUOEQrCimMN5/9XF8wWkrMc=; b=MBgHh0qhQ6KxEWUu37sAaXbyzd
	v9KjEWrtWks9wPfiD3VZVW4+7ufQwBH6nAoeWk+TINB28onCkbShcKHsHoUBALoDDQBrwMQyWm5Uv
	vp8wqJkSQ+qZ9cCmEXYuHQoaH3p8k1mqUvu6I0RAiYGcFhKB9rKHRSH2EM5vjJcs3l8Vl9SRJU/DH
	pIBY7eK7AFDI8+VVc1SVokaKi5OvX2dtMb5lBczeoLur1q2wSxz/TcZPIs7UexEF5VRdgTxnrt810
	EXHjxAna3ZDHk0vLchHVglhbQPFy2eMIAJASPGGH7eGn3DFOi6x5Ys2uTb6CCVIxxKlhv7gSYywH0
	uNfoVGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Eu-00000007g6k-0QsO;
	Thu, 18 Dec 2025 01:55:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Em-00000007fzh-13Gn
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:55:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1ZJk53718119
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X8x6g3YZB2wpQhVgsdcIzUOEQrCimMN5/9XF8wWkrMc=; b=HkiSgOXHo0ChYvGs
	J2BsJyYYqjQ8r25Le2QcSjfG4iuCTX1LM7SeI1iZMfT7pBkXmjij3PzGZwDO+Uv7
	m4f1IjUj4BNIHGtTzrfplEpkBTks5PIlNypKmceO9HJXvs8OFhJBdAOjpeD0/uRR
	Y4m+7zpvgXWqLo0lPyJqk2Npw22qrFAkj7KqjMs0FWWtPjv9Xy2wDLO1urk7dJEK
	QSdzUSN2hgA4m6EeIUUWJRvBFKGHibYiWzhQqezI/6sm/BRDxCoHfDkrKpjWVRkc
	n2ixfZovN8azJkTHMCT8dZm+MpW1P6jRAR7plIYrBRIKjAUlV7UDWAn3CjfXYJKZ
	+bbd0w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40n79atp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29da1ea0b97so3314035ad.3
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022927; x=1766627727; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8x6g3YZB2wpQhVgsdcIzUOEQrCimMN5/9XF8wWkrMc=;
        b=EsEb25QPeAmsiVGU/XAgvSCNtHvoq8QXwkq+iquVeLwx9IgFAXiSzlTYzsW3sITJ81
         MTJ7G9ojBiLZ38LxK4Kiqr+gkC+UzgWgt9St5pZ01N6ZXrbV3DQa4+5dLTR5NdLhziWT
         lYgrUZEG1fa/fL5mlMxkwOqckDMYXOwhUBx+uuetmAa96V9wKUJ/yRKrnxFp1nVENJRn
         EtB4LOucNAFmGIbFWv8X8/GBGSiN0mxMplSs8jIJdwAXLiemgqQXy/iSHYtvRqjWiJ8t
         uHhtXGjrASAPWDg7VWtDR6jo+O5tVGcwPUdCkj4oq1g6MN1HE1iPc6KVwqeCwMGbOM0I
         hTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022927; x=1766627727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X8x6g3YZB2wpQhVgsdcIzUOEQrCimMN5/9XF8wWkrMc=;
        b=wGp/VsHZ8N+snIvc1qjr7LL4iSQOKGnLI9ZaDGqITiTmpdRXXps/1VqFaipgjn3DJN
         hpCW5MCX45cxvrJyucweUaYDfI6cHVFwp+UlCzU1v1D3GXEPLlXuRBUPJE97NG8qzK/d
         YvVGWezxwyh2RBLvLRdGOi8d0aiK5h6vps1WY7p4JuPXbtyC+36EEpRNvii9oFzYvc+J
         /RjMyaB6zRo8lMObxGUIzuMc1k31K1o+LMao6T3Q6Cc7637McnCBdhIwn1Bn3HNM/38w
         85q+jTIdo3jxCQ8JViJOcKfDk1MQVhuP5qo9HTCUHjQ6XaRQS35IEWPzWK2AlZzeYvwO
         mGlw==
X-Forwarded-Encrypted: i=1; AJvYcCXqJm0HksmaP2DWwZ/4BorOjCM6K4YtKVL5lJ+lzpq4vbFz8W8jOdrEexjqrTqsaFlSRjXjG/g=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVM6djJZgzJy5oB1ftggn+fBj56oHC4QW5KDba6iSYQSK9NVvr
	ZMRU2A4zM7YyZoiR4gYGPmurGW8EP0454n66zPCuQE88kakKwBFaPgx0lUx9b7EJKwMda3u6vB7
	vgJ0qvOYT2/7JeKTuYRansFRWKqyv3wLHfGT9iNRFZWO+54gyO4da0lgYv3b3pIhk7SEUJVG5IO
	A=
X-Gm-Gg: AY/fxX6pX/SpkKa8jhDjsHebc3O5sx7WCp56lscpq4+wzRDdDNJ9ei9V5ho17cwsKf+
	JsHrd6dapx7VJhqeX0EkArcLywrHQstviX2OEM4P9lBGGK6FPcFtm9XhFls/8vxlSZD0GWljnc0
	nUDF9GNaXVD+rtILrNz0OHPOd7JNdLydBPwHL/Sz+M7etFJUHjUhDVqitmNn4HeTl/zRbImKZVW
	gK0MbJYeomRUWFW2FkMPdSKbJyZMbNA+3Y15VysXRsyYfmBoBFjif5xusf0Q6SXZj+iqYS+0skW
	ke9msifnck2QxMHF2ZdfQWmNi7EMJbWr0kDkvKUJkAwM4qOizjZRA2tU83WxsZ+mS4TzTizOr4u
	qh/A6yy2bfja+T0rIRASZVWlSBWTS0ioQhWwWHrKcKHNT9/dPigaSkkkJzMWPJh0=
X-Received: by 2002:a17:903:2f48:b0:258:f033:3ff9 with SMTP id d9443c01a7336-29f2436e48fmr209138875ad.48.1766022926563;
        Wed, 17 Dec 2025 17:55:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdny4hssq0COgccFXnFu/2aNeGS1VVg0No119OMqt9HxSHD+Q0oAALdZbuOSFFeiHq7Dp7kg==
X-Received: by 2002:a17:903:2f48:b0:258:f033:3ff9 with SMTP id d9443c01a7336-29f2436e48fmr209138645ad.48.1766022926023;
        Wed, 17 Dec 2025 17:55:26 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:25 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:25 +0800
Subject: [PATCH ath-next 11/19] wifi: ath12k: support downloading auxiliary
 ucode image for QCC2072
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-11-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: jlUGvR1bq31hhtwiDO2gGTclnufN99hj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfXwK5kSytTW/1F
 Hv/sj7JCppnJv/iuHfIF4ix6LRvwc7D0bmhgOp4s/rD49oqMNAiAluaxzMFkzsKR8U8U/V7KcVX
 C7E7Yg8EwyOXmD2rywwYwL+7yOVmMwgyre+xsFcUvZzAXTX7ig9FSJ9l1TrXrZFHTxX9audF8gh
 qgugeMPPtRPL2WsAA5oBQuPwWKZk6eL+Pgq+L0h1LRiKERp/7rm/v7wUw+XbJVKinBYwWjqPr+T
 XHSER+SzCHIh28kOOtc1Yl1kJkyHZ8Xw6hD1Grp5gRgJjBqPwHYuiP4ixoQukM9fCFX3xpRh+eA
 kb+MseEtyauRA0UA3FjMmm6erMu7FUVu5BkgiUPb7Ye32w3xMk5TuLvsautSx+I+KrJz5Xu/HNJ
 4tCQt9bEOFcFgJYOdgxspfesDlwwFg==
X-Authority-Analysis: v=2.4 cv=TZebdBQh c=1 sm=1 tr=0 ts=69435f0f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ejwxJ43VBFfvAu_YmawA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: jlUGvR1bq31hhtwiDO2gGTclnufN99hj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_175528_360164_B5289D8F 
X-CRM114-Status: GOOD (  24.78  )
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

QCC2072 requires another firmware image named aux_ucode.bin, add support
to download it.

Add a new hardware parameter download_aux_ucode to make sure other chips
are not affected.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0-01560-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h     |   2 +
 drivers/net/wireless/ath/ath12k/fw.c       |  10 +-
 drivers/net/wireless/ath/ath12k/fw.h       |   3 +-
 drivers/net/wireless/ath/ath12k/hw.h       |   2 +
 drivers/net/wireless/ath/ath12k/qmi.c      | 179 ++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/qmi.h      |  15 +++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |   8 +-
 7 files changed, 215 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 667cf5993cf1..990934ec92fc 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1082,6 +1082,8 @@ struct ath12k_base {
 		size_t amss_dualmac_len;
 		const u8 *m3_data;
 		size_t m3_len;
+		const u8 *aux_uc_data;
+		size_t aux_uc_len;
 
 		DECLARE_BITMAP(fw_features, ATH12K_FW_FEATURE_COUNT);
 		bool fw_features_valid;
diff --git a/drivers/net/wireless/ath/ath12k/fw.c b/drivers/net/wireless/ath/ath12k/fw.c
index 5ac497f80cad..22074653cbb8 100644
--- a/drivers/net/wireless/ath/ath12k/fw.c
+++ b/drivers/net/wireless/ath/ath12k/fw.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
- * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "core.h"
@@ -121,6 +121,14 @@ static int ath12k_fw_request_firmware_api_n(struct ath12k_base *ab,
 			ab->fw.m3_data = data;
 			ab->fw.m3_len = ie_len;
 			break;
+		case ATH12K_FW_IE_AUX_UC_IMAGE:
+			ath12k_dbg(ab, ATH12K_DBG_BOOT,
+				   "found aux_uc image ie (%zd B)\n",
+				   ie_len);
+
+			ab->fw.aux_uc_data = data;
+			ab->fw.aux_uc_len = ie_len;
+			break;
 		case ATH12K_FW_IE_AMSS_DUALMAC_IMAGE:
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
 				   "found dualmac fw image ie (%zd B)\n",
diff --git a/drivers/net/wireless/ath/ath12k/fw.h b/drivers/net/wireless/ath/ath12k/fw.h
index 7afaefed5086..e146d24dfea4 100644
--- a/drivers/net/wireless/ath/ath12k/fw.h
+++ b/drivers/net/wireless/ath/ath12k/fw.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
- * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_FW_H
@@ -15,6 +15,7 @@ enum ath12k_fw_ie_type {
 	ATH12K_FW_IE_AMSS_IMAGE = 2,
 	ATH12K_FW_IE_M3_IMAGE = 3,
 	ATH12K_FW_IE_AMSS_DUALMAC_IMAGE = 4,
+	ATH12K_FW_IE_AUX_UC_IMAGE = 5,
 };
 
 enum ath12k_fw_features {
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 85da4e43cf61..d1234a65ac76 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -78,6 +78,7 @@
 #define ATH12K_DEFAULT_CAL_FILE		"caldata.bin"
 #define ATH12K_AMSS_FILE		"amss.bin"
 #define ATH12K_M3_FILE			"m3.bin"
+#define ATH12K_AUX_UC_FILE		"aux_ucode.bin"
 #define ATH12K_REGDB_FILE_NAME		"regdb.bin"
 
 #define ATH12K_PCIE_MAX_PAYLOAD_SIZE	128
@@ -143,6 +144,7 @@ struct ath12k_hw_params {
 		size_t cal_offset;
 		enum ath12k_m3_fw_loaders m3_loader;
 		bool std_elf_img:1;
+		bool download_aux_ucode:1;
 	} fw;
 
 	u8 max_radios;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 4966697f4e62..cfde4147c8fc 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -1623,6 +1623,47 @@ static const struct qmi_elem_info qmi_wlanfw_m3_info_resp_msg_v01_ei[] = {
 	},
 };
 
+static const struct qmi_elem_info qmi_wlanfw_aux_uc_info_req_msg_v01_ei[] = {
+	{
+		.data_type      = QMI_UNSIGNED_8_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u64),
+		.array_type     = NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct qmi_wlanfw_aux_uc_info_req_msg_v01, addr),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u32),
+		.array_type     = NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct qmi_wlanfw_aux_uc_info_req_msg_v01, size),
+	},
+	{
+		.data_type      = QMI_EOTI,
+		.array_type     = NO_ARRAY,
+		.tlv_type       = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+static const struct qmi_elem_info qmi_wlanfw_aux_uc_info_resp_msg_v01_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof(struct qmi_response_type_v01),
+		.array_type     = NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct qmi_wlanfw_aux_uc_info_resp_msg_v01, resp),
+		.ei_array       = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type      = QMI_EOTI,
+		.array_type     = NO_ARRAY,
+		.tlv_type       = QMI_COMMON_TLV_TYPE,
+	},
+};
+
 static const struct qmi_elem_info qmi_wlanfw_ce_tgt_pipe_cfg_s_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
@@ -3237,6 +3278,131 @@ int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 	return ret;
 }
 
+static void ath12k_qmi_aux_uc_free(struct ath12k_base *ab)
+{
+	struct m3_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
+
+	if (!aux_uc_mem->vaddr)
+		return;
+
+	dma_free_coherent(ab->dev, aux_uc_mem->total_size,
+			  aux_uc_mem->vaddr, aux_uc_mem->paddr);
+	aux_uc_mem->vaddr = NULL;
+	aux_uc_mem->total_size = 0;
+	aux_uc_mem->size = 0;
+}
+
+static int ath12k_qmi_aux_uc_load(struct ath12k_base *ab)
+{
+	struct m3_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
+	const struct firmware *fw = NULL;
+	const void *aux_uc_data;
+	char path[100];
+	size_t aux_uc_len;
+	int ret;
+
+	if (ab->fw.aux_uc_data && ab->fw.aux_uc_len > 0) {
+		/* firmware-N.bin had a aux_uc firmware file so use that */
+		aux_uc_data = ab->fw.aux_uc_data;
+		aux_uc_len = ab->fw.aux_uc_len;
+	} else {
+		/*
+		 * No aux_uc file in firmware-N.bin so try to request old
+		 * separate aux_ucode.bin.
+		 */
+		fw = ath12k_core_firmware_request(ab, ATH12K_AUX_UC_FILE);
+		if (IS_ERR(fw)) {
+			ret = PTR_ERR(fw);
+			ath12k_core_create_firmware_path(ab, ATH12K_AUX_UC_FILE,
+							 path, sizeof(path));
+			ath12k_err(ab, "failed to load %s: %d\n", path, ret);
+			return ret;
+		}
+
+		aux_uc_data = fw->data;
+		aux_uc_len = fw->size;
+	}
+
+	/* In recovery/resume cases, AUX_UC buffer is not freed, try to reuse that */
+	if (aux_uc_mem->vaddr) {
+		if (aux_uc_mem->total_size >= aux_uc_len)
+			goto copy;
+
+		/* Old buffer is too small, free and reallocate */
+		ath12k_qmi_aux_uc_free(ab);
+	}
+
+	aux_uc_mem->vaddr = dma_alloc_coherent(ab->dev, aux_uc_len,
+					       &aux_uc_mem->paddr, GFP_KERNEL);
+	if (!aux_uc_mem->vaddr) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	 aux_uc_mem->total_size = aux_uc_len;
+
+copy:
+	memcpy(aux_uc_mem->vaddr, aux_uc_data, aux_uc_len);
+	aux_uc_mem->size = aux_uc_len;
+
+	ret = 0;
+
+out:
+	release_firmware(fw);
+
+	return ret;
+}
+
+static noinline_for_stack
+int ath12k_qmi_wlanfw_aux_uc_info_send(struct ath12k_base *ab)
+{
+	struct m3_mem_region *aux_uc_mem = &ab->qmi.aux_uc_mem;
+	struct qmi_wlanfw_aux_uc_info_req_msg_v01 req = {};
+	struct qmi_wlanfw_aux_uc_info_resp_msg_v01 resp = {};
+	struct qmi_txn txn;
+	int ret = 0;
+
+	ret = ath12k_qmi_aux_uc_load(ab);
+	if (ret) {
+		ath12k_err(ab, "failed to load aux_uc firmware: %d", ret);
+		return ret;
+	}
+
+	req.addr = aux_uc_mem->paddr;
+	req.size = aux_uc_mem->size;
+
+	ret = qmi_txn_init(&ab->qmi.handle, &txn,
+			   qmi_wlanfw_aux_uc_info_resp_msg_v01_ei, &resp);
+	if (ret < 0)
+		goto out;
+
+	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
+			       QMI_WLANFW_AUX_UC_INFO_REQ_V01,
+			       QMI_WLANFW_AUX_UC_INFO_REQ_MSG_V01_MAX_MSG_LEN,
+			       qmi_wlanfw_aux_uc_info_req_msg_v01_ei, &req);
+	if (ret < 0) {
+		qmi_txn_cancel(&txn);
+		ath12k_warn(ab, "qmi failed to send AUX_UC information request, err = %d\n",
+			    ret);
+		goto out;
+	}
+
+	ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH12K_QMI_WLANFW_TIMEOUT_MS));
+	if (ret < 0) {
+		ath12k_warn(ab, "qmi failed AUX_UC information request %d\n", ret);
+		goto out;
+	}
+
+	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
+		ath12k_warn(ab, "qmi AUX_UC info request failed, result: %d, err: %d\n",
+			    resp.resp.result, resp.resp.error);
+		ret = -EINVAL;
+		goto out;
+	}
+out:
+	return ret;
+}
+
 static int ath12k_qmi_wlanfw_mode_send(struct ath12k_base *ab,
 				       u32 mode)
 {
@@ -3601,6 +3767,7 @@ static noinline_for_stack
 int ath12k_qmi_event_load_bdf(struct ath12k_qmi *qmi)
 {
 	struct ath12k_base *ab = qmi->ab;
+	const struct ath12k_hw_params *hw_params = ab->hw_params;
 	int ret;
 
 	ret = ath12k_qmi_request_target_cap(ab);
@@ -3621,7 +3788,7 @@ int ath12k_qmi_event_load_bdf(struct ath12k_qmi *qmi)
 		return ret;
 	}
 
-	if (ab->hw_params->download_calib) {
+	if (hw_params->download_calib) {
 		ret = ath12k_qmi_load_bdf_qmi(ab, ATH12K_QMI_BDF_TYPE_CALIBRATION);
 		if (ret < 0)
 			ath12k_warn(ab, "qmi failed to load calibrated data :%d\n", ret);
@@ -3633,6 +3800,14 @@ int ath12k_qmi_event_load_bdf(struct ath12k_qmi *qmi)
 		return ret;
 	}
 
+	if (hw_params->fw.download_aux_ucode) {
+		ret = ath12k_qmi_wlanfw_aux_uc_info_send(ab);
+		if (ret < 0) {
+			ath12k_warn(ab, "qmi failed to send aux_uc info req: %d\n", ret);
+			return ret;
+		}
+	}
+
 	return ret;
 }
 
@@ -3906,6 +4081,7 @@ void ath12k_qmi_deinit_service(struct ath12k_base *ab)
 	qmi_handle_release(&ab->qmi.handle);
 	cancel_work_sync(&ab->qmi.event_work);
 	destroy_workqueue(ab->qmi.event_wq);
+	ath12k_qmi_aux_uc_free(ab);
 	ath12k_qmi_m3_free(ab);
 	ath12k_qmi_free_target_mem_chunk(ab);
 	ab->qmi.ab = NULL;
@@ -3914,5 +4090,6 @@ void ath12k_qmi_deinit_service(struct ath12k_base *ab)
 void ath12k_qmi_free_resource(struct ath12k_base *ab)
 {
 	ath12k_qmi_free_target_mem_chunk(ab);
+	ath12k_qmi_aux_uc_free(ab);
 	ath12k_qmi_m3_free(ab);
 }
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 050dcaca1cb7..b5a4a01391cb 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -154,6 +154,7 @@ struct ath12k_qmi {
 	u8 num_radios;
 	struct target_info target;
 	struct m3_mem_region m3_mem;
+	struct m3_mem_region aux_uc_mem;
 	unsigned int service_ins_id;
 	struct dev_mem_info dev_mem[ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01];
 };
@@ -203,6 +204,7 @@ enum ath12k_qmi_cnss_feature {
 	CNSS_FEATURE_MIN_ENUM_VAL_V01 = INT_MIN,
 	CNSS_QDSS_CFG_MISS_V01 = 3,
 	CNSS_PCIE_PERST_NO_PULL_V01 = 4,
+	CNSS_AUX_UC_SUPPORT_V01 = 6,
 	CNSS_MAX_FEATURE_V01 = 64,
 	CNSS_FEATURE_MAX_ENUM_VAL_V01 = INT_MAX,
 };
@@ -541,6 +543,19 @@ struct qmi_wlanfw_m3_info_resp_msg_v01 {
 	struct qmi_response_type_v01 resp;
 };
 
+#define QMI_WLANFW_AUX_UC_INFO_REQ_MSG_V01_MAX_MSG_LEN	18
+#define QMI_WLANFW_AUX_UC_INFO_RESP_MSG_V01_MAX_MSG_LEN	7
+#define QMI_WLANFW_AUX_UC_INFO_REQ_V01	0x005A
+
+struct qmi_wlanfw_aux_uc_info_req_msg_v01 {
+	u64 addr;
+	u32 size;
+};
+
+struct qmi_wlanfw_aux_uc_info_resp_msg_v01 {
+	struct qmi_response_type_v01 resp;
+};
+
 #define QMI_WLANFW_WLAN_MODE_REQ_MSG_V01_MAX_LEN	11
 #define QMI_WLANFW_WLAN_MODE_RESP_MSG_V01_MAX_LEN	7
 #define QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN		803
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index bfa111968676..03732370b58e 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -340,6 +340,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.std_elf_img = false,
+			.download_aux_ucode = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -423,6 +424,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.std_elf_img = false,
+			.download_aux_ucode = false,
 		},
 
 		.max_radios = 1,
@@ -508,6 +510,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.std_elf_img = false,
+			.download_aux_ucode = false,
 		},
 		.max_radios = 2,
 		.single_pdev_only = false,
@@ -590,6 +593,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.std_elf_img = false,
+			.download_aux_ucode = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -666,6 +670,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.std_elf_img = true,
+			.download_aux_ucode = true,
 		},
 
 		.max_radios = 1,
@@ -712,7 +717,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.wmi_init = ath12k_wifi7_wmi_init_wcn7850,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01) |
-					   BIT(CNSS_PCIE_PERST_NO_PULL_V01),
+					   BIT(CNSS_PCIE_PERST_NO_PULL_V01) |
+					   BIT(CNSS_AUX_UC_SUPPORT_V01),
 
 		.rfkill_pin = 0,
 		.rfkill_cfg = 0,

-- 
2.25.1


