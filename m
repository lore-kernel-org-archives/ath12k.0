Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB75F417F3
	for <ath12k@archiver.kernel.org>; Mon,  9 Mar 2026 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+/6LEz4YQxVekCdPCfPPKI1tzPq3wraX1+loD9w8RnQ=; b=GF3OLOXelG3qGgUiPnyodpDp8G
	FRpiqZNVlWHJz37QdqSkbF7mo1Rci9HDeAAWsBgBqKsbV3u+//Tfce+fwctY+x9rXi37ZPqD9dknl
	IVw3Pj933aQ/zrH7M9M9XB49DsqsHDDDuj46vHg8DyC/syN92XgEDC8bKKBFhlH/HCIIO74zGBiAa
	KziYES9NPsoMavszfVnfHYmpspi9S+Y6ZL8ktShkOIi6eiOiiINfdIixHUNzrgTa84c1rZAEp5ssG
	ytVbyRP/zpLOu8XZe05JNqtIPlfvnLuDUBoboGCtAGO8/sjhZUA3xz6vnWo2IOub2+54y+wA/FJAb
	GaYw7+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcPg-00000007aWw-1wv0;
	Mon, 09 Mar 2026 15:20:56 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcPe-00000007aW3-0GKl
	for ath12k@lists.infradead.org;
	Mon, 09 Mar 2026 15:20:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4852a8482fcso25132935e9.3
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 08:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773069652; x=1773674452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+/6LEz4YQxVekCdPCfPPKI1tzPq3wraX1+loD9w8RnQ=;
        b=SMboUOjh6TzpQkh8Te8UcAwaGQOOoyj6KM7g6mD7FxtjBfHbMiIAUtK3g6Q/U31cDt
         wW9oG322C77LPvYBMRm5xYOzMOhj4Sv1dsmYDjzT/6cA6lWppwvRdDUpTeF9X4BfiRL3
         F6GqJ8Okrlp6rb6W/hCjFKD5s5o+n/nsDdc29VOTVYt28to53C0hvWQpYxktsjMDTP3G
         MjukqdAYYz8LHNU+uGgDPLqbdl13j7VAWWqAFDTUMRDW6weskmxFGtKEUZSb9Ygzi25d
         CZV4pO7jHJrhRSCQyhEQwLivqbyDBb7kp+6wqBLdVAZOvmssLdnCpsyElkb/Q+VbuyjT
         Y3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069652; x=1773674452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/6LEz4YQxVekCdPCfPPKI1tzPq3wraX1+loD9w8RnQ=;
        b=FtGA991br/6d1BoanGR6m2wzYjkTHp+3roO8LJv/Kch8pUpLo08n8uM2uZEgbXmfsD
         mu9j8ElOm5SJvCMjb1HAPljjMzQlbU+DVxQHNjGumJp80YRHuJnHFp0sMV6k2lmxgvk4
         +ZcDR1GVlzTZ+bstH0jXciGFT/1VW1Jn+A2zL+l7uoDwBzyL8FXTnztWZNo4HkQUsL8o
         Q7dDA9tlZaN9l3EX/hBML36HmkGemeGbKqed3MSKNaSoJq7JElvz7RXv3QUF+SYEMXd6
         jsxu33UXQxuAie5bS1wJrbuR3iPZ5VLy9il71dwYV2IFT2HYfMYhEaBghZYlFFycDmFq
         MHdA==
X-Gm-Message-State: AOJu0YxueYcGFI1kPJJxXcRVphil2+o28CiVLvPWDqiyGusGohtx1zfL
	SC8ovMLrWFAaXmRo/L2tKWa2Vwduk+IVwEY8oL9ZowGrEswQGEd90n4fNNRzmw==
X-Gm-Gg: ATEYQzxxvt0G8AnDSaJajVZoiSt6oUfQ/YgVoyD92RprMxh7ClEsoYjmPstiTd4Doqe
	slR3nfqZTAb8IOjAVfnG2m0kWTGOqcD3GO/k/n+NEcuBnpCEKouqmtQRqDXx/BJTjJihOm8UHm/
	Vl/X55RPJz9YhH71j49Gg7i9b/5rWCJDWOocO1ur7XMKQc2QFXQnC9JIOYl9zo4nvjvgMiSN+zA
	cULPjj/X8Zl6zECvDSLNuUEfJ8VFJ3TGQGlrJjcSNVtFj8j1p9PWRJXRYBk9cgLna1OC4CpTUYr
	QjlRX2vox000ux/icJxpE8s+hWrsLGKVNn4ovmG4G7qNrSb9z12pHn10Nu1IWTuifz4f9BFtZW6
	MLmL8PL2ymsHRyuAYQ8GHoKlnL/rM5FVkqEoKU+uYFreuMTEY1mJvppRwbslN2aX/Kesxn/LPE6
	/6CcZbpT9pMvTKDD9Y8SAuD/MucurkbIvlDFgWL29m+2DNf4XV5fuCdRlE
X-Received: by 2002:a05:600c:8b62:b0:485:309c:2984 with SMTP id 5b1f17b1804b1-48530bab0a8mr114078395e9.13.1773069651191;
        Mon, 09 Mar 2026 08:20:51 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48539e574b5sm115979495e9.8.2026.03.09.08.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:20:50 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: avoid dynamic alloc when parsing wmi tb
Date: Mon,  9 Mar 2026 16:20:50 +0100
Message-ID: <20260309152050.191820-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_082054_307733_81DF97B7 
X-CRM114-Status: GOOD (  18.57  )
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

On each WMI message received from the hardware, we alloc a temporary array
of WMI_TAG_MAX entries of type void *. This array is then populated with
pointers of parsed structs depending on the WMI type, and then freed. This
alloc can fail when memory pressure in the system is high enough.

Given the fact that it is scheduled in softirq with the system_bh_wq, we
should not be able to parse more than one WMI message per CPU at any time

So instead lets move to a per cpu allocated array, stored in the struct
ath12k_base, that is reused accros calls. The ath12k_wmi_tlv_parse_alloc()
is also renamed into / merged with ath12k_wmi_tlv_parse() as it no longer
allocs memory but returns the existing per-cpu one.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
changes from RFC:
  - rebased on ath-next 8e0ab5b9adb7
  - converted missing call sites ath12k_wmi_obss_color_collision_event()
    & ath12k_wmi_pdev_temperature_event()
  - changed alloc order & cleanup path in ath12k_core_alloc() as it seems
    it confused people
  - used sizeof(*tb) in ath12k_wmi_tlv_parse()

Note I did try to move to a DEFINE_PER_CPU() allocated array but the module
loader complained about the array size. So I stuck to the per ab alloc. 
---
 drivers/net/wireless/ath/ath12k/core.c |   7 +
 drivers/net/wireless/ath/ath12k/core.h |   2 +
 drivers/net/wireless/ath/ath12k/wmi.c  | 178 ++++++-------------------
 3 files changed, 51 insertions(+), 136 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index c31c47fb5a73..c1de70b24828 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -2258,6 +2258,7 @@ void ath12k_core_free(struct ath12k_base *ab)
 	timer_delete_sync(&ab->rx_replenish_retry);
 	destroy_workqueue(ab->workqueue_aux);
 	destroy_workqueue(ab->workqueue);
+	free_percpu(ab->wmi_tb);
 	kfree(ab);
 }
 
@@ -2270,6 +2271,11 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
 	if (!ab)
 		return NULL;
 
+	ab->wmi_tb = __alloc_percpu(WMI_TAG_MAX * sizeof(void *),
+				    __alignof__(void *));
+	if (!ab->wmi_tb)
+		goto err_sc_free;
+
 	init_completion(&ab->driver_recovery);
 
 	ab->workqueue = create_singlethread_workqueue("ath12k_wq");
@@ -2317,6 +2323,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
 err_free_wq:
 	destroy_workqueue(ab->workqueue);
 err_sc_free:
+	free_percpu(ab->wmi_tb);
 	kfree(ab);
 	return NULL;
 }
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 59c193b24764..ebe7b94fd712 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -19,6 +19,7 @@
 #include <linux/average.h>
 #include <linux/of.h>
 #include <linux/rhashtable.h>
+#include <linux/percpu.h>
 #include "qmi.h"
 #include "htc.h"
 #include "wmi.h"
@@ -937,6 +938,7 @@ struct ath12k_base {
 	struct device *dev;
 	struct ath12k_qmi qmi;
 	struct ath12k_wmi_base wmi_ab;
+	void __percpu *wmi_tb;
 	struct completion fw_ready;
 	u8 device_id;
 	int num_radios;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 8e13c3ec1cc7..73bbb2eb4fce 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -289,29 +289,19 @@ static int ath12k_wmi_tlv_iter_parse(struct ath12k_base *ab, u16 tag, u16 len,
 	return 0;
 }
 
-static int ath12k_wmi_tlv_parse(struct ath12k_base *ar, const void **tb,
-				const void *ptr, size_t len)
-{
-	return ath12k_wmi_tlv_iter(ar, ptr, len, ath12k_wmi_tlv_iter_parse,
-				   (void *)tb);
-}
-
 static const void **
-ath12k_wmi_tlv_parse_alloc(struct ath12k_base *ab,
-			   struct sk_buff *skb, gfp_t gfp)
+ath12k_wmi_tlv_parse(struct ath12k_base *ab, struct sk_buff *skb)
 {
 	const void **tb;
 	int ret;
 
-	tb = kzalloc_objs(*tb, WMI_TAG_MAX, gfp);
-	if (!tb)
-		return ERR_PTR(-ENOMEM);
+	tb = this_cpu_ptr(ab->wmi_tb);
+	memset(tb, 0, WMI_TAG_MAX * sizeof(*tb));
 
-	ret = ath12k_wmi_tlv_parse(ab, tb, skb->data, skb->len);
-	if (ret) {
-		kfree(tb);
+	ret = ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
+				  ath12k_wmi_tlv_iter_parse, (void *)tb);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	return tb;
 }
@@ -3913,7 +3903,7 @@ ath12k_wmi_obss_color_collision_event(struct ath12k_base *ab, struct sk_buff *sk
 	u32 vdev_id, evt_type;
 	u64 bitmap;
 
-	const void **tb __free(kfree) = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	const void **tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ath12k_warn(ab, "failed to parse OBSS color collision tlv %ld\n",
 			    PTR_ERR(tb));
@@ -5714,7 +5704,7 @@ static int ath12k_pull_vdev_start_resp_tlv(struct ath12k_base *ab, struct sk_buf
 	const struct wmi_vdev_start_resp_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -5724,13 +5714,11 @@ static int ath12k_pull_vdev_start_resp_tlv(struct ath12k_base *ab, struct sk_buf
 	ev = tb[WMI_TAG_VDEV_START_RESPONSE_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch vdev start resp ev");
-		kfree(tb);
 		return -EPROTO;
 	}
 
 	*vdev_rsp = *ev;
 
-	kfree(tb);
 	return 0;
 }
 
@@ -5809,7 +5797,7 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
 
 	ath12k_dbg(ab, ATH12K_DBG_WMI, "processing regulatory ext channel list\n");
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -5819,7 +5807,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_REG_CHAN_LIST_CC_EXT_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch reg chan list ext update ev\n");
-		kfree(tb);
 		return -EPROTO;
 	}
 
@@ -5849,7 +5836,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
 	if (num_2g_reg_rules > MAX_REG_RULES || num_5g_reg_rules > MAX_REG_RULES) {
 		ath12k_warn(ab, "Num reg rules for 2G/5G exceeds max limit (num_2g_reg_rules: %d num_5g_reg_rules: %d max_rules: %d)\n",
 			    num_2g_reg_rules, num_5g_reg_rules, MAX_REG_RULES);
-		kfree(tb);
 		return -EINVAL;
 	}
 
@@ -5859,7 +5845,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
 		if (num_6g_reg_rules_ap[i] > MAX_6GHZ_REG_RULES) {
 			ath12k_warn(ab, "Num 6G reg rules for AP mode(%d) exceeds max limit (num_6g_reg_rules_ap: %d, max_rules: %d)\n",
 				    i, num_6g_reg_rules_ap[i], MAX_6GHZ_REG_RULES);
-			kfree(tb);
 			return -EINVAL;
 		}
 
@@ -5884,14 +5869,12 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
 		    num_6g_reg_rules_cl[WMI_REG_VLP_AP][i] >  MAX_6GHZ_REG_RULES) {
 			ath12k_warn(ab, "Num 6g client reg rules exceeds max limit, for client(type: %d)\n",
 				    i);
-			kfree(tb);
 			return -EINVAL;
 		}
 	}
 
 	if (!total_reg_rules) {
 		ath12k_warn(ab, "No reg rules available\n");
-		kfree(tb);
 		return -EINVAL;
 	}
 
@@ -5993,7 +5976,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
 						      ext_wmi_reg_rule);
 
 		if (!reg_info->reg_rules_2g_ptr) {
-			kfree(tb);
 			ath12k_warn(ab, "Unable to Allocate memory for 2g rules\n");
 			return -ENOMEM;
 		}
@@ -6027,7 +6009,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
 						      ext_wmi_reg_rule);
 
 		if (!reg_info->reg_rules_5g_ptr) {
-			kfree(tb);
 			ath12k_warn(ab, "Unable to Allocate memory for 5g rules\n");
 			return -ENOMEM;
 		}
@@ -6046,7 +6027,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
 						      ext_wmi_reg_rule);
 
 		if (!reg_info->reg_rules_6g_ap_ptr[i]) {
-			kfree(tb);
 			ath12k_warn(ab, "Unable to Allocate memory for 6g ap rules\n");
 			return -ENOMEM;
 		}
@@ -6061,7 +6041,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
 							      ext_wmi_reg_rule);
 
 			if (!reg_info->reg_rules_6g_client_ptr[j][i]) {
-				kfree(tb);
 				ath12k_warn(ab, "Unable to Allocate memory for 6g client rules\n");
 				return -ENOMEM;
 			}
@@ -6096,7 +6075,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
 
 	ath12k_dbg(ab, ATH12K_DBG_WMI, "processed regulatory ext channel list\n");
 
-	kfree(tb);
 	return 0;
 }
 
@@ -6107,7 +6085,7 @@ static int ath12k_pull_peer_del_resp_ev(struct ath12k_base *ab, struct sk_buff *
 	const struct wmi_peer_delete_resp_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -6117,7 +6095,6 @@ static int ath12k_pull_peer_del_resp_ev(struct ath12k_base *ab, struct sk_buff *
 	ev = tb[WMI_TAG_PEER_DELETE_RESP_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch peer delete resp ev");
-		kfree(tb);
 		return -EPROTO;
 	}
 
@@ -6127,7 +6104,6 @@ static int ath12k_pull_peer_del_resp_ev(struct ath12k_base *ab, struct sk_buff *
 	ether_addr_copy(peer_del_resp->peer_macaddr.addr,
 			ev->peer_macaddr.addr);
 
-	kfree(tb);
 	return 0;
 }
 
@@ -6139,7 +6115,7 @@ static int ath12k_pull_vdev_del_resp_ev(struct ath12k_base *ab,
 	const struct wmi_vdev_delete_resp_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -6149,13 +6125,11 @@ static int ath12k_pull_vdev_del_resp_ev(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_VDEV_DELETE_RESP_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch vdev delete resp ev");
-		kfree(tb);
 		return -EPROTO;
 	}
 
 	*vdev_id = le32_to_cpu(ev->vdev_id);
 
-	kfree(tb);
 	return 0;
 }
 
@@ -6167,7 +6141,7 @@ static int ath12k_pull_bcn_tx_status_ev(struct ath12k_base *ab,
 	const struct wmi_bcn_tx_status_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -6177,14 +6151,12 @@ static int ath12k_pull_bcn_tx_status_ev(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_OFFLOAD_BCN_TX_STATUS_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch bcn tx status ev");
-		kfree(tb);
 		return -EPROTO;
 	}
 
 	*vdev_id = le32_to_cpu(ev->vdev_id);
 	*tx_status = le32_to_cpu(ev->tx_status);
 
-	kfree(tb);
 	return 0;
 }
 
@@ -6195,7 +6167,7 @@ static int ath12k_pull_vdev_stopped_param_tlv(struct ath12k_base *ab, struct sk_
 	const struct wmi_vdev_stopped_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -6205,13 +6177,11 @@ static int ath12k_pull_vdev_stopped_param_tlv(struct ath12k_base *ab, struct sk_
 	ev = tb[WMI_TAG_VDEV_STOPPED_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch vdev stop ev");
-		kfree(tb);
 		return -EPROTO;
 	}
 
 	*vdev_id = le32_to_cpu(ev->vdev_id);
 
-	kfree(tb);
 	return 0;
 }
 
@@ -6350,7 +6320,7 @@ static int ath12k_pull_mgmt_tx_compl_param_tlv(struct ath12k_base *ab,
 	const struct wmi_mgmt_tx_compl_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -6360,7 +6330,6 @@ static int ath12k_pull_mgmt_tx_compl_param_tlv(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_MGMT_TX_COMPL_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch mgmt tx compl ev");
-		kfree(tb);
 		return -EPROTO;
 	}
 
@@ -6370,7 +6339,6 @@ static int ath12k_pull_mgmt_tx_compl_param_tlv(struct ath12k_base *ab,
 	param->ppdu_id = ev->ppdu_id;
 	param->ack_rssi = ev->ack_rssi;
 
-	kfree(tb);
 	return 0;
 }
 
@@ -6533,7 +6501,7 @@ static int ath12k_pull_scan_ev(struct ath12k_base *ab, struct sk_buff *skb,
 	const struct wmi_scan_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -6543,7 +6511,6 @@ static int ath12k_pull_scan_ev(struct ath12k_base *ab, struct sk_buff *skb,
 	ev = tb[WMI_TAG_SCAN_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch scan ev");
-		kfree(tb);
 		return -EPROTO;
 	}
 
@@ -6555,7 +6522,6 @@ static int ath12k_pull_scan_ev(struct ath12k_base *ab, struct sk_buff *skb,
 	scan_evt_param->vdev_id = ev->vdev_id;
 	scan_evt_param->tsf_timestamp = ev->tsf_timestamp;
 
-	kfree(tb);
 	return 0;
 }
 
@@ -6566,7 +6532,7 @@ static int ath12k_pull_peer_sta_kickout_ev(struct ath12k_base *ab, struct sk_buf
 	const struct wmi_peer_sta_kickout_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -6576,7 +6542,6 @@ static int ath12k_pull_peer_sta_kickout_ev(struct ath12k_base *ab, struct sk_buf
 	ev = tb[WMI_TAG_PEER_STA_KICKOUT_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch peer sta kickout ev");
-		kfree(tb);
 		return -EPROTO;
 	}
 
@@ -6584,7 +6549,6 @@ static int ath12k_pull_peer_sta_kickout_ev(struct ath12k_base *ab, struct sk_buf
 	arg->reason = le32_to_cpu(ev->reason);
 	arg->rssi = le32_to_cpu(ev->rssi);
 
-	kfree(tb);
 	return 0;
 }
 
@@ -6595,7 +6559,7 @@ static int ath12k_pull_roam_ev(struct ath12k_base *ab, struct sk_buff *skb,
 	const struct wmi_roam_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -6605,7 +6569,6 @@ static int ath12k_pull_roam_ev(struct ath12k_base *ab, struct sk_buff *skb,
 	ev = tb[WMI_TAG_ROAM_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch roam ev");
-		kfree(tb);
 		return -EPROTO;
 	}
 
@@ -6613,7 +6576,6 @@ static int ath12k_pull_roam_ev(struct ath12k_base *ab, struct sk_buff *skb,
 	roam_ev->reason = ev->reason;
 	roam_ev->rssi = ev->rssi;
 
-	kfree(tb);
 	return 0;
 }
 
@@ -6647,7 +6609,7 @@ static int ath12k_pull_chan_info_ev(struct ath12k_base *ab, struct sk_buff *skb,
 	const struct wmi_chan_info_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -6657,7 +6619,6 @@ static int ath12k_pull_chan_info_ev(struct ath12k_base *ab, struct sk_buff *skb,
 	ev = tb[WMI_TAG_CHAN_INFO_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch chan info ev");
-		kfree(tb);
 		return -EPROTO;
 	}
 
@@ -6674,7 +6635,6 @@ static int ath12k_pull_chan_info_ev(struct ath12k_base *ab, struct sk_buff *skb,
 	ch_info_ev->mac_clk_mhz = ev->mac_clk_mhz;
 	ch_info_ev->vdev_id = ev->vdev_id;
 
-	kfree(tb);
 	return 0;
 }
 
@@ -6686,7 +6646,7 @@ ath12k_pull_pdev_bss_chan_info_ev(struct ath12k_base *ab, struct sk_buff *skb,
 	const struct wmi_pdev_bss_chan_info_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -6696,7 +6656,6 @@ ath12k_pull_pdev_bss_chan_info_ev(struct ath12k_base *ab, struct sk_buff *skb,
 	ev = tb[WMI_TAG_PDEV_BSS_CHAN_INFO_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch pdev bss chan info ev");
-		kfree(tb);
 		return -EPROTO;
 	}
 
@@ -6714,7 +6673,6 @@ ath12k_pull_pdev_bss_chan_info_ev(struct ath12k_base *ab, struct sk_buff *skb,
 	bss_ch_info_ev->rx_bss_cycle_count_low = ev->rx_bss_cycle_count_low;
 	bss_ch_info_ev->rx_bss_cycle_count_high = ev->rx_bss_cycle_count_high;
 
-	kfree(tb);
 	return 0;
 }
 
@@ -6726,7 +6684,7 @@ ath12k_pull_vdev_install_key_compl_ev(struct ath12k_base *ab, struct sk_buff *sk
 	const struct wmi_vdev_install_key_compl_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -6736,7 +6694,6 @@ ath12k_pull_vdev_install_key_compl_ev(struct ath12k_base *ab, struct sk_buff *sk
 	ev = tb[WMI_TAG_VDEV_INSTALL_KEY_COMPLETE_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch vdev install key compl ev");
-		kfree(tb);
 		return -EPROTO;
 	}
 
@@ -6746,7 +6703,6 @@ ath12k_pull_vdev_install_key_compl_ev(struct ath12k_base *ab, struct sk_buff *sk
 	arg->key_flags = le32_to_cpu(ev->key_flags);
 	arg->status = le32_to_cpu(ev->status);
 
-	kfree(tb);
 	return 0;
 }
 
@@ -6757,7 +6713,7 @@ static int ath12k_pull_peer_assoc_conf_ev(struct ath12k_base *ab, struct sk_buff
 	const struct wmi_peer_assoc_conf_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -6767,14 +6723,12 @@ static int ath12k_pull_peer_assoc_conf_ev(struct ath12k_base *ab, struct sk_buff
 	ev = tb[WMI_TAG_PEER_ASSOC_CONF_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch peer assoc conf ev");
-		kfree(tb);
 		return -EPROTO;
 	}
 
 	peer_assoc_conf->vdev_id = le32_to_cpu(ev->vdev_id);
 	peer_assoc_conf->macaddr = ev->peer_macaddr.addr;
 
-	kfree(tb);
 	return 0;
 }
 
@@ -6792,7 +6746,7 @@ static int ath12k_reg_11d_new_cc_event(struct ath12k_base *ab, struct sk_buff *s
 	const void **tb;
 	int ret, i;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -6801,7 +6755,6 @@ static int ath12k_reg_11d_new_cc_event(struct ath12k_base *ab, struct sk_buff *s
 
 	ev = tb[WMI_TAG_11D_NEW_COUNTRY_EVENT];
 	if (!ev) {
-		kfree(tb);
 		ath12k_warn(ab, "failed to fetch 11d new cc ev");
 		return -EPROTO;
 	}
@@ -6814,8 +6767,6 @@ static int ath12k_reg_11d_new_cc_event(struct ath12k_base *ab, struct sk_buff *s
 		   ab->new_alpha2[0],
 		   ab->new_alpha2[1]);
 
-	kfree(tb);
-
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = &ab->pdevs[i];
 		ar = pdev->ar;
@@ -8567,7 +8518,7 @@ static void ath12k_pdev_ctl_failsafe_check_event(struct ath12k_base *ab,
 	const struct wmi_pdev_ctl_failsafe_chk_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -8577,7 +8528,6 @@ static void ath12k_pdev_ctl_failsafe_check_event(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_PDEV_CTL_FAILSAFE_CHECK_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch pdev ctl failsafe check ev");
-		kfree(tb);
 		return;
 	}
 
@@ -8591,8 +8541,6 @@ static void ath12k_pdev_ctl_failsafe_check_event(struct ath12k_base *ab,
 	if (ev->ctl_failsafe_status != 0)
 		ath12k_warn(ab, "pdev ctl failsafe failure status %d",
 			    ev->ctl_failsafe_status);
-
-	kfree(tb);
 }
 
 static void
@@ -8664,7 +8612,7 @@ ath12k_wmi_pdev_csa_switch_count_status_event(struct ath12k_base *ab,
 	const u32 *vdev_ids;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -8676,7 +8624,6 @@ ath12k_wmi_pdev_csa_switch_count_status_event(struct ath12k_base *ab,
 
 	if (!ev || !vdev_ids) {
 		ath12k_warn(ab, "failed to fetch pdev csa switch count ev");
-		kfree(tb);
 		return;
 	}
 
@@ -8686,8 +8633,6 @@ ath12k_wmi_pdev_csa_switch_count_status_event(struct ath12k_base *ab,
 		   ev->num_vdevs);
 
 	ath12k_wmi_process_csa_switch_count_event(ab, ev, vdev_ids);
-
-	kfree(tb);
 }
 
 static void
@@ -8699,7 +8644,7 @@ ath12k_wmi_pdev_dfs_radar_detected_event(struct ath12k_base *ab, struct sk_buff
 	struct ath12k *ar;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -8710,7 +8655,6 @@ ath12k_wmi_pdev_dfs_radar_detected_event(struct ath12k_base *ab, struct sk_buff
 
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch pdev dfs radar detected ev");
-		kfree(tb);
 		return;
 	}
 
@@ -8749,8 +8693,6 @@ ath12k_wmi_pdev_dfs_radar_detected_event(struct ath12k_base *ab, struct sk_buff
 
 exit:
 	rcu_read_unlock();
-
-	kfree(tb);
 }
 
 static void ath12k_tm_wmi_event_segmented(struct ath12k_base *ab, u32 cmd_id,
@@ -8761,7 +8703,7 @@ static void ath12k_tm_wmi_event_segmented(struct ath12k_base *ab, u32 cmd_id,
 	int ret;
 	u16 length;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
@@ -8772,14 +8714,11 @@ static void ath12k_tm_wmi_event_segmented(struct ath12k_base *ab, u32 cmd_id,
 	ev = tb[WMI_TAG_ARRAY_BYTE];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch ftm msg\n");
-		kfree(tb);
 		return;
 	}
 
 	length = skb->len - TLV_HDR_SIZE;
 	ath12k_tm_process_event(ab, cmd_id, ev, length);
-	kfree(tb);
-	tb = NULL;
 }
 
 static void
@@ -8792,7 +8731,7 @@ ath12k_wmi_pdev_temperature_event(struct ath12k_base *ab,
 	int temp;
 	u32 pdev_id;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ath12k_warn(ab, "failed to parse tlv: %ld\n", PTR_ERR(tb));
 		return;
@@ -8801,15 +8740,12 @@ ath12k_wmi_pdev_temperature_event(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_PDEV_TEMPERATURE_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch pdev temp ev\n");
-		kfree(tb);
 		return;
 	}
 
 	temp = a_sle32_to_cpu(ev->temp);
 	pdev_id = le32_to_cpu(ev->pdev_id);
 
-	kfree(tb);
-
 	ath12k_dbg(ab, ATH12K_DBG_WMI,
 		   "pdev temperature ev temp %d pdev_id %u\n",
 		   temp, pdev_id);
@@ -8836,7 +8772,7 @@ static void ath12k_fils_discovery_event(struct ath12k_base *ab,
 	const struct wmi_fils_discovery_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab,
@@ -8848,15 +8784,12 @@ static void ath12k_fils_discovery_event(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_HOST_SWFDA_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch FILS discovery event\n");
-		kfree(tb);
 		return;
 	}
 
 	ath12k_warn(ab,
 		    "FILS discovery frame expected from host for vdev_id: %u, transmission scheduled at %u, next TBTT: %u\n",
 		    ev->vdev_id, ev->fils_tt, ev->tbtt);
-
-	kfree(tb);
 }
 
 static void ath12k_probe_resp_tx_status_event(struct ath12k_base *ab,
@@ -8866,7 +8799,7 @@ static void ath12k_probe_resp_tx_status_event(struct ath12k_base *ab,
 	const struct wmi_probe_resp_tx_status_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab,
@@ -8879,7 +8812,6 @@ static void ath12k_probe_resp_tx_status_event(struct ath12k_base *ab,
 	if (!ev) {
 		ath12k_warn(ab,
 			    "failed to fetch probe response transmission status event");
-		kfree(tb);
 		return;
 	}
 
@@ -8887,8 +8819,6 @@ static void ath12k_probe_resp_tx_status_event(struct ath12k_base *ab,
 		ath12k_warn(ab,
 			    "Probe response transmission failed for vdev_id %u, status %u\n",
 			    ev->vdev_id, ev->tx_status);
-
-	kfree(tb);
 }
 
 static int ath12k_wmi_p2p_noa_event(struct ath12k_base *ab,
@@ -8900,7 +8830,7 @@ static int ath12k_wmi_p2p_noa_event(struct ath12k_base *ab,
 	struct ath12k *ar;
 	int ret, vdev_id;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse P2P NoA TLV: %d\n", ret);
@@ -8910,10 +8840,8 @@ static int ath12k_wmi_p2p_noa_event(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_P2P_NOA_EVENT];
 	noa = tb[WMI_TAG_P2P_NOA_INFO];
 
-	if (!ev || !noa) {
-		ret = -EPROTO;
-		goto out;
-	}
+	if (!ev || !noa)
+		return -EPROTO;
 
 	vdev_id = __le32_to_cpu(ev->vdev_id);
 
@@ -8936,8 +8864,6 @@ static int ath12k_wmi_p2p_noa_event(struct ath12k_base *ab,
 
 unlock:
 	rcu_read_unlock();
-out:
-	kfree(tb);
 	return ret;
 }
 
@@ -8948,7 +8874,7 @@ static void ath12k_rfkill_state_change_event(struct ath12k_base *ab,
 	const void **tb;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -8956,10 +8882,8 @@ static void ath12k_rfkill_state_change_event(struct ath12k_base *ab,
 	}
 
 	ev = tb[WMI_TAG_RFKILL_EVENT];
-	if (!ev) {
-		kfree(tb);
+	if (!ev)
 		return;
-	}
 
 	ath12k_dbg(ab, ATH12K_DBG_MAC,
 		   "wmi tlv rfkill state change gpio %d type %d radio_state %d\n",
@@ -8972,7 +8896,6 @@ static void ath12k_rfkill_state_change_event(struct ath12k_base *ab,
 	spin_unlock_bh(&ab->base_lock);
 
 	queue_work(ab->workqueue, &ab->rfkill_work);
-	kfree(tb);
 }
 
 static void
@@ -8988,7 +8911,7 @@ static void ath12k_wmi_twt_enable_event(struct ath12k_base *ab,
 	const struct wmi_twt_enable_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse wmi twt enable status event tlv: %d\n",
@@ -8999,15 +8922,12 @@ static void ath12k_wmi_twt_enable_event(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_TWT_ENABLE_COMPLETE_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch twt enable wmi event\n");
-		goto exit;
+		return;
 	}
 
 	ath12k_dbg(ab, ATH12K_DBG_MAC, "wmi twt enable event pdev id %u status %u\n",
 		   le32_to_cpu(ev->pdev_id),
 		   le32_to_cpu(ev->status));
-
-exit:
-	kfree(tb);
 }
 
 static void ath12k_wmi_twt_disable_event(struct ath12k_base *ab,
@@ -9017,7 +8937,7 @@ static void ath12k_wmi_twt_disable_event(struct ath12k_base *ab,
 	const struct wmi_twt_disable_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse wmi twt disable status event tlv: %d\n",
@@ -9028,15 +8948,12 @@ static void ath12k_wmi_twt_disable_event(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_TWT_DISABLE_COMPLETE_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch twt disable wmi event\n");
-		goto exit;
+		return;
 	}
 
 	ath12k_dbg(ab, ATH12K_DBG_MAC, "wmi twt disable event pdev id %d status %u\n",
 		   le32_to_cpu(ev->pdev_id),
 		   le32_to_cpu(ev->status));
-
-exit:
-	kfree(tb);
 }
 
 static int ath12k_wmi_wow_wakeup_host_parse(struct ath12k_base *ab,
@@ -9109,7 +9026,7 @@ static void ath12k_wmi_gtk_offload_status_event(struct ath12k_base *ab,
 	const void **tb;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -9119,7 +9036,6 @@ static void ath12k_wmi_gtk_offload_status_event(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_GTK_OFFLOAD_STATUS_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch gtk offload status ev");
-		kfree(tb);
 		return;
 	}
 
@@ -9129,7 +9045,6 @@ static void ath12k_wmi_gtk_offload_status_event(struct ath12k_base *ab,
 		rcu_read_unlock();
 		ath12k_warn(ab, "failed to get arvif for vdev_id:%d\n",
 			    le32_to_cpu(ev->vdev_id));
-		kfree(tb);
 		return;
 	}
 
@@ -9145,8 +9060,6 @@ static void ath12k_wmi_gtk_offload_status_event(struct ath12k_base *ab,
 				   (void *)&replay_ctr_be, GFP_ATOMIC);
 
 	rcu_read_unlock();
-
-	kfree(tb);
 }
 
 static void ath12k_wmi_event_mlo_setup_complete(struct ath12k_base *ab,
@@ -9158,7 +9071,7 @@ static void ath12k_wmi_event_mlo_setup_complete(struct ath12k_base *ab,
 	const void **tb;
 	int ret, i;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse mlo setup complete event tlv: %d\n",
@@ -9169,7 +9082,6 @@ static void ath12k_wmi_event_mlo_setup_complete(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_MLO_SETUP_COMPLETE_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch mlo setup complete event\n");
-		kfree(tb);
 		return;
 	}
 
@@ -9188,14 +9100,11 @@ static void ath12k_wmi_event_mlo_setup_complete(struct ath12k_base *ab,
 	if (!ar) {
 		ath12k_warn(ab, "invalid pdev_id %d status %u in setup complete event\n",
 			    ev->pdev_id, ev->status);
-		goto out;
+		return;
 	}
 
 	ar->mlo_setup_status = le32_to_cpu(ev->status);
 	complete(&ar->mlo_setup_done);
-
-out:
-	kfree(tb);
 }
 
 static void ath12k_wmi_event_teardown_complete(struct ath12k_base *ab,
@@ -9205,7 +9114,7 @@ static void ath12k_wmi_event_teardown_complete(struct ath12k_base *ab,
 	const void **tb;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse teardown complete event tlv: %d\n", ret);
@@ -9215,11 +9124,8 @@ static void ath12k_wmi_event_teardown_complete(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_MLO_TEARDOWN_COMPLETE];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch teardown complete event\n");
-		kfree(tb);
 		return;
 	}
-
-	kfree(tb);
 }
 
 #ifdef CONFIG_ATH12K_DEBUGFS
-- 
2.53.0


