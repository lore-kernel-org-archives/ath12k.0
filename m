Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7319606A335
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=092gnzHe;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWwCqqvm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kc9vNP92
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=092gnzHeTTnZ9z
	pcl9yyrpsUail+HTnEszAba+u+wuGIMN2+04k8Qy1hNQQpDAwh4d0BxTZz+6pWdeNIbRQowsLa1Tv
	4S6TCHtBvDC0B9h+dkoYyS5AKPchZL37VWvqgA4VhytnaMYkGpxJU3jNvV1Py9dz0bWA8b+fAYt95
	NjWAfUnmxInMoTim5gvoFF2oW1WfU6gL9gthBYjYhn5gAi5YAzR7M6DSh7ROpWvxcBPG7Z0BUhw1S
	fxw7R9jeFjfaDAXX6il+PmiDNopTSUk3u8Xmr9J/wRE1i+A9JZJICZCb7Hxs6RmS7HJjQ692xmc3X
	KrW5+KurguHJu63sgiiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtcm-000000079Xi-1q30;
	Tue, 24 Nov 2026 16:44:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtcd-000000079Si-16KD
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 16:44:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL18f1872699
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=WWwCqqvm0H/6V+XN
	+5OtzpUE6C6N2ABlGE8AQ+cyjy13MueChABpPBU5MDIhuSCEz5/sJewspvbVuj8R
	PHZzEXZgPaCMjYUqTaBJHAc+lYiyfQ20Ao06hSbgo+GjGrEZclVpmnx4WRDlP6hW
	CfRPpL7DM4IyhjQrfDb+ITeTbz0m93nrtjkYh9/u+mwdb1xPtyCNf6qnchBhM6fa
	vENDM04+KrjgwgzoWeQOkOrXPUIT5gU9LOTQsMdDj8dlfAA+S5W0SOCx8eKL5pPw
	+cN7I+06Umm83CDR427FeUQSCiyLHeOngUP9viWa7qQtme8SLfib+2Z6oXT+54fM
	Th4CPQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxk8ej7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:43:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso8286082eec.0
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 08:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538638; x=1796143438; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=kc9vNP92rr/YAAkbTlaB+Ql6OteFP1t2x2DwNAUE2zwFTCVU3QCeOol98TqMK+AJvL
         mQQgmN36zefOe6fAf2pWkyZ31g0C3XP+V/LRpZC+z0Qy1KDsCjo8d0eXIGLtzjB9TzcI
         k9R8VywoDJwrdDygM6QNvdDr1H4xapKfOJKvOIWndIwlCTZokXeMQI90I+fJiHlidl1U
         lkK/XiXvL6WTGZx6JX7xsio0Gt2FJZtsMyS4Nqgr75RH9BVvZN8Zhg5dZfg7RvX7KywL
         Pq2HvioD4xC9Id0VdheWgYoFoor9RDq4bzKzeT8kUzCm4GtQcZJWsp/Ccpg659u3AKJk
         K4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538638; x=1796143438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=WpvDaJ6zaeegBQSW2y2zAoyWCU4bP8HrOpnNgt/FkxKSqPOkcKLkvliMrjd+3hl+Lr
         e1xYE+H9Mo0BP3gCcQpJP2aAveG2gP60Prtlb6yCUc5/7Cb5HibERCWEEWiw1a5eaVj+
         CCohWD7RkUN5+igDTTJNq9jQ+vpMQVq62uijUsyfWx4OoZPNXwC0aJ8y8/30nHtkz2hz
         bYWQDgO5kJsiPh7o8Q5e5uj1ofrsf2x8wKM2DwlrwoeDkfU4SDw6uoqc/neekPENnkfO
         XbCHgxr/hF+TIdymGFHOl1GV8hd2wDUIm4FUdqCbkcyPjoKA5+C/oYwqbi/FO15Knwg2
         g0/g==
X-Forwarded-Encrypted: i=1; AL+hErFU9T89B3oWG7gK1VyStX7ktK9aZDDMDxRNKhVDSO+zBJEwbnMap1zYe0jwrirSdHAlbVcgLfA=@lists.infradead.org
X-Gm-Message-State: APuU4Z+JJPd0CYT0zlW95/THhhCoqhKvf0SaiQ5CwnYCHHefjNztNILL
	6NFwxZvKCsQ+P7qKsZNzr6aBE9xTcuz2d7VV1qDurrcgjlRVMLRt0r965g9qAV9eNS8bPkJQBbu
	+m79cOYJxRU0JfI/E/897lyv1EL/yY5xiEaRVEYLa2iIS84g0cajnNlSXpra9BRN+
X-Gm-Gg: AZFdTZdaZf6NjOP994zYjCpLsFK4Lpst6eI6Pu4UFGIIzh88aJpjo0Xs4gbsAHpUnQO
	DHgxhqsy0JmjL/NMByDWEVQhM/IrJJO//i8B6Za4E3LBQJbX/7kCpGvxYQ4J1AnLTTuxTUph5G7
	j3nWsGBkQhx8/piI+zWv/5uZrqzxQRi7RaxUTGX7VJ6in95kVKeFk9o0gYoJRRPW0WEft/+wz35
	gAnYqt1jQvd2wezl9+zOBCdQH0MvIx/DN1cS7lv00yIX3WoAKlcvZPWTWH8z9boqw5qtAlC0lkG
	RKPlT0PuPUISHhPIk/dTMOw5AyLwa0je7elI3v0gzMX3uEaFgoFkb2qkJO6ze016LULxJvKdN0V
	roSuQrwdn8xlRDm34ELzrjleYxu6gf98Ocrru3YokXieStY3wch3oTCzHbp5YWx+A6j+wkB9U5E
	y/0Mx6812FL+BlgzSiKkqFAHkp3pa8yk5Et/TVSauNBWrMUyCOxFx32Bw0mxYuVopni0CSloFOk
	0Y=
X-Received: by 2002:a05:693c:4196:10b0:386:a97c:f80d with SMTP id 5a478bee46e88-386a97cf86cmr9886155eec.27.1795538638042;
        Tue, 24 Nov 2026 08:43:58 -0800 (PST)
X-Received: by 2002:a05:693c:4196:10b0:386:a97c:f80d with SMTP id 5a478bee46e88-386a97cf86cmr9886121eec.27.1795538637480;
        Tue, 24 Nov 2026 08:43:57 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:43:57 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:30 +0530
Subject: [PATCH ath-next v4 04/14] wifi: ath12k: add Wi-Fi 8 directory and
 base module scaffolding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-4-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX4mRV/N6/37C7
 sEIOyoTZWcXSKqnWAuQG8xQDVs52q1pdcSur7HRsQNXCnbm3Itziyy97qimnXxsgqtSiBlaybYB
 iFBz7sVYxWB2TwbFoBjUllskpiOet6u8+KtWdFrZw60xEucXEvKuxUCmLCCe7PTQzDSiGGrDZrS
 LEIyG0CqvJLJFrFDY7eXfYQ+YHGn72hk3SGLln0heph4RT5E4+PqL2pm/4nec5H1IsB82lmM61D
 IKw/0sjmjlQAAu0U6o0gSHA64rCIRYRI4Yjm+y3O1cgLxsfws+LOzaAOXGovJFn7iMk9BJcFlOw
 5k1M6HG4eTT2MCejp+o1gv6GpmOTdzLsnf9YBiloKmWHvqBdkPSGRWftjfrb9xTiBge2uX4pzrV
 1EdIanpmmsZNWpMOYqpJiKj1u/bPgsgqEIkzJwcKiqhNJzQ/nrlEwTS2v641SpDcerBAm42fVp0
 Y4y944AbMvXXyUIOaIQ==
X-Proofpoint-GUID: tgZubxjOd9S6yUmZBdx7-u-F6Ur-0J3d
X-Proofpoint-ORIG-GUID: tgZubxjOd9S6yUmZBdx7-u-F6Ur-0J3d
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b05bece cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX8y886BF6KEDf
 HXeXaDyKA1jACp8b/nYdEkI2n9J+fXJNoR+4Mapyuc/YcvLaZM3IVIjTbKof/rVoZbYfxeklXHy
 j74o9jLBNLf3+zlWXddAW2rVusBOQSs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_084359_330741_3427D6C1 
X-CRM114-Status: GOOD (  17.76  )
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

QCN9575 is a Wi-Fi 8 target with a distinct hardware family that cannot
share the Wi-Fi 7 module. Add a dedicated wifi8/ subdirectory to host
QCN9575-specific code. Introduce Wi-Fi 8 build rules, base module source
files (wifi8/core.c, wifi8/pci.c, wifi8/pci.h), and add
ATH12K_DEVICE_FAMILY_WIFI8 to ath12k_device_family. Keep Wi-Fi 8 PCI
init/exit as stubs so the module builds cleanly and remains bisect-safe;
actual PCI driver registration and hardware support come in follow-up
patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/Makefile       |  1 +
 drivers/net/wireless/ath/ath12k/core.h         |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  4 ++++
 drivers/net/wireless/ath/ath12k/wifi8/core.c   | 31 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.c    | 18 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.h    | 11 +++++++++
 6 files changed, 66 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index 861ec85eebed..332110d72a1d 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -25,6 +25,7 @@ ath12k-y += core.o \
 ath12k-$(CONFIG_ATH12K_AHB) += ahb.o pcic.o
 
 obj-$(CONFIG_ATH12K) += wifi7/
+obj-$(CONFIG_ATH12K) += wifi8/
 
 ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o debugfs_htt_stats.o debugfs_sta.o
 ath12k-$(CONFIG_ACPI) += acpi.o
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index a8e8a55aa718..2a4b5e5e1af3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -956,6 +956,7 @@ struct ath12k_mem_profile_based_param {
 enum ath12k_device_family {
 	ATH12K_DEVICE_FAMILY_START,
 	ATH12K_DEVICE_FAMILY_WIFI7 = ATH12K_DEVICE_FAMILY_START,
+	ATH12K_DEVICE_FAMILY_WIFI8,
 	ATH12K_DEVICE_FAMILY_MAX,
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
new file mode 100644
index 000000000000..b8c5b6d3a7bd
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
+ath12k_wifi8-y += core.o \
+		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/core.c b/drivers/net/wireless/ath/ath12k/wifi8/core.c
new file mode 100644
index 000000000000..9253ef9d9cf5
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/core.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include "../pci.h"
+#include "pci.h"
+
+static int ath12k_wifi8_init(void)
+{
+	int ret;
+
+	ret = ath12k_wifi8_pci_init();
+	if (ret)
+		pr_warn("Failed to register ath12k Wi-Fi 8 PCI driver: %d\n",
+			ret);
+
+	return ret;
+}
+
+static void ath12k_wifi8_exit(void)
+{
+	ath12k_wifi8_pci_exit();
+}
+
+module_init(ath12k_wifi8_init);
+module_exit(ath12k_wifi8_exit);
+
+MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11bn WLAN devices");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
new file mode 100644
index 000000000000..3975081d167b
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/pci.h>
+
+#include "pci.h"
+
+int ath12k_wifi8_pci_init(void)
+{
+	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
+	return 0;
+}
+
+void ath12k_wifi8_pci_exit(void)
+{
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.h b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
new file mode 100644
index 000000000000..efe02721e470
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef ATH12K_WIFI8_PCI_H
+#define ATH12K_WIFI8_PCI_H
+
+int ath12k_wifi8_pci_init(void);
+void ath12k_wifi8_pci_exit(void);
+
+#endif /* ATH12K_WIFI8_PCI_H */

-- 
2.34.1


