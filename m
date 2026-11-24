Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DC5606A31E
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 17:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zl/P6Zbm;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mNsXZNol;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvTRTmX8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=zl/P6ZbmjNdsr+
	2RFwWEqMG2hLv7Kj7HCxF56TnXiJCXkvXsQQAdEjWlo1tBNfTddcCsOMwJHEOr+RdoxQvdtyBIG5p
	hlKMwWGyMIeG7eELtyRKokR6yhWuoU8X0ncE2OxJTx0E3OiUz8mEa8rJk9waJScd107DKiEhLc0fG
	Gt2hLmox4W8emI8xBIY1ac6MzEJjfbGDi/KMxk3EBIRV2K5F9YBg5vTd3krLxiHNJap4JNM+HGiTi
	q5HKvHTf5wE8uL/geGl2vP29hekVWYG7ctJOloTX5O8NtN6GZe0mzfFTRTzndEDBbPznR03cIMJR1
	Nwx8w4ollgSDLsM5W0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVucv-00000007QA5-0zHB;
	Tue, 24 Nov 2026 17:48:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVucs-00000007Q9R-3LRF
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 17:48:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLKcI3267099
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=mNsXZNol8vfyPhsw
	zeG5WqVZWU8/sAWBWY1u8YuTVKLvRYKLbjpx39IdL9MS47/6189Zrzql4j03lnXh
	a9skXeD9KxOwpG7w+91RJ++4l2PcjKX5W+1bFacaR0qZDY0kxz9mvvUyzFuKq4xl
	fcI+vO6Ds9H4QU9JaxdQeVT7PvjjPQuFIn5i7e2xDYMEKUOWGpcqR9Agn+/JXDNc
	yZxTe88XEg/42K9aeb+OHvypqYaHcb7kiPGVykzdmsTPz6VNWkLl7AOrKi2MfQmn
	scmT4O6y+tVSZfFMUJVWYmjCBhzzWnDcZeGCjADJR7oR4/gHmjNWBLyXn4T4469I
	6Kd5qg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7s7sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so5867857eec.1
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 08:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538673; x=1796143473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=fvTRTmX8KqWHl3dpFU+x1HegQqqnlm1qGVgcmJzSlyXTLTwnqE6hK31YvGyn93ok95
         6swrtn7F3rxvsWVVudyo8oiPw06/mc5oyTMpyAhdbGdEG5+csbWe71SRSuhEa8uRcW8N
         5ndJ7YHEEbFgjKTOHk8NtBgJsdIEEDWidH0ELXwsbUHTAeonSi9ayPR82obTwKWkfH9a
         8ezcwx4wk93WlmQl1c6Y/uHvwxDH/weaE8ZyhOf69mQo4Fsy1I/+AJPSqPU8INTgnM2a
         F8ezqeH7gUP/9G759JIomddo1sAHTLv6yNdvOUli8IHmyLiqHTD6J50jaiirrOlIrws/
         lvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538673; x=1796143473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=lpvSG98D5aSPDEbfhdqAtWVCel+/+N+CrR994bhokQ7M7UXKvsA3+0LlCJmoxZialO
         UKjvOubWXg2FSgMq0bNdchC0fNFdfd8h5jKtWRv3ggtaasUi5u8y44UXtMLHacBSyGoP
         Z8rQ0n4Q8gOiy1Wz3yORPsEN3f42B//jdzFyZKKuQGKbbAvBOwfc0BOe/gvcF5++0UHo
         QcCGYTz2T0c/SA7/zeoua8RqCxk4zkpnbn3MZOPup2h9mi4PEig+mwrazcX50Jc/Ql+Z
         XBF+lOaqEdPFvPIlcowXKWsEQMDLjjs5bxMzy+mn5NT+pSDIY5oUVVvlOqyEQL3M1uqy
         qqvg==
X-Forwarded-Encrypted: i=1; AL+hErGiyE938GtW78/LuM6FRutugHWZlkPKkYRdDWWJ2dfvatboyYLVDmIhe27zCtjfUngFYIS17aM=@lists.infradead.org
X-Gm-Message-State: APuU4Z/iG3dzTLEvYeKvn5w+HcXz8WUvu3XfiGQDxaXCu/1X475XkBNj
	Xg8i6tEg8s8fWl6zThwY0D5DuPU45aVDUi0dFff6YER/DDfiNI9YH+f6cj/aqROC9OW+YuX+pLp
	IfGnA26XZPPKqon4jPLbjL3Tf2HmkOEWaOaDzR/NHAOOO/BimFMeoq232kSK1MxHs
X-Gm-Gg: AZFdTZc2vgiujzv+0gQdVdp2NoKR3xAhifo0bQDNk/nbEGC5kbrE91AHGNVOd1BHINN
	dDvZXQNoSMJg11uaPk/G/XfGH8ugS8Fov0NSVuD89lL3CKh6EyZhOWoxAIWYZHDS5Yx9kWmCpBS
	chd73HLutzW3RQxprnrDRVPNZBymblJpMfGmdKei3QhkFcKLNuR0VUmcXtzfZACb+MDAiB7QwB4
	SPxgGQ5bpDofRxNFIDfp9Elo/CfUh+7N9ZisTSvWMEuYeCB/Tv2b8dee2SHjDrqhezis6fjAs6O
	zy0Oco9pnyBm8eOyDLuRPntYK/93d1JE9FQUl0+G3oD28A7siY+ThZXSz4QpwADGz1KCTTLpYZm
	7MBWLPx/RmKhZHlmSPWN+9CPK66LonIb7lltHCKzjw0m6fY8TAfpTsJ2A0sfv/GMNV2FgFhrW1d
	+lN2OCDoelp7Mzly1i+z91PqAcekoRTstzgECL2ScU2GhgZTxEtrmt7Uj4GLHbiV9T2QsFPF92/
	IE=
X-Received: by 2002:a05:693c:69d4:b0:386:5adb:ac25 with SMTP id 5a478bee46e88-3865adbb1d2mr12013371eec.22.1795538673042;
        Tue, 24 Nov 2026 08:44:33 -0800 (PST)
X-Received: by 2002:a05:693c:69d4:b0:386:5adb:ac25 with SMTP id 5a478bee46e88-3865adbb1d2mr12013337eec.22.1795538672382;
        Tue, 24 Nov 2026 08:44:32 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:32 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:37 +0530
Subject: [PATCH ath-next v4 11/14] wifi: ath12k: add Wi-Fi 8 WMI init for
 QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-11-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX2GCftUbgJyC1
 rsVVMPy3Z1X2ktz5I2e+64aJxmz6spjrr9e3rabiBfOu2Jn5aLGJvcAlgNFvOtJqjRGLG3l6rS/
 /rKWFGuCfXGD85DyOt8FvzFDH1DuQzw=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05bef2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Fa-mINMYIZ2DnWK0-L0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX3ROjprHh3vW9
 ZL5ttzbEl35uW5LWoUyJ5Q9VRPLsLxPcqkRz9AP1ixxAtrKjYFze5sLZVZEcLkFiInqmOqC7UXP
 rcP1Z8pECqlbK+pRA38wLV9gpDz8P4Ca55bYhghPLw3OXItLfkAj7+ix/nZHD1PWlrpffPaGwAm
 c7dhQCP+cDZJpbKKIjK0+2BD4QGaUhS8qCkNDwMFwlYqZG40tTqzEhR8iFEpdQVAJGhcj1fnTUo
 ve7m/Mfx+aynwY5Xexr9G7MZ73Kkz7A63H6Q7HOURKgBi97toccn/PDAPuaI2RLRQKKzFaKZYnX
 hH/Sq8RKM/oRUSAczYYfu1oWdjUQCV+XeUZqFj3ScIcdAqqL4n/WvY29QIczK9I9TnEXnVPuDNZ
 fdVzMMym19y0XOjgHM/A51fRPUGF1cMyxUL30LP928GLK0Ga7qeSKwKPT9W6S11yBa0oF/od1vU
 m5lvQmIHhlJw0JjsK6g==
X-Proofpoint-ORIG-GUID: sx22R_Sb1LhLHoVrNteXU9rLqmCP3yDL
X-Proofpoint-GUID: sx22R_Sb1LhLHoVrNteXU9rLqmCP3yDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_094818_958514_C85116D0 
X-CRM114-Status: GOOD (  19.13  )
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

Implement the WMI resource configuration for QCN9575.

Add ath12k_wifi8_wmi_init_qcn9575() in wifi8/wmi.c to populate the WMI
resource configuration struct used during firmware initialization, setting
vdev and peer counts, RF TX/RX chain masks, scan and power-save limits, EMA
and TWT parameters, and peer metadata version. Set the QCN9575 hw params
wmi_init pointer to ath12k_wifi8_wmi_init_qcn9575 and build wifi8/wmi.c
from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h           |  2 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/wmi.c    | 57 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/wmi.h    | 13 ++++++
 5 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 96776c6e2050..b8045b33ca0d 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -77,6 +77,8 @@
 #define TARGET_DMA_BURST_SIZE		1
 #define TARGET_RX_BATCHMODE		1
 #define TARGET_EMA_MAX_PROFILE_PERIOD	8
+/* host supports peer map v3 and unmap v2 */
+#define TARGET_PEER_MAP_UNMAP_VERSION	0x32
 
 #define ATH12K_HW_DEFAULT_QUEUE		0
 #define ATH12K_HW_MAX_QUEUES		4
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 3717b00741fd..989e640c7b41 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -6,4 +6,5 @@ ath12k_wifi8-y += ce.o \
 		  hal_qcn9575.o \
 		  hw.o \
 		  mhi.o \
-		  pci.o
+		  pci.o \
+		  wmi.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index fa64b865b931..74873fc5f3f3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -16,6 +16,7 @@
 #include "hal.h"
 #include "hw.h"
 #include "mhi.h"
+#include "wmi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -70,7 +71,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 
 		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
-		.wmi_init = NULL,
+		.wmi_init = ath12k_wifi8_wmi_init_qcn9575,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.c b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
new file mode 100644
index 000000000000..c575cae2582d
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../core.h"
+#include "wmi.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config)
+{
+	config->num_vdevs = ab->num_radios * TARGET_NUM_VDEVS(ab);
+	config->num_peers = ab->num_radios *
+		ath12k_core_get_max_peers_per_radio(ab);
+	config->num_offload_peers = TARGET_NUM_OFFLD_PEERS;
+	config->num_offload_reorder_buffs = TARGET_NUM_OFFLD_REORDER_BUFFS;
+	config->num_peer_keys = TARGET_NUM_PEER_KEYS;
+	config->ast_skid_limit = TARGET_AST_SKID_LIMIT;
+	config->tx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_timeout_pri[0] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[1] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[3] = TARGET_RX_TIMEOUT_HI_PRI;
+
+	if (test_bit(ATH12K_FLAG_RAW_MODE, &ab->dev_flags))
+		config->rx_decap_mode = TARGET_DECAP_MODE_RAW;
+	else
+		config->rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
+
+	config->scan_max_pending_req = TARGET_SCAN_MAX_PENDING_REQS;
+	config->bmiss_offload_max_vdev = TARGET_BMISS_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_vdev = TARGET_ROAM_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_ap_profiles = TARGET_ROAM_OFFLOAD_MAX_AP_PROFILES;
+	config->num_mcast_groups = TARGET_NUM_MCAST_GROUPS;
+	config->num_mcast_table_elems = TARGET_NUM_MCAST_TABLE_ELEMS;
+	config->mcast2ucast_mode = TARGET_MCAST2UCAST_MODE;
+	config->tx_dbg_log_size = TARGET_TX_DBG_LOG_SIZE;
+	config->num_wds_entries = TARGET_NUM_WDS_ENTRIES;
+	config->dma_burst_size = TARGET_DMA_BURST_SIZE;
+	config->rx_skip_defrag_timeout_dup_detection_check =
+		TARGET_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK;
+	config->vow_config = TARGET_VOW_CONFIG;
+	config->gtk_offload_max_vdev = TARGET_GTK_OFFLOAD_MAX_VDEV;
+	config->num_msdu_desc = TARGET_NUM_MSDU_DESC;
+	config->beacon_tx_offload_max_vdev = ab->num_radios * TARGET_MAX_BCN_OFFLD;
+	config->rx_batchmode = TARGET_RX_BATCHMODE;
+	config->peer_map_unmap_version = TARGET_PEER_MAP_UNMAP_VERSION;
+	config->twt_ap_pdev_count = ab->num_radios;
+	config->twt_ap_sta_count = 1000;
+	config->ema_max_vap_cnt = ab->num_radios;
+	config->ema_max_profile_period = TARGET_EMA_MAX_PROFILE_PERIOD;
+	config->beacon_tx_offload_max_vdev += config->ema_max_vap_cnt;
+
+	if (test_bit(WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT, ab->wmi_ab.svc_map))
+		config->peer_metadata_ver = ATH12K_PEER_METADATA_V1B;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.h b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
new file mode 100644
index 000000000000..a66ede369ba3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_WMI_H
+#define ATH12K_WIFI8_WMI_H
+
+#include "../core.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config);
+#endif

-- 
2.34.1


