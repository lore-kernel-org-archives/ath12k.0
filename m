Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31261E99046
	for <ath12k@archiver.kernel.org>; Fri, 10 Apr 2026 07:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fmEXD1qIyUmzxQdrW7wk7qeou2259gvsDVSfQeAi2mk=; b=ERMmGc4TrLiSwmWemE0UBo4VU2
	6tyU4gzGPcmf2GfM8gKJUtyqSDBdWjn+PY2QY275HrVv7DM+nPxEoW21rm3dV8XBgKykPVnfeccl4
	uXc0ZIsUOWAb8J2heFz+EZqIYqV50/Hd8tIYpfBuUpFBeb8wkzvqraQM4XO6Y28pMvsyjVTQEqu6u
	R1u1Du60ULysGncPixR0gadrFJPSJ0IufrK83YQCzBJyBHq13Nfeuv97jp5vQpIkxbIv5+gZUpPoU
	P3WZmS6qmBNWrxEWvKoYY/tFyRjZUMxHnzxqtl1kYODQEm87+pdQd86L8b0oLy4bj+MdQeE+lbn7V
	5X5KZlxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB63P-0000000BiOp-3tEr;
	Fri, 10 Apr 2026 07:13:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB63N-0000000BiOS-24sg
	for ath12k@lists.infradead.org;
	Fri, 10 Apr 2026 07:13:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A1Bt3Z115013
	for <ath12k@lists.infradead.org>; Fri, 10 Apr 2026 07:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fmEXD1qIyUmzxQdrW7wk7qeou2259gvsDVS
	fQeAi2mk=; b=dRxnfUzuXm5S0XPt8IA5+lcUqUP+bY3Lu0cIXNa6nwm4NXDqmnY
	H48OXrmvAM8SYZcNHD2c2zw8krYt0ZwWT8shYUpS0Zf6i7mMjzN2zSQn32+0EwfR
	A70X/zLJ5qJ63acOSrfJ8KPwHiQOR2EllostIylWVMxDc8HsA56OW/8aWjNJHNL7
	TEsU8z/yDbXkpgzIluft9E1WYXo7X/DTxbFgtf+e97ZRm1PeT0YsL4BLIE30irhI
	sa9MMWay+BRtZauCkzttX77xT2g0SBvJHCXAU0q1Sgkexbs1iZhqh9LoTzVXyxP/
	PDmi9DOyTt5SX+IqG7Ee15XLN92FSIRiWhw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dee8xarw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Apr 2026 07:13:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35641c14663so2217971a91.2
        for <ath12k@lists.infradead.org>; Fri, 10 Apr 2026 00:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775805198; x=1776409998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fmEXD1qIyUmzxQdrW7wk7qeou2259gvsDVSfQeAi2mk=;
        b=WhVO8kvCovloi+rZ/kNI5zslRiTRinO5VF5smwnoSQZ148xim1VDFvptKZRcddnfMS
         BGfb9WM6cNT/lUaXSGROWLFzrOYumW+3EAdeF7fg93CXn0kc3NsOFsuracPKHwWoj/FJ
         b8tfS+o/hWMVy1GwNgjS0LJk6wADYs+C/PIJDGyI20SZypNA9xTRNeSCvqAFx5rK1cdi
         HMPyYjdMdXRycFbd7ZQsZqA9hhHS1K6uH29T0E9CKwjj4IQxpPPclsxeRqzB8UEzsrOM
         fAHepGDuF30lVk4q/hyu+GoakYPi2D5v6vM9FKbnhtzbWO9a2B00uenvx+k/b8Hmjk6Q
         suvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775805198; x=1776409998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmEXD1qIyUmzxQdrW7wk7qeou2259gvsDVSfQeAi2mk=;
        b=BJAPHu+40oPiXmODl6VQMUZwqkt29ajNACXIdcJnztakKD2phtHGRBCnuHWfmwq1EA
         9DDwE9I34bCqMhLM7Ij57jJ6RQx73qprxq5Y/8Zh7xKSdGXN0U22doIX4PwEw3AGQfV3
         yqFwMtqLwV00a9/Hy7pWU8zEz1j/QAu1gnF1hO8VaYC7gUMGJs6UBLa5V2R0Qw4uX1cQ
         ZMCkvGxBnHRFzKixzsvcTlgeKuQT/TrCAf9Ol2QU79/gIZnjTZf3Ix71IuGQYrTDd2bW
         vIk2wtx7f6D6p7+WbjyLAaHH7ZfbGlq5U6JCzZc11F6Uu8Z+o6lwP6xKYBGbPPplJczt
         COoA==
X-Gm-Message-State: AOJu0YwxW3JWUqgnC99bUe65Gkp60xRXxOpYU4HxQaKOeqjqJwkm3zAF
	j/0oFfbY7yGhTvpEYGhOmeg8FIX9VzvIn6epCWy7DNTrUoEhkRgsQrgm2jJP6zbePEa2/TcDQo2
	IQZ024ipqcPxAUT3SaDfbsQiH7xVnh9W6gH3p9HIuupEYWdhsmNUFup+zRECDXQL43oN7g2tK
X-Gm-Gg: AeBDietu1TKsptUkSgglU/WoCgIEOGb0ZiVXX9XwGft+hN3njzfWLxowAAVPvys/8zy
	WMsVdSpynv4HVjPPfqCGwTMkQuNGgWALztN9WjEoV/KlZYHudC+77dWiUBTGEVzVanhRhGnMaQD
	Ut/0W3dII+n2IS1pitIQJXQVbt2UQ8uoaZaSMz+1UK+iFyuhgs/dtrteSSGAUAea9+mMsato6ft
	CVaICnfQ+iqWS1ilyBRKSUO2yXtl9rZ6e+Gz9CLgauZwqSTfmkpPWRzMbqOuqaZSp1DtpQ3YGjq
	tvmukhGfQ97xxQtbweUNQ3vVtAfHgTcRRc/aFz5kPwBxVjZmFJTPEf9kuE+20m+40a+1r8B/OQy
	hCwZi5fLzAWSkbF0Coi58tl+Btr7S6tEF+4znXSqwtByx3NoxPfO7Bfr2QFarkYiJ+gEie+QcoB
	KCHNf7zsi5UIOslOlhhxBo10OwvNbXnSwR6Ha0nSYOxzSo
X-Received: by 2002:a17:90a:c2c3:b0:35b:9d97:63ac with SMTP id 98e67ed59e1d1-35e427c925amr2264159a91.7.1775805198179;
        Fri, 10 Apr 2026 00:13:18 -0700 (PDT)
X-Received: by 2002:a17:90a:c2c3:b0:35b:9d97:63ac with SMTP id 98e67ed59e1d1-35e427c925amr2264111a91.7.1775805197482;
        Fri, 10 Apr 2026 00:13:17 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e4131cfacsm2070459a91.10.2026.04.10.00.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:13:17 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: fix OF node refcount imbalance in WSI graph traversal
Date: Fri, 10 Apr 2026 12:43:00 +0530
Message-Id: <20260410071300.2323603-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2NSBTYWx0ZWRfX4HfKWhTcDiEf
 CJg6aRzlNHXDOGpiQeL0Tmb/gT7yRj+74+BDd+JmgnzRIjJC+IgODEnx+AYmD01bIAXptu3n87O
 ADCwo+kBS4bDsaGNcwdjQSEZkNvZdsSobD0VXjoIQ+5HV6VkFNoH2HEawwoJmItGxpX5kDP1P42
 265VIw8Kx4Nb+220dSLTfCC7NOTRpcXfrQR8S9GrDzrH7fMJB9QNCpMmfIX8G1mnupMrJtsY/nM
 V7fxRuc1ReSFYq9fRNnYq75mjI7YBGUw6g+7BGpz8NoEb89eR86dbidzcYkH/FMy96II3J0acuU
 PP21JXPet7wojrJv/ocoTwO09lxWJrMWXY9l3iBTh/WOl5jEcxYhAMLz32OQn4ITfdVDp2CIlCw
 Db1u0Gz/U910Kux3mSpgy575Wk8P1WsdsKqPIEIRoacM+xaQpaLh7lDlIfpiIvWv6CHYNqd4nRR
 i3CjWPQ6UqfXkJ7Kpew==
X-Proofpoint-GUID: KADIpv-MfeA1Xnk2X-5AmYqaiHz9iUDm
X-Proofpoint-ORIG-GUID: KADIpv-MfeA1Xnk2X-5AmYqaiHz9iUDm
X-Authority-Analysis: v=2.4 cv=O7YJeh9W c=1 sm=1 tr=0 ts=69d8a30f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=cJ7lEyrx1ZesTjHcJmMA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_001321_678940_71B8016F 
X-CRM114-Status: GOOD (  19.54  )
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

ath12k_core_get_wsi_info() traverses the WSI (Wired Serial Interface)
device graph starting from dev->of_node. The current code uses
dev->of_node directly as the local traversal pointer and calls
of_node_put() on error.

Since the driver does not own a reference to dev->of_node, dropping it
during traversal results in the following OF refcount underflow:

OF: ERROR: of_node_release() detected bad of_node_put() on /soc@0/wifi@c000000
CPU: 1 UID: 0 PID: 210 Comm: insmod Not tainted 6.19.0-rc4-next-20260109-00023-g797dd36dc178 #26 PREEMPT
Hardware name: Qualcomm Technologies, Inc. IPQ5332 MI01.2 (DT)
Call trace:
 show_stack+0x18/0x24 (C)
 dump_stack_lvl+0x60/0x80
 dump_stack+0x18/0x24
 of_node_release+0x164/0x1a0
 kobject_put+0xb4/0x278
 of_node_put+0x18/0x28
 ath12k_core_init+0x29c/0x5d4 [ath12k]
 ath12k_ahb_probe+0x950/0xc14 [ath12k]
 platform_probe+0x5c/0xa4
 really_probe+0xc0/0x3ec
 __driver_probe_device+0x80/0x170
 driver_probe_device+0x3c/0x120
 __driver_attach+0xc4/0x218
OF: ERROR: next of_node_put() on this node will result in a kobject warning 'refcount_t: underflow; use-after-free.'

Fix this by explicitly acquiring a reference to the starting node
using of_node_get() and attaching automatic cleanup via
__free(device_node).

Each discovered WSI node is stored in ag->wsi_node[] with its own
of_node_get() reference. These references are later released in
ath12k_core_free_wsi_info() during driver teardown.

Also remove unnecessary memset() of wsi_node array since cleanup now
explicitly sets pointers to NULL.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Fixes: 908c10c860e0 ("wifi: ath12k: parse multiple device information from Device Tree")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 77 ++++++++++++++++----------
 1 file changed, 48 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 2519e2400d58..980a12fb2c6e 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1838,10 +1838,22 @@ static struct ath12k_hw_group *ath12k_core_hw_group_alloc(struct ath12k_base *ab
 	return ag;
 }
 
+static void ath12k_core_free_wsi_info(struct ath12k_hw_group *ag)
+{
+	int i;
+
+	for (i = 0; i < ag->num_devices; i++) {
+		of_node_put(ag->wsi_node[i]);
+		ag->wsi_node[i] = NULL;
+	}
+	ag->num_devices = 0;
+}
+
 static void ath12k_core_hw_group_free(struct ath12k_hw_group *ag)
 {
 	mutex_lock(&ath12k_hw_group_mutex);
 
+	ath12k_core_free_wsi_info(ag);
 	list_del(&ag->list);
 	kfree(ag);
 
@@ -1867,52 +1879,59 @@ static struct ath12k_hw_group *ath12k_core_hw_group_find_by_dt(struct ath12k_bas
 static int ath12k_core_get_wsi_info(struct ath12k_hw_group *ag,
 				    struct ath12k_base *ab)
 {
-	struct device_node *wsi_dev = ab->dev->of_node, *next_wsi_dev;
-	struct device_node *tx_endpoint, *next_rx_endpoint;
-	int device_count = 0;
-
-	next_wsi_dev = wsi_dev;
+	struct device_node *next_wsi_dev;
+	int device_count = 0, ret = 0;
+	struct device_node *wsi_dev;
 
-	if (!next_wsi_dev)
+	wsi_dev = of_node_get(ab->dev->of_node);
+	if (!wsi_dev)
 		return -ENODEV;
 
 	do {
-		ag->wsi_node[device_count] = next_wsi_dev;
+		if (device_count >= ATH12K_MAX_DEVICES) {
+			ath12k_warn(ab, "device count in DT %d is more than limit %d\n",
+				    device_count, ATH12K_MAX_DEVICES);
+			ret = -EINVAL;
+			break;
+		}
+
+		ag->wsi_node[device_count++] = of_node_get(wsi_dev);
 
-		tx_endpoint = of_graph_get_endpoint_by_regs(next_wsi_dev, 0, -1);
+		struct device_node *tx_endpoint __free(device_node) =
+					of_graph_get_endpoint_by_regs(wsi_dev, 0, -1);
 		if (!tx_endpoint) {
-			of_node_put(next_wsi_dev);
-			return -ENODEV;
+			ret = -ENODEV;
+			break;
 		}
 
-		next_rx_endpoint = of_graph_get_remote_endpoint(tx_endpoint);
+		struct device_node *next_rx_endpoint __free(device_node) =
+					of_graph_get_remote_endpoint(tx_endpoint);
 		if (!next_rx_endpoint) {
-			of_node_put(next_wsi_dev);
-			of_node_put(tx_endpoint);
-			return -ENODEV;
+			ret = -ENODEV;
+			break;
 		}
 
-		of_node_put(tx_endpoint);
-		of_node_put(next_wsi_dev);
-
 		next_wsi_dev = of_graph_get_port_parent(next_rx_endpoint);
 		if (!next_wsi_dev) {
-			of_node_put(next_rx_endpoint);
-			return -ENODEV;
+			ret = -ENODEV;
+			break;
 		}
 
-		of_node_put(next_rx_endpoint);
+		of_node_put(wsi_dev);
+		wsi_dev = next_wsi_dev;
+	} while (ab->dev->of_node != wsi_dev);
 
-		device_count++;
-		if (device_count > ATH12K_MAX_DEVICES) {
-			ath12k_warn(ab, "device count in DT %d is more than limit %d\n",
-				    device_count, ATH12K_MAX_DEVICES);
-			of_node_put(next_wsi_dev);
-			return -EINVAL;
+	if (ret) {
+		while (--device_count >= 0) {
+			of_node_put(ag->wsi_node[device_count]);
+			ag->wsi_node[device_count] = NULL;
 		}
-	} while (wsi_dev != next_wsi_dev);
 
-	of_node_put(next_wsi_dev);
+		of_node_put(wsi_dev);
+		return ret;
+	}
+
+	of_node_put(wsi_dev);
 	ag->num_devices = device_count;
 
 	return 0;
@@ -1983,9 +2002,9 @@ static struct ath12k_hw_group *ath12k_core_hw_group_assign(struct ath12k_base *a
 		    ath12k_core_get_wsi_index(ag, ab)) {
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
 				   "unable to get wsi info from dt, grouping single device");
+			ath12k_core_free_wsi_info(ag);
 			ag->id = ATH12K_INVALID_GROUP_ID;
 			ag->num_devices = 1;
-			memset(ag->wsi_node, 0, sizeof(ag->wsi_node));
 			wsi->index = 0;
 		}
 

base-commit: ae530e0b135102c5fc08e64c39e7a18564a52b3e
-- 
2.34.1


