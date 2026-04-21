Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE90F94CB3
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 21:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DXmPZkb/Svwu6Il6bmZz1uAoo07kk+9/HvI68DRq0LI=; b=VHIrLR5vxNvYpCPggURQ9nJD7a
	Ab1LIlDtoxTfYwIbwzchxeCcCz/YZFsOaRj0aNn/QBrlLQIwj+b5zMjAAAABeEV/BVemM1rLnZFSj
	2SMgdKNgw+ZW9XbrxdyK4IakNm+TTMr0y5Zvv9JCeUmlzG0lQsfMNgDAjwSQppa+DBwuuEzg0DJK3
	w2D6+TGueGB988P69vvecEtfyaQeA2p0x23eKbubq8wYOi7/mRhnNiGnml1hybA/lmy4wPsosBrE6
	nRDWNhq5tyLy4ZGgU0IukVy3pfx83PQ3JKQ1dAT7EPhXtrTCniXrDflAnfoGIhp5tkEnhKq5+2ffk
	ZC/ooZ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFIlJ-00000009Bkk-2t9H;
	Tue, 21 Apr 2026 21:36:05 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFIlG-00000009BkK-39hG
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 21:36:04 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so2713332a91.1
        for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 14:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776807362; x=1777412162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DXmPZkb/Svwu6Il6bmZz1uAoo07kk+9/HvI68DRq0LI=;
        b=cyN3KfjQJm3UyH0Liqs5SjCtXBGQFLFMeVkwOqeowmpBU08oLELUHSRDYq0Uzif7D6
         UiQHsuGRH5s5SPtY5OFqUQbVsJ6n7IYT2ovYas+5wodIzglmmk2FWLffNXBT1OPAKBFp
         GrvVHhitQwv3zRm3fhUnDQkh56ybn+D4K5N/Q+9MhnWKxftQO3m8l522kxhj8YbvqVSk
         uwTyyI8evf6Li0TujgvDbMlMwAvJGsIqF5WOdqWRwpmKkzsyLh1fjo54EHwtAtMM28Wi
         O54mmRTwBfGa7ysEy/WDO23JCb1hDEWy7eqSS/0jWnmOcwbYRaIfO6Xr4zAbB3eYleXa
         hcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776807362; x=1777412162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXmPZkb/Svwu6Il6bmZz1uAoo07kk+9/HvI68DRq0LI=;
        b=MkZ8iVZXd02j7JLY/cl06UCGs3MdqIDh0OxIdCoQ6vPoYryA8n/yAe5/bSDHYce3xX
         QA/0KOwyh6W4bUFjnrAmplQU3zOKK3UDwgJiqR1coTmlisl9e/Ezr1zx6/J+eW5aiC8X
         4Fai+5T/qfzgRZaycTEQlDUPbns2gwa8YicTM8ZYTqznIBa5qRAFRobkkF+vHyUIEfgO
         Ygn8GirRsy9bB9H9XKYrxb3XvCWKuq5809GMM/4+k38aE7yKx9AaucpPtiB9cNv3goxc
         VQauf6Aja4B/IIhgcVP5H2kF7HONSX+qReIoj9VKzonBQ8wV533BQ/Mq6oxXBFZVAksA
         K0WQ==
X-Forwarded-Encrypted: i=1; AFNElJ/mm/T2Uw5btkFLRCQmHTlQRFHgl9KE8O3CnK6Cvh6wiWY+oEbcLIB9kKEsXd/SoAVZRpMJR5o=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnO37z5c7mPq0luqhNTI9y3E09d9APxuPltfqUPeUA0NsCRnCB
	SE+nlZ9fx7JV1RalIT7Mh7M2Z926KZl1q5ywvNSIzU5kgp9YxjmnDzER
X-Gm-Gg: AeBDiesmR+SPMnoEpuYFlkUk2hjWHw0ho69+tfXS3odIzp3DUWBdNasUlJzTdGJ1NKU
	tZu5wUCsbbIE+taKvRpczA8dbSsK1DcKNlVfnpHzYVW9/1snrIqMHi1J7b3Rewfx5LANe/QCLu0
	e8AfLTp/E8UMnU1R9qpgbt4qtTrMLAn5eu011SlU893Z4goTs5AkNM34mntXKTUWncqjvCkRAfQ
	FVQu9Ur47VIMYc4U7mjyHEkk2RbjkhSaIDqPSlFnTZFs4VUQJmJciWgb09HFAo8GbqG2wIFUwBj
	GK0YNcuVPhYyfeUxaJ3AiZtFrjm0Ee3XnWJ6YWw4xjtblgCAOn6hr6Cru1Pa3ZvxVOCVGuucnXG
	ESdBXHNg2eiNOUhHfPXzjsZNIlsTJ6lZ6QoEqosxQBd62v/2++cmNjIkco08toBpjL+KDDufbkk
	UVDYFGHx/m1vo4oapFCwS4CTUXCuu0u/epWR2rnK3v172ibYsuoMdDYgZGGdjC/gK2sfT4b/UD0
	HrN
X-Received: by 2002:a17:90b:2e4e:b0:35e:579a:7e9a with SMTP id 98e67ed59e1d1-36140204c56mr15021196a91.7.1776807361797;
        Tue, 21 Apr 2026 14:36:01 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8be])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a92asm14352270a91.10.2026.04.21.14.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 14:36:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	ath12k@lists.infradead.org (open list:QUALCOMM ATH12K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2 ath-next] wifi: ath12k: use kzalloc_flex
Date: Tue, 21 Apr 2026 14:35:44 -0700
Message-ID: <20260421213544.6238-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_143602_798475_E535F0A5 
X-CRM114-Status: GOOD (  12.48  )
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

Convert kzalloc_obj + kcalloc to kzalloc_flex to save an allocation.

Add __counted_by to get extra runtime analysis. Move counting variable
assignment immediately after allocation before any potential accesses.
kzalloc_flex does this anyway for GCC >= 15.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 v2: reword last comment.
 drivers/net/wireless/ath/ath12k/mac.c | 29 +++++++--------------------
 drivers/net/wireless/ath/ath12k/wmi.h |  2 +-
 2 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index fbdfe6424fd7..32d590504a80 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5611,12 +5611,14 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
 	if (ret)
 		goto exit;

-	arg = kzalloc_obj(*arg);
+	arg = kzalloc_flex(*arg, chan_list, n_channels);
 	if (!arg) {
 		ret = -ENOMEM;
 		goto exit;
 	}

+	arg->num_chan = n_channels;
+
 	ath12k_wmi_start_scan_init(ar, arg);
 	arg->vdev_id = arvif->vdev_id;
 	arg->scan_id = ATH12K_SCAN_ID;
@@ -5638,18 +5640,8 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
 		arg->scan_f_passive = 1;
 	}

-	if (n_channels) {
-		arg->num_chan = n_channels;
-		arg->chan_list = kcalloc(arg->num_chan, sizeof(*arg->chan_list),
-					 GFP_KERNEL);
-		if (!arg->chan_list) {
-			ret = -ENOMEM;
-			goto exit;
-		}
-
-		for (i = 0; i < arg->num_chan; i++)
-			arg->chan_list[i] = chan_list[i]->center_freq;
-	}
+	for (i = 0; i < arg->num_chan; i++)
+		arg->chan_list[i] = chan_list[i]->center_freq;

 	ret = ath12k_start_scan(ar, arg);
 	if (ret) {
@@ -5674,7 +5666,6 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,

 exit:
 	if (arg) {
-		kfree(arg->chan_list);
 		kfree(arg->extraie.ptr);
 		kfree(arg);
 	}
@@ -13735,19 +13726,13 @@ int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	scan_time_msec = hw->wiphy->max_remain_on_channel_duration * 2;

 	struct ath12k_wmi_scan_req_arg *arg __free(kfree) =
-					kzalloc_obj(*arg);
+					kzalloc_flex(*arg, chan_list, 1);
 	if (!arg)
 		return -ENOMEM;

-	ath12k_wmi_start_scan_init(ar, arg);
 	arg->num_chan = 1;
+	ath12k_wmi_start_scan_init(ar, arg);

-	u32 *chan_list __free(kfree) = kcalloc(arg->num_chan, sizeof(*chan_list),
-					       GFP_KERNEL);
-	if (!chan_list)
-		return -ENOMEM;
-
-	arg->chan_list = chan_list;
 	arg->vdev_id = arvif->vdev_id;
 	arg->scan_id = ATH12K_SCAN_ID;
 	arg->chan_list[0] = chan->center_freq;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 5ba9b7d3a888..5f150f21c146 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3586,7 +3586,6 @@ struct ath12k_wmi_scan_req_arg {
 	u32 num_bssid;
 	u32 num_ssids;
 	u32 n_probes;
-	u32 *chan_list;
 	u32 notify_scan_events;
 	struct cfg80211_ssid ssid[WLAN_SCAN_MAX_NUM_SSID];
 	struct ath12k_wmi_mac_addr_params bssid_list[WLAN_SCAN_MAX_NUM_BSSID];
@@ -3595,6 +3594,7 @@ struct ath12k_wmi_scan_req_arg {
 	u32 num_hint_bssid;
 	struct ath12k_wmi_hint_short_ssid_arg hint_s_ssid[WLAN_SCAN_MAX_HINT_S_SSID];
 	struct ath12k_wmi_hint_bssid_arg hint_bssid[WLAN_SCAN_MAX_HINT_BSSID];
+	u32 chan_list[] __counted_by(num_chan);
 };

 struct wmi_ssid_arg {
--
2.53.0


