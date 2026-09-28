Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498CECA5FA3
	for <ath12k@archiver.kernel.org>; Mon, 28 Sep 2026 21:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wyL1tn+mP5nVx2w+7Pq20gMgeqZvEvpVrUK6ny4B9pc=; b=WrCrHJF4FUN986itrKNGIvcRST
	aujJY3PeP+REpwkNz5kFYrI+8NlOZZiMc6GOACVf690ztJltx8qVimTB9aoaPB5C3ahX3mjoyWawh
	mVSufBsVRGvWKnMmYioyRjGRHNJ7FiQeu/IMLLuyp33oaIbHd8xSEV2cBqZmxOkAfYX3DsJGx3zSQ
	53RAF1yerPzBaEjB6YAsnGHC8P0CcVkm5j8C9qOmRxbJQlvLASB0HbIKzNK6RN6knq0wQ1sT/B2ch
	Ff6KNBKjY3Zya9tcDeLrXVE7fQWT58diIxIPej1Tqdd+KSYLugXgW2pIp6xmQn/hmRQ1MgyJRT2E5
	kCGVjPRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIyV-00000001g9J-3m7e;
	Mon, 28 Sep 2026 21:33:27 +0000
Received: from mail-wr2-f12.google.com ([74.125.225.76])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIyT-00000001g8d-1PJy
	for ath12k@lists.infradead.org;
	Mon, 28 Sep 2026 21:33:26 +0000
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso2807987f8f.0
        for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 14:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790631203; x=1791236003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyL1tn+mP5nVx2w+7Pq20gMgeqZvEvpVrUK6ny4B9pc=;
        b=dQs4ZlgRs8gXWoM4cTcCRq3beHXWm6v4pWO2UcsUvfMi/IcH8BpEKcqcTUOppFFREi
         8ypsBANIihEK4tT5XApZxGzOhPSr8K1+SUbGsXz19NcIsc2hnzqocr8gxEBPJzggU+QZ
         EkX7U3sMhG49q09+mMwngpsrb6sydVgEYy07hVtGuyMIuv/N9tzNNPv19P4nQ7UyQ8zG
         xhyuIGOePbmn51u0oIps5Fdgjk5LO52u9DJU3fRIvXFYq95lJn8l5icN42eGHHEnGTPF
         PUz1RaHXPMx5poyzCk7ZA9AaVtVPk146sblT0fCsPzYt+pObFDnE8jUwKenxqQ9uNf8u
         dSZw==
X-Forwarded-Encrypted: i=1; AKwUvBwlcXjFeyCj/g5m+fRy4ehbICy1UPlg88Vs5NckHWiAgV6Y4MIqOEHiiek4k4Q3ENTGARAx8RY=@lists.infradead.org
X-Gm-Message-State: AFq9FYJWtlrcS/pJPbpo0IJx/dxb9X1S2KV61625kYJnvwTrVF+ZaXG5
	cIsnHYuEl9rSK26dC3ePdL91foB0sJZddM9SrTRaVjRePXSL3WFAPrTP
X-Gm-Gg: AYBFou10Cosn8YQjZlXyv/Wld7rM02Sx/6tyAm5yPA1yu1RVfXpZfpp4ynn6+YLcz30
	fHse7qPv5zTDyKgewRc+oWv2pBkNJRzDemyYf7cSMAijxVXrzMgifh4mpU25ULP0TNGjStOlwdk
	WDGw6D7XuxwvNp2ZCBJTPEKfaqJ8gV/nzI7/Ezep+ZDj9HGOCcFAmyJC2hByF3jU/C2vywgPrnx
	iS0JUDrtDXTyjYe2ZFxkh/yPy5jMWQOqOYYpyPQwjsCG63G9YXBa1Bq6F2dNiyieuMzIsCzKNm6
	cgJtgNpzi03cKfSDo8fvJHlatxUDDkLTy4tRfWpPp2cFVZxH1BZrJnqT2hi9KqNz6IHM4AdKwoN
	hWJVaE1UDwtc8fBf3sf4D20wZh8EhLds/odA42/IySC+nKuGRxgHz6sErRiFXjxlY7o7M2xoTDS
	3cpkjP9SJcBY7e5FQSRxNuqyz6vazoJgU2i3YAQjxf9WuqOZlC0nHxk+stT4wsISTFwfT6AxdBD
	m83/C3pvw6MLw==
X-Received: by 2002:a5d:5d12:0:b0:48a:eeef:b4a7 with SMTP id ffacd0b85a97d-48aeeefb641mr1919631f8f.48.1790631203458;
        Mon, 28 Sep 2026 14:33:23 -0700 (PDT)
Received: from mac.net ([2001:861:8b92:2c50:ca1:5b1b:d140:af71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a4e9sm25993824f8f.11.2026.09.28.14.33.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 14:33:23 -0700 (PDT)
From: Benoit Masson <yahoo@perenite.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	stable@vger.kernel.org,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v3] wifi: ath12k: assign device id from the WSI index
Date: Mon, 28 Sep 2026 23:33:22 +0200
Message-ID: <20260928213322.98949-1-yahoo@perenite.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_143325_405735_3F126629 
X-CRM114-Status: GOOD (  12.39  )
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

Devices of a hardware group are added to ag->ab[] in PCI probe
completion order (ab->device_id = ag->num_probed++), which is not
stable across boots. The wiphy radio array is built from ag->ab[] and
the wiphy device is taken from its first entry, so the wiphy sysfs
path and the mapping of radio indices to bands change on every boot.

Persisted wireless configurations reference radios by index (e.g.
OpenWrt/hostapd "radio0"), so such a configuration attaches to a
random band at each boot. This affects any multi-chip group with
single-band radios, e.g. TP-Link Archer BE800 (three QCN9274/QCN9224
radios in one group).

Store each ab in ag->ab[] at its wsi_info.index, which is derived from
the device tree WSI ring and is therefore deterministic.
ag->num_probed remains the group device counter. The unassign path is
unchanged, it already indexes ag->ab[] by ab->device_id.

Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Fixes: 6f245ea0ec6c ("wifi: ath12k: introduce device group abstraction")
Cc: stable@vger.kernel.org # 6.14+
Signed-off-by: Benoit Masson <yahoo@perenite.com>
---
Changes in v3:
- Expand the commit message with the problem statement (why this
  matters for stable).
- No code change since v2.

Changes in v2:
- Set ab->device_id from wsi_info.index in ath12k_core_hw_group_assign()
  instead of reordering pdev_map[] in ath12k_mac_allocate(), as suggested
  by Rameshkumar. mac.c is no longer modified.

 drivers/net/wireless/ath/ath12k/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 99bf5cf..6505255 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -2029,7 +2029,8 @@ exit:
 		goto invalid_group;
 	}
 
-	ab->device_id = ag->num_probed++;
+	ag->num_probed++;
+	ab->device_id = wsi->index;
 	ag->ab[ab->device_id] = ab;
 	ab->ag = ag;
 
-- 
2.46.0


