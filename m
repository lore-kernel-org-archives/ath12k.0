Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7B4C71157
	for <ath12k@archiver.kernel.org>; Tue, 17 Jun 2025 08:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pYWthPmPJFGxXCVXC1WQk9SHm/xcWGcWNcfAf+I0uks=; b=JHkrBaAGPdhTgjLqeAVs8+4PHj
	wuojN3NOQIFSzVzK2SpV/XP6KVDBqShkVW5cFv1ehwMQLQIFfeCsELXqKkqLa++41KekQ2J90tamX
	yauzCFPuy+TDyWUQGEUaAQKVcmBbBechd05TEFrE5ODlpes485ZZkvzOV5biL2ndEKtrQ0yuTMtKr
	UIdWksMEi/zrcmOYnvVqS/0JZGZnw86Sx8DWX5j4wKhcXyp4kFlLXzSgpEtBDGlop6G1c9xINBWPS
	Q2vzYblBWu8fGjLq1feNpudLRzY8BNMonhVuurfSDT9hY9HxWoW0cXQUdrX+kuLW8nW8q8PgN/Guw
	FoGcV02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRzs-00000006e7T-12B5;
	Tue, 17 Jun 2025 08:48:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRw2-00000006dKx-2W6b
	for ath12k@lists.infradead.org;
	Tue, 17 Jun 2025 08:44:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E9D14423A;
	Tue, 17 Jun 2025 08:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C827C4CEEE;
	Tue, 17 Jun 2025 08:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750149890;
	bh=UwJ4gWOA+4pUw1190gZfv9SzitV3uWzPw5iBVgkeq28=;
	h=From:To:Cc:Subject:Date:From;
	b=ez/t/QZh2AGvECjxhFJVod2sUwdGUte5QUrvSJHZowj0cxJBN/f9IB+p4KZLx+S9w
	 9tQGouQPOBtO09IopoEoe2ImCunfDOW+pGBjBbaql+EgnpV1nOQ7Pz0jNZmFnUiagK
	 7dtE8+MsyizOj2yYybrEnmNh+OSvEWl7BgSae0ryhAVm6FotSELBeLxwfQyEOb1wBK
	 8vRFwFUF3QlEDt8f5psC0H6xyUj0uG2zvnnQpq5jeKppuNdT3qxJMAURo6nesBy9Xy
	 Tzvci9RI9AQ4zIl9V1WtPuw/MCR/ttYdYVkXDmPdlT7Zt0XASDBsDVWbOnCPurmdO2
	 DaFGUydhrA7Og==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uRRvz-000000003ml-3pRK;
	Tue, 17 Jun 2025 10:44:47 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Remi Pommarel <repk@triplefau.lt>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 0/4] wifi: ath12k: fix dest ring-buffer corruption
Date: Tue, 17 Jun 2025 10:43:58 +0200
Message-ID: <20250617084402.14475-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_014450_665489_BFDF5F10 
X-CRM114-Status: UNSURE (   9.64  )
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

As a follow up to commit:

	b67d2cf14ea ("wifi: ath12k: fix ring-buffer corruption")

add the remaining missing memory barriers to make sure that destination
ring descriptors are read after the head pointers to avoid using stale
data on weakly ordered architectures like aarch64.

Also switch back to plain accesses for the descriptor fields which is
sufficient after the memory barrier.

New in v2 are two patches that add the missing barriers also for source
rings and when updating the tail pointer for destination rings.

To avoid leaking ring details from the "hal" (lmac or non-lmac), the
barriers are added to the ath12k_hal_srng_access_end() helper. For
symmetry I therefore moved also the dest ring barriers into
ath12k_hal_srng_access_begin() and made the barrier conditional.

[ Due to this change I did not add Miaoqing's reviewed-by tag. ]

Johan


Changes in v3:
 - drop reference to commit 51ad34a47e9f ("wifi: ath12k: Add drop
   descriptor handling for monitor ring") from the commit message of
   patch 1/4

Changes in v2:
 - add tested-on tags to plain access patch
 - move destination barriers into begin helper
 - fix source ring corruption (new patch)
 - fix dest ring corruption when ring is full (new patch)


Johan Hovold (4):
  wifi: ath12k: fix dest ring-buffer corruption
  wifi: ath12k: use plain access for descriptor length
  wifi: ath12k: fix source ring-buffer corruption
  wifi: ath12k: fix dest ring-buffer corruption when ring is full

 drivers/net/wireless/ath/ath12k/ce.c  |  3 --
 drivers/net/wireless/ath/ath12k/hal.c | 40 ++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 10 deletions(-)

-- 
2.49.0


