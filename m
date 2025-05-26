Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C734FC5AD49
	for <ath12k@archiver.kernel.org>; Mon, 26 May 2025 11:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Re8+Yp+TjvGBXlUFLtvm9ZkTS+IR3co+gGvnP8xJM08=; b=37k3KGhk5ScZmo8oWX7GeSmx1Z
	vjEBVznsn3B4VGC4/kY9znmzyjzxfeVAObNEZySRqRRk+ISV6HooP3upTPEx+mrU/qvBgAnbeT0xe
	2ka+hp9wGf052GEsJ4aNdIthHqYroNs2/MBnduOmSMtvsOxcVjWFyzFemgLOTvMQ84RbL6T+mdEAS
	4iq/qFxUN3CQaPPD5xncXb6xej6RzAdAnMmZJYxFQT4vkXQnK2UdUhOSXI7sK4nPkJcwmfRPcSGUD
	LptsvVgQBqY/t5obJRHjDPUrhe/a/vWjR/BfMtP7pwcEQT2tG1UzgWZZgZT0rZ2Riom0WoNarF2kg
	R5ke+hfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWNP-00000008k7S-2QYX;
	Mon, 26 May 2025 11:52:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWNN-00000008k5y-1LIE
	for ath12k@lists.infradead.org;
	Mon, 26 May 2025 11:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99040A4E3B6;
	Mon, 26 May 2025 11:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40141C4CEE7;
	Mon, 26 May 2025 11:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748260336;
	bh=6z7x8xoEqYgfeTyuv+MxW6E85QUdFqBt/3KadJRmPQo=;
	h=From:To:Cc:Subject:Date:From;
	b=IgTJt3KJcKq4yFa6XclWnQZrI/0oIx9+/pMynCoYToLZz4U/7o1JNR7iIKC8rgOz8
	 bgAfdbyj3SgxHjjGRn2RlSiV+ULf1X58f26nrlZ+V5CE9N9OPmEi61adC5E8Kq4zFw
	 diWY3H2Lcs/EkQK6jFj2nMKovePbkg/VQ9vKAT1cseFcZeWOIRd4o/FWzJc7KaULvz
	 sMwIhcnuO0NLV5YeDz2XMCJipN/8adTk8szmX1bak4D5EbI4CJIVl02+0XHi4+IDNI
	 OWCjCI4WyqmwlAav4/Zh6REHeiu+IgcZ1OxEG7X++K3VkJdY1EwUdLk9VUxOLKPsV7
	 5/2sYMqxKSESg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uJWNN-000000000fE-3MDh;
	Mon, 26 May 2025 13:52:17 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Remi Pommarel <repk@triplefau.lt>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] wifi: ath12k: fix dest ring-buffer corruption
Date: Mon, 26 May 2025 13:51:35 +0200
Message-ID: <20250526115137.2490-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_045217_420497_1A3537B2 
X-CRM114-Status: UNSURE (   7.38  )
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

Johan


Johan Hovold (2):
  wifi: ath12k: fix dest ring-buffer corruption
  wifi: ath12k: use plain access for descriptor length

 drivers/net/wireless/ath/ath12k/dp_mon.c |  3 +++
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 12 ++++++++++++
 drivers/net/wireless/ath/ath12k/dp_tx.c  |  3 +++
 drivers/net/wireless/ath/ath12k/hal.c    |  2 +-
 4 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.49.0


