Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18FDC98328
	for <ath12k@archiver.kernel.org>; Sun, 27 Sep 2026 01:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bxwshbrxYLFrgDXVSsiEGqJVWdpJpdakWMZ76gQ4IE0=; b=cjqxpOWWA/jfs2VVvSK7x6Hyej
	6qLFSrduhiA7pNVhnfT9Fz50zO5v0GsaqH0CRVi9iryU95sq1qz0SGordmikR/sQBnW9cGG0ciaTV
	6JOxUqn6dzrxsz1EERNn2dIxsupWyXUmP2jyLVpg8D/4NamBqP8g1ffes+zB4fYdPvNdZOJ5Zr3Ta
	Q9dvvI9RKhKww5Fm2ng6umEc93LZzbib35vYMBN/2f1wCLHTo8W7uHS+bqNjxNu9g3DS7KzEPC1op
	FkhowmZsayCG4rljiZHoq44fHUH2+8cnQFqzDHOsrxiV05wmNCyypnCn9gV5ioyNdNSPZfIcpRUrx
	N2E+HqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAdbt-0000000FvEL-09Cf;
	Sun, 27 Sep 2026 01:23:21 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAdbq-0000000FvDw-2giY
	for ath12k@lists.infradead.org;
	Sun, 27 Sep 2026 01:23:20 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e66390995so10966515e9.2
        for <ath12k@lists.infradead.org>; Sat, 26 Sep 2026 18:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790472196; x=1791076996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxwshbrxYLFrgDXVSsiEGqJVWdpJpdakWMZ76gQ4IE0=;
        b=NtHRz6RWlwJvq+nTqIPrrbrHqhHBtGAaTwx9e+Psgl41D4cyriH0jznMBlhbrKeTRO
         /R8G7+GcAgUuGwYaZKiwhby7wMNEmfKuLziJamHJ6dO9oGOSD/jjbAB0jpvovle4Yihz
         YByiShNA1mSFlLrcb5mDIRx1i3Z/KyX811Y1dulgmBvifChOwmzAEF5s4kJIq4c9rRZb
         5lvkOsqBfUHKNPx6GUZ8syukg2AtUPoXqsyZOoAedKAc7Zq06L0S7uq2R8px+noZEizk
         ABpLw5cjgIjP2fgYIwxfxxetiS0FuubixuvvilUh/JFLCD4w+ten5UlnARrGISXPxKZF
         vBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790472196; x=1791076996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bxwshbrxYLFrgDXVSsiEGqJVWdpJpdakWMZ76gQ4IE0=;
        b=qOw7lTllPfRm2QAk1f/BKmgCd0KSSfUOx8EC8LbgTPQqxODAwKxYQ0Vb4lYv4XkWhf
         v04NuYFjpKxG8awz1FWsIFocqfvjK0tasFjxYauDM2XUOyiwfp4PLKhW106xB3U2vTRk
         Kcv6GwvfwZL5KAKWnNttWpI96uC8oWyCYfDJ7JFjbXUe4+W/ab5D3gsIUt5FNFnMPLVp
         zRXDk7j4/r63rZtgTvh3r8rvQ+XtaJ0pIvY8yT7lOI0S7GfhTKLqW0VcHyeGJc/yeWhD
         PBOh+g7zqeCUaGDmvTSfGAGZy43dcshwH4kR5UqqMW2SBsFUdvMeNmzOB4QwiFbUIqRr
         wIiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdPW2tLTubES1/62V/11f00gjPSbHlYwqzD96q2P8yasWF//KeaqeV/7OmLL3WFHWrpq2HXG8=@lists.infradead.org
X-Gm-Message-State: AFuF++l9MsZ/N4d1NH81Cs4WOeFJ7t43YmS7bkcfFzXQ7a90L2U9NQnR
	qWn4eW0aSKFYdQxoRl2lNR0Fnvb6fSrgPQ2FZDVGtv1K/yH6QX1WyhF7
X-Gm-Gg: AYBFou2fr6fOh/4Wxqge5pPeKierETtCjqIugjBIkRnvhlGxLKA7oXp+A7IYtS0SOt/
	TdwCCV9lbax3xw2MjWPwN9KmuTNi0xdkemTrS6lCWeMXdYzPF53tLzy6mQm0xsA96ZM/AH3w9lM
	tfXP5+Zajox4wCyms8BZ70963v09UdjeuxEq7GgrIIRWJu0nsWiT0HYpfFKZxZB14MbfViuJqco
	L6RAoimN7gRwWZ2xrifvsDCBiB3++NUSQjrGcYdQkDvkFZUXqjQvcSRCTgac8ldV25uZdVqoNW2
	3lwuph5MFQz7JhuEa4baK7ibQYIP4pn6qENENuINdafs/FfjtkSCXmvr2E/BtlmLKcUD+4CiCVI
	+a+XQ3OlFDaPCP7aa1gvICbCOYWpxmlb4+t2/oyBRE7Ma+V/Gs7piGmHUWXDE8XoXr0no8bxvfi
	QKXShuMMF+pakmiC8rA7hxGax+YNKU4lhd57t3u45NCJr/39XrncT+hVf/orljvn2Z2KNsTWm6b
	t7E5fmqUosvUg4YFmmToQnPDg==
X-Received: by 2002:a05:600c:19cd:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-49ff06f7a45mr117047985e9.30.1790472195756;
        Sat, 26 Sep 2026 18:23:15 -0700 (PDT)
Received: from mac.lan ([2001:861:8b92:2c50:9cf6:601a:85a9:dd7f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017998dbsm27530395e9.14.2026.09.26.18.23.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 26 Sep 2026 18:23:15 -0700 (PDT)
From: Benoit Masson <benoitm@perenite.com>
X-Google-Original-From: Benoit Masson <yahoo@perenite.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	stable@vger.kernel.org,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Subject: [PATCH] wifi: ath12k: order hw group devices by WSI index
Date: Sun, 27 Sep 2026 03:23:14 +0200
Message-ID: <20260927012314.34857-1-yahoo@perenite.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_182318_704170_F6BB55B3 
X-CRM114-Status: GOOD (  19.29  )
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

On multi-chip (WSI/MLO) platforms the devices of a hardware group are
added to ag->ab[] in PCI probe completion order (ab->device_id =
ag->num_probed++). PCI probe is asynchronous, so the order in which the
chips complete firmware bring-up is not stable across boots.

ath12k_mac_allocate() builds the wiphy radio array directly from
ag->ab[], and takes the wiphy device from the first entry. As a result
both the wiphy sysfs path and the mapping of radio indices to bands
change from boot to boot on boards such as the TP-Link Archer BE800,
which has three single-band QCN9274/QCN9224 radios in one group. A
persisted hostapd configuration that pins radio0 to a band then attaches
to a random band.

Order the devices used to build pdev_map[] by ab->wsi_info.index, which
is derived deterministically from the device tree WSI ring and the
qcom,wsi-controller node. ath12k already uses wsi_info.index as the
canonical per-device index for the firmware link IDs in
ath12k_host_cap_hw_link_id_init().

Note that ag->ab[] itself is left untouched: the unassign path indexes it
by ab->device_id, which is the probe-order id.

Fixes: 6f245ea0ec6c ("wifi: ath12k: introduce device group abstraction")
Cc: stable@vger.kernel.org # 6.14+
Signed-off-by: Benoit Masson <yahoo@perenite.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 99bf5cf..6505255 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -15444,6 +15444,7 @@ static void ath12k_mac_set_device_defaults(struct ath12k_base *ab)
 int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 {
 	struct ath12k_pdev_map pdev_map[ATH12K_GROUP_MAX_RADIO];
+	struct ath12k_base *ab_order[ATH12K_MAX_DEVICES] = {};
 	int mac_id, device_id, total_radio, num_hw;
 	struct ath12k_base *ab;
 	struct ath12k_hw *ah;
@@ -15467,6 +15468,21 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 	if (WARN_ON(total_radio > ATH12K_GROUP_MAX_RADIO))
 		return -ENOSPC;
 
+	/*
+	 * Order the devices deterministically by WSI index instead of PCI
+	 * probe completion order, so that the wiphy and the radio index to
+	 * band mapping do not change from boot to boot.
+	 */
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+		if (WARN_ON(ab->wsi_info.index >= ATH12K_MAX_DEVICES))
+			return -EINVAL;
+
+		ab_order[ab->wsi_info.index] = ab;
+	}
+
 	/* All pdev get combined and register as single wiphy based on
 	 * hardware group which participate in multi-link operation else
 	 * each pdev get register separately.
@@ -15483,12 +15499,12 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 	mac_id = 0;
 	for (i = 0; i < num_hw; i++) {
 		for (j = 0; j < radio_per_hw; j++) {
-			if (device_id >= ag->num_devices || !ag->ab[device_id]) {
+			if (device_id >= ag->num_devices || !ab_order[device_id]) {
 				ret = -ENOSPC;
 				goto err;
 			}
 
-			ab = ag->ab[device_id];
+			ab = ab_order[device_id];
 
 			/*
 			 * the assumption is all devices within an ah
-- 
2.54.0 (Apple Git-157)


