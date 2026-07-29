Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75839C53219
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 08:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PQGPp7H4ZR1+G13BP75L3PYyXUIdHtICat2MzwnzvU0=; b=UobG2RWXRfPNtUcIc3Hxvy5UT9
	C8/VgtK+DR+AvaQkHIuAm6CHeC1Zx9wZ7KO0AFqiLeS1s/QyEm2JJwwUUxHCr745fDCu4MFvRm+8K
	weLDA1iujsPgc/Sw8TIgv8+ErIJaOgjfYRfiIagr9n1jiemuBNteaUDnoKMFn1PGNO3EjMpXmPAlR
	97fMOJsgBQAz8m0U4PPal2rNaDIXfr4yg6w6h9kfDczEnhQ4XlGZhbMvNUZsRapLwLUpSpphoflsV
	TcqrVOzoVHmofP12dVvOQalbD1bGQMmqTXpprYgeNNR6bJ0J7Osm3RdyR12lE7jEaKp7JROl3Zltk
	eDJrAQ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozMA-00000007CkN-3yvQ;
	Wed, 29 Jul 2026 08:09:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozM7-00000007Cjn-2j79
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 08:09:36 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49550ec592cso11400685e9.0
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 01:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785312574; x=1785917374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PQGPp7H4ZR1+G13BP75L3PYyXUIdHtICat2MzwnzvU0=;
        b=EKGqTr9agD7Ay/KPtEwSTpZ0lvz1B49TEF7c/yTNg2Bd/5A22lPRkxZOLnW4vAUZOf
         SwZwYaUx45BhRMvyAt91QBrmpT6nGVzdvEwAwGQZhgsJWStM/KhkyOiqnsXdRu03TQ4l
         SDeup91YHEqqmNmiPu6FsbkYRULY7XwHbViQrilc5loz0b7XcWO3qSjkw8MGxQANkJTY
         rLmFb0d5WM4PM4dNJFJ18TDMjLmsx7wDrx/jANp0ktMwNCbzQqxKp9fbGLheVDMWVQPw
         3f+8rqFWiF1wX8LzbzDoVhm/+08iQPRe7kbbYRNsGJyoPQGibseLYb4zsxSaS8PE9qIm
         L7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312574; x=1785917374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQGPp7H4ZR1+G13BP75L3PYyXUIdHtICat2MzwnzvU0=;
        b=QAyJOvS1Z38Yi/7JJkdSXBLp56oiU0skDHYQ/swBoTbLJob6M0gfSjYbOBFHZ+VgE/
         u7lEijao/8IjmmNizBKLAf98xiKgnClX/hvFdpM1GBWWbfyOWHsOZaXxIrEujIEFnafL
         /vDmiH5EFdkdzKrCBTCnfouSoxjWn713jD1CR4fZf6HwK0XG8NAff18VQIXQD7ZVo8vS
         CCLqyoDkrkPVa6i7evH3spaoFKJ7qIAQYZXPDqHUkWJFuTdiILYTd+Bgh6lifIhwbI19
         D2XoFh6l+wJ12xfTVhscmb8FXD70zRWk5XVz4W2vxYHpPScUKETzpFapJ79HC2DFv1oo
         vTMw==
X-Gm-Message-State: AOJu0YyXcCbYdpvCuSTQ60E3CgQNNCYsYsZ9amPkSlaoDp3CxhOPgBxg
	rdEiMv6qoGGFfadnjaF3ScgTsR7/oBnAf0tjGzlqOtdMzEPt36Nfx9g++m6B5w==
X-Gm-Gg: AR+sD12au8B6aJyF/dCqyMdkm93vm4j96kCaIHl7QAloxeO4VhrX8tHPGWm3Rw9KAiS
	5nS+RgxePKKYaWQHyC0oDtJbGEVnXWpUP1qNuBNu23GH5huQz15R2WCMDhUfUpxO64RL682r2bP
	F//vVN0Zua2Bc26LwYI3SGZQi6tmkZiDsyHi1E/oUGsNjQARpomRq3HKm5AQcWjomeCAXYb3f3R
	pW/ZHMVCxejFN2boofwrY6ZZKxLZrzwz5mDKdE0n7oncXZthQHJ7Wrg5IMmR8Zml6GKvOoCtJGU
	2/8Cqt0Rqk/8Z8XIUs1dy5k/I4njTHDzvh+Mph9lcasU1mnszC0F+ARU2f2PtagOFl0e7XUOqXw
	+fCcyunaXpx8632NzeiOpn0SAdPHyQn4NJZXymZaMOiJuG+/uWeyO9QfBbsvepa+xfucyhMFaJ+
	JBx09eAsfpyThA1CTz0MdbAFLNssfx+hEywgBmqSWsDzhcgwSLZDe/iTHXlWXoXPnncIDRK4EZP
	dpRkbTxjP8SA9XwaZNXfdv/nSXVgqzgkg==
X-Received: by 2002:a05:600c:19cb:b0:495:7016:b875 with SMTP id 5b1f17b1804b1-497fd3098f0mr11122455e9.13.1785312573650;
        Wed, 29 Jul 2026 01:09:33 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bff4784sm345456145e9.4.2026.07.29.01.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:09:33 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-current] wifi: ath11k: reset ar->num_station on hardware start
Date: Wed, 29 Jul 2026 10:09:32 +0200
Message-ID: <20260729080932.3462066-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_010935_715789_656AFA49 
X-CRM114-Status: GOOD (  11.11  )
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

When (multiple) hw restart occurs, we end up in a situation where we
cannot accept new stations / mesh peers. This seems to be the
'num_stations' in 'struct ath11k' that did not get reseted properly in
this case. In ath11k_mac_op_start(), it was indeed the only accounting var
that did not get reseted so let's clear it too.

This avaoids problems like those:

	[1248828.088023] WARNING: CPU: 0 PID: 12281 at net/mac80211/util.c:1682 ieee80211_reconfig_stations+0x98/0xc0
	[1248828.088029] Modules linked in: ath11k_pci XXX [last unloaded: ath11k_pci]
	[1248828.088053] CPU: 0 UID: 0 PID: 12281 Comm: kworker/0:0 Tainted: G        W          XXX
	[1248828.088058] Tainted: [W]=WARN
	[1248828.088059] Hardware name: XXX (DT)
	[1248828.088060] Workqueue: events_freezable ieee80211_restart_work
	[1248828.088064] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	[1248828.088068] pc : ieee80211_reconfig_stations+0x98/0xc0
	[1248828.088070] lr : ieee80211_reconfig_stations+0x94/0xc0
	[1248828.088073] sp : ffffff800025bc10
	[1248828.088074] x29: ffffff800025bc10 x28: 0000000000000001 x27: ffffff8027b19640
	[1248828.088078] x26: ffffff802a5619c8 x25: ffffff8027b199f0 x24: ffffff8027b19880
	[1248828.088082] x23: ffffff802a560e40 x22: ffffff8027b18880 x21: ffffff802a560800
	[1248828.088087] x20: 0000000000000001 x19: ffffff8027c71000 x18: ffffffffffffffff
	[1248828.088091] x17: 128c0801a9c37469 x16: 766e692d32464545 x15: ffffffffffffffff
	[1248828.088095] x14: 000000000000001f x13: 00000000000000b1 x12: 0000000000000001
	[1248828.088099] x11: ffffffc081061518 x10: ffffff800025baf0 x9 : ffffffc0808097f8
	[1248828.088103] x8 : 00000000ffffffd0 x7 : 0000000000000000 x6 : 000000000000003f
	[1248828.088107] x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffffff8011ef2e80
	[1248828.088110] x2 : 0000000000000000 x1 : ffffff8011ef2e80 x0 : 00000000ffffff97
	[1248828.088115] Call trace:
	[1248828.088116]  ieee80211_reconfig_stations+0x98/0xc0 (P)
	[1248828.088119]  ieee80211_reconfig+0x774/0x1438
	[1248828.088123]  ieee80211_restart_work+0x10c/0x178
	[1248828.088127]  process_one_work+0x178/0x3c0
	[1248828.088130]  worker_thread+0x280/0x440
	[1248828.088133]  kthread+0xe0/0xf8
	[1248828.088137]  ret_from_fork+0x10/0x20
	[1248828.088141] ---[ end trace 0000000000000000 ]---
	[1248828.090658] mesh1: HW problem - can not stop rx aggregation for 72:fc:8f:a8:f1:ed tid 0
	[1248828.090667] mesh1: HW problem - can not stop rx aggregation for 72:fc:8f:a8:f1:ed tid 3
	[1248828.090670] mesh1: HW problem - can not stop rx aggregation for 72:fc:8f:a8:f1:ed tid 4
	[1248828.090689] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 0
	[1248828.090694] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 1
	[1248828.090697] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 5
	[1248828.090700] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 6
	[1248828.090704] wlan2: HW problem - can not stop rx aggregation for be:3b:3d:84:3a:00 tid 0
	[1248828.090707] wlan2: HW problem - can not stop rx aggregation for be:3b:3d:84:3a:00 tid 1
	[1248828.090710] wlan2: HW problem - can not stop rx aggregation for be:3b:3d:84:3a:00 tid 6
	[1248836.686596] ath11k_warn: 39 callbacks suppressed
	[1248836.686604] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)
	[1248836.686609] ath11k_pci 0000:04:00.0: Failed to add station: e8:51:9e:d6:93:22 for VDEV: 1
	[1248941.120126] ath11k_pci 0000:04:00.0: failed to flush sta transmit queue, data pkts pending 2
	[1248941.120186] ath11k_pci 0000:04:00.0: failed to clear all peer keys for vdev 2: -2
	[1248941.120190] ath11k_pci 0000:04:00.0: Failed to disassociate station: 92:14:23:65:57:fc
	[1248941.120196] ath11k_pci 0000:04:00.0: failed to lookup peer 92:14:23:65:57:fc on vdev 2
	[1248941.120200] ath11k_pci 0000:04:00.0: failed to find peer vdev_id 2 addr 92:14:23:65:57:fc in delete
	[1248941.120204] ath11k_pci 0000:04:00.0: Failed to delete peer: 92:14:23:65:57:fc for VDEV: 2
	[1248941.120207] ath11k_pci 0000:04:00.0: Failed to remove station: 92:14:23:65:57:fc for VDEV: 2
	[1248941.121319] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)
	[1248941.121326] ath11k_pci 0000:04:00.0: Failed to add station: 92:14:23:65:57:fc for VDEV: 2
	[1248941.123036] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)

Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ae91b57c8422..c1fa42edd363 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6716,6 +6716,7 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 	ar->num_started_vdevs = 0;
 	ar->num_created_vdevs = 0;
 	ar->num_peers = 0;
+	ar->num_stations = 0;
 	ar->allocated_vdev_map = 0;
 
 	/* Configure monitor status ring with default rx_filter to get rx status
-- 
2.55.0


