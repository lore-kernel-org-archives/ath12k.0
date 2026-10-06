Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF58CA5FF0
	for <ath12k@archiver.kernel.org>; Tue,  6 Oct 2026 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w1Pwz4NjkdSqfWaloOa4OtuYhXBcLt6Eb4swx56Ymeo=; b=uw3dpvT+31TrtSfrXqnb1CMgx6
	MFqrpYOFaW1Kn+VFu8EP08d3BIYr3zV2oIIdsIZhEdIh1PoRRpLnxqzPzb7VWP2ggwB4bPk8YURNM
	HewbLj5d+QorCokzQm4vPLHVNWGL/GaoQsFK+Onstpl5yWZnyDPA0pBLIDcz1cZbyWw6KWLv40E+m
	ODq0JSt7YHo0J4+xfBrVrsh5J9Rl8p/izaNODf8xMjy9Zd+N1FOF7MB9OKypD+QmMx3sRpx1UsE8s
	t6MSfy3gT6096DbAHB0GMMnpYvq7vvR6CkKceRub6O15mnDb1LFbNDX+FAwlIBz+fIFbA3F8fAiPg
	jqQAVbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1hO-00000000PWN-3NYV;
	Tue, 06 Oct 2026 09:43:02 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1hK-00000000PVi-0joH
	for ath12k@lists.infradead.org;
	Tue, 06 Oct 2026 09:43:01 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c2a4e013a44so395468066b.2
        for <ath12k@lists.infradead.org>; Tue, 06 Oct 2026 02:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791279776; x=1791884576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w1Pwz4NjkdSqfWaloOa4OtuYhXBcLt6Eb4swx56Ymeo=;
        b=qhZCk97Tt4V5i/gCiVrfD4FB9NhxDjMBlSXitlLHeV4F7tbr1NqDYIfJs4tQsm818v
         UfUpTlZJ4vD2uAcp5GyVj/nmoWkRlRSK6jTluISUrpxFNEGNsY76ZDTzrBXt8poNosQF
         BSMU9V9Nnd5KRAEvSqgj8LnaeD7qEuY4sfIxD6wp1R0jSHZoRkjIyBSfCNVkuOP6roH+
         Ky3GqbVSF0M2w4Zg3vUiBkiUC8ztjHTU+RsRqK9A5J3GnQGpFYuoelBeMMXdG+REOiuP
         zdO7gP9GiURyotcrCIgtE+YKkk+/qmix0H/qNDFuGnRIq8b09fGveqZHWHj+GA1XWnx3
         br2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279776; x=1791884576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1Pwz4NjkdSqfWaloOa4OtuYhXBcLt6Eb4swx56Ymeo=;
        b=b7g3RJFIrYVzzQwg6B22U2slpfn1wziu54IB3ZrsnjsT9r1iPVQk9foN2XwV9Em7Zv
         YLYt7bsUFKeiNZDS0iYOh0i29sIQl4Fiyv5fp0CiXTINDYDZRBtm4+nHd5I71jFlKPCD
         KtSDl7LiRku9eubEdfTYh7qFhqedWv5diD/BDklL1w8In1pt4YOShdIcbB4EPYCzbOCM
         ORKCvoupvNPvsFMThBPGgNXWCCmgya0s6dH5C8bFhWyGvaePcL5F/wKdSgbkJjEk5Lzt
         AC3rM+4B8j29xJWrNoDN60+fGxZyF4IRmHOW/r+Y/8BzXhREph/8cR7ktON+T/U4OJFJ
         PlZQ==
X-Gm-Message-State: AFuF++mT6S60pNZg+r5RM9sIKvQwhG38P8n64neAQmEhHb9/p7QT0rb9
	Eno9iOcM0NMYjQKmsjWQ16wXF7boGSq5kRgKetj+qLqE9YGc9Gi/lqcdvPj+o23iabISi1L49wc
	=
X-Gm-Gg: AYBFou3QCyntxoWrR9m2PAAZj+wQ9o2+q1CxhqDy+4lkQJtX2gRIdMVC9YA71wMJZmA
	VfdkeA6Bpz4o0CH1un+FXmMIBf7myMFg0o8xHi3Gczo2PIEEvQ/AJiEIac4RETdzAaNVHr1FB0C
	uPDUq/pfLEx+PLSrJyZZpzESSExZ7yVyDTeSzshjHMq1zKYih8okIfUtVOUWm55gh2mSePKHIub
	sAM7lhPK2LpAOuXDAaxCgUmWGrwUjU/OiN2EZCjhHo8XhVoRXOSaesHQ+rjWerwk64A0HBz2c86
	htkD7uuyJQ+0WvmtI2+G3ksirICBZKe7pM5TTh33dyf36pjcu2eLvBRewhwVE8xjNChhvtstebt
	B5qU7ibb6YWuqPy9SsWGmBLsU9ZxiDygQdfgh4WYD2r5Qo0SxMsYoPS6Ed3helprFG4MICRA6q8
	dULcSsAeb2y51Z0cZvH8xxbHMVJ8l1pjjhsbnUhUt7Ft2le+gqsL1Aetrip7bV/o5p8vIdZnIGV
	So=
X-Received: by 2002:a17:907:e102:b0:c2e:7df5:cda7 with SMTP id a640c23a62f3a-c2e7df5d380mr445606866b.33.1791279775699;
        Tue, 06 Oct 2026 02:42:55 -0700 (PDT)
Received: from Quarx2k-PC.lan ([92.124.138.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31562da31esm183753966b.38.2026.10.06.02.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:42:55 -0700 (PDT)
From: Nikolai Semendiaev <agent00791@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	jjohnson@kernel.org,
	wabsie@gmail.com
Subject: [PATCH 0/2] wifi: ath12k: isolate RXDMA page-fragment caches
Date: Tue,  6 Oct 2026 15:41:45 +0600
Message-ID: <cover.1791233788.git.agent00791@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_024258_229026_42C97F58 
X-CRM114-Status: UNSURE (   5.99  )
X-CRM114-Notice: Please train this message.
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

Hi,

This series adapts Mark Ruvald Pedersen's ath11k page-fragment cache
changes to ath12k. On QCN9274, sustained WAN traffic
can exhaust memory when Ethernet and Wi-Fi run on the same CPU.
Long-lived RXDMA buffers share per-CPU page-fragment caches with other
network users and can pin mostly unused 32-KiB backing pages.

Patch 1 makes external IRQ transitions follow the NAPI state so that
crash recovery can safely quiesce RXDMA before teardown. Patch 2 gives
regular and monitor RXDMA rings private caches and drains them after
their buffers have been released. It also fixes alignment of empty
skbs and preserves monitor status buffer capacity after alignment.

The series is based on ath.git main at:
388d3c42e8aba1cfc3c6d2c52877a46d8cf740db (Linux 7.3-rc5).
Runtime measurements were made on Linux 6.18.54, with Ethernet and
Wi-Fi IRQs on CPU0:

  Hardware: QCN9274 hw2.0 PCI
  Firmware: WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Two 45-second downloads showed peak order-3 memory growth of 54 and
68 MiB. An earlier unpatched 45-second test grew by 187 MiB, and longer
unpatched downloads reached OOM.

A five-minute download at about 660 Mbps transferred 24.8 GB without
OOM. Peak growth was 105 MiB, falling to 35 MiB above baseline after
one minute idle.

Thanks,
Nikolai

Nikolai Semendiaev (2):
  wifi: ath12k: make external IRQ control idempotent
  wifi: ath12k: use private page-frag caches for RXDMA rings

 drivers/net/wireless/ath/ath12k/ahb.c    |  4 +--
 drivers/net/wireless/ath/ath12k/core.c   |  3 ++
 drivers/net/wireless/ath/ath12k/dp.c     |  3 ++
 drivers/net/wireless/ath/ath12k/dp.h     |  3 ++
 drivers/net/wireless/ath/ath12k/dp_mon.c | 29 +++++++++------
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 45 +++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/dp_rx.h  |  2 ++
 drivers/net/wireless/ath/ath12k/pci.c    |  6 ++--
 8 files changed, 73 insertions(+), 22 deletions(-)


base-commit: 388d3c42e8aba1cfc3c6d2c52877a46d8cf740db
-- 
2.43.0


