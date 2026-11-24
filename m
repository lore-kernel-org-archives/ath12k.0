Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80AD606A323
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 17:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mEdCEqR/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=opwQzPZD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGi4uUKH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=; b=mEdCEqR/sisSZh
	/gw+jAxYGc4qjGmb+UiaGd8QHPTYlzVvlZE71VL++wXjTLGusUzG0JOUrzVGcJxFjmpPcmaS3KvPW
	Cc5m/uLEn7s/HaLQNmBg4PNIFD483MsWdAZ5w8TLb390RS8b1q5I8n4liUaXPVy85KBJOQWDxnlwa
	n/xNsZS74Y2x1Sql7sN75FfWfDG1esTvrgfzAE+rCK1DrURYQeI8AWGlWKvb4ncL3ijMPRX0sg8h7
	7onTPd5aNsePkISv5FaAFk+exO9JfHNnnfzBIO+MyXwe7/TAlNOHiWUdhdZB/IeVlHxR1derOBRAS
	S+Hq2iK9Iw5Ti8HblOxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuR9-00000007O75-2hKU;
	Tue, 24 Nov 2026 17:36:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuQq-00000007O5x-1auY
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 17:35:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLBHj2318195
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=; b=opwQzPZDOqWR/SpD
	fixUCb010P/cGk3E2Ehy7xPkSPSy9UN2v30t4/jYBs1GzomV3O85UZR5taR/3BfD
	Bc5IBM7gWsB+LADxCUgY43ND45C2lViqB8oauIiH9RskI0NGBdzKPK+uJOxJUFWY
	6BF0xiqxit3Rzm8RZPhni9Qa79uUHzquVhXtzXUdKfj5WnOpg3WFuS9slbUSYd/Y
	7tyPXRCYbR3qh/PwVvc3sERMA0rSZENB2puAEAmLA8MBODTKbzOkIbAZD0zZgg+7
	SXV6voWsk9KcpiUPV3S0QFH4eexz96TOIAdo3fH8VGJY6fmq/WT05KmYrxAT+iNu
	2JrIIw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd3vre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869accaac2so2796260eec.1
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 08:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538688; x=1796143488; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=kGi4uUKHw60PQNTaAnYB1/EQQb1R5M60OrrsC5ZbzAuLquFlwxpAtGvo/3b2UeF1VQ
         +ALYGJhYBBfKN9Ti1iol0ltqwPsHiNnhWRaXa8E4BYYcjJxGbQx6H1kx3yzX5HSdduA2
         cPPXcQfdvL8QykUSyj0Uzi25hubXlhQkzTBBWdZQu+s3DLVfXyWyXiZ38wF6XkIR+FlQ
         R8K2x/T+8zrBQz0KzjR5MiyMnzgKpmZXIJ+x8uKCDbKdJU9uuxOWLcECR2kS3V3hIH/L
         nNWVSkBYbXfuWTjBSqY4t7kgZ0Z2Fsq3am4T7bll6posMPNUdxoPjgX6es/03ARbgI9f
         5fiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538688; x=1796143488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=W/O8NTVRzr5oTCzlvIvDgtLoqoBAftf2Uwqg5n4xVQkE/UtS/4G64UuJC+dl74Jhts
         gkVeLR7SSHs/e+ImxX+Kg7YLoYq+CrMP/SA9f5nOzJ28ShAAMqqTwdmWrfJajI8pOTHt
         7DPDxQQ8Qr8QXKO9SXBsH/Gbm8K9yMH8jgC7A174emkEaX1vVES6Ex8Bzv28LBUvc3TT
         suLa88m7FRQLuPQ8nfwY3iHlodfb6b3hIhsaUQB0DrRggKVsbI69pRxINyXZmE79wOzP
         XT1CGarqmi6+Fun/Stp7aFrDAHYdq6lTT7ioHnrP5lM48CeJxNbepjNMEw98VQaBDu6e
         Pzlg==
X-Forwarded-Encrypted: i=1; AL+hErHj25e4poId0E52XeDHYTc8bQJD4gkom8LQKVZ4Y2eKc6R5s3AKhvxU82RBP3w3CpJQ7DRfsFU=@lists.infradead.org
X-Gm-Message-State: APuU4Z/SjwaCTpxMRp6CAZSXeE5rr56cxq6tLRQ2amU0Ywh0NN8cGKJm
	Wa2w6je2MFNgbN50AB6wAu8Kmi15mcADW3MRPG1OsL3dcCzEbIlTOIpdTSQsWzKhvdFNgFo+6sX
	YL9XiwyUJBh/X+TJ/b+A+gYbEOIka2r8Jdvuk7G15CBN9ue8nnrhs2UKDrl3AMJ/v
X-Gm-Gg: AZFdTZeH+rYP2XMFLFpJw8f1dQ08V6u2yH/0jq4Sd8/1cKoXqy32i6I20LH8i4HpziP
	zu4DXus/bbbSLTj6BjJVwdWH1viPsO/7907o6/Wr30ilaJ3aVaVBGbwbqLen0cqZqUZAFHKzbnv
	cohEFyFn4ffN3J8pVOWB6SalAD5j1G3qkYvz6LVKsdsma573RERgl+bxdeBJiGWB58J3DURga7T
	oxjqD/gnVBrabo8ZC5dnti7mAap+39sWZFZU5LRvcelygUIGqOJafFa3dXaWxH/PldWzTrRk2ya
	IGYcrPWdQ7cycDdYMya4JU4OuDl8u3WdNiuQAP1EpAG8KIWfpmmLiFx5oQj77ERJD4x5dNXWjfh
	7zOF+zSbCgX+zqGgbBxrz+HcWhPGteAF1F0R7K0HtAEr0uS1CFnx9yk3lkYV3xWC8y6ZdFem8xw
	MQSs4XNcs6HnJUoPeqTRw/tvwJNnpy1ldfgH96MpyoJbZsgVT/9Y5xQy0/+q7C40KGsl5x/Ihxm
	vs=
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr18432265eec.6.1795538687955;
        Tue, 24 Nov 2026 08:44:47 -0800 (PST)
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr18432231eec.6.1795538687388;
        Tue, 24 Nov 2026 08:44:47 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:47 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:40 +0530
Subject: [PATCH ath-next v4 14/14] wifi: ath12k: add Wi-Fi 8 PCI driver
 scaffolding for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-14-1f5b87ece6a3@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b05bf01 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Yi4xBBFUvw6BgwE4oHQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX1xpijMtMdTiR
 jq9c+cS3tnr2qPLgPPnA247nAh3YnPpb/xRSVfebwb2CgDHdTeY2zOkTFbRQkJWs/PjwzURTzYZ
 aWCV0uN61phB8YKN83olqQ+Q531peHSYtimfaPYggAZOxbNoRvGWg6etkZ3BfXDH5iGYf18RUlw
 HPzI5KQWoP6jDFIlgR7A7mZT1aLu6Xw+dqtNpznm9D2vxs1300DjHlFhPvwIja8tkbMoT2filRS
 f2JBuOYknkSuLfgzzXGuAgNLYgTIf51L5cFKqAFZqAXm5EXn53ttBTEJchVPgUFqmCqNJP4/NQ0
 9ooMT1pvPx9Yn60wl0oa4Ow36aRZ+eM2CAbxq94tYTBAgmmnH6It30WQJUawLQgU3IkaEEiQKCV
 9Qw7nHmm9yZsVTHsGW3xhj/0FuFBmD8nr8I7aliJ89Mcj8NaG1OfVa0xP4BuV7D3AlQUILOI9nY
 FCQa8a+0n1Msk7fsQ2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX30dOR6yiszz+
 DQyDXdbw45xytDhe8A4IjAMeVc8jDVdqEhOOPe1z6YGKNas3puXZ0zyLjKieBRCcWeeehvRHuc4
 8VQGcxzHDWaFGsHGpjCSe2naIhsXd9E=
X-Proofpoint-ORIG-GUID: OppeKGd5JSynzO-6DzjjROsX0mGWSQo-
X-Proofpoint-GUID: OppeKGd5JSynzO-6DzjjROsX0mGWSQo-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_093552_834758_0406EDB1 
X-CRM114-Status: GOOD (  19.25  )
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


