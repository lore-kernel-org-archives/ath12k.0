Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA42FD8FD3
	for <ath12k@archiver.kernel.org>; Thu, 26 Feb 2026 16:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QaeTeRqtkcDSjFqUpKRv3e9jCf/xGwxGNheOodZu50=; b=VjwNd7em0Wi2R2aYN9UO6kjVdo
	QCgHcpIoEn8dz/4WtvZFdD1nkHBKJPgWlY0CgjI7gCxRwZtz8sMyhWAXjYZF7uF40nWQqC8VPXqxd
	w6iXZCamk87UDfQkupFd5QDDxVKWLP12E7hgzEiTSzNGIBM4SlJV5POV5Og+beW9KY6tetoWliOa9
	nTHEYFs1BLyxcWV4Frs7MVgK+9mqnxIL4ueZEiZnyTwJT494p9trHeqRYrrUWab0vIcXpy2X9ulDk
	mT9l7GdSOnh8Mi21NkIwdUDEsPDhuuMJrhfHJ6T9s0H6RSF8YSgTKV1yQgw6xWPQeHHLJAEe9b+bf
	p/lRQdwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvee3-00000006mup-0cj0;
	Thu, 26 Feb 2026 16:55:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvee1-00000006mti-03de
	for ath12k@lists.infradead.org;
	Thu, 26 Feb 2026 16:55:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso10086515e9.3
        for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 08:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772124919; x=1772729719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QaeTeRqtkcDSjFqUpKRv3e9jCf/xGwxGNheOodZu50=;
        b=Ztf5UFVwzTbFaq8TwcQbn9ro7iN9oM9kWY97yom44sr6qk7l2CuTX4C7TMxBsq11VZ
         h0kwIsazYRvmznsUSG1+jZB8HlDwh9oc+Udpan4prxHhLM0dTAtZj9HYR7PC6MZqc9+I
         EU2myoa5GB8MeAqlIRK4LX4/oqzvym1EpjVLXpdfHQ4ikAAtRrUoScNMpbcLY2ifDl9e
         VgNCguzBJUy8ZC/h0zBHpYvp+K99BygbuWTlnmSDMR66jwKsAbRb8ypCOqDODgc8mEJ0
         SGgSBpKEFQOGHRH4G+2YbQr/J9EjgNg4PAvOfSNG6wUjUCbGgo9KT5Xz+ohqHKbrRVH9
         J43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772124919; x=1772729719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7QaeTeRqtkcDSjFqUpKRv3e9jCf/xGwxGNheOodZu50=;
        b=X+NxW/rrst8qzUH/dwIlN+tdZVZDnXnEZL8GLQTMM28uOVw5B053Zw2BqcOoikdpVG
         7Z6s1pcmI/6nmqK/hJmbectlQXvcrNEhacY5FdlaKKg65FFMAgwylBalqDqdMy95FuOE
         F0OvBm8pCmwpO/jup2TyoSnMhDUQSuQYisvLR4Cd3kVatRraqp8vUhJ5am/dbkPEJakB
         obSj8uxkA0/MUzgQYEibVsTPc/JmmLgzQBsRCemuI+oBoH1iS2jZrfI6n2jj7bEHYYG/
         /nQs/TkLWpkXQEQFOPNgXQbM0dX3sOzulE/ODmobXw/DmQ93XstNstP4/iTLz3cJpi3M
         bL+Q==
X-Gm-Message-State: AOJu0YxjynyB41XXgnWV3TCxpheD/M4V0As7HpB1NESUfaJ+W/YNXE9j
	GAMAONIOYRYgj4qXV987NCgaY4EqQUrha5+Rd3k9XQYTr5n4sia7j7TVLlJuLw==
X-Gm-Gg: ATEYQzyQQpZZcd4ramw01MK08Ah/jD5dARhdOXzvImnSIO1EmHEyxKs3ym2QbT46El1
	9z1HCWmPGS8+Bgf7Iaka0oxdyMIFoVWMIbF7/su0QasKesNi0M5EyyNM30jCaMaCMZlGFLks2l7
	zAuVhxWnP6ELASqWJBZb7BzIzq6YpHRchXutNk1LpSQc3KxfCMXuM/c+7qONbUW6++YmVjUjWVj
	rPgRA0dwTNiMY5wVttaDDJTZS5pD6CmADrWJEwatGjEDZObJr4HMbk6EW2jbpfn1gSInne6+IZx
	ZhPiue70K0Hq4qCJBR0u2r7WW5tcNMI64R7HhSsjlM1AJ3DA/yBSm/VcL4Qn64+z2kVBsoaDLED
	RkptVo0umBK/w3cfagKjKPaRPMnhr+N2Aqzb/noehGmmcxkg+wQn/w4pdsm7SJXo4KOJvjkAAlG
	Hx8W+YlMlVRzD0mBrlA08GS6Wp6dpwkNNl0wQZb4kHvqPNbb3HXBvFbYjD5jySJHyrXi8=
X-Received: by 2002:a05:600c:820e:b0:480:1e8f:d15f with SMTP id 5b1f17b1804b1-483a95eb591mr354594255e9.2.1772124918742;
        Thu, 26 Feb 2026 08:55:18 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb85c58sm39488595e9.9.2026.02.26.08.55.18
        for <ath12k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:55:18 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Subject: [RFC PATCH 1/1] wifi: ath12k: avoid dynamic alloc when parsing wmi tb
Date: Thu, 26 Feb 2026 17:55:17 +0100
Message-ID: <20260226165517.1899045-2-nico.escande@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226165517.1899045-1-nico.escande@gmail.com>
References: <20260226165517.1899045-1-nico.escande@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_085521_241532_2D0BAD0D 
X-CRM114-Status: GOOD (  17.05  )
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

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath12k/core.c |   7 +
 drivers/net/wireless/ath/ath12k/core.h |   2 +
 drivers/net/wireless/ath/ath12k/wmi.c  | 170 ++++++-------------------
 3 files changed, 49 insertions(+), 130 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 9d6c50a94e64..961c9df69aa1 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -2237,6 +2237,7 @@ void ath12k_core_free(struct ath12k_base *ab)
 	timer_delete_sync(&ab->rx_replenish_retry);
 	destroy_workqueue(ab->workqueue_aux);
 	destroy_workqueue(ab->workqueue);
+	free_percpu(ab->wmi_tb);
 	kfree(ab);
 }
 
@@ -2249,6 +2250,11 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
 	if (!ab)
 		return NULL;
 
+	ab->wmi_tb = __alloc_percpu(WMI_TAG_MAX * sizeof(void *),
+				    __alignof__(void *));
+	if (!ab->wmi_tb)
+		goto err_sc_free;
+
 	init_completion(&ab->driver_recovery);
 
 	ab->workqueue = create_singlethread_workqueue("ath12k_wq");
@@ -2296,6 +2302,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
 err_free_wq:
 	destroy_workqueue(ab->workqueue);
 err_sc_free:
+	free_percpu(ab->wmi_tb);
 	kfree(ab);
 	return NULL;
 }
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 990934ec92fc..378573a100e8 100644
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
@@ -934,6 +935,7 @@ struct ath12k_base {
 	struct device *dev;
 	struct ath12k_qmi qmi;
 	struct ath12k_wmi_base wmi_ab;
+	void __percpu *wmi_tb;
 	struct completion fw_ready;
 	u8 device_id;
 	int num_radios;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 404f031a3c87..9ccc10c07c21 100644
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
 
-	tb = kcalloc(WMI_TAG_MAX, sizeof(*tb), gfp);
-	if (!tb)
-		return ERR_PTR(-ENOMEM);
+	tb = this_cpu_ptr(ab->wmi_tb);
+	memset(tb, 0, WMI_TAG_MAX * sizeof(void *));
 
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
 
@@ -6785,7 +6739,7 @@ ath12k_pull_pdev_temp_ev(struct ath12k_base *ab, struct sk_buff *skb,
 	const void **tb;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -6795,11 +6749,9 @@ ath12k_pull_pdev_temp_ev(struct ath12k_base *ab, struct sk_buff *skb,
 	ev = tb[WMI_TAG_PDEV_TEMPERATURE_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch pdev temp ev");
-		kfree(tb);
 		return -EPROTO;
 	}
 
-	kfree(tb);
 	return 0;
 }
 
@@ -8582,7 +8534,7 @@ static void ath12k_pdev_ctl_failsafe_check_event(struct ath12k_base *ab,
 	const struct wmi_pdev_ctl_failsafe_chk_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -8592,7 +8544,6 @@ static void ath12k_pdev_ctl_failsafe_check_event(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_PDEV_CTL_FAILSAFE_CHECK_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch pdev ctl failsafe check ev");
-		kfree(tb);
 		return;
 	}
 
@@ -8606,8 +8557,6 @@ static void ath12k_pdev_ctl_failsafe_check_event(struct ath12k_base *ab,
 	if (ev->ctl_failsafe_status != 0)
 		ath12k_warn(ab, "pdev ctl failsafe failure status %d",
 			    ev->ctl_failsafe_status);
-
-	kfree(tb);
 }
 
 static void
@@ -8679,7 +8628,7 @@ ath12k_wmi_pdev_csa_switch_count_status_event(struct ath12k_base *ab,
 	const u32 *vdev_ids;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -8691,7 +8640,6 @@ ath12k_wmi_pdev_csa_switch_count_status_event(struct ath12k_base *ab,
 
 	if (!ev || !vdev_ids) {
 		ath12k_warn(ab, "failed to fetch pdev csa switch count ev");
-		kfree(tb);
 		return;
 	}
 
@@ -8701,8 +8649,6 @@ ath12k_wmi_pdev_csa_switch_count_status_event(struct ath12k_base *ab,
 		   ev->num_vdevs);
 
 	ath12k_wmi_process_csa_switch_count_event(ab, ev, vdev_ids);
-
-	kfree(tb);
 }
 
 static void
@@ -8714,7 +8660,7 @@ ath12k_wmi_pdev_dfs_radar_detected_event(struct ath12k_base *ab, struct sk_buff
 	struct ath12k *ar;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -8725,7 +8671,6 @@ ath12k_wmi_pdev_dfs_radar_detected_event(struct ath12k_base *ab, struct sk_buff
 
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch pdev dfs radar detected ev");
-		kfree(tb);
 		return;
 	}
 
@@ -8764,8 +8709,6 @@ ath12k_wmi_pdev_dfs_radar_detected_event(struct ath12k_base *ab, struct sk_buff
 
 exit:
 	rcu_read_unlock();
-
-	kfree(tb);
 }
 
 static void ath12k_tm_wmi_event_segmented(struct ath12k_base *ab, u32 cmd_id,
@@ -8776,7 +8719,7 @@ static void ath12k_tm_wmi_event_segmented(struct ath12k_base *ab, u32 cmd_id,
 	int ret;
 	u16 length;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
@@ -8787,14 +8730,11 @@ static void ath12k_tm_wmi_event_segmented(struct ath12k_base *ab, u32 cmd_id,
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
@@ -8831,7 +8771,7 @@ static void ath12k_fils_discovery_event(struct ath12k_base *ab,
 	const struct wmi_fils_discovery_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab,
@@ -8843,15 +8783,12 @@ static void ath12k_fils_discovery_event(struct ath12k_base *ab,
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
@@ -8861,7 +8798,7 @@ static void ath12k_probe_resp_tx_status_event(struct ath12k_base *ab,
 	const struct wmi_probe_resp_tx_status_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab,
@@ -8874,7 +8811,6 @@ static void ath12k_probe_resp_tx_status_event(struct ath12k_base *ab,
 	if (!ev) {
 		ath12k_warn(ab,
 			    "failed to fetch probe response transmission status event");
-		kfree(tb);
 		return;
 	}
 
@@ -8882,8 +8818,6 @@ static void ath12k_probe_resp_tx_status_event(struct ath12k_base *ab,
 		ath12k_warn(ab,
 			    "Probe response transmission failed for vdev_id %u, status %u\n",
 			    ev->vdev_id, ev->tx_status);
-
-	kfree(tb);
 }
 
 static int ath12k_wmi_p2p_noa_event(struct ath12k_base *ab,
@@ -8895,7 +8829,7 @@ static int ath12k_wmi_p2p_noa_event(struct ath12k_base *ab,
 	struct ath12k *ar;
 	int ret, vdev_id;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse P2P NoA TLV: %d\n", ret);
@@ -8905,10 +8839,8 @@ static int ath12k_wmi_p2p_noa_event(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_P2P_NOA_EVENT];
 	noa = tb[WMI_TAG_P2P_NOA_INFO];
 
-	if (!ev || !noa) {
-		ret = -EPROTO;
-		goto out;
-	}
+	if (!ev || !noa)
+		return -EPROTO;
 
 	vdev_id = __le32_to_cpu(ev->vdev_id);
 
@@ -8931,8 +8863,6 @@ static int ath12k_wmi_p2p_noa_event(struct ath12k_base *ab,
 
 unlock:
 	rcu_read_unlock();
-out:
-	kfree(tb);
 	return ret;
 }
 
@@ -8943,7 +8873,7 @@ static void ath12k_rfkill_state_change_event(struct ath12k_base *ab,
 	const void **tb;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -8951,10 +8881,8 @@ static void ath12k_rfkill_state_change_event(struct ath12k_base *ab,
 	}
 
 	ev = tb[WMI_TAG_RFKILL_EVENT];
-	if (!ev) {
-		kfree(tb);
+	if (!ev)
 		return;
-	}
 
 	ath12k_dbg(ab, ATH12K_DBG_MAC,
 		   "wmi tlv rfkill state change gpio %d type %d radio_state %d\n",
@@ -8967,7 +8895,6 @@ static void ath12k_rfkill_state_change_event(struct ath12k_base *ab,
 	spin_unlock_bh(&ab->base_lock);
 
 	queue_work(ab->workqueue, &ab->rfkill_work);
-	kfree(tb);
 }
 
 static void
@@ -8983,7 +8910,7 @@ static void ath12k_wmi_twt_enable_event(struct ath12k_base *ab,
 	const struct wmi_twt_enable_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse wmi twt enable status event tlv: %d\n",
@@ -8994,15 +8921,12 @@ static void ath12k_wmi_twt_enable_event(struct ath12k_base *ab,
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
@@ -9012,7 +8936,7 @@ static void ath12k_wmi_twt_disable_event(struct ath12k_base *ab,
 	const struct wmi_twt_disable_event *ev;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse wmi twt disable status event tlv: %d\n",
@@ -9023,15 +8947,12 @@ static void ath12k_wmi_twt_disable_event(struct ath12k_base *ab,
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
@@ -9104,7 +9025,7 @@ static void ath12k_wmi_gtk_offload_status_event(struct ath12k_base *ab,
 	const void **tb;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
@@ -9114,7 +9035,6 @@ static void ath12k_wmi_gtk_offload_status_event(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_GTK_OFFLOAD_STATUS_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch gtk offload status ev");
-		kfree(tb);
 		return;
 	}
 
@@ -9124,7 +9044,6 @@ static void ath12k_wmi_gtk_offload_status_event(struct ath12k_base *ab,
 		rcu_read_unlock();
 		ath12k_warn(ab, "failed to get arvif for vdev_id:%d\n",
 			    le32_to_cpu(ev->vdev_id));
-		kfree(tb);
 		return;
 	}
 
@@ -9140,8 +9059,6 @@ static void ath12k_wmi_gtk_offload_status_event(struct ath12k_base *ab,
 				   (void *)&replay_ctr_be, GFP_ATOMIC);
 
 	rcu_read_unlock();
-
-	kfree(tb);
 }
 
 static void ath12k_wmi_event_mlo_setup_complete(struct ath12k_base *ab,
@@ -9153,7 +9070,7 @@ static void ath12k_wmi_event_mlo_setup_complete(struct ath12k_base *ab,
 	const void **tb;
 	int ret, i;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse mlo setup complete event tlv: %d\n",
@@ -9164,7 +9081,6 @@ static void ath12k_wmi_event_mlo_setup_complete(struct ath12k_base *ab,
 	ev = tb[WMI_TAG_MLO_SETUP_COMPLETE_EVENT];
 	if (!ev) {
 		ath12k_warn(ab, "failed to fetch mlo setup complete event\n");
-		kfree(tb);
 		return;
 	}
 
@@ -9183,14 +9099,11 @@ static void ath12k_wmi_event_mlo_setup_complete(struct ath12k_base *ab,
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
@@ -9200,7 +9113,7 @@ static void ath12k_wmi_event_teardown_complete(struct ath12k_base *ab,
 	const void **tb;
 	int ret;
 
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	tb = ath12k_wmi_tlv_parse(ab, skb);
 	if (IS_ERR(tb)) {
 		ret = PTR_ERR(tb);
 		ath12k_warn(ab, "failed to parse teardown complete event tlv: %d\n", ret);
@@ -9210,11 +9123,8 @@ static void ath12k_wmi_event_teardown_complete(struct ath12k_base *ab,
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


