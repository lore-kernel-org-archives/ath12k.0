Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B3860713D2
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q9MMYWmZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=KpJ5MVqc;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mS57UF3t;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h7C0qxqZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=Q9MMYWmZanHe7D
	ow5JfwZDJ6CqKL1C7P+CKQUA15VND0Xuza5ynUwrInXUpqc7WKCFmBxatsz7GfRZvw8aT/0sdEAhi
	kwC7fOQEpqrQLdJ8hWUxJNw/smCWjyOSrmC0c9OF2O1iNrnF1yLB/5qP24FMmn8o/ryzCrKAclF2Q
	T7OxABDRdHa8e8KPji7Ior46VrGmy0dAu4Q2HJj4G+EJhCqhVt56QDVtuftu3xCjODzqhtOr8Mk6t
	pzXW5mwjObinihm1gKKKq2vyNCdmBbC9C+jarS5Z/hKkl9V9NT4xg24To5V+SC6rYCSi2bT2oH5lS
	/D/cXTpqwL0Ne9wOXb3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQK1-00000009AcW-2eIi;
	Thu, 12 Nov 2026 08:38:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQFI-000000098S3-3X5Z
	for ath12k@bombadil.infradead.org;
	Thu, 12 Nov 2026 08:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=KpJ5MVqcq5hsuY+iIIQRJGMNgw
	ajgUiKq0CGF9FAUmR02caELxN3hc2bc4EKSPj+0f2Aj3ReisCZKj35ylm6ESGRf6Enob1brVR9mCS
	fuyhi5LMWSaQi9A7xj+0LdmvqjUJLbg4kQffPYqz1j2hvI8YSzLrCQDpuXav4Ioiv8IsnQlkbkv20
	5lH/NQca7cPWlMrC8F/u0hBIXnNjaV2LBWbN8JreFiXma8SF6k9UiP35ZGjPFZYY4lKW6W3u6b/7d
	gsK/iN81SlJl4u2DwHCS9A3fZurtLx+I1PaHmCVNx8G7pCYYHQ092HJkCXLV4mZBNimdty+fYx+vD
	0h7u6fXw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQFF-0000000A3Tt-4BAx
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 08:33:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZmsP3813322
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=mS57UF3tUgxFrlxj
	xB1z4moWrZ/cepUsWIaj9Xw4c6DddzWGrWZ5DN3zr0NQZUhDRUr22twDmG1EZFY1
	LeTcCeOKTsdTpFAU7H14mr/i1GzX+0G6dUcQIPT+XI2ROlQcZLiZ9uC+hg1x2RMZ
	RwSgCOMRN2cPqipFt0gpaknCXNO8ErZ0g8xpNrGrWzumyQMTrsU7/SleTwJomSSv
	q2KeSy5KdoAOg2B3QjmkcAP6W5+52pQlX6chy3AOiMSiJs0lpUJ1ppqzz1XjOyPF
	zbTI59XXvaL9zAs7VaqRL2EWi/HPBSyfcBzTbDMs15Y0/NZTBuEcJ5eo/WZnMcN4
	bsnKag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0jy8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:33:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so1319531a91.1
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 00:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472399; x=1795077199; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=h7C0qxqZp5mah3DtaL/ZOHrcHbEY2UtlD+jhf5yx1xecoIPkfKAAMm1A+VO1pQO6qc
         +Zvjx9Iflz3T8CxBjgoITHl+vieC2IcfMUGKj5x/3bK09fuVtz5tCCJwaHijHEJ+kR38
         Zd7d6D1eL9DhRA+RJsMPMrg4ZcieLaVabpDZl1f6Lm3jj0m4x1mqeGjMF+0qcajp0j7C
         xPhm+adl6dFUVMiTn4FfCMA7ZHY5e5Ab1nbMYBByIlXsmNhgo2/N44SzaCxibhR6tFQL
         RqfasrgzggKinQT43V+Nyoc5f9HUD3OjqOf4UrF3TkWybfmKO8ovzKL59qtZ/okcCTSj
         p1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472399; x=1795077199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=KKK4eVgH3fKtsvOLnC1SIxbjK7fJ1133/zEMJFj9gPjm5CrF8J8+pO1U5mFsIlKT08
         tMbfg/Y2ICChQFRIMLHjR4CLi2CbabxWJ5jXp/8RGDf3qyDe8C3P8TafH8MMzmjzzupO
         sp7pZF7mt9REZEDMV83xrWeQhsUsT7Mjixxn4Geg0c5KKiHiJ/E3/tAndOrurz6kF0jG
         C+uh8qcHbXaVYl7NU1Yuk3RFoBKFwKe4INxTdxGDNClsj3zfCi8S4B4GHxW23cz1FI9s
         xrsDxlfw0fT0jA8AN+VeABWyl6wRoCSIdYsMn7M0Fer2TfshxcKj19QhjECqSIyOBrCu
         7Z9w==
X-Forwarded-Encrypted: i=1; AL+hErFs1oPiDe1tT62VxLNhj86t0TOMlkJNbkH9RaUc3KtxsyzPT0TM783ecgWUNfrAjSUyHU+mbdI=@lists.infradead.org
X-Gm-Message-State: APuU4Z/8hcs6V3uTdTOKdJ06PoxIzsRX+19Pn6/5FJO1Use8PkSAPMz/
	DATg/t4KkAzqoVpFTCwHK1nSjGPbH9NK2XTl/Pmdcw3LvnkJKmr+SUCElcL46RPwAiVWIhcjmyY
	ZcpPt1MGd6qFr4coZgwTiY3stACgo+ilW9Bm4pPwszTNL27Oycj5ZuUyCz6zTFMXj
X-Gm-Gg: AYBFou2LDJP0VEnDeu477t/v4eAeC3HMXcxtGLa2kJ6mZSM4he1yXrQ3d0NppcbxY3I
	M30d0NrrgoI1zi70SGWu7L5+UrPGYC/l9YnRYqP0VXiE9yPZ+0yyB9Upq40W2AW4Mn8lBGqvaW2
	+0KuI1WMVJ2zmIjyfp11+zCqXGc1CZbPl2fMHOTRMDvvdOI4XmnrnFdprAnagB1N+S/yp2vgyFU
	Ct66p6yEje0Ev6Pc8G+3X3MQgHFI1tj35decNjst+YlcevV9/JviIjX/JN674Z4tSk5aanserEr
	CUu5piXaMDX3EVAP9KB7yl5Qe5hAcn83ph3QwNHheIq9rV1ScPNPqycgxGxrFtWONQvqVCaIHpi
	ozk6mrBABh2tfJucUUVNSZHiU19pVmIHx26bDvjrjaW+k7merd3iGDMHd3zWEGUIlZN1Dbo9aWG
	PDqJlMKEsRmAalPY8ZyuqQ6AUr/QfyPZVuM/S1pW2HpOecd3x1aKejV5aHfF0FaJtuLcQP4oBDq
	w==
X-Received: by 2002:a17:90a:da83:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b182defb03mr4885532a91.7.1794472398760;
        Thu, 12 Nov 2026 00:33:18 -0800 (PST)
X-Received: by 2002:a17:90a:da83:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b182defb03mr4885514a91.7.1794472398263;
        Thu, 12 Nov 2026 00:33:18 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:17 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:24 +0530
Subject: [PATCH ath-next 10/15] wifi: ath12k: add Wi-Fi 8 MHI config for
 QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-10-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-GUID: XtOrMPDDkEawzdyaqMKY0P-IBbnuWpU_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX9xz+cRBKRxy9
 EVgXuj43dwJd2j4KpybyTvr7bRR5QzJh+qDLnjedPvkJbQNFR/WXaDgQaTm+Phr3YujGf2F2NIr
 4mjmnl6yKKPRrqBklTDxSEYTgce4N0d94eegbx64SjlluD168SyVTisz8dezCiIghZ1h+QwzFLV
 unFoiYSRDDT6gnx08xEk3GzaJnphOz4x9pImGwI/oH/jN187MY2Mli69cjGrKFGo1CZUZA54jch
 xJPwMdXSwRPOsCTcZh+JcEgh7ZLqDX6HhawaGdf8c/8RKreV9n2aXHxUH3ZIt2waRt19iarmLlv
 n+G5572nXnWycgQI4ICBNfFJdWb41qhVWFMIV4G7yhzhJABTw/Q9fIwY9hqtc9Y6xYnBbhfUT9S
 zmPNKtK7OmFthXz1FVP7XvL7vZYZu6aiona/s78WFGzm9mw3XOmaO/XRJl3Suk2bCirC3rPGUD5
 qhvvi0YCksPfiOMc/Ww==
X-Proofpoint-ORIG-GUID: XtOrMPDDkEawzdyaqMKY0P-IBbnuWpU_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX9xAFYB7+u1hr
 Xpdoi3mejF/qSkRVTWOxrXsJNwlh94xxN2XSbWr7H9IhdMN2jp/alLekDpHqGB6kjK6CBK7Vn6d
 x87S5VC8USBFWADf8GY8SQskhgYXvKk=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af579cf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_083322_187271_547031F1 
X-CRM114-Status: GOOD (  19.62  )
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


