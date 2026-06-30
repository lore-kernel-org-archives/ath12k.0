Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83775C43327
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 06:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1sew3R7z0WlcrCJ3IJSLd4KUPosf5U1/TQ1P+NsWe0U=; b=wOB/kbxWZNnL4VyIkUzfyXey5s
	LzvpsjgOWaIQ2MEhXX+Xt4jhltumCRatsO7PjG3oK1/y9soteEieuUBm6jT+XtpRxIIRfaYeKG6Dk
	a+yp/pzOv3QPcB/03b5ZosbQYz5KYL7KN4PDgyk0zYHYE84DepUkNWNK82E2Pee4EZrn9wAT0e1fF
	jw21FgAT21OWcqHsupo3Zom7Lyreku630K4ij/J8El4FZRRj6uWGSdmsz5DG1rd2TiK+SQgpMkhJt
	GAELiTf1qDx6QY0nmGBptvrvUfJNsz4boCGfiVMkCu/bklNs0u3HhZjly08TmYc5iCDLwBbT3x/4k
	NiBYDWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRqA-0000000Fuwb-18ns;
	Tue, 30 Jun 2026 06:21:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRq7-0000000Fuuw-2xIm
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 06:21:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CPn41097887
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 06:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1sew3R7z0Wl
	crCJ3IJSLd4KUPosf5U1/TQ1P+NsWe0U=; b=V1txEdHQFvw6gU9wsCSUHguK7xI
	PyEX3ayEezm33M+iozWwn1Z6dj7etE8YH4LCV8/cH74qe7HPQgXAQn1RBQDaf7ls
	O33oeX2LA+tOrOONCPfUpJUV/6C/aWh3zSBZBT08lAP1dNjD9amhPaokTBC/OwWs
	LC/iAyG/gpB1z0axuM/ur67QXAgevho84rjiIuybVDDBRAA1khOFyrEwcshbgarc
	FInj854B/D9Ee8ZJ3nEjzCZQyOBMOZchOV4iL9QJuIXl/lmHAXEQ+cq7zJqhPl9K
	5cNbcJSRsTk84WZHXcpBFTh6m9jUAUP/QrqXAWOw5//wUu6ZPDxkoFMre9g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1ct5kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 06:20:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf55c3f44aso2431515ad.0
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 23:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782800458; x=1783405258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sew3R7z0WlcrCJ3IJSLd4KUPosf5U1/TQ1P+NsWe0U=;
        b=EgBNUl4jM9jD272l+my+jv5qOFifIY1xy7l4+7EafnOVMYiAI3toyStpNPSnNW/DZN
         i4lU3izkXuMbuKBqmCfs+jvHSn9uMiMmvxoHZJPwRTLCq77XZbPXlHauCTnO/KQ8NUNg
         IFcxkZGFEgIZg5ZtuRHwCqWgbR9bauBMVUUaSi2t7AqSwXqJIhnCyhpHnQRp2DAWuDVd
         1IrPNmLXiIjAWG5idQ+jlIqSpI4fzKQTG09k2YHZR6V4+LadI7l27XCIaU5AhRr7GHIn
         XsgGTmBnyw3rDVl3NskGRdPrVzsgY9s1R+rsVKX6M4acA23c1IZkTMK9lWEcfntIVqck
         SyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782800458; x=1783405258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1sew3R7z0WlcrCJ3IJSLd4KUPosf5U1/TQ1P+NsWe0U=;
        b=IA0j1FloHOgYKEKbAnP7y/pfJsMjmdovvR609X9hkHeHeNYidbwK+djIRHGMYzQE78
         2vzNwJOrADX+92PzEbryBMTbIPpFaKqp4ZBV1PJcWPBqKdqxYgODJOy9vejVvPGu8r2r
         UVyk2ee72Zr/VlIy0DwHimS/+BIK91Jn1lVgqsDukj5PPEShfgOWCtEJ2iWNMORQVzqg
         tNfQrvSu9B3pNhYRmuVOYmN+ENf0hx+ohYHeyJYPwbk1TYCzqVbiLzaOPZuQCQA8xtFZ
         PGHKvdns5DA4/3gWBvZIZnN0lFCC0F4+y1LB5IE+7CS9fhQe+8x0Th64eHLN7vVwzvB6
         pQzw==
X-Gm-Message-State: AOJu0Yz8g7t50SmjLNFZymRyw67g1w9RVycrViwn35wm6zpmnZQRGLRy
	p8IKTUAVtvrrj1va7SZmYDwhog/WLIzmlR32LuAeMHROYaE9A6fjFP/3HtHOXcxFJnZhGB5XQNs
	Vr3UgaZ/y/a3Vm42dIYKDeISUY5FiOItFXTtONIT+bYqG6uXqj+ls3jshHZUEvwKq7+ZEzPPX
X-Gm-Gg: AfdE7cmSGDj+QBlycKO7JAzf4wknodQB3nRUPdJqAAi0kJLQBN39SOM/xUgVGvmT9Ly
	SjtXNlJGhqNee6FGNCSQW5sfAeGmmwfvfYOabQ/D3aU1WVqqqJHPeMytt2WJkNryVUDSIMpfyqj
	xGWKS39GPF7YixUvt7kNgexJhb7vH6DxTemXdI0XW8vRtQaei8gQHu0bSKKLklH1CM+P0dvBp4s
	PrH+bW6xNAo272xpvB7OnO6XP29Xrc0RnTui/Utop+24eR8TLIaS4QFGXGj1RIl3w3Lowkcd9+P
	HaVvp8K1FFU9O7yztbXp2ThONNaPxIywir5C8SQkAMQMDVnHzD9V4bw6E5L/RDwixoFIPfRlING
	QnBPnZkpwQIvTwhgQDylM0DjR548ChTHvoHLvTqE/lYp5pRWowOqG28H7Si3BVx39wB7suPnCUh
	zNJBEnoSoajz3TeDllKdhCTpHJwFIu94MncQ==
X-Received: by 2002:a17:902:e5c8:b0:2c9:d27b:af11 with SMTP id d9443c01a7336-2ca44897d0dmr3792065ad.11.1782800457569;
        Mon, 29 Jun 2026 23:20:57 -0700 (PDT)
X-Received: by 2002:a17:902:e5c8:b0:2c9:d27b:af11 with SMTP id d9443c01a7336-2ca44897d0dmr3791855ad.11.1782800457051;
        Mon, 29 Jun 2026 23:20:57 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382d0d22sm6413835ad.80.2026.06.29.23.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:20:56 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next v2 1/3] wifi: ath12k: switch to name-based reserved memory lookup
Date: Tue, 30 Jun 2026 11:50:46 +0530
Message-Id: <20260630062048.1615178-2-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630062048.1615178-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260630062048.1615178-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA1MSBTYWx0ZWRfX/33nt5mxSue4
 VACTd9P+psNKTtTi2K1ajroOxM+GExZ8du2K74Ee2H8gj7cHcyzdUwPnAyatAMm8gQfaVCVzyKo
 vYQa4q6J9hRjTj7vZekhinIeV8KlIs2kPUXNr/J0CBpEyfQ1rG1cSrImWpodMIXFPyIP54qlZQR
 CN0qNbtQNX+2j5p3H45pehDW45DNvO0rHCp8qIBUlGAoYpYIZ0sU24QfsA4WckhUFOM/WjyTGhH
 ANWTFI3Lum4/t43VoRC5jmG8FSuXcl4pPl01EThtCppa+V9aCRzH42pB/qb2VJ1G6CXIlLMKEo7
 sP7PAgTycGtcJMPwEVaS+uyEtPX9nwF+8DE0ReCbGhMVXO5Oit1fmvK9Od6uHybAWB2MihqyFjw
 6hnC1WOsPoSNUJeWzVlKiZoeVPOG/V3UtPML5ZcRXV7FSglT1j0n+PFyekWvT8/vs6ood6HsNcU
 sgR7yw76tFsG/fe2t9A==
X-Proofpoint-ORIG-GUID: QCpHjSpBSJNcbsFGUKoCGi-gwj02eGOJ
X-Proofpoint-GUID: QCpHjSpBSJNcbsFGUKoCGi-gwj02eGOJ
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43604a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=jmRftXr0Aczi6AUq4NEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA1MSBTYWx0ZWRfXycpqDSUqjlvu
 F4wAwwBhmMsX28PdntElYZAioDXqncOKky60w40oeDabflfyBYVQfYtWbro8VJo6ELklSMSx4wg
 Zs1tnNg8PPxmruVHha391laOlsaJOoc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_232059_861611_F3B43186 
X-CRM114-Status: GOOD (  21.32  )
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

The driver currently retrieves reserved memory regions using index-based
lookup, which depends on the ordering of reserved-memory nodes in the
device tree. Since different platforms define these regions in varying
orders and combinations, this approach is not compatible and can result
in incorrect memory region access.

Switch to looking up memory regions by name instead of index so it does
not depend on node order.

Use names already defined in qcom,ipq5332-wifi.yaml, so there are no
backward compatibility issues.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c  | 18 ++++++------
 drivers/net/wireless/ath/ath12k/core.c | 25 -----------------
 drivers/net/wireless/ath/ath12k/core.h |  2 --
 drivers/net/wireless/ath/ath12k/qmi.c  | 38 +++++++++++++-------------
 4 files changed, 29 insertions(+), 54 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 30733a244454..6df3b775a214 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -12,6 +12,7 @@
 #include <linux/remoteproc.h>
 #include <linux/soc/qcom/mdt_loader.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <linux/of_reserved_mem.h>
 #include "ahb.h"
 #include "debug.h"
 #include "hif.h"
@@ -338,24 +339,25 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 	char fw2_name[ATH12K_USERPD_FW_NAME_LEN];
 	struct device *dev = ab->dev;
 	const struct firmware *fw, *fw2;
-	struct reserved_mem *rmem = NULL;
 	unsigned long time_left;
 	phys_addr_t mem_phys;
+	struct resource res;
 	void *mem_region;
 	size_t mem_size;
 	u32 pasid;
 	int ret;
 
-	rmem = ath12k_core_get_reserved_mem(ab, 0);
-	if (!rmem)
-		return -ENODEV;
+	ret = of_reserved_mem_region_to_resource_byname(dev->of_node, "q6-region",
+							&res);
+	if (ret)
+		return ret;
 
-	mem_phys = rmem->base;
-	mem_size = rmem->size;
+	mem_phys = res.start;
+	mem_size = resource_size(&res);
 	mem_region = devm_memremap(dev, mem_phys, mem_size, MEMREMAP_WC);
 	if (IS_ERR(mem_region)) {
-		ath12k_err(ab, "unable to map memory region: %pa+%pa\n",
-			   &rmem->base, &rmem->size);
+		ath12k_err(ab, "unable to map memory region: %pa+%zx\n",
+			   &res.start, mem_size);
 		return PTR_ERR(mem_region);
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 742d4fd1b598..617d039b9237 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -637,31 +637,6 @@ u32 ath12k_core_get_max_peers_per_radio(struct ath12k_base *ab)
 }
 EXPORT_SYMBOL(ath12k_core_get_max_peers_per_radio);
 
-struct reserved_mem *ath12k_core_get_reserved_mem(struct ath12k_base *ab,
-						  int index)
-{
-	struct device *dev = ab->dev;
-	struct reserved_mem *rmem;
-	struct device_node *node;
-
-	node = of_parse_phandle(dev->of_node, "memory-region", index);
-	if (!node) {
-		ath12k_dbg(ab, ATH12K_DBG_BOOT,
-			   "failed to parse memory-region for index %d\n", index);
-		return NULL;
-	}
-
-	rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-	if (!rmem) {
-		ath12k_dbg(ab, ATH12K_DBG_BOOT,
-			   "unable to get memory-region for index %d\n", index);
-		return NULL;
-	}
-
-	return rmem;
-}
-
 static inline
 void ath12k_core_to_group_ref_get(struct ath12k_base *ab)
 {
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index fc5127b5c1a3..ba2f617d8e5f 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1294,8 +1294,6 @@ void ath12k_fw_stats_init(struct ath12k *ar);
 void ath12k_fw_stats_bcn_free(struct list_head *head);
 void ath12k_fw_stats_free(struct ath12k_fw_stats *stats);
 void ath12k_fw_stats_reset(struct ath12k *ar);
-struct reserved_mem *ath12k_core_get_reserved_mem(struct ath12k_base *ab,
-						  int index);
 enum ath12k_qmi_mem_mode ath12k_core_get_memory_mode(struct ath12k_base *ab);
 
 static inline const char *ath12k_scan_state_str(enum ath12k_scan_state state)
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index fd762b5d7bb5..0176d6a4bf8c 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -13,6 +13,7 @@
 #include <linux/firmware.h>
 #include <linux/of_address.h>
 #include <linux/ioport.h>
+#include <linux/of_reserved_mem.h>
 
 #define SLEEP_CLOCK_SELECT_INTERNAL_BIT	0x02
 #define HOST_CSTATE_BIT			0x04
@@ -2727,20 +2728,20 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 
 static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 {
-	struct reserved_mem *rmem;
+	struct device_node *np = ab->dev->of_node;
 	size_t avail_rmem_size;
+	struct resource res;
 	int i, idx, ret;
 
 	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
 		switch (ab->qmi.target_mem[i].type) {
 		case HOST_DDR_REGION_TYPE:
-			rmem = ath12k_core_get_reserved_mem(ab, 0);
-			if (!rmem) {
-				ret = -ENODEV;
+			ret = of_reserved_mem_region_to_resource_byname(np, "q6-region",
+									&res);
+			if (ret)
 				goto out;
-			}
 
-			avail_rmem_size = rmem->size;
+			avail_rmem_size = resource_size(&res);
 			if (avail_rmem_size < ab->qmi.target_mem[i].size) {
 				ath12k_dbg(ab, ATH12K_DBG_QMI,
 					   "failed to assign mem type %u req size %u avail size %zu\n",
@@ -2751,7 +2752,7 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 				goto out;
 			}
 
-			ab->qmi.target_mem[idx].paddr = rmem->base;
+			ab->qmi.target_mem[idx].paddr = res.start;
 			ab->qmi.target_mem[idx].v.ioaddr =
 				ioremap(ab->qmi.target_mem[idx].paddr,
 					ab->qmi.target_mem[i].size);
@@ -2764,13 +2765,13 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 			idx++;
 			break;
 		case BDF_MEM_REGION_TYPE:
-			rmem = ath12k_core_get_reserved_mem(ab, 0);
-			if (!rmem) {
-				ret = -ENODEV;
+			ret = of_reserved_mem_region_to_resource_byname(np, "q6-region",
+									&res);
+			if (ret)
 				goto out;
-			}
 
-			avail_rmem_size = rmem->size - ab->hw_params->bdf_addr_offset;
+			avail_rmem_size = resource_size(&res) -
+					  ab->hw_params->bdf_addr_offset;
 			if (avail_rmem_size < ab->qmi.target_mem[i].size) {
 				ath12k_dbg(ab, ATH12K_DBG_QMI,
 					   "failed to assign mem type %u req size %u avail size %zu\n",
@@ -2781,7 +2782,7 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 				goto out;
 			}
 			ab->qmi.target_mem[idx].paddr =
-				rmem->base + ab->hw_params->bdf_addr_offset;
+				res.start + ab->hw_params->bdf_addr_offset;
 			ab->qmi.target_mem[idx].v.ioaddr =
 				ioremap(ab->qmi.target_mem[idx].paddr,
 					ab->qmi.target_mem[i].size);
@@ -2806,13 +2807,12 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 			idx++;
 			break;
 		case M3_DUMP_REGION_TYPE:
-			rmem = ath12k_core_get_reserved_mem(ab, 1);
-			if (!rmem) {
-				ret = -EINVAL;
+			ret = of_reserved_mem_region_to_resource_byname(np, "m3-dump",
+									&res);
+			if (ret)
 				goto out;
-			}
 
-			avail_rmem_size = rmem->size;
+			avail_rmem_size = resource_size(&res);
 			if (avail_rmem_size < ab->qmi.target_mem[i].size) {
 				ath12k_dbg(ab, ATH12K_DBG_QMI,
 					   "failed to assign mem type %u req size %u avail size %zu\n",
@@ -2823,7 +2823,7 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 				goto out;
 			}
 
-			ab->qmi.target_mem[idx].paddr = rmem->base;
+			ab->qmi.target_mem[idx].paddr = res.start;
 			ab->qmi.target_mem[idx].v.ioaddr =
 				ioremap(ab->qmi.target_mem[idx].paddr,
 					ab->qmi.target_mem[i].size);
-- 
2.34.1


