Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C7CCD98C7
	for <ath12k@archiver.kernel.org>; Fri, 12 Jun 2026 03:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f/cSaD7TtRbyQmfmeTtYyf4+fdttmjWQdF4y83zbGbg=; b=k57KcHebYMeYewR+/PHMm1H+0U
	B6B3EFoHyP4zGQqhW/kgJbghxGRYRsgkKp/ycgSksvumWLMcHocCn92GdEPUEgmm/LjgMAnddAOte
	1Jmxz7hZqI0UCc9qb9BA/kEmn5qnfBhUycEMkIcXw6qZ7u2Ku+M1dCJ53Jc0a+Nr3rHf+pMrILUyg
	jUNrKf3Pvkn6MBXo04GcrIflVBMPSzIjaFlmwbIbUD3SYx9DTLyQFYHifinqGF3Abe/5MG69jalww
	2st1alrM4bOvWoiYB8rm5FkjTYbgJHoYbspEUVDNOuUuqfe8Xq6ElyL/6T1/N2MPdhlVABXBfr5Zv
	/U1qCOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXsUe-0000000AJXu-30wV;
	Fri, 12 Jun 2026 03:23:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXsUb-0000000AJXY-3jc7
	for ath12k@lists.infradead.org;
	Fri, 12 Jun 2026 03:23:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39bHZ2516205
	for <ath12k@lists.infradead.org>; Fri, 12 Jun 2026 03:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=f/cSaD7TtRbyQmfmeTtYyf4+fdttmjWQdF4
	y83zbGbg=; b=Kk6Ik038wJzIat1xf/GjMxEP0q7gWh6rfKRzPwyuKVF6qYoaGI2
	TyapWql6bqqN+k7m4MFvmvBu7dcQEHSv1HktV5hVV7FJYFg+EFnjxbaU2/GbEnLD
	dHEkZz/XqACpQpfGLn/sGViyBA/C9b/Mj/6ShlkjRkpiCpXZ+FHcd9mVdI6xartp
	HUKsUrpOAgoODh+G/OTAef5XyR2SqQe/wfhft0lxm9bbz5Ck7bqZZR7S0JLXVIe5
	Nlbp6lCM15JZRQahN4necmx7MvVj4huW7sOnz8T+O7CcrWqyWnI6rHLf744ttQve
	F2ZL15p7jKNmA96hXN757V6MpArY2xOFa+g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r71fj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 12 Jun 2026 03:23:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304dd917645so1157499eec.1
        for <ath12k@lists.infradead.org>; Thu, 11 Jun 2026 20:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781234616; x=1781839416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/cSaD7TtRbyQmfmeTtYyf4+fdttmjWQdF4y83zbGbg=;
        b=UYkSx/S0GioeH7p/fvuEqZrAoXZe7EGcaY0gw3oLHwmQGQ9JVA7MKKetZjxj0zDNGP
         PrlzUB6C3t7k3m5lYGWIofA6ry3kkEB9jEBt0iHvQDGEdJrZj9zYymHejHblpOt4TVhw
         AFQ7JGdSqy4htnlLBcjmKRf1FSn+d0o6N+PCaPPzbPv/6lC7FHb3Yx1hVfigdr0VAcb5
         /Q/6C9f41fQTgjQ+iT2zVYDbJgbJ8aRUqYJ7pd0mvp9aAdLTQU2sfC7qBX7xCwGqBEeo
         QRVoGoJBOizBggPYgQpHZ7ttM4RRnKrbXicrIb4W/aN6Zg/3LeOBenyAZkEGq3hQCwil
         B1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781234616; x=1781839416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/cSaD7TtRbyQmfmeTtYyf4+fdttmjWQdF4y83zbGbg=;
        b=NAK+46+xqe2ywdOZnPqKm3nlt2l7LiBB0HOe9++ozUXYzhkr3Cdjqz+9y4rSJYzoRW
         wahR7PI0fYqilOLAMQbu7o3/9YB9OuI+OgcuzKnzX814DZyo+G5SVIwAm6qrhTBkFLQg
         ZBDe4yD06URTHh9HcXatHuy9chO2+cxo6eL0Qx18qMEyqq8W9Z7RaK0f6qJP+yxf7Lsa
         K1lw36+EszlTsUMlgzdKg7k9ESccBc+ClJHwspdGt242+ob9wNsIgeW9nxCn4/8189YS
         aQK8Jv/Qarpvc69qt1xGSwsPyM3mKmnIYU1roSaNn9IJU2f/bT4/u6PNI8xjqGe+X4mq
         /ipA==
X-Gm-Message-State: AOJu0YzJnVoNtFHaAGpJKLOz8CRfo9UufjDwV8dRlESBwWPZBwr227RL
	otDCpKNFnDRvE6nck5WxBBnPEsim2PW9qcBvHRSlqyjrfd5D0UTJRCFvn6NGKucAQveJrprJB82
	auS6kntZ+UPnJ+jg4qAYsI9sZBr7kM2+4ujdz48id72ywlyNz5dwumRbjwHF889rCJ5tWhKMV
X-Gm-Gg: Acq92OF+a11eWhdOLSw3761mv/bZYOX/jz5n1VjWnPpM59vV3pUPYcA3Ro67oQZUhiD
	frJKjQIywSxxoPM2bdMO956o6J5/XExPj8RgK2hECmN3aY08T3H/6l6yrt7/NjbQ/XT98/9h6mD
	xSr6+MedSwKDpZIppYrf/zGf9zVTUCEvaAqDHviz0bQPYIWSKBCvnvEjRRm6nk4e48dVKeRmz8a
	hp7zUjihxd9GkZDCHW626L4/JpGJaid6qbEyh5fv717WsIOp9SGQLjpX8u8DeIHwLoklz9ImO52
	MIPF1q/JuUKAKvIlKmTzFSHfBq4mBY+E7dPwUWG4rPYtmr47gFOKpozRz+1JjgvsC3ZJmy875nW
	kzOuvryYekaRhW2QV78f5M9O5SvAN88p0+/r493EL95DSBF9I2n6SAOz3QWfBshTqhiwFP++1bj
	45
X-Received: by 2002:a05:7300:8cab:b0:304:6139:5a3e with SMTP id 5a478bee46e88-308200def3dmr687824eec.34.1781234615456;
        Thu, 11 Jun 2026 20:23:35 -0700 (PDT)
X-Received: by 2002:a05:7300:8cab:b0:304:6139:5a3e with SMTP id 5a478bee46e88-308200def3dmr687807eec.34.1781234614932;
        Thu, 11 Jun 2026 20:23:34 -0700 (PDT)
Received: from hu-yintang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f88bsm1491904eec.16.2026.06.11.20.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 20:23:34 -0700 (PDT)
From: Yingying Tang <yingying.tang@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com,
        yingying.tang@oss.qualcomm.com
Subject: [PATCH ath-next] Revert "wifi: ath12k: add panic handler"
Date: Thu, 11 Jun 2026 20:23:32 -0700
Message-ID: <20260612032332.2278338-1-yingying.tang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S-AAnLEW9nmg536EzodTDbCm8eZZnqFl
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2b7bb8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=CAN3Sn-i8mXM1BMfvN0A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: S-AAnLEW9nmg536EzodTDbCm8eZZnqFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAyOCBTYWx0ZWRfXzS2+oOkom14A
 ZjVqlWoPuTratyzaEAT7sYeo94mLByKOdJYF3Xy7r7nRnKPAHG+yNrlIfrnlwARUQwUs2VAvkkZ
 qcGdG/2lLzYnJjMsPeZsq79ctJNFJlKOZsCAZj03+e6R/2kYs5kh79dKxyYqB7fpnPdWbwy0Pmc
 3SNPKz3A3Sfx8YJZkuH6YGk3Fe2lRiXLFpH4tdfkHgw10o+4obl3s9a/UzMk3GiyWT7JCNlNb5n
 z2WOiyhe2V3vhbkOn9Il2onudm+bB41LyLoijL+SK7FCYHcc7TV8s3m9zMJShpfA1rs/hKJTFVj
 fAb4D/ssCEanA/10miZBUFuQtFDt9kTlW07NVCfCl3tgpa7SlQGfo+vddewc6uKuGrwL5aiwIfs
 hFsSgiiCwsEXGbs0NV3zWNBnzdR2BwJHXHUoMEM4G1VhynP2Eaa47ATjGNoFtFfBwWcQmOTww4o
 GJ7p3IjL2URdreLV50Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAyOCBTYWx0ZWRfX9Fbk19u7zZrg
 9nJsJU6hSI4UMqDiyqoAI4Q6J4G01v5dUL5J0LzeAK1ipLqhrsu7P9DvQpEF0eTULkJwlhymsc/
 8+EU9HsPJHJPJeFNWoSKFtFYE7lG+Ig=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_202337_961436_B961865B 
X-CRM114-Status: GOOD (  14.80  )
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

This reverts commit 809055628bce824b7fe18331abb65e44d02b0ecf.

Call trace:
rcu_note_context_switch+0x4c4/0x508 (P)
__schedule+0xbc/0x1204
schedule+0x34/0x110
schedule_timeout+0x84/0x11c
__mhi_device_get_sync+0x164/0x228 [mhi]
mhi_device_get_sync+0x1c/0x3c [mhi]
ath12k_wifi7_pci_bus_wake_up+0x20/0x2c [ath12k_wifi7]
ath12k_pci_read32+0x58/0x350 [ath12k]
ath12k_pci_clear_dbg_registers+0x28/0xb8 [ath12k]
ath12k_pci_panic_handler+0x20/0x44 [ath12k] ath12k_core_panic_handler+0x28/0x3c [ath12k]
notifier_call_chain+0x78/0x1c0
atomic_notifier_call_chain+0x3c/0x5c

ath12k_core_panic_handler() is invoked via atomic_notifier_call_chain(),
which runs inside an RCU read-side critical section. The current code calls
ath12k_pci_sw_reset() synchronously from this context, which eventually
reaches mhi_device_get_sync() and schedule_timeout(), triggering a voluntary
context switch within RCU.

Revert change "wifi: ath12k: add panic handler" to avoid this issue.

Tested-on: WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 33 +-------------------------
 drivers/net/wireless/ath/ath12k/core.h |  3 ---
 drivers/net/wireless/ath/ath12k/hif.h  |  9 -------
 drivers/net/wireless/ath/ath12k/pci.c  |  8 -------
 4 files changed, 1 insertion(+), 52 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 1a9866061f82..6705a8a73de1 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1793,29 +1793,6 @@ int ath12k_core_pre_init(struct ath12k_base *ab)
 	return 0;
 }
 
-static int ath12k_core_panic_handler(struct notifier_block *nb,
-				     unsigned long action, void *data)
-{
-	struct ath12k_base *ab = container_of(nb, struct ath12k_base,
-					      panic_nb);
-
-	return ath12k_hif_panic_handler(ab);
-}
-
-static int ath12k_core_panic_notifier_register(struct ath12k_base *ab)
-{
-	ab->panic_nb.notifier_call = ath12k_core_panic_handler;
-
-	return atomic_notifier_chain_register(&panic_notifier_list,
-					      &ab->panic_nb);
-}
-
-static void ath12k_core_panic_notifier_unregister(struct ath12k_base *ab)
-{
-	atomic_notifier_chain_unregister(&panic_notifier_list,
-					 &ab->panic_nb);
-}
-
 static inline
 bool ath12k_core_hw_group_create_ready(struct ath12k_hw_group *ag)
 {
@@ -2212,18 +2189,13 @@ int ath12k_core_init(struct ath12k_base *ab)
 	struct ath12k_hw_group *ag;
 	int ret;
 
-	ret = ath12k_core_panic_notifier_register(ab);
-	if (ret)
-		ath12k_warn(ab, "failed to register panic handler: %d\n", ret);
-
 	mutex_lock(&ath12k_hw_group_mutex);
 
 	ag = ath12k_core_hw_group_assign(ab);
 	if (!ag) {
 		mutex_unlock(&ath12k_hw_group_mutex);
 		ath12k_warn(ab, "unable to get hw group\n");
-		ret = -ENODEV;
-		goto err_unregister_notifier;
+		return -ENODEV;
 	}
 
 	mutex_unlock(&ath12k_hw_group_mutex);
@@ -2248,8 +2220,6 @@ int ath12k_core_init(struct ath12k_base *ab)
 
 err_unassign_hw_group:
 	ath12k_core_hw_group_unassign(ab);
-err_unregister_notifier:
-	ath12k_core_panic_notifier_unregister(ab);
 
 	return ret;
 }
@@ -2258,7 +2228,6 @@ void ath12k_core_deinit(struct ath12k_base *ab)
 {
 	ath12k_core_hw_group_destroy(ab->ag);
 	ath12k_core_hw_group_unassign(ab);
-	ath12k_core_panic_notifier_unregister(ab);
 }
 
 void ath12k_core_free(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 4edc8f4e0cb5..a81cb3032145 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -15,7 +15,6 @@
 #include <linux/ctype.h>
 #include <linux/firmware.h>
 #include <linux/of_reserved_mem.h>
-#include <linux/panic_notifier.h>
 #include <linux/average.h>
 #include <linux/of.h>
 #include <linux/rhashtable.h>
@@ -1121,8 +1120,6 @@ struct ath12k_base {
 
 #endif /* CONFIG_ACPI */
 
-	struct notifier_block panic_nb;
-
 	struct ath12k_hw_group *ag;
 	struct ath12k_wsi_info wsi_info;
 	enum ath12k_firmware_mode fw_mode;
diff --git a/drivers/net/wireless/ath/ath12k/hif.h b/drivers/net/wireless/ath/ath12k/hif.h
index e8840fab6061..42bb00c13ef3 100644
--- a/drivers/net/wireless/ath/ath12k/hif.h
+++ b/drivers/net/wireless/ath/ath12k/hif.h
@@ -30,7 +30,6 @@ struct ath12k_hif_ops {
 	void (*ce_irq_enable)(struct ath12k_base *ab);
 	void (*ce_irq_disable)(struct ath12k_base *ab);
 	void (*get_ce_msi_idx)(struct ath12k_base *ab, u32 ce_id, u32 *msi_idx);
-	int (*panic_handler)(struct ath12k_base *ab);
 	void (*coredump_download)(struct ath12k_base *ab);
 };
 
@@ -149,14 +148,6 @@ static inline void ath12k_hif_power_down(struct ath12k_base *ab, bool is_suspend
 	ab->hif.ops->power_down(ab, is_suspend);
 }
 
-static inline int ath12k_hif_panic_handler(struct ath12k_base *ab)
-{
-	if (!ab->hif.ops->panic_handler)
-		return NOTIFY_DONE;
-
-	return ab->hif.ops->panic_handler(ab);
-}
-
 static inline void ath12k_hif_coredump_download(struct ath12k_base *ab)
 {
 	if (ab->hif.ops->coredump_download)
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 375277ca2b89..65a780e74d01 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1469,13 +1469,6 @@ void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend)
 	ath12k_pci_sw_reset(ab_pci->ab, false);
 }
 
-static int ath12k_pci_panic_handler(struct ath12k_base *ab)
-{
-	ath12k_pci_sw_reset(ab, false);
-
-	return NOTIFY_OK;
-}
-
 static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
 	.start = ath12k_pci_start,
 	.stop = ath12k_pci_stop,
@@ -1493,7 +1486,6 @@ static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
 	.ce_irq_enable = ath12k_pci_hif_ce_irq_enable,
 	.ce_irq_disable = ath12k_pci_hif_ce_irq_disable,
 	.get_ce_msi_idx = ath12k_pci_get_ce_msi_idx,
-	.panic_handler = ath12k_pci_panic_handler,
 #ifdef CONFIG_ATH12K_COREDUMP
 	.coredump_download = ath12k_pci_coredump_download,
 #endif
-- 
base-commit: 54a5b38e4396530e5b2f12b54d3844e860ab6784 

