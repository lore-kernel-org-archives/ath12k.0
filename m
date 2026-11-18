Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ACB606A33B
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 06:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mD3Wlx+J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IybehDLe;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JRrD/6Xt;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MBnKsXlW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=mD3Wlx+JchVWE7
	GtnNFpznOXBm2ljrmItuAyT2jZNN7oe63gY0I9evSns3i8+MDkNk4RPYvTh7U8I8hbgu+sp+ut9pc
	VV+AUJXglHE0IOl4fIAGLH1VXZsuNjb1XpF5XeMYJbeVITxHjOI+xCAxvfy3ub2fVkVoQ9h0y0sua
	zAZJfJoC2yxXVeoW3ViQ7+X0jVPop4ukLwfC8jwPta/zvfMQzE8BRdsoxxEbCwdJnPqLQCkYkA1rK
	rEKhRHK1a9vq9XOjBv3ukQMD+3queYFrVyJe0wrjHyZo7mHKmvHkN1YBbphkaVPjKO1P0F4Y3q+1C
	ngKTHHJo85zbZ+r8DvQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ1n-00000007rvA-2zxJ;
	Wed, 18 Nov 2026 06:20:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ1m-00000007rt5-1FPr
	for ath12k@bombadil.infradead.org;
	Wed, 18 Nov 2026 06:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=IybehDLeoJ6wFVaBLq+m9y72vk
	ynNR6+xQG6Zhl5AnxOrc8mn1q2S5EzOkYyWFgVM9VBXpLd6+rFXyyAJobJ1Ux2WTa83LXUs8wGuvI
	v+5r+YPRN760hskAOQJoH/xzLirbYX3awpT0NHv3icgyoY+pXPJGEnSfQb67Q6Ndgsuw5z4OZ7Ijs
	OZyHi954gc2YhowFb7CmOpbAUlXbnwfvns6Oq4zqDrPLYwBQpOIgsLsjCQPtcZh0HyFkkLvuQEtdF
	HlBQiEXpsTAh5+CDTGRPC9UPJF+KQ35sNPGHKBrjzfbhmO+AoSyOE3X9XHXkZoXP5YP61cy5q6Fxo
	vlqPo+tg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ1L-0000000Fghp-08bv
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 06:20:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UvCa3121699
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=JRrD/6XtDsB6Qbh6
	4sy7bGtdYPb9cJE2/2loKnxWE6q+uR9hy9l5Rb7Q68cmJwu2P0E4szy9+pjEjrcW
	KOk+jQzGqhPYWfcSv8wgDlV6X7etDM+TbxghBRHXg4SQzoeM1YoQEzUJtEVz7vog
	B5sMAlmPf69U9vOIPpLikxGqFB1Oerqyhq0h9ZA7LBRovX2FrB79UVpzopQuQM6l
	vzsxU1CoXd6YCCJ/lQWTKFqMqMPoxF5m4jSh0sZnUu6xhbaxACNL2zbKRGD6BPCb
	7qorAaJq/qqTq5mXhgkxJSlRP1ElYj8Tfcfp45U8citY70CC1PlpmKvFlKOGc/Ck
	TfvUtg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hgca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:19:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb8931aeeaso427644a12.1
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 22:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982787; x=1795587587; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=MBnKsXlW6bT8BkWKoMIqYuwzvY7bz95BwHZeW01ro3RpRNQ9HwcT/6Y7MetDM6dXeF
         cQ9cQvqHDxqr/mqrC/v14qWW16nHl/hrwFE6Np0iXz7KhyZAEhoXd+Rqt6wVhTuLKtcq
         hJMeVX6g/++EJhOdrfFZbFyl6DfNJYV4v4cGnRaBigFoKeCp3HQ/vwl7EsSYhvBXV0uT
         xNQIz5QyhvJwGcoiBDrGAjWMwXPGUpHD5lHAZB85FdB2/Y2/TyvfnTY3o37S8EhhS52W
         FAe/PF48M5KS56R2DAKsGvtCtxl1eeeWvZK0ZiVw6HV3URaqLaBcxnPmCsNKLLjc7i8d
         TNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982787; x=1795587587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=UEmSTZysaiwH7dGr6oHkJvVwCis8+Jih8JsMVLjnjhstV2qYzoMtLhFPISjR3hT8Gl
         BgKylCgiyb9CyDyRyhZ2Ohft1WJj3XVeyzx2IdNL7OzQnwleBka5X7xSae+VBWLEks0p
         lZGLx58AVjcbyfQqS24G0zyqdsJmol4n7T2iXaW8hEm9nSMEgVkQFMui2gr5ECWXkahg
         IH/QBjKyjPSaGyBbYX69oTEHen9mD57k6F4AD9ngpf3UA9gjqGhjNcgTinbZAi3w2/Hh
         3Gwg8rEYUNiMifncy4O9sdP6lPLTo+YZj2AkcEZZ0RJpsKZw0CIdqdPANVOQiS6tOZJc
         kgFw==
X-Forwarded-Encrypted: i=1; AL+hErGyZviEyI2jHB6VCWIChVoiSvHuEcWeUVeG5O76Oeh8p98Kdsg2gn1RaTgBU/4T6kZCv1WFNnM=@lists.infradead.org
X-Gm-Message-State: APuU4Z8/Sv8E0cWRBgrQOxNqLYdimHAkADAzBaQlFcwp6h2WglBRw8gv
	drAfLl5Ih4NT1EWefhLFhDjMxxUYf/tq6MSXs4FvjhTKokC4dzh1zeRmaX+4Ldf0O3AFL0b+y5U
	2nVWfkBUKh0bE5mE58rrCdVwS1NcqYRJpTZPF198km/9Hh76MQpRSRgUAD8fDQqei
X-Gm-Gg: AZFdTZcRGmcvDz7Er24J/ELrL6LpeDJteML2g5JMWxNZOun5BIcJFosiShG3O4mXnTn
	UQdTDnLPU9hABE32WVRqr6r7Fpqd7dzcCZWMt73nfwrDNGQJwMi+NoZ2LeBkuOrrnynE3oidMcH
	mXYQj3PDYMR4zKBQQhuOB2lb4EHUBdZaK8vovID6lYK7gKFgmnpM/kymnuq7C+g7PxaDPSzdZrX
	emGKAxYsPrBXWl5M4PuMt9QyWLxtf5//Mk6J9L9h3I+y72YhUaBSFJ5lpDN9BH51PCkK5ZTUO0d
	kbaRgWAt6nr7jRlxzQ1V3T/H6dIHIcSfjn+2b7mFW4wV7tV4eGRd/HcIQbgLtEKO+lg96NT7r40
	BbQo8nQDJt4UKEVcFrxLtvHBipPYZKXQ9mnEmybV5qzFMqsV3khh6x1hUP1ZCLeZKH95LrdV2QH
	e9CCBcrxGEl62tIMx+8h9yTJsdRb8QzFJt26cvTEROiOcasFkik+XAkYj2mxCgcgeJKVSTs0uzx
	6w=
X-Received: by 2002:a17:90b:1d04:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3b3d07a5375mr1531485a91.42.1794982787354;
        Tue, 17 Nov 2026 22:19:47 -0800 (PST)
X-Received: by 2002:a17:90b:1d04:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3b3d07a5375mr1531457a91.42.1794982786698;
        Tue, 17 Nov 2026 22:19:46 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:46 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:10 +0530
Subject: [PATCH ath-next v2 07/15] wifi: ath12k: add Wi-Fi 8 HAL register
 table and hal init hook for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-7-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-GUID: I72sLkB4VSfoLNytkwrlwLLG1xag3NCA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXwgR8Zo/PlrMZ
 ezM+45KilxCyJqNcm9aG1Fr4fhhMFlzBdFqCTwz+9aaKrV88Hm5Lcqs55UFF07Sdy9lPf79N5PH
 92lklGeowjjj3VI/82SvckMGVmOoTTY=
X-Proofpoint-ORIG-GUID: I72sLkB4VSfoLNytkwrlwLLG1xag3NCA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXwsy8zyOm0aB5
 7i9badAFWZSEjXwuTzMGllYuqHBQM/H0JjGsRLz6quY7D64X88nbbj6Tw95l8zsEJv4OE5VGrIg
 50fg1UP6SYRrJKQvUUJMBUCPOxWFwdc+2qkQBdlxENUQ/LY/qv8HlDQtJcmz5ydf+MMqQ/w6p6r
 XQvVXIwflo19SpE5ra3uh9NEMyWzifZgQCiWFdM7ayYkNbQtBUid5wRHcEBVhYqy4X7PCS6JZ0J
 jg5syEuv9kcxW3gO5FOh+oGlIZYPY5/Yf83vxiOR8uiqNUjKm3wIbB3vru8p/dRpy0dq3R6kUI+
 y1U6nXYT1wxpXRRHOy+g55PZB1BpDOlaU0Dof2L5Pt5MqqolRseJDm4xlAXhRUwL3ieP7EG0l8B
 jP5ph+HW6nTzAFmXrwPjO5R0lxoAABAmMFUjATFRC8tta+tnAU66RPwElrcE8usdKVUYCQ5ZM3B
 fKQ/zO+aqi56vaMo7yA==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd4384 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=k5nCMmGC1qFvne7xG5UA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_062003_042070_94694555 
X-CRM114-Status: GOOD (  18.10  )
X-Spam-Score: -0.9 (/)
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

QCN9575 uses a different HAL register layout from Wi-Fi 7 and requires a
dedicated register table and HAL init path. Add QCN9575-specific HAL
register definitions in wifi8/hal_qcn9575.c (qcn9575_regs) and its
header.  Add wifi8/hal.c with an ath12k_hw_version_map entry that points
ATH12K_HW_QCN9575_HW20 to qcn9575_regs, and introduce
ath12k_wifi8_hal_init(). Invoke ath12k_wifi8_hal_init() from
ath12k_wifi8_hw_init() so HAL setup is hooked into the Wi-Fi 8 hardware
init path. Keep HAL ops and params fields as NULL placeholders;
follow-up patches fill operation tables and remaining HAL parameters.
Update wifi8/Makefile to build hal.c and hal_qcn9575.c.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/Makefile     |  2 ++
 drivers/net/wireless/ath/ath12k/wifi8/hal.c        | 23 ++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal.h        | 13 +++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    | 42 ++++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.h    | 13 +++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         |  3 ++
 6 files changed, 96 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 277b5f13754d..b1b90c109c76 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
 ath12k_wifi8-y += core.o \
+		  hal.o \
+		  hal_qcn9575.o \
 		  hw.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.c b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
new file mode 100644
index 000000000000..1afc6fc21d0f
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include "../hal.h"
+#include "../hif.h"
+#include "hal.h"
+#include "hal_qcn9575.h"
+
+static const struct ath12k_hw_version_map ath12k_wifi8_hw_ver_map[] = {
+	[ATH12K_HW_QCN9575_HW20] = {
+		.hw_regs = &qcn9575_regs,
+	},
+};
+
+void ath12k_wifi8_hal_init(struct ath12k_base *ab)
+{
+	struct ath12k_hal *hal = &ab->hal;
+
+	memset(hal, 0, sizeof(*hal));
+
+	hal->regs = ath12k_wifi8_hw_ver_map[ab->hw_rev].hw_regs;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
new file mode 100644
index 000000000000..311fc5b8015c
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HAL_H
+#define ATH12K_WIFI8_HAL_H
+
+#include "../core.h"
+
+void ath12k_wifi8_hal_init(struct ath12k_base *ab);
+
+#endif /* ATH12K_WIFI8_HAL_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
new file mode 100644
index 000000000000..56d45785ecd4
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include "hal_qcn9575.h"
+
+const struct ath12k_hw_regs qcn9575_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.tcl1_ring_id = 0x00001604,
+	.tcl1_ring_misc = 0x0000160c,
+	.tcl1_ring_tp_addr_lsb = 0x00001618,
+	.tcl1_ring_tp_addr_msb = 0x0000161c,
+	.tcl1_ring_consumer_int_setup_ix0 = 0x0000162c,
+	.tcl1_ring_consumer_int_setup_ix1 = 0x00001630,
+	.tcl1_ring_msi1_base_lsb = 0x00001644,
+	.tcl1_ring_msi1_base_msb = 0x00001648,
+	.tcl1_ring_msi1_data = 0x0000164c,
+	.tcl1_ring_base_lsb = 0x000015fc,
+	.tcl1_ring_base_msb = 0x00001600,
+
+	/* REO DEST ring address */
+	.reo1_ring_base_lsb = 0x00000848,
+	.reo1_ring_base_msb = 0x0000084c,
+	.reo1_ring_id = 0x00000850,
+	.reo1_ring_misc = 0x00000858,
+	.reo1_ring_hp_addr_lsb = 0x0000085c,
+	.reo1_ring_hp_addr_msb = 0x00000860,
+	.reo1_ring_producer_int_setup = 0x0000086c,
+	.reo1_ring_msi1_base_lsb = 0x00000890,
+	.reo1_ring_msi1_base_msb = 0x00000894,
+	.reo1_ring_msi1_data = 0x00000898,
+
+	/* CE base address */
+	.umac_ce0_src_reg_base = 0x01b80000,
+	.umac_ce0_dest_reg_base = 0x01b81000,
+	.umac_ce1_src_reg_base = 0x01b82000,
+	.umac_ce1_dest_reg_base = 0x01b83000,
+
+	.gcc_gcc_pcie_hot_rst = 0x1e38438,
+
+	.qrtr_node_id = 0x01e03300,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h
new file mode 100644
index 000000000000..e2dd68ebd82f
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HAL_QCN9575_H
+#define ATH12K_WIFI8_HAL_QCN9575_H
+
+#include "../hal.h"
+
+extern const struct ath12k_hw_regs qcn9575_regs;
+
+#endif /* ATH12K_WIFI8_HAL_QCN9575_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 6e89a42111b6..91d8f762e642 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -11,6 +11,7 @@
 #include "../debug.h"
 #include "../hw.h"
 #include "../mhi.h"
+#include "hal.h"
 #include "hw.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
@@ -129,6 +130,8 @@ int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 
 	ab->hw_params = hw_params;
 
+	ath12k_wifi8_hal_init(ab);
+
 	ath12k_info(ab, "Wi-Fi 8 Hardware name: %s\n", ab->hw_params->name);
 
 	return 0;

-- 
2.34.1


