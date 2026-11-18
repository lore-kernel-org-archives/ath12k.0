Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B983606A883
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 08:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1eEjkepV;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzCboT7D;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ATkLWv5S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=1eEjkepVrIcxps
	Ov++pcqDc019lY0Tai5BVrRp4T4QjjlpBdNsxttr4WjzsHFrnMFKWZTqwjTk9jjBkgTjMB/SzcZAY
	3y2je3Z23ErlHzQ2dATtn9wA4QrAbl2Q4NMTMQtQEn1Yst6Spf5fVA9pH5DykLe5m0bX/grh6woYq
	Sv4nkPsx/thqIBymqLfMZsGL7383sBt+iGIHKJs+LF3u5PmwZHC55hRrbuMnyCnlhBM/GX0cZV7Rg
	iZPFUMef72XG1qwJcpvpTYYE+6resGxMNjgntk3OJ8i7gigRMqsHlQFBo+x+0v7CYhjsTHXyWVU44
	1kmMgUg3ZfAa8rFTXiqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaqI-000000088dI-3f39;
	Wed, 18 Nov 2026 08:16:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaq9-000000088Rp-3KId
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 08:16:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxHs3121726
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=DzCboT7Dhn4gGb+i
	TKOVZRY4KjDy1mBZpGu3EEkyjoEsvlCkOvJksE4Rjgq5yUOJHiEDO7cUGcbMcdLU
	YDu7rJfTvsgwFBD+IipYzt4X3XhRNfgcjPC8e0JXIBpU3v3Bt/EaLN3/xHOAE4t2
	gAA0sk8RB8umQ+qZ3mJHt0gWfYHl8Ni8EfHuyj54kpTTcPvkwoa+TcrleTNl31Ai
	IQ0Z2Fs3XXOqRhEupUNC7Wd4mv7jdt7xfwIiEcp6rot7Xu5oP6jwJY7cc/k/H2I3
	MpkVyI8B1Zm/PnkPp3UXkoY0JUzHfS6zhWd+zMNsVy067//RjR2PTXXXd9SIXHo4
	TDcMVA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hy1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso801562a12.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 00:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989784; x=1795594584; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=ATkLWv5SaE69fzrHGcVPVcWEPuyxfZ9GRo77HCa9ul/2zY4tlnKT1hnT8x9XhEwuKu
         mHJW7GLvmdeijoIeRc9AQBqgXQhdOA+zeD2ChnuLSMlh5YuzpWNYoEpLsVCHJk8U3L4U
         dx+aINMhcqQ2ebIrdlsZ0TBrvv6b+ZaPGabXpC4eR5an8XI3XYiXLZQHiAtY/D4AU9mw
         jKImZ8LbeG3k+A1BA5RhRzAPRb6qV+Rr+PTrZmMjsWAbL9HwylwU1hbg/osfbrRcgmRt
         +4ZxNxC6TUxbLmTz0ko6tz0zu6yPV8qKG+VS0fyUyxAL5VOh6cjxNb2/prUwdAGAdgTN
         +foQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989784; x=1795594584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=K6ZpYXhPD4IcfPGQpmR/KozzA0YK/o7ISaHhJFYlyWzr3lSmsxRzajycafoBAg+Aui
         n1lX4jfo7Ux14VGhuT+btqHGtr8DNiZ00SOuD/chrfeTRe/jsrdUEAQQEK30wpdLlRQF
         7AqGBb9hCjNAxtnmxMp2AJkYMQO0jmPXXgtQHIf3d8jRwtfI7axQXKWylASswafQSSy9
         PxuIGwoObP80zYURiv8CD3a2cKvctrpX71nI1A4MqDAWUSGNwW9t7rsFv82811PPx32/
         B7tOE0VC+4IsbeRMTnqbVi/92yk9eRBLQizylsUzcqHLjS7e41XZ++XJyyNieIeNiLr7
         SfEw==
X-Forwarded-Encrypted: i=1; AL+hErHMnrB0sAdIopIUX7LF+6MEvXqfBBPaLUoxanKoA9tQhxb2NmxoDhuB7QYJhCETi3aS10NULp0=@lists.infradead.org
X-Gm-Message-State: APuU4Z/3mItplFHzWcFL3zCGd5kuATrA3DgT1+B5W/syyHS8XUhhgox5
	QmVwGC7ivVZEKTLrFurJP017JUzzpC4DJm41uIac3l2h8TMkMo8mEn+Gq3dZ3AUwwQUcRYMd4j5
	RcHj7t6p2/inptr+hto1d/MONB4bYMTDM+mliW32tQf2gIEJxC48H9+85YltEKObTmyA8mUHf
X-Gm-Gg: AZFdTZfvc3znVH19V0RKETs5yZnBurEiFxpgyNFpYR5OQiBnn7hVjeB7yT+dNpnBjWR
	LZOpozZk387RQDJEoe1QXZfzkaLkcUFbTlsM5MHJ92YqDBeNdnmNeCXsoUVI7SqkYKMWUq//J+o
	W+FUd1makqebzNzwLe2UJ19gXgaPIqqUHav2biWQDzKbJdFr2GQiN8LUwSLgQ6aUsZzxll5x7bC
	ey9Mj0yldOGfpFZNj/5QNYiIZSzB2NzJ+wY7c6F1rPhSnQ4lzJ0Z0PCLNy9Afuh0LyoVy1tWIuI
	VKrYHr6SSmtcs8SOyeRXScPpiS6oURYTe7HRb97CvwY8uSqCCq1wZq5kTlLtjyClChYUzdKh++q
	qVUr9Om5Yi/vREmfJmHiFAlJeNhwXyW05ImczkELHYme93qWRljfFIZLy/XuW1YSVD1yLm18VB3
	l5gfS/wFCYk1ZmPldqrg1PJVPsJl+sKxBOqKeXPi8gLt7BQpDCLTPbOoZ9wMT1VWFBm6YczePOE
	A==
X-Received: by 2002:a17:90b:3908:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b3d07cb4bamr1897036a91.60.1794989783746;
        Wed, 18 Nov 2026 00:16:23 -0800 (PST)
X-Received: by 2002:a17:90b:3908:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b3d07cb4bamr1897016a91.60.1794989783284;
        Wed, 18 Nov 2026 00:16:23 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:33 +0530
Subject: [PATCH ath-next v3 10/15] wifi: ath12k: add Wi-Fi 8 MHI config for
 QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-10-9875d2a3953f@oss.qualcomm.com>
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
X-Proofpoint-GUID: l7Ug0PC7GRnCpcRrfbOZHR6T_eHMO0DJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX1kUZ46yRZXb6
 pdjtYn0Hj6jDTNCXGqlPxsASZM245ZOmHxErOzsdfYVlTBk3weS4voFuNRIUWb0cll5AAdmeBvm
 6hrE4NkSUYyk4twmKwVSXymdUyyDO9w=
X-Proofpoint-ORIG-GUID: l7Ug0PC7GRnCpcRrfbOZHR6T_eHMO0DJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX//ykjuArrw/6
 R9PLneeaj31sTvPwT6iE3TbQcg9SeC+4bhsXzQwDFpwTn7gmka7JkPNb+apRwnsollW2I62ncLQ
 U6vLYzkbipUp6YyGmbPTxKRoH8+8ILizZhe4wgDs2bA2ibr3E53Ijpy6jHgxoEj2ej2QOra/r3I
 JRAEMOsq5t+EcKuJl8AOmFLvaSgVVeLqETYxRJ9AUPlPlsI+AJVGUSNB3b2jg5HJZsnLhB4j5TA
 6v/W/ShD+jEzA+QaOrFFL3ok/0hv5xDcOQzVJ+1qgrxGAX1OT5t33SaAcQR+yZZIX+rofVpA7+5
 PHk8hmbveYASwUP1oo92mGLI+3RU34A/Vp9LmxARkrK+MEcENYqSHFPR7J2gkWR0rbwWAr1l4TT
 usK0/3Mmp5ZMXXbgdPBog1Q2XBnDQOhZAvMtpCw8twqobbx6j5aAyDKMF7Tct0ubD3expt8+9Wn
 5vVdeZCb5EeC91mhhLQ==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd5ed8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_001625_950983_60A24313 
X-CRM114-Status: GOOD (  18.65  )
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

Implement the MHI controller configuration for QCN9575.

Add ath12k_wifi8_mhi_config_qcn9575 with IPCR channels 20 and 21 and
control and data event rings in wifi8/mhi.c, and export it through
wifi8/mhi.h. Update the QCN9575 hw params entry to use
ath12k_wifi8_mhi_config_qcn9575. Build wifi8/mhi.c from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/mhi.c    | 70 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/mhi.h    | 10 ++++
 4 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index b1b90c109c76..051c6447d35c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -4,4 +4,5 @@ ath12k_wifi8-y += core.o \
 		  hal.o \
 		  hal_qcn9575.o \
 		  hw.o \
+		  mhi.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index bffd1081fd2f..428d6b2b4418 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -13,6 +13,7 @@
 #include "../mhi.h"
 #include "hal.h"
 #include "hw.h"
+#include "mhi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -64,7 +65,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.num_tcl_banks = 0,
 		.max_tx_ring = 0,
 
-		.mhi_config = NULL,
+		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
 		.wmi_init = NULL,
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.c b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
new file mode 100644
index 000000000000..04eb1f1650c3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../mhi.h"
+#include "mhi.h"
+
+static const struct mhi_channel_config ath12k_wifi8_mhi_channels_qcn9575[] = {
+	{
+		.num = 20,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+	},
+	{
+		.num = 21,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+	},
+};
+
+static struct mhi_event_config ath12k_wifi8_mhi_events_qcn9575[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.data_type = MHI_ER_CTRL,
+		.mode = MHI_DB_BRST_DISABLE,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+	{
+		.num_elements = 256,
+		.irq_moderation_ms = 1,
+		.irq = 2,
+		.mode = MHI_DB_BRST_DISABLE,
+		.priority = 1,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575 = {
+	.max_channels = 30,
+	.timeout_ms = 10000,
+	.use_bounce_buf = false,
+	.buf_len = 0,
+	.num_channels = ARRAY_SIZE(ath12k_wifi8_mhi_channels_qcn9575),
+	.ch_cfg = ath12k_wifi8_mhi_channels_qcn9575,
+	.num_events = ARRAY_SIZE(ath12k_wifi8_mhi_events_qcn9575),
+	.event_cfg = ath12k_wifi8_mhi_events_qcn9575,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.h b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
new file mode 100644
index 000000000000..7a229ea378d2
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _ATH12K_WIFI8_MHI_H
+#define _ATH12K_WIFI8_MHI_H
+
+extern const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575;
+#endif /* _ATH12K_WIFI8_MHI_H */

-- 
2.34.1


