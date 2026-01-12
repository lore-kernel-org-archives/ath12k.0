Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338F0D25032
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NE7S8gBTNQKTG3tmqbJFI7qx+haDyEtPwTPhOF443DQ=; b=gbnMvfMDXy6PFdECgGPSLk5DKy
	nokbwF+eUtRemMswXuV0/lAl31py8u8OEjWbC5xfRrYqkc9IHjXc+9LMqpa4k1L5n4sgdDoolgeSG
	e1kwuedOGoeSoucXysfWkRM9kGPiGIs8Zh4NFNzxSzzamjI1KiEGfeeDVdBhomh0dO23s0YG2i/Qm
	Ys7G5B3yfhx14WaHNTgXbQHCFHpUyje+srWjHX9wevJ1a8RB2oEsC9SDuK+T2m6pYATP9dZWKZtLc
	aoE93MFf3zmel7VNcJdqFT4pH8tZRGy+nmti5XKwd2kam1soJ/mhVG6UkMlP9DFWzXaQPEfKSG9JN
	Z6FoSREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUH-00000004tZ7-3Ixv;
	Mon, 12 Jan 2026 07:37:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUD-00000004tTm-3Dx6
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:37:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMNegb3997386
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NE7S8gBTNQKTG3tmqbJFI7qx+haDyEtPwTPhOF443DQ=; b=E55Eo0I3uU8/098v
	Aq2adUoG9Yw3eHuSYgRzsWGq8lk/eVgMpB7GlMuOJERtv7EdE7EUlviksjNcnlJE
	C1A1k9rG25Vc28Mi97IzK24KGVwP6nqGjKi3oieYjqYXcPMzcT/pgutX5PszvOMk
	ODcRUokXf+331LMcrNULCG5JnmJwev56wZ9PBBEsMorUWimsNg1agPEY7kmbh+MQ
	IlP8UH8vffcondF7VSoTY4THM06w8ggtTtg3+mFSbuu3L2Rd9xqZxPJcv7fIEb3u
	rizRf/tAiHHPPo5IIv7Bzl85hJbo4v55ay22uv6G4NdTC4Ml9Ec4yD1hKwK/pRNn
	hfHH5w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhakxcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34aa1d06456so7635960a91.0
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203432; x=1768808232; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NE7S8gBTNQKTG3tmqbJFI7qx+haDyEtPwTPhOF443DQ=;
        b=iSPsyf4lVzH1QlaxelmX+E90q2Xz08RnN/eX9KpxDo2EGEdgv8R3s4Zq0E5LIWyI5/
         GdMH52T/oCpR1zCDFvg6Ur3vyB3+FEFvuAh1qG7Mm6agraZZrmvWTRFzz5UnxMAkIGNj
         5SNRX/6+IpKHMMOecByleok9e3cAfxMyFWFNAC8cZxQYSGgza4khv99XRQ8tanifySCM
         Umfu9GiCMXei0R91/um70eEfhw838jDQ59CEJ5MbkVD/0pK/Qdn9YUUO/AL0eHj1HhDL
         k30tZt/PToEam1iFwmXMaEL7lZvOHJAYJDfktxFPY6RynmJ9XovvoAP8QMjU7k9X/FqQ
         Bs6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203432; x=1768808232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NE7S8gBTNQKTG3tmqbJFI7qx+haDyEtPwTPhOF443DQ=;
        b=OY2h+WDOodwYwWD720yE/y7V0bn47SId+AcTv+341CGzh5bfYBbhlzXNLxbWHmj/ei
         IUeW64zWWu7f9kEgn5F5ci5NxjrDnsD80Qm9Ky4ZUmq5i542eJ9REUnhEUgcoS3jQ+Rl
         FiADiTyyzXRouGoDF7EIQGG+83f2HfaO49lolwqBAa/lDwAF2zufOFfbJWXhPLnJZNRU
         wUH/4e6HccD1/Yi4KnK9Unpw6zAmRkxtEX+HvGZcF6JsK8De6EOSGihGUQrarvAIUgdG
         tsLSkhbeyXHeyXeS5eRZJwknnSxo+RzyFuymRnjc0bndbfPes3Mj+LS//xWyaQFhhaGZ
         jt0A==
X-Forwarded-Encrypted: i=1; AJvYcCXtRVt+op3c7VPwMsAid+Aj4vqlC2dkbvoXtBKr6JTqEAvkA2fyWqhy/BgUoWymfDl3bHhTDlg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj1jMG648o5CGaI+CLzuBHVg2Gsq0A6dfl56U6suujbM8M9qw6
	IxzFhztaTB8pUmVEXSXWPi2JgTZGgfugCNLxe8k2LDOdO7S/Tu9ml3bMFCB4CrfIcLgKM18UdEr
	8dgEcoXdGccxDPk+QpecX0JavNvG4lsTrKM5nmXEmRp5b/cmjH5wyDvh+59UzezlK2oY2iRSV+d
	o=
X-Gm-Gg: AY/fxX6BkKMRlGfHcaC8NUECyv0ZG5JxYEgOAyAtg+vwxmwRi+WrETr1fIUU7941NrY
	nuoOfljXBNCBAp1Eeov7lM7VGPUm5YrOL2HLwhhhNPMyqW7LJSavszU4pohMHWDBTzv6lHdwfsa
	ol4L9H4cw6fNRk8DI9N2+GVQKjXx1qOOUmq2Kx/5kgfSGe7evQX9LrVR569RBTFVD1SE2P/HmGX
	NqqwjmH373M8nT0D7ULXYj9yBDfZQm1rbUiU7KDGAgKtnwwEb2Nqt2Q9bMyOfRUbHMgn3DnZ9U6
	34rj6T9FVBdMyDPke+vqNHQlAIKTmF+IW7Bkh+3T1Z+upamaly/R8DXddLP8jb6d6IcpvxZMQWO
	Zbo6VlBM80EDsa6KEG9+q4lrlwGBqeV8V818JjxdSCm8pm4V3k43neMdHpcSADXI=
X-Received: by 2002:a05:6a20:e212:b0:34a:f63:59dd with SMTP id adf61e73a8af0-3898f9ba712mr16218144637.51.1768203432035;
        Sun, 11 Jan 2026 23:37:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsb9S52hPVJ5K/uAzdEyTnpgJTw6JTQ7/Q4JNdQh4BuJioN6plEDP+I1V6h7C82yC9ErCU/w==
X-Received: by 2002:a05:6a20:e212:b0:34a:f63:59dd with SMTP id adf61e73a8af0-3898f9ba712mr16218130637.51.1768203431468;
        Sun, 11 Jan 2026 23:37:11 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:37:11 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:30 +0800
Subject: [PATCH ath-next v2 10/18] wifi: ath12k: support downloading
 auxiliary ucode image for QCC2072
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-10-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: GOZ_b-SxXFkPaILhEDyK0rqDLDQyc9n8
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=6964a4a9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ejwxJ43VBFfvAu_YmawA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: GOZ_b-SxXFkPaILhEDyK0rqDLDQyc9n8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX4Pxx0G8GlrYt
 90/9LvWjPJgcJyJntiwvCfy1tjHAY0OUZqXo1R450uLEXfjbxKJylXZvBfDDtWUDbJF1NVhNryn
 adu8wXGL5D/o/xtwyQbbDgTh+qqpfVUrfJyRpuztwa/fItBQrWsDh/mgqiteerV68PlN5rZuH1r
 HwRCg2W4gMq8jg+sUQSVqy4OpSH2A73Hh0q00syYwcrvpEaAOl7JaFGs4AeeYwx3QKrMhXfGakw
 IevMfa1RYRxAjZoy4+L35YbkHd4YXOc0wvL2Y+bJmnc9SFAabZ/2MyK87y8WvcRKFLd/1IqYb1h
 l1cv66zhmmentBPi9P9HHQFyff/5ESzb6ggt4MFkpFB3ub/cQutpRPQiBsn1lm6nyVIZU9mPD64
 Kt+SVYT3w0C9gCudF6cyGOI09kNIQFbf/FYi1cTxNuVf21j+Gtil5XSi8FrmSwcIFe/qRo5zfr2
 BXs53bn4I1B55A4HpTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_233713_867379_83ADAF5A 
X-CRM114-Status: GOOD (  25.27  )
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
index 655753d0413a..a9888e0521a1 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -78,6 +78,7 @@
 #define ATH12K_DEFAULT_CAL_FILE		"caldata.bin"
 #define ATH12K_AMSS_FILE		"amss.bin"
 #define ATH12K_M3_FILE			"m3.bin"
+#define ATH12K_AUX_UC_FILE		"aux_ucode.bin"
 #define ATH12K_REGDB_FILE_NAME		"regdb.bin"
 
 #define ATH12K_PCIE_MAX_PAYLOAD_SIZE	128
@@ -142,6 +143,7 @@ struct ath12k_hw_params {
 		size_t board_size;
 		size_t cal_offset;
 		enum ath12k_m3_fw_loaders m3_loader;
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
index ef0a59f6339c..38c388319e00 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -339,6 +339,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.board_size = 256 * 1024,
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
+			.download_aux_ucode = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -421,6 +422,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.board_size = 256 * 1024,
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
+			.download_aux_ucode = false,
 		},
 
 		.max_radios = 1,
@@ -505,6 +507,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.board_size = 256 * 1024,
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
+			.download_aux_ucode = false,
 		},
 		.max_radios = 2,
 		.single_pdev_only = false,
@@ -586,6 +589,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.board_size = 256 * 1024,
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
+			.download_aux_ucode = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -661,6 +665,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.board_size = 256 * 1024,
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
+			.download_aux_ucode = true,
 		},
 
 		.max_radios = 1,
@@ -707,7 +712,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.wmi_init = ath12k_wifi7_wmi_init_wcn7850,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01) |
-					   BIT(CNSS_PCIE_PERST_NO_PULL_V01),
+					   BIT(CNSS_PCIE_PERST_NO_PULL_V01) |
+					   BIT(CNSS_AUX_UC_SUPPORT_V01),
 
 		.rfkill_pin = 0,
 		.rfkill_cfg = 0,

-- 
2.25.1


