Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AB0C531D0
	for <ath12k@archiver.kernel.org>; Sat, 25 Jul 2026 18:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVw21EajYFGo2Uy1Ircyl9njPPqRM/2Kk9IHbzFuUK0=; b=UbWNWZJ/LHGkPGeqULEUUoGVb6
	IHv8j5Cpy6zE8F8pgDO2WI0f6voWd05GWRZNTrWhOxZ88TbEOpxovzXvozBtwzt+LsqDwPsIBhaVw
	sm94O3IUTriCCo2IhzlrvUr5NX4cnF/Z/vlo9iPEMR4NNUTMICoXbHlLxrkFY1ZLPEsnoRtPK/Fni
	6VsoF4ge/4339qZt8AZWQjiDkYqlGDRh3mlwcoaajb+N2/SRVdH8CiRXrYrPMSZngRB5d4h2xnZSe
	BoXBttuNs6oyeIr5IHfEnN5GtTHi/jQzw8hnKougJFF59/CIcLabbX73Hmp02R9v5Zmv6kHnUKtir
	aznSVr/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wngqn-00000000dOk-41zS;
	Sat, 25 Jul 2026 18:11:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wngql-00000000dNi-2KwL
	for ath12k@lists.infradead.org;
	Sat, 25 Jul 2026 18:11:52 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66PGvXkK3604148
	for <ath12k@lists.infradead.org>; Sat, 25 Jul 2026 18:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVw21EajYFGo2Uy1Ircyl9njPPqRM/2Kk9IHbzFuUK0=; b=ENQGeFAL2011Iyxw
	8Yejbsl9MRkeWW9zytVLZxxJazFmMedhWs17CQ0tV2XSzYWdfe/XZ9rzNM5uzWRf
	BfnJ3UVj2Rekdmsrk2E50XBLkL+ZeXSmjJCtcRtXsyPXX2s32b0OXgkOXoM0DkkD
	drohvWSRuR/LooQfkoj7UqMJBFPiKihTsHo9NMmiKX3FqIMnXx3gDVrV+2lIwGNC
	LtBdKP4HGVBgXvlIWGh6idZUZ5YRLY+bXD29f+EQo/99pDWUIr7/oOBAQwFqM59H
	O0hNH/I7/h3Tgdg8218Rr43BRYhJqtCKSvHOv+SlZ4B0MDO/6wl5cMhCz9nlPG7C
	7VH6jg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjufspjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 25 Jul 2026 18:11:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so1489769a91.0
        for <ath12k@lists.infradead.org>; Sat, 25 Jul 2026 11:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785003110; x=1785607910; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVw21EajYFGo2Uy1Ircyl9njPPqRM/2Kk9IHbzFuUK0=;
        b=Rq/2yO2otO8OqnpotyIQligbZn4WxrfLF/MM6Yydsu2z6KpRd6slCWLysG4So9JyP2
         XuG+8T3WsiHpS3+oW6vy8wC8O/row+A6nmC0xWsmzs6DfnlSJccpu2FqrJFrIQWpddvq
         qGadZwRMfe6rJbaBs9vMkdyg5ZbTuVdeZVlqRpdcZfbJBdrsrMREBIYsxr+O4aVym0Ap
         Y3xS+q34xfLhJEhLzYtDhADDg8AxSZ0pheH96A5cCzCNMjH+kIPV7MOlmTMK51kc2U20
         oXGBEJl/PYJZCHTR52bIXp8el8CeyWHLmPd0TQ5V1UCk0hdLO8CeujvGS2RXZvkvMhpj
         Tu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785003110; x=1785607910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVw21EajYFGo2Uy1Ircyl9njPPqRM/2Kk9IHbzFuUK0=;
        b=o9aXhgf/cbjfOA3JCzBjKReAKK8VZbWA9RwDyKJE6vavAP2Hv4i8VkaIAI6VRerDWN
         A/bLhKL2w9IxKkmSD5xf9Z+WsYwA52cK6zm7pX4SkQuuXvAMV6EvjpZa3PCakGKABMlk
         phD3KkMjVxAkkfDqH9FKIkyUfbMLyx4iAWBE8dFPlv9w9lcHOKrucs+ye7jrsO64pBsE
         b3uZ74sUT0t7KG1QX7flPxlj9wqmAhcC6D4i4iggRiFePs2p58ASHQqHaVcOW7aE/El5
         gsie2T8L1k5flKDDm+DlnzjHRfj3laMcuddyGinjn/e4fitpf3JOw4raJBwYXGq+q1OZ
         Oyqg==
X-Forwarded-Encrypted: i=1; AHgh+RohXvf1XV9KVadw9NnsU0BS5lf7C7GQlcOsi/BJ4TnAWeYGSeaqKtO97HbM/jAZHr3UJZcHpqs=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy8PRnkWwSRcnvA5BhVVuy6/JbTRgp2oWj3mFiFYamt8hGA+2J
	7YMdaBmT+N8MWMebF7B1wI8f5x+7BqSLxr7jdi4y8YhR7rxcqL8vFX1zZyjmGWVD550kcvTaSi4
	eectYtedxiYgAowkYHI2EYVyvwpOXL27vSoVswsovmNLo76MtVqu04D/W1LkLNTQa
X-Gm-Gg: AR+sD12R5khkrw0RUqvkoRbY29pCa/lgwwu5GtXOyOhhbiX2Pbi6klbo7i1S3ncdbbr
	iJ7a44ATIKmStPJWRW469Lzcmdu6N2tEV3gCoV8z6AeHWjk/Bc6tovK9u3CIqu2lOZQUgN9Yx6r
	Namkl/XAuwltWPDuDxi9ol0AMgbaHN7T/X/ub/F/KNNeKIhy3T/vTfLbMhnnUYsBxfxb9vi0M5s
	xPZaum6YL/ZT1v5U2pAFtGx0OF1d4w7xsMR+ToNmYtEv5q4R+IEDAuMGq3DzrRF11WAS/8z/5Wt
	Gl2Sn7dWPWypKj3NuaH3vgxCowEMHba8IW8Vf1mbdcLHtN2/FqcGgVMy28lZLAtqyF+PqYrfqA2
	WSd1cBFMxna72/DhaatVMy6pvN2gRP4jjPkWFp0oJmcB8QqiAzJMrtlY=
X-Received: by 2002:a17:90b:5347:b0:387:e0db:bc34 with SMTP id 98e67ed59e1d1-38f298b386cmr2763305a91.42.1785003110201;
        Sat, 25 Jul 2026 11:11:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5347:b0:387:e0db:bc34 with SMTP id 98e67ed59e1d1-38f298b386cmr2763285a91.42.1785003109777;
        Sat, 25 Jul 2026 11:11:49 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm64692635c88.2.2026.07.25.11.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 11:11:49 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Sat, 25 Jul 2026 11:11:45 -0700
Subject: [PATCH ath-next 1/2] wifi: ath12k: move firmware_mode enum to
 qmi.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-consolidate-firmware_mode-v1-1-aedff0ce0ba5@oss.qualcomm.com>
References: <20260725-consolidate-firmware_mode-v1-0-aedff0ce0ba5@oss.qualcomm.com>
In-Reply-To: <20260725-consolidate-firmware_mode-v1-0-aedff0ce0ba5@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 33vNg4oMF_YZrRC-QXBtYDTxvKFrAP0s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDE3MyBTYWx0ZWRfX0Q/Em7zaVjBN
 3L7FBRTKz5j5ZiIeOkPXmJsxFSJU8RlrZEAie/cobw4fHBhgepfNrBpN9yMZzEiGOgFDHJijHf3
 dv24/hgZs7gm2C5JPDMVp1K0kEea+hs=
X-Proofpoint-GUID: 33vNg4oMF_YZrRC-QXBtYDTxvKFrAP0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDE3MyBTYWx0ZWRfXz4nRJ/MZc8gT
 o+AWJKk99G4We+hO5MZp9joYMYfAEYod8iPlP81J4KKyVX8KTTVpJHRvwwgeWE1SA0excMDG+C5
 xG6QE/+HrJpcEvNyW9oICRBNwdUj3c4E/PbkIL5KjYGMg96ENlOiWrnPD1F1QA6XD9jTHBlcmSX
 2jJKwWciJ0Z7t1pFGUQBN08hHDuBgBJLZRHh0Ssk3viw2fX+W/LF7/LlP8X4sikEj2EBYZxGHNY
 MhkiBXxv4Q2rcSKNuvvQt3rvWFihc16UY+eRX2DSFmLb+yEihZY02Ll34pvxzceMIISad8Z5epD
 q2/lY5i9Yj+VXv6tnnpXYLcSzkCyBfn4vX6ZpjVGNQW9B7GU/xd6zQ6njM8nUHchBkPsld6xkXd
 CXVX3oJRX/lORMGJD8ztnYPfwJpeEAwC0kl5aD91Hs+wg147ovP5PXIgBvp7uHti3jp5rMiBSXf
 hqijES9zMyebkbqWY3w==
X-Authority-Analysis: v=2.4 cv=F5ZnsKhN c=1 sm=1 tr=0 ts=6a64fc67 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7UZE0HBkOswYJVh0bkIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607250173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_111151_605288_670C38B6 
X-CRM114-Status: GOOD (  16.52  )
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

The enum ath12k_firmware_mode defines values that are part of the QMI
ABI, so it belongs in qmi.h rather than core.h. Consolidate it there
along with ATH12K_FIRMWARE_MODE_OFF, which is currently a bare macro.
Rename the enum to ath12k_qmi_firmware_mode to align with the naming
convention of the other enums in qmi.h, and place it with the other
ath12k_qmi_* enums.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  3 ++-
 drivers/net/wireless/ath/ath12k/core.h | 10 +---------
 drivers/net/wireless/ath/ath12k/pci.c  |  1 +
 drivers/net/wireless/ath/ath12k/qmi.c  |  4 ++--
 drivers/net/wireless/ath/ath12k/qmi.h  | 14 ++++++++++++--
 5 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index a9112760185f..a052a77828f3 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -23,6 +23,7 @@
 #include "wow.h"
 #include "dp_cmn.h"
 #include "peer.h"
+#include "qmi.h"
 
 unsigned int ath12k_debug_mask;
 module_param_named(debug_mask, ath12k_debug_mask, uint, 0644);
@@ -1188,7 +1189,7 @@ static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
 }
 
 static int ath12k_core_start_firmware(struct ath12k_base *ab,
-				      enum ath12k_firmware_mode mode)
+				      enum ath12k_qmi_firmware_mode mode)
 {
 	int ret;
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index f9fb1399e0b6..a43959ebf46f 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -160,14 +160,6 @@ enum ath12k_hw_rev {
 	ATH12K_HW_IPQ5424_HW10,
 };
 
-enum ath12k_firmware_mode {
-	/* the default mode, standard 802.11 functionality */
-	ATH12K_FIRMWARE_MODE_NORMAL,
-
-	/* factory tests etc */
-	ATH12K_FIRMWARE_MODE_FTM,
-};
-
 #define ATH12K_IRQ_NUM_MAX 57
 #define ATH12K_EXT_IRQ_NUM_MAX	16
 #define ATH12K_MAX_TCL_RING_NUM	3
@@ -1143,7 +1135,7 @@ struct ath12k_base {
 
 	struct ath12k_hw_group *ag;
 	struct ath12k_wsi_info wsi_info;
-	enum ath12k_firmware_mode fw_mode;
+	enum ath12k_qmi_firmware_mode fw_mode;
 	struct ath12k_ftm_event_obj ftm_event_obj;
 	bool hw_group_ref;
 
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index ad74140e0fa5..907d29b1020c 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -17,6 +17,7 @@
 #include "mhi.h"
 #include "debug.h"
 #include "hal.h"
+#include "qmi.h"
 
 #define ATH12K_PCI_BAR_NUM		0
 #define ATH12K_PCI_DMA_MASK		36
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index bb61c78e5c29..c466c3ae793a 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3431,7 +3431,7 @@ int ath12k_qmi_wlanfw_aux_uc_info_send(struct ath12k_base *ab)
 }
 
 static int ath12k_qmi_wlanfw_mode_send(struct ath12k_base *ab,
-				       u32 mode)
+				       enum ath12k_qmi_firmware_mode mode)
 {
 	struct qmi_wlanfw_wlan_mode_req_msg_v01 req = {};
 	struct qmi_wlanfw_wlan_mode_resp_msg_v01 resp = {};
@@ -3631,7 +3631,7 @@ void ath12k_qmi_firmware_stop(struct ath12k_base *ab)
 }
 
 int ath12k_qmi_firmware_start(struct ath12k_base *ab,
-			      u32 mode)
+			      enum ath12k_qmi_firmware_mode mode)
 {
 	int ret;
 
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index cbe5be30053a..27b69847a15e 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -32,7 +32,6 @@
 #define QMI_WLFW_FW_READY_IND_V01		0x0038
 
 #define QMI_WLANFW_MAX_DATA_SIZE_V01		6144
-#define ATH12K_FIRMWARE_MODE_OFF		4
 
 #define ATH12K_BOARD_ID_DEFAULT	0xFF
 
@@ -602,6 +601,17 @@ enum ath12k_qmi_mem_mode {
 	ATH12K_QMI_MEMORY_MODE_LOW_512_M,
 };
 
+enum ath12k_qmi_firmware_mode {
+	/* the default mode, standard 802.11 functionality */
+	ATH12K_FIRMWARE_MODE_NORMAL,
+
+	/* factory tests etc */
+	ATH12K_FIRMWARE_MODE_FTM,
+
+	/* firmware offline */
+	ATH12K_FIRMWARE_MODE_OFF = 4,
+};
+
 static inline void ath12k_qmi_set_event_block(struct ath12k_qmi *qmi, bool block)
 {
 	lockdep_assert_held(&qmi->event_lock);
@@ -617,7 +627,7 @@ static inline bool ath12k_qmi_get_event_block(struct ath12k_qmi *qmi)
 }
 
 int ath12k_qmi_firmware_start(struct ath12k_base *ab,
-			      u32 mode);
+			      enum ath12k_qmi_firmware_mode mode);
 void ath12k_qmi_firmware_stop(struct ath12k_base *ab);
 void ath12k_qmi_deinit_service(struct ath12k_base *ab);
 int ath12k_qmi_init_service(struct ath12k_base *ab);

-- 
2.43.0


