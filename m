Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F093CCD199
	for <ath12k@archiver.kernel.org>; Fri, 17 Oct 2025 02:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t+rnK2SBkgejW+h2uc2RN8cqumDO4qAqva6fj75dOAw=; b=yHUvzj4ZXYcAmm2mSF7wrcCZ2K
	O3at73CorYN6xsN6svnq1RVosMaFuWtEpTm7YedF/jjo+HnVtZcr5NzBk5gL4RnkEZf59ds8hrRWw
	vMWYLK7E53/dtecO9tX3+K4obqW22Ai3q1QOdXfE5UnIqKXTbyLETFZVXH4P38jqwfFuTGxiSJOpG
	8I+9uoIP2rYDfH8xcDuHeNON53K2R9FzPJcbgo0LrizjOqJK6XUPSivdEz1qWZZOhfC05qjFdNJTE
	JwjJOQin6OfB9C0RUmBAJqv6j//cBmfuLJ/JH9I6lRADdDAu+u6xknAtOpxInLqjCKjUOQNBqHCkN
	yb0vxZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9aKw-00000006PYM-3OWP;
	Fri, 17 Oct 2025 02:36:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9aKu-00000006PY0-1wFW
	for ath12k@lists.infradead.org;
	Fri, 17 Oct 2025 02:36:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLQVv025265
	for <ath12k@lists.infradead.org>; Fri, 17 Oct 2025 02:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t+rnK2SBkgejW+h2uc2RN8
	cqumDO4qAqva6fj75dOAw=; b=Vh1qiGO9qQmAs7zxKWcIOb0d7MB5McPiaQY90h
	lEb/Wv35exkI4OiLH0c+NANKGBGWOfP1SGCBgS9ett4uVd5qF4SEHvdLJUZyajFA
	CJqPSlchRx1mwgj6HMuD15YEnXY4V3isE2OpcTItb7UPMqnh/udNFepNQtFHdjxf
	JPPTmbbLxga9n67QrvBKPgUgkX3327Dj0oJsTqlNx1Odc7ng8eNP3k2gevTI8jYG
	9SsVyWfY7DtW6XKyfkmILVwXxDeo9GIjWEXX4mr9sDhl4t3UvaOFHSY9VApmfHi7
	5SPRy0a8ITzDwplsGOLzfP//Mnf/6h+/OlLtsPdAIL07zFqQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkjht3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Oct 2025 02:36:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-27ee41e062cso20496215ad.1
        for <ath12k@lists.infradead.org>; Thu, 16 Oct 2025 19:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760668614; x=1761273414;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+rnK2SBkgejW+h2uc2RN8cqumDO4qAqva6fj75dOAw=;
        b=BGgnV92XqrbjQ7CdGMyGWqgD32/6GPouvLufLi0HcROa0SDxEve6RWHJkQu67Frdqs
         SGaBFf9KDi2wmBezwyaFdlPNXgr+h8LqVNfJmpSdgOdIlkswuRQkXTWXhm/AqXQqBELG
         AR6fyzrFX9Z0HuZJNJ/9dXAssfToHhbPzEAtJg4SbV5MeZoTr+cBejGy3XTslUXdXxUr
         Lu4hkUFgrdkJqe2rCjzWX8B+v3Qk78Zi5odBuasB/fTBw2kKdM0VCrqyBVSlvCfrcww1
         6VwM7TrQOVnLODegBeSg8kHWm1yU2eZSEfW+N6zml6qzv3eMJcnYxUQBqaAfYdxptrUz
         RuLA==
X-Forwarded-Encrypted: i=1; AJvYcCUk/S3oBmNIxSYeoJDcYQrxnW782idVwcRf+OXeO3bC2yO7hFE+/35wqIuHM9h1uyKpvaWU40I=@lists.infradead.org
X-Gm-Message-State: AOJu0YyzonQ5/1XkQia7BSjWq6Q/kzwWgDF3XoMOzRBXECLOmercYFdK
	ytALNSevxIh9xhSvifJ90rLKszaGlh5jEwFEdQOYsxoDxZecbwOzE01WzG2RF7HyUcksUBnkEdq
	Um2tNG0q1q4pgkXNppOhAQEO4HN1j02dA1utEnfEVbqIBw0LxYgagckNOjtIqtFULkZsZ3asS
X-Gm-Gg: ASbGnctv2HxefzMDeCRI0PNG+CPyxuezJscv9U+55jm7aQkDvIF/llMViwUXxviFsuU
	3AYOIf7b2D8GaRRucfjw/I4S8pKJFnYVd2nQ/jvuBQ3T4h5yqs/IOOfFUXsO/j9DUONZTY4dHU4
	ES/YU90a9dNiYY9+cDkpd2QLplqr6sTzAjUnbolbPaq91PdVdvZKjE+usfVULBkGmjQV25ZuHvr
	LIas/hQw6RZ8Q9AQ3UBNOEn9OSw8Uj+WNt3jqHCdtsiuqFaNwLH74ZRZnDXmN3Xcb+PguS6xcvV
	QQ33BM7q9dFSPd69kozDrqHChmwB1q3ap8FMWMcZ0dL8my1hjYSzwR5JsgD/VXMI9WcfSMyqe64
	owwSdV6zuLwgARjQiRABx4cbpjLBDungnCnMFWIZsJ7xwrUPTWcgi
X-Received: by 2002:a17:903:3c24:b0:269:8f2d:5221 with SMTP id d9443c01a7336-290c9c89cd4mr27124245ad.9.1760668613950;
        Thu, 16 Oct 2025 19:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELcgfI37vYNA6c0ZgvfiHA4l6S2SN/1iT0YUV3kI/I7bcIFYFC9cdrph4t3DVpoN4KCVVzLg==
X-Received: by 2002:a17:903:3c24:b0:269:8f2d:5221 with SMTP id d9443c01a7336-290c9c89cd4mr27124015ad.9.1760668613476;
        Thu, 16 Oct 2025 19:36:53 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099afd74esm45706065ad.113.2025.10.16.19.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 19:36:53 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 10:36:36 +0800
Subject: [PATCH ath-next] wifi: ath12k: restore register window after
 global reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-ath12k-reset-window-cache-v1-1-29e0e751deed@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALOr8WgC/32NQQ6CMBREr0L+2k/aBhBdeQ/DorS/tlGothUwh
 LvbENduJplM3psVIgVHEc7FCoEmF50fc+GHApSV443Q6dxBMFGzo6hQJsvFHQNFSji7UfsZlVS
 WsD/1FZlGsLoVkPlnIOOW3X2FjOFIS4IuL9bF5MNnP534vv/87R//xJGjZIZq0roxil18jOXrL
 R/KD0OZA7pt277u0Be00wAAAA==
X-Change-ID: 20250724-ath12k-reset-window-cache-b9b4ef620582
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 2ybvs__X_YAKdQT1bhtLUl3nDe41tImB
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f1abc7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qHv5NdDvAEshpcKH2xcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 2ybvs__X_YAKdQT1bhtLUl3nDe41tImB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXxo9Jca28gWAM
 gHL0GF388YU4UXJ4gpjBGyha5OGWooxNelNAvD9A0AHjliJjH3lc5KQuhuBTu6jw1iwFrXNyodB
 4qXyjZMO0Dd3jeTrGABt6MAtulxO9/uijxhLZPtE/Z4Gszh9uof1m/sB7+tnChY2vrgTUR0g2nu
 S6Fds0hwNe2Lrya0mwm+wrr6UtU8p97GtK8/v+oZBiqsDgRcQYxYmHOferwpHThE9o0olbo+u/7
 TjCG7yP+draygW0kdLjrvtkXAYM8Az9l3y9cUNYaEWoye5z8aaW4kYTPh+Z3l3LAOwLQrscVq/w
 +LslQBYnrUmUOH5N3yFKoy9ho0ECM7A1WsPnlzig2OIUo/TV20LWtr5scvvYoi+mjeRreCB0oRz
 lJKsuNgZzBzy9Jr6ieK5rMIyJZCdHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_193656_648812_27F26627 
X-CRM114-Status: GOOD (  17.54  )
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

Hardware target implements an address space larger than that PCI BAR can
map. In order to be able to access the whole target address space, the
BAR space is split into 4 segments, of which the last 3, called windows,
can be dynamically mapped to the desired area. This is achieved by
updating WINDOW_REG_ADDRESS register with appropriate window value.
Currently each time when accessing a register that beyond WINDOW_START,
host calculates the window value and caches it after window update,
this way next time when accessing a register falling in the same window,
host knows that the window is already good hence no additional update
needed.

However this mechanism breaks after global reset is triggered in
ath12k_pci_soc_global_reset(), because with global reset hardware resets
WINDOW_REG_ADDRESS register hence the window is not properly mapped any
more. Current host does nothing about this, as a result a subsequent
register access may not work as expected if it falls in a window same as
before.

Although there is no obvious issue seen now, better to fix it to avoid
future problem. The fix is done by restoring the window register after
global reset.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index c729d5526c753d2b7b7542b6f2a145e71b335a43..60b8f7361b7f63704cee79e0013804e71ac42d7b 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/module.h>
@@ -218,6 +218,19 @@ static inline bool ath12k_pci_is_offset_within_mhi_region(u32 offset)
 	return (offset >= PCI_MHIREGLEN_REG && offset <= PCI_MHI_REGION_END);
 }
 
+static void ath12k_pci_restore_window(struct ath12k_base *ab)
+{
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
+
+	spin_lock_bh(&ab_pci->window_lock);
+
+	iowrite32(WINDOW_ENABLE_BIT | ab_pci->register_window,
+		  ab->mem + WINDOW_REG_ADDRESS);
+	ioread32(ab->mem + WINDOW_REG_ADDRESS);
+
+	spin_unlock_bh(&ab_pci->window_lock);
+}
+
 static void ath12k_pci_soc_global_reset(struct ath12k_base *ab)
 {
 	u32 val, delay;
@@ -242,6 +255,11 @@ static void ath12k_pci_soc_global_reset(struct ath12k_base *ab)
 	val = ath12k_pci_read32(ab, PCIE_SOC_GLOBAL_RESET);
 	if (val == 0xffffffff)
 		ath12k_warn(ab, "link down error during global reset\n");
+
+	/* Restore window register as its content is cleared during
+	 * hardware global reset, such that it aligns with host cache.
+	 */
+	ath12k_pci_restore_window(ab);
 }
 
 static void ath12k_pci_clear_dbg_registers(struct ath12k_base *ab)

---
base-commit: d5ce93f136fbee2b7afbe221f34ca881036f8de3
change-id: 20250724-ath12k-reset-window-cache-b9b4ef620582

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


