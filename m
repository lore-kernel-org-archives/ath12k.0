Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C563606A327
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 11:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P3BCM5kr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NnTckwwD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Sn2Z7LutKRGw9FfthfDc/nbX7YvwhkUABQURsLZyMdk=; b=P3BCM5krmkJy6W
	r8VZ4mSTJbLStRU7YnybXVur2ga79uKAliKh+Xp3p6VIQtRtHE4CqQ3hG9odDjCiQKK+H0xNSmNhN
	G+ay+VtIbmuQ3uyfsF0hiP57ebpV4ES3upPOy83v4DMfRRx5Udszkue1HYOuztM2Lzer7FYCbRY8U
	BFqjv16UxIdjHJgTK5qWPUXMXyfWZ0iPG96egN/cINhyBHHjZtRlhGgYwEkS9n9gICO5EVx5ASVRZ
	peLG+r0wzaYEQOqXR91mtVlZ6O17GBbKoZGO/rmZkNuXRBO1x3mhH4jgP9iLMZpGL6J4D9+VkBI3d
	ZhGblIwDvn8l7f701k2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSZn-00000009bsD-3UWZ;
	Thu, 12 Nov 2026 11:02:43 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSZb-00000009bpu-3iDh
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 11:02:41 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5c14f3dab09so2509928e87.0
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 03:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481350; x=1795086150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sn2Z7LutKRGw9FfthfDc/nbX7YvwhkUABQURsLZyMdk=;
        b=NnTckwwDg4ZW+kjawDck/3h3BpJGmgACHZGKLB0QMJMrHsjDISEL24/DpZjYxbJANr
         CB/Hferx0rnu01URzbIvdHTtDqujts+ogeHosOKazlGWL2boDb6CmOOY0oLwB3NcCM/5
         IBjpnjU4qwSPn53fNl4g5bhLR2bPTgUYDbfhVzd30BABoXlI7Mt5pMqIZagW+dBKt6g2
         ioFDoJhxkNUbwFaykx/4rOGIcbp6vqmT8fu8uvWC2ccZ0peogJ7OFBVRCn9KAXmCDJz5
         jeZ5pRszn1E8PbAt0L4k1qWi83Dqb08DmceyfeLSxxfamnY9WotxvPHBvTxo8sWLaRvD
         2cVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481350; x=1795086150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sn2Z7LutKRGw9FfthfDc/nbX7YvwhkUABQURsLZyMdk=;
        b=DuJ03AFFgSpp8UmWPclAJ1NmCiAVJ45QDTmcS62VmjNNPmPgg2/N82bPMYnQ/F0mqY
         XDNptFxlkzwgzGs7Qo4Sqy7npz+78neXN2C+YBbx1uMyk6s9EPyd8XGHElBZTeJ5wjr+
         e0Xr5NMDpM47zSD+BxIbLOYUDB0EWFzaXzGEWMRpksRZPdkskHmelplZf+KUxr6Cilyt
         2BszDLhYjPR7vMqpj3iJ8Ik8daZ6EBCMOdkvTY+RG/rORPnP/aGMhosRY5BXkocIKNb+
         2HEv3lO34U4PfoHoP2wGtwil7nw5wOkk4T4+bLpDMq1aLRQmI3MyiKl1jJ4PXknONgq/
         oD8Q==
X-Forwarded-Encrypted: i=1; AL+hErHehBzeZO9iJGZu1UUp9ms88epNavhdmrhSFMHIxkLeO6FHLs9F6404BphlxJL5ml+5GCWflm8=@lists.infradead.org
X-Gm-Message-State: APuU4Z+0arPjN/EGOgTMO4gQbIuCvQzA9X/ehT/lbLE+wTkjg8zRQWU9
	j9DpOSeey5yK4/853tbeK04q+EPZ5smb/O9F7xYwwSXkvOZXxzAjNKPL
X-Gm-Gg: AYBFou2Ns7LQjH2ybMVvFgyIsmtNklV0qG+QumBypd/o2pd0zhIJHnOzTbLhvBqV7rk
	FH+xpipAgGVmP6XXsFkwQf9Mg8sLyIkILjSjlmKf24pDJdN5gVtu2enDnMa33nAaUJVGrOUZUkl
	94n4aZfr2L4HJ9y887jAgBxcUetSFwUFUcJCIY45ItB0lNKIYKCXtxqkaHV+bLcKYi4vMjgFKb0
	B67Audb9U3+r8C2KNagipZuTU43SMF/nd75NfAU78zRWw4SZ+qSLJOA/uoMEn9akT1UmPJNNan0
	fWrsCXrvrbh1eKsJgnUQC93KDXO3IBLnQYazMNkB5hpHN6qJ9d4Nl8YsJecQHUY5dFXju+bcA2D
	Ldz5XbouJhouFz4l9aaPaP5Rl2vDT0qKfXHvPz8L3/mPvBlf3rT/JfctuLvNlv2l8O9wvu4+LMh
	htYaQeM3ylnogy2WZvmWQgoPJBaMwi5dxbWmGy8Jrpjw8UCzceHoYf+naSylDBZQex+vEfnFbHp
	qqnvyjEtiAvsWLO26kTEj4hLeJXFT4TU7SVp9BgtseGtTpkU9pSocDV9OcscK6iF3EK+QgOcyl6
	aUCN9HFfwtnvYStJAn5Ko27IoE3Pa4GEzp4aLiJTxFrNUEYtFGgTu5jY
X-Received: by 2002:a05:6512:3e27:b0:5c1:563f:ff23 with SMTP id 2adb3069b0e04-5c15d601ad7mr2222508e87.61.1794481349384;
        Thu, 12 Nov 2026 03:02:29 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2c05dsm15814046f8f.25.2026.11.12.03.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:02:29 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] wifi: ath12k: skip the links without a radio when a scan fails
Date: Thu, 12 Nov 2026 13:00:08 +0200
Message-ID: <20261112110008.1229-5-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261112110008.1229-1-tvlad744@gmail.com>
References: <20261112110008.1229-1-tvlad744@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_030231_964924_D04D5979 
X-CRM114-Status: GOOD (  11.51  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_mac_vdev_create() clears arvif->ar when the vdev creation fails,
and the link stays in ahvif->links_map. When a scan fails after that,
ath12k_mac_op_hw_scan() walks all the links of the vif to clean up and
dereferences the NULL radio:

  ath12k_wifi7_pci 0000:01:00.0: failed to create WMI vdev 1: -108
  ath12k_wifi7_pci 0000:01:00.0: failed to create vdev 00:03:7f:12:34:56 ret -108
  Unable to handle kernel paging request at virtual address 0000000000001508
  pc : ath12k_mac_op_hw_scan+0x9cc/0xb28 [ath12k]
  Call trace:
   ath12k_mac_op_hw_scan+0x9cc/0xb28 [ath12k] (P)
   __ieee80211_start_scan+0x4e8/0x6e0 [mac80211]
   ieee80211_request_scan+0x10/0x1c [mac80211]
   ieee80211_scan+0x98/0x14c [mac80211]
   cfg80211_scan+0x50/0x1f4 [cfg80211]
   nl80211_trigger_scan+0x694/0x6cc [cfg80211]

This happens when the firmware crashes a second time while mac80211 is
reconfiguring the device after a first crash: the WMI commands fail
with -ESHUTDOWN, and so do the vdev creation of the station link and
the scan that wpa_supplicant requests next. The oops leaves the wiphy
mutex locked, and everything that needs it hangs.

Such a link has neither a scan to stop nor a vdev to remove.

Fixes: feed05f1526e ("wifi: ath12k: Split scan request for split band device")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4cb41b8b1d3b..49cb9bd8dda1 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5889,6 +5889,9 @@ int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 				continue;
 
 			ar = arvif->ar;
+			if (!ar)
+				continue;
+
 			if (ar->scan.arvif == arvif) {
 				wiphy_work_cancel(hw->wiphy, &ar->scan.vdev_clean_wk);
 				spin_lock_bh(&ar->data_lock);
-- 
2.43.0


