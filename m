Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6876A606A896
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 08:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OuBZUiIE;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NM+xRzUP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zaa0zrw3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=OuBZUiIEgZp5Am
	/6MKZ8VLa+UcAD980MrEOwB/mpl4IzMWiN6feo2dY82nH9VHSrJcE96boRkmX2pAbQPZ7KXDRCriq
	pCnzYoxX9GAZZvzHPEChuviPhbQt971SuFNiUsDxjVKeg2cStgElD3DdIQzMP/q1M3ottEk0qmkMe
	tUqVLAo5BuRyoTS1K5cImqmV1odg8kICb24uTntHFLrSppKvufdfrALiDzeeSA1JOWL/ywvapkKJ9
	CAv/hivpedwIlsT4Twea1ipelt/ncGtOapGOx+4utS+jxoZ6U3JFAxh/80Ov1BPqIvj7MkuT/Zl7R
	wBHcHgbaEFThoh10QxDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaqW-000000088sM-3o5S;
	Wed, 18 Nov 2026 08:16:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaqJ-000000088eb-3Tnu
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 08:16:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UmKY3371251
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=NM+xRzUPozTCkio9
	Ga3Or0rnc0N2U8LowpUKl9AV6iCNmh7Jkua+sQSU2SfgCVGJOjeb/6eaxUL8QCsf
	A2Hk5eLWetzmefWWNBPqjHHd2W+Qpr2XqRdP0VV7MzMlurQWshTgzoUKV6SdgZwe
	o4z9P1FxfdiyhS6pmqrAF5ZY7Ny8bz5hp39QnyGwWrRlz9dtXQvRdV8D8B7dsFnL
	q4Wg4QnQof2oyi/wxAGZHQA7w5rkl5+Ih22cXn0y8iJHT2Ub/sj0nPk0Tpa+audW
	ZxwQBBJokqCqdiIJwNafszWCEeTkq3ixs6E4BMQbXq/4MP/8DoAIfHvb9gFMI9dP
	OnWRsw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8synk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so734929a91.0
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 00:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989794; x=1795594594; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=Zaa0zrw3EJH7t8FZvh434Jhppj1oFxyGji0MHyEi2fMdte1QrMURiUXjKFncSNfZGZ
         51/hF/6HAbOBeF3c5Ga1iYuk9U8sd/if/u1c3QEdNrrrYJFuELaY2XkZNqpwd3V6FB0H
         P18KSY/xS2xQjjaTp7qH81fL6TNCHXamg7lE7YXbwvCFLjIwkknvxl/PGc4JFSTZ88Kf
         UToCgXy04p0PPTiCJPq4AH43LbPGP6WzXWj4EotJGHonqYVH+9MEXiX9qUA3/D43eKet
         vz8peQflC6xZKtSbgqG9sjPsqunw56b0716+0bKBt6WqkMSakmBpYImfXmfO1QyeMklW
         b6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989794; x=1795594594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=cgFRHnff+sNPjZa7WUOTDd81ChiHsQQQ6sY5n9Ww/tAbF6KSTVqZpAliqExMYczb7+
         GVFSoD24pWGVed1F0vC0oXnv+Bp/TC7bbDnEoykvq/iKT7YBGc7Lx3tC0bIVdW5qi2/Q
         uFa/vdeTYAMmSpPrB2PEw4lyPhgLbbXvqiOZJQvGoDj55zVOUJ4HzoBOINEShKpv6pcC
         kln+JTTjSlm6jJ0bY4OmP1Sk4wSG4978dpbspowcNZ0sAyFcfO1WWRAKqrC3dcC66463
         wffRgCQjVEBp6gLKrs8kauy4xhstmaQGK0kF6Yisx5lOu2IBQjulv+hTsvo3tM1etjH5
         992A==
X-Forwarded-Encrypted: i=1; AL+hErGZy56pYxSKF4G2/3YNsUHNmtEqIc2gP18HuCT/OrarRcGHOh3Oi3ItJ4b8v3w4aT+HVye2FiA=@lists.infradead.org
X-Gm-Message-State: APuU4Z/yWqhaj+McIWEEXPVVW0xwrhAKwFc8TqnK9ix/3ao30RFBbDAj
	ZmMS//vFAAc7gGEZfv5EoMZIMmhVZae3DX21eR5TOHbaGDfeBVslFD4fnguq2ecer5MH76tO3D6
	mW9ITyu0PBFe4tAirT2/x8Zj7o6B5Jhpg6dfrDfG0VSmKKAloj6uFolKcJGKPlbp0krP2MO42
X-Gm-Gg: AZFdTZdatLSYsSIUGVArJJWLV+J58zCri8df/Ruo70Wu1A/d903OMj3ldGdvAr/yzW+
	3zv0Y8QWQJip1npIk6bXDvhBvJclN+XB1uVuz0TQnBdGzuWFq48bNDv8aTz/9g2uFfgiTP+31+T
	1VCSGfNh6XZ0c01F44hhLvjimr+nVi6K3eBz1k3EO3p737Z5UKS3YZgMCFLolcIzRiMSMIv9VE/
	ZbDLMPubkT2fi1axbmZXqJhqJ/09zZWKFhm3dhRgpGUA0pqFOcAnudqSakhYqqS28UeVeqFBAFo
	ipKMPYZLLO4CVZH6uSPouloi8vzDkQNkUe7b8rji5Knj30T6dKWMXqWfgWPP18b989DD1NuUktZ
	98DQUn1C79mOpCSWbnirBC6uTh0K+oqv9p/5KMrg8wedpmbY7jJO1XkQyFG8Hl2kL1vsFPfDZl1
	TLSovqcppYwK96aHxaKDhqBAg0m5ht1mxqGPXf70NaDSspc6h0u1uQihAr+mdzj3asZ7kNKBPQa
	w==
X-Received: by 2002:a17:90a:d2c8:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b3d04c9de8mr1312790a91.0.1794989794256;
        Wed, 18 Nov 2026 00:16:34 -0800 (PST)
X-Received: by 2002:a17:90a:d2c8:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b3d04c9de8mr1312777a91.0.1794989793795;
        Wed, 18 Nov 2026 00:16:33 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:33 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:35 +0530
Subject: [PATCH ath-next v3 12/15] wifi: ath12k: add Wi-Fi 8 WMI init for
 QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-12-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd5ee3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Fa-mINMYIZ2DnWK0-L0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 4fK6vet0j3pH6lofELfSE4Uddfhwa3u6
X-Proofpoint-ORIG-GUID: 4fK6vet0j3pH6lofELfSE4Uddfhwa3u6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX5PwC7XGMeBNg
 01ZzalxeYjf8AGK3r9tOdgzPEx9qCSGn7P7DZSHspoHjpSJWx97u6FkG9qOYofLatPWc5NZycdf
 UTk0Qudo2X7UXBbFAFxqFYzG5SDPAC8MVqNhztjcfrx6Rawd3rCFeRQ8vjso8bxx/B7SIFHe1Sr
 8gVbRQ6Em5CEK1qWFwdn8HBp76N07LM+skGcI/8nXyuf/RG0AqP5W1CXLYQMje1wmzTM4FdJ1uw
 xivyYqbvprXq3zUbPo6DpXwpOjZRNslzkTLGVY2Gdv5ethv6fy4IRBRSlIOu4N4RM10MPRUCpiO
 sHw2PBAJfKpmUy+z2HrzltGGvkh85hJHdacKK8Ql7VNukpKWHdA7Ue0fLpKz6V8Bzd9Vf17K/Cn
 5EZXCY8KYr7mGISuZdnJeOCfsMUWcnaKceU6q5RoSP3awx6KuHYU8lu57RciVezW1OjDolP665T
 XtzHRXVvIhDb73nmb5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX4xtpnvUgtkZ0
 wLBIe65NAXtT5f90YrrdLZP2Hwzz9juzlP2a3iYDXdsLa/Kb5zcf7krkTZtjuKCTBugoipBrve3
 M+mDkIMTU3oDKmTpz5/fULNx5LCVzwo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_001635_918217_C00B2F88 
X-CRM114-Status: GOOD (  18.18  )
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


