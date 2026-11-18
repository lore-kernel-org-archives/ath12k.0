Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E57606A325
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 07:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w6Gy/aHk;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SXVvHTtN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hoU8iiHX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=; b=w6Gy/aHkk8VkHQ
	Buzmcfi927z6dFKcX22uLd+3q5/g+FTttaN2+a+zOVvwokJ/zy3i4LXkrzjdpg6YujDDs6A57pYO/
	NfmdPkw2hyvCd9b2uC1PKycfIpiQmvYojMRurR110o1FMnJp9pYzpxw0hyOLPs0N892JSbcKCmUKg
	FZd5Nri1vJ67JWFDgWnQE/qjMpHBat3uJipkzbRKIy/hV0QH2Hr+WMAzrjO9WR/34gtzGqAeFTYjU
	UxOgEmGkpEHj+TIWOX8dAOBV6ChuaZ6kmypVz/OaUy6x9ppbUuo2xKqOzf8Lj+rkxR50LGkFGDskx
	zKsMHBgXWN8t5hMkhfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZfa-00000007xRF-1EJo;
	Wed, 18 Nov 2026 07:01:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZfV-00000007xQn-24iX
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 07:01:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V0Nm1430560
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=; b=SXVvHTtNrwJvpxSy
	AlF9OO6nb4C1vJwxBDsrp8tNoDtkMO1Sx2WFMTa7l8qXfSwTxn7QGlIbhQpynf0z
	saYZ5UTcsvidABxC+Z5meezLe3+reHdwyE/dPA1qDNhKxeOYq8rwW9VAg3JNr3Mt
	k8D6V9rDcJY+m+/MrZHRCfq28DpaPzH7ZTkpkViERdbGHriyFc2YCKesukL/HCQo
	/41gZxvLj5jtsh6cMHu+4xZexoA7TFydvRiCWGMMXvBeKv5GQy9+Mfg9duJea/t+
	6E5Zb+revK1pICH3Ot6DGHpNeodtXqfTwqLc2r8Q0bQgaBQbXX/hQBQMdxXaenfp
	13yf2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91hm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:20:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so584098a91.3
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 22:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982828; x=1795587628; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=hoU8iiHXd3RZbHHvY7HCMD1bwXWNEU+63TERpy8Hli5iqTOregvcl+ZG5Jb+Jdz53R
         qry2Pc9hdAofZ48DbGxSLRmPNZo7Qm0L4kG5vRdEdDKeru5H2vRP053k0CqN5sPhsIvx
         jVEy5LiHi0TXvKpROtEhOHxRRE+jLEnUBGBauW9535BdfUjpsa1V4lsaldiZqv6jsIL7
         8eejDAmIHEKbFMvt+yVDDPpfSC7abfA4r34cfA9qZd+DRw732tb3vZ+Wx0BFui1jV8MQ
         GEoyrL8ytZAIIs5ZB1VUM0HCAUkyVrxxAP13wNsCN3aU5yf2Nwe28fJErDKsYY+wxWTT
         K7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982828; x=1795587628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=zFC1iIvKImdvE8bGwAEGlCmmTrD8Rs65DXUkjvYfkSbPOLtFYKaCJDS8RguxBEzNq4
         5NiTLSBAPDWkcBmlJsUe+apSlioMzG+PmIfg0QrOtZKJbkFloM0xbIQr+ecgWEcmzYoR
         e6Wgk1AACnrSbaXj+xMM1N0TkUX/bahFAB6j16WzmECGW4bCTu08I1PP/GKPHpIRF54f
         3dqg4U9Es6oUjmS10786213DJ/MQ6eVJoWZLcC0kO7w1v9ZWGbvoSN5jZ6e/JNxnpsZk
         ppYryZwhlkQW7IH3P9TEKh5EMajhefL1lJFXX++6yLYePUanA4RY7smE3pczXpohmtbj
         UePw==
X-Forwarded-Encrypted: i=1; AL+hErHNSZGabHtpysJI1JoLIHhZYel+IgyWNDQv9T1DoCc1D+o7HLo+uj2Zrl7MWq+FDx1orefyS7o=@lists.infradead.org
X-Gm-Message-State: APuU4Z8VfkgymPqiRGohaSmYL121GURST598Q9+MBUmTsKgvVwasI1UY
	NwO2HUFD1j2ezRw7HGiqpbIrrTMN7MJVX+aFyxlQEV/sGg3NmJBrP7iHVPGSJrCJVEnovs92HpW
	w8LNh6Z2LB9BRS9BAIOXUgIlq/Tn4EewJY0b7hYB1TP3hLZIc4/SivkwGgT95u0EiXZAueMMF
X-Gm-Gg: AZFdTZePgOaDtXlLWtDdVWO7efyNtAvOFZ2nwYCMVG5XGyTm0exATyrHJLBw+fhWPCo
	af6fGRVJT7KDkjb8yA+ORolqhbNxpEDFenHKK9py5s6omkt8tv4EtcU0pbsWPvBJ+oM4NmI776I
	/fnUNk5sYLtwC3ynUqEvfbPxIhPo8r7ZObLXVB4ZiR97+Oo3B77ZP5Jl5w6+k3dclf0wzblxXan
	gs85T9vC+3UEYo0HGLvjjeR45nLOQMdVlKZvOhfB8LT5s6Cm+RRSIpuNprclOjp4miuKjGslHOB
	m9pilf8vfbOgScr1tnbk7wbdsSY9D30prbYZdwpHUQF/x0LQ1D4RNqNglA2mVvolSGtHG1OPw8I
	iii2Q5wrxTMag4QtUSmWGoX+xk1cgAxHIQnGoM196L2La46JljXlP6RmgIsUzNBheUJZYY7HsRm
	aLKoozdmn/Rg5cxGjF+5TEy+1S84Ugy+6EuxjBznXMqzwu/Hkvf2hAzDF8TzPbC6Nv4Ym4UE4JO
	sE=
X-Received: by 2002:a17:90b:1e4f:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3b3d07e0fc3mr1968968a91.55.1794982828320;
        Tue, 17 Nov 2026 22:20:28 -0800 (PST)
X-Received: by 2002:a17:90b:1e4f:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3b3d07e0fc3mr1968948a91.55.1794982827817;
        Tue, 17 Nov 2026 22:20:27 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:27 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:18 +0530
Subject: [PATCH ath-next v2 15/15] wifi: ath12k: add Wi-Fi 8 PCI driver
 scaffolding for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-15-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX2QyWbQ7V2wvx
 8M4vOp5bRj4zWIN4QEnHry3bdcjzx8fRJKQ2bCiV166tSLddu3a16ZWlyVx4XrTV+iQeaNeiiUE
 e1DnSzWd1kINXYSLd+GR+7xsv0v6XfKk9Ld+m7VI9tzL1/5kf1dvj0yEOHkPF/yyhw8NiEyqxJu
 N4AnzMtNtC9U8yc3+8V7lP5j99uNHWMk5/AVk7oSWpcl7cDDmYvv/Nn2eaj0E2vVOz+rCrZCFER
 oQAwOdvEKEcrjC7xx8fseSRRS4OgTEl09yY1oC+zM7dOkcALmLhxs7R4x+CuR1FRJlq2xqKtg66
 OuPIIZUUojg4Qy6TJrSdq2y6KWmb/uBMzcsFCUaXB6QpjUtFwleQOB1ktjidCfOEXj+Nc65IcDb
 5CXmSZqAVhZj0rGaxJ/hRthPux8IrPx9AzGRdeIoURccFltsSJ3WTx8TavTL7F3gAcBjO7sTsgO
 2kDZB6L2NCb10JxQYFg==
X-Proofpoint-GUID: HGM6XoBPf64FvkdcGV16Cp4BaPQ_VEkl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX/wdasxU7XuIM
 Y8p/pVFg0uMgXsufYN63sR8P35DfGXH7WASTKQTWv5NxJYZDUgKYKYnC6RVap8n7K17YP83zbFU
 s0/6wgiRD8dFOvC21ld7rdi53F9TE9Q=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd43ad cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Yi4xBBFUvw6BgwE4oHQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: HGM6XoBPf64FvkdcGV16Cp4BaPQ_VEkl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_230121_564555_23205B7D 
X-CRM114-Status: GOOD (  18.75  )
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

Add QCN9575 PCI window register constants (WINDOW_VALUE_MASK [25:19],
WINDOW_STATIC_MASK [31:7], CE_WINDOW_MASK [13:7], UMAC_WINDOW_MASK
[20:14]) and a Wi-Fi 8 reg_base instance (ath12k_wifi8_reg_base) for
per-device window selection. Implement ath12k_wifi8_pci_probe() to
configure QCN9575-specific PCI settings: MSI vector layout (3 MHI, 5 CE,
8 DP vectors), static window mapping, window register address (0x3278),
and hardware revision. Call ath12k_wifi8_hw_init() at the end of probe
to complete hardware initialization. Define the Wi-Fi 8 PCI driver
struct with the probe callback, and register it with
ath12k_pci_register_driver() in ath12k_wifi8_pci_init().

This series only adds Wi-Fi 8 platform scaffolding; QCN9575's CP, DP,
and MAC datapath support will be posted as a follow-up series.
QCN9575_DEVICE_ID is intentionally left out of
ath12k_wifi8_pci_id_table for now, so no physical device can match and
probe until that follow-up series lands. The id_table entry will be
added in the final patch of that series, once QCN9575 is actually
functional.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h       |  2 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.h |  2 -
 drivers/net/wireless/ath/ath12k/wifi8/hal.h |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/pci.c | 89 ++++++++++++++++++++++++++++-
 4 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 9e88bdf4a93b..b30a8039b2ec 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -11,6 +11,8 @@
 
 struct ath12k_base;
 
+#define HAL_CE_WFSS_CE_REG_BASE			0x01b80000
+
 #define HAL_DESC_REO_NON_QOS_TID	16
 
 #define HAL_INVALID_PEERID	0x3fff
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.h b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
index 19e02bb16ff2..fe880b0befcb 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
@@ -31,8 +31,6 @@
 	((hal)->regs->umac_ce1_dest_reg_base)
 #define HAL_SEQ_WCSS_UMAC_WBM_REG		0x00a34000
 
-#define HAL_CE_WFSS_CE_REG_BASE			0x01b80000
-
 #define HAL_TCL_SW_CONFIG_BANK_ADDR		0x00a4408c
 
 /* SW2TCL(x) R0 ring configuration address */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
index c99521abdcb3..89fa9a7f3fd9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
@@ -11,6 +11,7 @@
 #include "hal_desc.h"
 
 /* WCSS Relative address */
+#define HAL_SEQ_WCSS_UMAC_OFFSET		0xf00000
 #define HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(hal) \
 	((hal)->regs->umac_ce0_src_reg_base)
 #define HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal) \
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
index 3975081d167b..fd0489f8333f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
@@ -5,14 +5,101 @@
 
 #include <linux/pci.h>
 
+#include "../core.h"
+#include "../hal.h"
+#include "../hif.h"
+#include "../mhi.h"
+#include "../pci.h"
+#include "hal.h"
+#include "hw.h"
+#include "mhi.h"
 #include "pci.h"
 
+#define QCN9575_DEVICE_ID		0x1113
+#define WINDOW_REG_ADDRESS		0x3278
+
+#define WINDOW_VALUE_MASK		GENMASK(25, 19)
+#define WINDOW_STATIC_MASK		GENMASK(31, 7)
+#define CE_WINDOW_MASK			GENMASK(13, 7)
+#define UMAC_WINDOW_MASK		GENMASK(20, 14)
+
+static const struct pci_device_id ath12k_wifi8_pci_id_table[] = {
+	{}
+};
+
+MODULE_DEVICE_TABLE(pci, ath12k_wifi8_pci_id_table);
+
+static const struct ath12k_pci_ops ath12k_wifi8_pci_ops_qcn9575 = {
+	.wakeup = NULL,
+	.release = NULL,
+};
+
+static int ath12k_wifi8_pci_probe(struct pci_dev *pdev,
+				  const struct pci_device_id *pci_dev)
+{
+	struct ath12k_pci *ab_pci;
+	struct ath12k_base *ab;
+	int ret;
+
+	ab = pci_get_drvdata(pdev);
+	ab_pci = ath12k_pci_priv(ab);
+
+	switch (pci_dev->device) {
+	case QCN9575_DEVICE_ID:
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->static_window_map = true;
+		ab_pci->pci_ops = &ath12k_wifi8_pci_ops_qcn9575;
+		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS;
+		ab->hw_rev = ATH12K_HW_QCN9575_HW20;
+		ab->target_mem_mode = ath12k_core_get_memory_mode(ab);
+		break;
+
+	default:
+		dev_err(&pdev->dev, "Unknown Wi-Fi 8 PCI device found: 0x%x\n",
+			pci_dev->device);
+		return -EOPNOTSUPP;
+	}
+
+	ret = ath12k_wifi8_hw_init(ab);
+	if (ret) {
+		dev_err(&pdev->dev, "Wi-Fi 8 hw_init failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct ath12k_pci_reg_base ath12k_wifi8_reg_base = {
+	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
+	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+	.window_value_mask = WINDOW_VALUE_MASK,
+	.window_static_mask = WINDOW_STATIC_MASK,
+	.ce_window_mask = CE_WINDOW_MASK,
+	.umac_window_mask = UMAC_WINDOW_MASK,
+};
+
+static struct ath12k_pci_driver ath12k_wifi8_pci_driver = {
+	.name = "ath12k_wifi8_pci",
+	.id_table = ath12k_wifi8_pci_id_table,
+	.ops.probe = ath12k_wifi8_pci_probe,
+	.reg_base = &ath12k_wifi8_reg_base,
+};
+
 int ath12k_wifi8_pci_init(void)
 {
-	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
+	int ret;
+
+	ret = ath12k_pci_register_driver(ATH12K_DEVICE_FAMILY_WIFI8,
+					 &ath12k_wifi8_pci_driver);
+	if (ret) {
+		pr_err("Failed to register ath12k Wi-Fi 8 driver: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
 void ath12k_wifi8_pci_exit(void)
 {
+	ath12k_pci_unregister_driver(ATH12K_DEVICE_FAMILY_WIFI8);
 }

-- 
2.34.1


