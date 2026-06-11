Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE9BCD98C5
	for <ath12k@archiver.kernel.org>; Thu, 11 Jun 2026 03:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAi/cH55ITaxLHzNN6NVJATn9sydmgbMVi5O/Jv7r6w=; b=SUPDmBLLLz5JEMmy8+tI0akmce
	N4m2Bv1Rjq3Uq9YAROOcDESWSEC0pguUyJOHwRtAmo3rjZn6eq7vjhWP0sTQlY9iVbicfYtMvnUxy
	T8yp0JxXrL3qobZ/9eBlp1RAh0gRgeLt8gGikcunKoZvnM45QuqvUa6h7M1+LU9rPFiHJlUG39alF
	tw4KU7+CE/X2INoSIvk/mnzwG/icUT15y4YxwvfLTtAURPrP+XPcIzxuORZl8N+NLEQh5G0ujevIk
	jSMTooR23VleNiyUpyzbwWFRSzoms9O4GJY7D1UjS5f7cRLoSKe0O8RwheFvjOwkfYluTg7SigBKh
	US+C7C7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWAW-00000008cFz-3cuC;
	Thu, 11 Jun 2026 03:33:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWAU-00000008cFC-3nzq
	for ath12k@lists.infradead.org;
	Thu, 11 Jun 2026 03:33:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NXOm3159569
	for <ath12k@lists.infradead.org>; Thu, 11 Jun 2026 03:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eAi/cH55ITa
	xLHzNN6NVJATn9sydmgbMVi5O/Jv7r6w=; b=Ll+i/DywpyGYjwdKlM/bL1PH3lv
	/RyOIL4Ioi/VE5XETjJIXV4F2neR704cqs5Y7h16qUKog8qWQV80svO1Xl/UFs0h
	Dd1JuwZGqNPCuJztbqCBq73Vke7OydiFiIRNh3ADvCDPQaZ0Tc9+vxKGkwZXVpoO
	lyA4wu+lnNp9ijWMcE4UNRuaVIOkAANU0vuITjGF+9UAJyCUK2TktARY8DxLQU2u
	gUTNEIlWbZZfmwVjaxEXm1AmyJKiWAlIrjp/BCtuoge85r10Vtq+9rkVCljPG55F
	2mScMNM/mmfwXUrjlfO+LKwTszIqKpEF5oIJrnJHhT9H3ncfkMbf4XdjHcg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701e9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 11 Jun 2026 03:33:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2d65d9792so5967345ad.0
        for <ath12k@lists.infradead.org>; Wed, 10 Jun 2026 20:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781148801; x=1781753601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAi/cH55ITaxLHzNN6NVJATn9sydmgbMVi5O/Jv7r6w=;
        b=QIb2QDomNMJO0E0zlVwFHy3iZBcYgthQZkBUkcIymcUgerKjQatllDRK+2Bg8Q9mcI
         KVW16pR/2RzHpPdQqpFbYkmBA1mp+gszndUgE5ERez1xTmxBPocOKXH+AzI/hZ9ozULZ
         kqZhYUx0rRwmUgewY191kEvQA3Oy1K35X2di69AQ0qljBHIJCh+eZX1YcTS05Ih3/KZo
         +odCMp0s3ZVo6jAdmZ3mitEknnwf8mg/1C/XsM4UQW2p+5IdoR3Xdj+vGovolGxAr1ed
         V4uFBvemgqGktHojpVWrMby3QTnxBS7SB97+rHPqvD4YmqpYsneU8c3AaVOQKf7xA2Vc
         Jvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781148801; x=1781753601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eAi/cH55ITaxLHzNN6NVJATn9sydmgbMVi5O/Jv7r6w=;
        b=bwRONsyeDrr66vCevYSM3BqIYzmhWB4f4sxz4kDhsbPnGmEoucd5dN+Eb58c7qaYj7
         3BeDiuEMbiYwXr+WWoHnnNmEnj4seLbEC1B9IwL69pwhsv7wg46tEyD2VrBKYZm26XWE
         s37MKpYRu5TtlFduwORDBAIIr1WSOTis6myABS42nb0kax9ZvDLBvgumAuMGTHVtFaG4
         PG2GEa0Ch1CkqUzr8BbLXLGyBJ/upNW19YMTUwlmAcg30lsYCiTvQAgSF5OFNNw568zl
         VrKPi2NXyq2WLgvmCWaCLTDEz7G4/wLi2yn5A+IynhCVKNkhvhP6glMNbPhDloFjaLK8
         QUuw==
X-Gm-Message-State: AOJu0YxwhjQb29TLdNSVwc/k7ZikoS7BGvzIg0mjmkqEuGuT7kFhPMlS
	QiJot5oQQ7isYgeW8w/0uKXt5cRNOLGc49NCGTiUhsYN2OwfinkHcYRz2q+Pr1A/ppUIdRKPYIr
	eOWwpv8hHal4Q4NrnfxwamkfqxwI3UTfnAUBaqpH2i4VS13/xdVCRXD0tnUhBrS2QXNqaSpgH
X-Gm-Gg: Acq92OFH0rVEKq8tVYD/ao5CZAN6NIhsOgg6QIirgbiz29PqUx44WIPX27Qpj3zdbCh
	ae3dtq2GTQI+AUGThF5vO2bFDh3hkZ/wXmkIPC3YNUrSIwEo9oteBvSax7sLn65qAu3AWVSL0r/
	fggaWufi7GM//N0GytXaPKYF8NQop9DrnuN6NBeAxQUz0Dtoo+NviSz+sycywA17f1vMIqKuXVP
	9+QD481nt6q7PazJHwaB6jTZLLJVdVGgOYmn3qvPNt1tKBgoNXx8AUWCt6V0PJ4g438Ky71Yf9Z
	rz5AKdQISrb2GvOrGOZzH3uZ/ScVyPJeSxpUMeQBTUn2kCwA3UaIv6mOy/EfYUzu/qdytXfOnBV
	56ccxcC9l4ZDMQo77DGL4SwOK9VBpaSBrFG4kksts9lHycVNVLm1UhZtq1ODqIvc+jRkBzDpCFy
	H8H8pHkLX1qK8yT1PEQTfk5w6NglliZDIDBswCgTVBu5C97UVlHXCLT/s=
X-Received: by 2002:a17:90b:33c1:b0:36a:aa9:eea0 with SMTP id 98e67ed59e1d1-3779cb2617fmr1024652a91.4.1781148801432;
        Wed, 10 Jun 2026 20:33:21 -0700 (PDT)
X-Received: by 2002:a17:90b:33c1:b0:36a:aa9:eea0 with SMTP id 98e67ed59e1d1-3779cb2617fmr1024636a91.4.1781148800891;
        Wed, 10 Jun 2026 20:33:20 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3775287186dsm896041a91.6.2026.06.10.20.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:33:20 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 1/3] wifi: ath12k: switch to name-based reserved memory lookup
Date: Thu, 11 Jun 2026 09:03:12 +0530
Message-Id: <20260611033314.2330-2-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611033314.2330-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260611033314.2330-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDAzMSBTYWx0ZWRfXwKVDAtO75q1x
 tVyPcp2LTOF7pHSt2iCkW8vBNHEzGfa39eL4GQyyCSG34kj9UApoZ6r5BzkjNHmcOL1czDyGMcj
 0G1S9I4zrhfe3SP4faovjtnHCXFhjMh4XbAzoCwk3EZraOkSxJokELGAAIMgNVhExCIF9HzcPIz
 SUzzSy4O4ywz9ksme5ECfyD393S8harZ10wRLJUQd2Nw4q2GsRvxzTpqArvWDMoTq2PEvFmQlKH
 UX3mGDV/LM7B5uBtM3gog7BbSeS5uCl0YnzAw4osvmrL4d7UmdKIjec7O45qXFub9F4vTXxYT3x
 NAD76eMp/t+B1OWDj4Yo8LvvxTaNYzG6WVM1CIsJOrv7dx10CvMdkJSFiJA2lG5df+voS+EM1ca
 M8Y9L0n1ORMw8U0Wm3ZuNHImlEmRvF2uzmVTFNJNATZIlg+nZ/Q5h+dLO6KBeXg4xdIzO50ti5+
 eLNhhmuFXS535lI/B2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDAzMSBTYWx0ZWRfXzpeAkUWlSY8A
 x2qz4Ylm1w1it290tqSdOjqzQpvX1uMlD7gBYxyw0X8LKFLAtjX1WdvhzUK8jlLgtsWvvbAUgRH
 qifUT/ivszYwWbPG7GvLHovfoc9LIO8=
X-Proofpoint-GUID: yV4zdZ50uxKyv_BWV6wsqlHf9n4p5uGo
X-Proofpoint-ORIG-GUID: yV4zdZ50uxKyv_BWV6wsqlHf9n4p5uGo
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a2c82 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=jmRftXr0Aczi6AUq4NEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_203322_950924_E17EDDC7 
X-CRM114-Status: GOOD (  20.33  )
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

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c  | 18 ++++++------
 drivers/net/wireless/ath/ath12k/core.c | 25 -----------------
 drivers/net/wireless/ath/ath12k/core.h |  2 --
 drivers/net/wireless/ath/ath12k/qmi.c  | 38 +++++++++++++-------------
 4 files changed, 29 insertions(+), 54 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 30733a244454..695b605a92fd 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -15,6 +15,7 @@
 #include "ahb.h"
 #include "debug.h"
 #include "hif.h"
+#include <linux/of_reserved_mem.h>
 
 #define ATH12K_IRQ_CE0_OFFSET 4
 #define ATH12K_MAX_UPDS 1
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


