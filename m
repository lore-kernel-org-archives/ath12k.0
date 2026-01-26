Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F69CCF65C7
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 09:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sWYMBOcYeZ9PNMuTUodJCzRwRVLkcoq/F3X3pSbTUs=; b=IDOfk+8Opnb5aApuco5jVoiT9H
	X3ZpcpdhJC/Tu5emfzl9aHIJLCJoS0KG41X+sXHznlrzNoaANZ1HOmVJ3LS0ccr3yFJGhxH7dM+dH
	AXvSl0zJKd/pNfK4DfhKG1zcSX7byQwhJh+J3qoSKkFuKmN+oQPEqqIzKftHr2VR/qaHxE1Cuc4eD
	WtUtViD6BoF0U01bTDyoEunKWi9VjN+ry5oA3JZr9+tx2/YI6OFfHnprBsN3ljWV8VG/Oma8V12uv
	bc7zphUplcutGoUiEsvdYdfGHJW/cYYiErpXkBNhGHfhneMrnlFWiAeV/L7ecRIhc16ILradna6gu
	KTYqqQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJHK-0000000CEfw-192d;
	Mon, 26 Jan 2026 09:53:02 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJHH-0000000CEfB-43q1
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 09:53:01 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-34f634dbfd6so3529660a91.2
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 01:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769421179; x=1770025979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sWYMBOcYeZ9PNMuTUodJCzRwRVLkcoq/F3X3pSbTUs=;
        b=LeVWmPsZdL4jMW2ydrLjUacg75o5UH4pOPap+OZe5CihK+cz503jD9m9FKSHVj2pM0
         kvQFfqO3WpKBlTKH/RncCdTJcbWlCh/DbYFV3fu7UaSgmxL0bMa6kkx1r39cIXAap301
         JjdFUXWMWYCw6/l0r+lNGS9sgDBF3En9WTpxHs3XWSaRKiVLpTF9TR1S4QCb27zF4o3x
         sYmNUtKI1qwxhsQ4OmXRqv6KARzhtrU+QDn3+VJ28X9JWIovaSCq5lhU97a6jRIN6kdU
         R4l7LJrZP3VJp085eJ22KsMbWjy0A2JnPy0mbvXx5WGcm64qsLVJTbBvSV+46pgnUIGo
         zA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421179; x=1770025979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3sWYMBOcYeZ9PNMuTUodJCzRwRVLkcoq/F3X3pSbTUs=;
        b=PHs+0KOGjALVuRw1NVvn6VBqZ8jpvy8+Iv8/INsRxdIm0tpxt0rErpiNwTS3xVUX08
         IgTqBaDY3srdXSs1QQkqaULIy4isFuR6MbxndOzd/D2bBdCJt291UaoL81KZNAoqW04n
         9YJsuKGYrFNeR6u7tj7FAjJVmGj2RzehC2cggji5jxu6u7W7ob5vix9VLaXKkQ7CXJgs
         eqshpDry4h5NOsalKIGaMiB4F2VDalMNDHJQkWMA6txeclSf7vNJheq+6xn/t64AQgXj
         YlGVy+4tCFzx5N7eY2OVa+enyRv0uYUbpFd0zcGjgm5Ftvg2WPB9gxD7kK25McbH9wP8
         EwxA==
X-Gm-Message-State: AOJu0YzTUO13MI38FFXF8A+PXUHliC0eBVH/sr9beWnS7HVq2xu14GdQ
	hF8v0dk95SCpZ/2Xa0mjKg8H+7+kd7K54T+r8xJtTC3TM3mCrMnAOycG4kAl+Sx7
X-Gm-Gg: AZuq6aJNgjAJDOTdh+ae3WHp2TMo0dp3OJ0T2ZMq49jFn9/qRSM425FM5eq1L6rNBd8
	LpMa/gsZ4IxBeXM9nGlJw2pJw2PENvHzRVWeVRVjssDYA3ND+8Sjv3N6wyuUJdiZZBSdEaVLXxR
	6baRZ00Ay5OusdG1y0vafDBVbviRV5NcGFUli2uY29czZwveklveDJrv3f8vu4h8nThO/A9K8KJ
	TdrCAef1SbfZJzD02rp+Bom1sJfQVnCXTWjVf4KKYQ/CWUTNKpb3jk0q79kDH5Imyh870pwAug9
	FajXdFViAo0VchaodNoh+X+9NlnxcNiNzmvnp/XwOqJOflWwP0HmIBCy2ilFPa3xEojhKNeSn/P
	QjNExWrCUOYLwFTY+yQQwjJpeYcN/8fyBtjl6PscBxgmVRLOPHZVjI97sbHvmEKO1xjIRzfnn1m
	s9KF6osBYX4l2wgtTEkm//nfHEpRp/mSyOmTT/
X-Received: by 2002:a17:90b:3512:b0:34f:62e7:4cfd with SMTP id 98e67ed59e1d1-353c4183501mr3515625a91.24.1769421178790;
        Mon, 26 Jan 2026 01:52:58 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:1d59:cd47:36b6:dec7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536f359950sm3187627a91.10.2026.01.26.01.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 01:52:58 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	kvalo@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH v2 1/2] wifi: ath12k: Remove frequency range filtering for single-phy devices
Date: Mon, 26 Jan 2026 15:22:43 +0530
Message-ID: <20260126095244.113301-2-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126095244.113301-1-bjsaikiran@gmail.com>
References: <20260126095244.113301-1-bjsaikiran@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_015300_041826_CD42A05D 
X-CRM114-Status: GOOD (  11.10  )
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

The frequency range filtering added in commit acc152f9be20 was designed
for split-phy devices where multiple radios with overlapping frequency
ranges within the same band are combined into a single wiphy. Each radio
in such setups handles only a subset of channels within a band (e.g., two
5GHz radios covering 5GHz-low and 5GHz-high separately).

However, this filtering breaks single-phy devices like WCN7850 that use
a single radio to handle both 2.4GHz and 5GHz bands. On these devices,
the freq_range is set to cover the entire supported spectrum, but the
filtering logic incorrectly restricts channels, causing 5GHz to become
completely unusable.

The issue manifests as:
- All 5GHz channels filtered out during channel list updates
- No 5GHz SSIDs visible in scans
- Only 2.4GHz networks functional

Remove the frequency range filtering entirely and rely on the firmware
to handle frequency restrictions based on actual hardware capabilities.
This approach works correctly for both split-phy and single-phy devices,
as the firmware has complete knowledge of what the hardware supports.

Fixes: acc152f9be20 ("wifi: ath12k: combine channel list for split-phy devices in single-wiphy")
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/net/wireless/ath/ath12k/reg.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 7898f6981e5a..48c362a86524 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -153,12 +153,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
 			if (bands[band]->channels[i].flags &
 			    IEEE80211_CHAN_DISABLED)
 				continue;
-			/* Skip Channels that are not in current radio's range */
-			if (bands[band]->channels[i].center_freq <
-			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
-			    bands[band]->channels[i].center_freq >
-			    KHZ_TO_MHZ(ar->freq_range.end_freq))
-				continue;
 
 			num_channels++;
 		}
@@ -190,13 +184,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
 			if (channel->flags & IEEE80211_CHAN_DISABLED)
 				continue;
 
-			/* Skip Channels that are not in current radio's range */
-			if (bands[band]->channels[i].center_freq <
-			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
-			    bands[band]->channels[i].center_freq >
-			    KHZ_TO_MHZ(ar->freq_range.end_freq))
-				continue;
-
 			/* TODO: Set to true/false based on some condition? */
 			ch->allow_ht = true;
 			ch->allow_vht = true;
-- 
2.51.0


