Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009F0CA6004
	for <ath12k@archiver.kernel.org>; Wed,  7 Oct 2026 21:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Z8CfWUeO+BpA0EWxBPHQDHuoY5+JehiGP0c5OUk/IA=; b=w6xreeM39sAg1O7wOWCbqT513t
	Xmin/akGeKtKHQvnlNhb9xoD4BFqUJXmgrH9oay1VyxHuI01l0/PLIJrP7jvy3igKmMMEkWE4piOL
	aHCpOSNuWZ/+HSjwo8bzCQQimY+uz/m+X55Uy/37WmYyEbKOBoQm7+wVal2Jaknvz7S+tXwK99Xjg
	0+YWSy0Brigtt8RYz/ZJRJLQ7jQxNoNO7mfqGehkaop7BvDdYx62qk8KrFPNmVYEHGIwxbVHB08TS
	AIigQ8LViBKYF+QrRSmwLDqGSyKYhDPwRSH8Fqb0eypwiWmgc90/1120/c7GXAk1cjL/hNJM+dz4G
	biw1FL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZM6-00000003CkQ-0U2J;
	Wed, 07 Oct 2026 21:39:18 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZM3-00000003Cio-00gb
	for ath12k@lists.infradead.org;
	Wed, 07 Oct 2026 21:39:16 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5bcbb82dbadso2567235e87.2
        for <ath12k@lists.infradead.org>; Wed, 07 Oct 2026 14:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791409152; x=1792013952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Z8CfWUeO+BpA0EWxBPHQDHuoY5+JehiGP0c5OUk/IA=;
        b=Wh0p6YNMI04lNUuNMYzF2Jla++PB7gWlbytTuw8aND8/4ul5j8vjs/U8z5ccxSSoIs
         kvHMdxv3T5n45TjHx4NYhySu/bcLkAqXBlPbOeNd1uRcDMGMU5XJuFR0mGMA6jrDN4vu
         Vg5OfMPgHCbEQ7X+LdNDUtsSjThJFTfnCajyzXQ3yH40IgVgCr533dtwdeT4UGh9832c
         0ikQD+rvA1VKQ0NrUXushAUVjeL7fNSWzpfBYW591IhxVfzXrdpIj/w8tKrHz48wDwQt
         3v/EZZhLJGmw1YjRCAdcbuxk4iyXm3yRuUmg6QMVygLioDPhmMijGvRnqh6flJ0a/Idq
         nYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791409152; x=1792013952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Z8CfWUeO+BpA0EWxBPHQDHuoY5+JehiGP0c5OUk/IA=;
        b=pqnGFYX1tjy973QRG6bZYbmJPXLbv6BPhROu/e7SZkN81aZbjU5ieV1SoIckE2Pxvs
         e1qFZ26zyFb5gBSDP0pcpE7rT8H9iNkvuHpgAuHToDBFe4fF1krHECQHhap192ueDXp2
         t/I0xzYr4WbZHltF08RCsyBwkRQE74EZ9Ymza6gezzapjZ7VrSEv6tqdffJw5emj5k4e
         PV4TIoDBVubkAEk496/sxHfZfP+48LYuBUijR+A//hUPN5GNveP51row8WvAFfU2dufC
         K8xQsPni1wLkq6ySoi0Zac7MLYHE4z7W/1Xb/+x9KSPN+arU9uUYyo5jCtf3SR2Ukz0L
         /aDA==
X-Gm-Message-State: AFq9FYLZe290Ra64JPpFjV3gbcJhS9PLn7Hi664TU9obcFC7LtOqWomG
	hnIov7fJEsbASOxRScg8lNiYIFsm6dyc37dib6EdNOe+u+sMQ8oG692zv89cYCuNQ7fwN7VAtWc
	=
X-Gm-Gg: AYBFou38klvQ4uJNk4nt0YLgF4S5yFTl+HNJWYV/+LbpvFZsksxfJitZSZ63QPXfuFb
	t2Yo2WUaXTaHwFvDbOfJCc7PtenFibFbBEXClO9XhAVYRT9gYH5O/XDRDmYO2B1aXgsHb51fCGr
	9FRwQlwGOozKnc7g0es17bp2u+ghoPLw8Eb+Z5J1TWE+wa4WVY3XLmZSP9vO8GEcHhMJ4eHbPqc
	f0XO4MmYJuBFp2N8qmA4wIEUcB8Ys4MhHfze5UxTi9isyAHI1cGUGvTLuAYajIbvaXdosjR4EJG
	3mFpUly4wuXVBY1HCc7qnbpzPlDaSLJL/AEQfbNOlFu0Hjq8Wp/z6Xz2/uaUJ444JM8hrGJ8Hw4
	7grT/Yxt+tTpheUx2FUpO8xQzFgDDkCn8ol0brNfG3PfhHz7JzlTEgrVYmuCnr4MIIuMgpS7ZWO
	kaIF/qcPjHhHtBF58M9TKI/YonyJAyj6BCLv0XoSFG8I1T7vgZjz/1VTOwJS4MBGhZ5kRMAQhmj
	1nW
X-Received: by 2002:a05:6512:33d3:b0:5b6:1a7c:aa1a with SMTP id 2adb3069b0e04-5bcd07442b0mr1332608e87.50.1791409152110;
        Wed, 07 Oct 2026 14:39:12 -0700 (PDT)
Received: from Quarx2k-PC.lan ([92.124.138.168])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ae563df4sm1241411fa.30.2026.10.07.14.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 14:39:11 -0700 (PDT)
From: Nikolai Semendiaev <agent00791@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	jjohnson@kernel.org,
	wabsie@gmail.com
Subject: [PATCH v2 0/2] wifi: ath12k: isolate RXDMA page-fragment caches
Date: Thu,  8 Oct 2026 03:38:27 +0600
Message-ID: <cover.1791408913.git.agent00791@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_143915_080105_421A0245 
X-CRM114-Status: UNSURE (   7.91  )
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

Changes in v2:
- Include linux/bug.h before linux/page_frag_cache.h in dp.c to make
  WARN_ON_ONCE available on Alpha. This fixes the build error reported
  by the kernel test robot:
  https://lore.kernel.org/oe-kbuild-all/202610072103.1v2wWX3z-lkp@intel.com/

Nikolai Semendiaev (2):
  wifi: ath12k: make external IRQ control idempotent
  wifi: ath12k: use private page-frag caches for RXDMA rings

 drivers/net/wireless/ath/ath12k/ahb.c    |  4 +--
 drivers/net/wireless/ath/ath12k/core.c   |  3 ++
 drivers/net/wireless/ath/ath12k/dp.c     |  4 +++
 drivers/net/wireless/ath/ath12k/dp.h     |  3 ++
 drivers/net/wireless/ath/ath12k/dp_mon.c | 29 +++++++++------
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 45 +++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/dp_rx.h  |  2 ++
 drivers/net/wireless/ath/ath12k/pci.c    |  6 ++--
 8 files changed, 74 insertions(+), 22 deletions(-)


base-commit: 388d3c42e8aba1cfc3c6d2c52877a46d8cf740db
-- 
2.43.0


