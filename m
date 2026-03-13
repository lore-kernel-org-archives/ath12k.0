Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D61106ACFE
	for <ath12k@archiver.kernel.org>; Fri, 13 Mar 2026 00:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dc7T6F+QAAK7xJvWNMAT28cNkHEqvmKrsbYs4miggWQ=; b=znXQEO8+nD64xaT44dFTgDDIxh
	DfAUeuC2sgSHc0n60NFhv0Ee3sZoIkR/9cqFyh04hL8/ExA7lzp+RVvid2bZ7hP+KhbMd/xO0jK7l
	QWH1JLyN39pN4wx3uyiQ5ZNNkdQaYF4AwF9Edcc0cToC5fZGE5FjRl5DUbwqL2unSu9jw1lrw7nZv
	6uQQnhySuYSV+ZCn7ICtCvdCrxEwxrrTkyc45HKc1qNUJQVmkocCfJkNlT6+eGdWtmI/qHt7G1MUF
	kMLXqBSSCKyb7MrhSNlhHubrFw+8YXlNzAmCfE052Gl6kf4WZHiyy2dRMgkj08CWvyNg6pTi8tfuE
	8XjolLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qB6-0000000Ft7C-3JSe;
	Fri, 13 Mar 2026 00:14:56 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qB4-0000000Ft6K-3knJ
	for ath12k@lists.infradead.org;
	Fri, 13 Mar 2026 00:14:56 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-799569f6e9dso18043657b3.3
        for <ath12k@lists.infradead.org>; Thu, 12 Mar 2026 17:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773360893; x=1773965693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc7T6F+QAAK7xJvWNMAT28cNkHEqvmKrsbYs4miggWQ=;
        b=UW9OoThd82W8LfD8Md6W+KZc7hwK1+zrHa5zEC0tCCA8XDzU0AWCkuWjkjxJizW5MW
         vpYlv25rQHzmf1sGykoWI+fpfT98Iby5zIsRxR3TS3pjTnBz/H81Dr1nIe70n8Yyw8VQ
         pZOQ9e/bAgyDzdEo7VsF6yZXs/OnciJkPdWzQgxPUDaX5i1SR/E2204pwdPIcPWdW6VX
         Dyw+xw3lwK3GbY0uqxjmY/aRQXkIMUzCcAFyp7zPNasUzDBMgDsmuooWo+1Ery4n/s7S
         16/q94ndv9HUJ4wH05mtquzI9z3KnqXjYoqVsphLg58pxnFdYJU+YWWVQdXWOo3tpSc6
         6hOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773360893; x=1773965693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dc7T6F+QAAK7xJvWNMAT28cNkHEqvmKrsbYs4miggWQ=;
        b=fEJE+W/aaOUOGWfhfEOXy1o7ZWsm4Ev28JPWI/5dXJkcM6XL/1L81rt3+0FsDXABdM
         toaqxoGy+tl27DeCOAVFak1UvdNxlN1rvekosZ5MnTJZ4rYG/o4jY14RfzTitC/7bn8N
         8zItpZD3SGjpKOnslSy9Akw4H0z7/2Db2GgVRKZlD362vb5+VPncKdJITWSBpk/VuzLB
         Pr/w16yDA5QmaLSzimoiGbzNuIzFs/Vrg3zcs0xyRDy6iQ7OV2r9x8PYSpWX6MRc4Pm1
         WMu79HLkTIL1mCoAnlr979wvgl11c0Bo2+2drUC8krgvbrp7L4JI5G2mr2lvsSxxqFHq
         ezZw==
X-Forwarded-Encrypted: i=1; AJvYcCWwmnD9r1H6Oacj/DKvDWEkSWMnNq8WnBRFw5Hbjvn2UtzcXntU9A/KuZZnCqc/ZHGfth+BXCk=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb/3jyKE2/Ubb/aSASxV/cEJ7N/7uu5kyzZy6soikgSaXmmjuc
	8jBOLeFH2GCYPArgyzRFsVJBRMshVRXPkaP+bYZFBQPAvnXvvTOJi26c
X-Gm-Gg: ATEYQzz2oZpo+emJK0l/Hb1WYXsf+kCo/oUdtE1DZxCn9vtvLJp+65JF7bu1+HBO2ip
	Y8seONaAcZmM0GSzaoHnjYVF+n1Glv8qoFnSiYm2bFLzdKRAdI+D9vB7egkIOh8xzr5HlARfcYL
	mmi/pXW++fLoskspIb+74Vq+RBb6dq0n6MVvvHu86M8AXeZa0iIYg7513mY+my1URlS2st3PPmZ
	pIb6+cFvxY6mN3wn5M5jpigoTcA0dEuDu3kUkvqsEgtqr4nsf3ZvZ1IJ9nG+rO/NvDI/lcC55qH
	nH0sSFxZSrSYb4Tqwf7eBSz2V8ib6pMWNx+2dPe39E0B51ESAyKQ1To+kThlzHPko3hiMOPnnxA
	yjlsqStqWjWwbfVAwdtC/xQ7BbGBhyNFl/VaoivyJbvaeR/tYcF/4q+qmCyiO/Gv9GVTw4XRinL
	Ek+PSCf/Kx8/Y8LQtunj1Hh2aROZmzttxuRW37Uhb6CYyUhKsRQxlt29mxMBeDh4Yl
X-Received: by 2002:a05:690c:6f13:b0:798:11ac:d0ac with SMTP id 00721157ae682-79a1c1e5451mr16754597b3.53.1773360893250;
        Thu, 12 Mar 2026 17:14:53 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917e1fa3esm41018377b3.18.2026.03.12.17.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 17:14:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	ath12k@lists.infradead.org (open list:QUALCOMM ATH12K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH ath-next] wifi: ath12k: use kzalloc_flex
Date: Thu, 12 Mar 2026 17:14:34 -0700
Message-ID: <20260313001434.118010-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_171454_963316_297C6B77 
X-CRM114-Status: GOOD (  12.36  )
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
assignment immediately after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 29 +++++++--------------------
 drivers/net/wireless/ath/ath12k/wmi.h |  2 +-
 2 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 553ec28b6aaa..b7c43a64e37b 100644
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
index 0bf0a7941cd3..190e7a4a92d0 100644
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


