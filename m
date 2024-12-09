Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFD3E7717D
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 18:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=clK93tpYdMSyEXoZsFazqZnUmbhU6t+vou1oCvd6JPA=; b=KksUykNPZtSWmGroBevmK6GnPa
	nb4+RyCNKmE7JbJ20vRFfcMuWFCsDyZePrBuJglvtXWEKxIpfGEsWxbhKu6Ezdh9U/Dxy59maOGrX
	xIZjh1VMqoc2XZoy6HT0wNmxhbn661lGJKFGKj8eAEKX0V74Obseto/LrS0c89HJFxclRudyF5yf6
	znOzX1NvUJzx04R5qGOgHlFxcfeDJqhMmRs66wxlQuCEiB5p1hSsMJQFTyiLAojXgJaG7SHROwwFZ
	eSSB1FOxZY9w0wcXaCZlZkEOKoTha5JDxNKYxvHlXW7TYXclB3VA52AS2T+4DSIpP6aM/gw0edP1I
	ltN+d5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKitn-00000008w6q-05yt
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 18:54:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKitk-00000008w5Z-13Oy
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 18:54:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D9A05C5DB3
	for <ath12k@lists.infradead.org>; Mon,  9 Dec 2024 18:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51FFC4CEDF;
	Mon,  9 Dec 2024 18:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733770463;
	bh=90AjjSK78KZHmSzF/kocMWbCfIF7ZpNwSM++h3U7QLE=;
	h=From:To:Cc:Subject:Date:From;
	b=hdZvBRzBw3F1nyeM8KzoejVSVlIkdpTPyZLQlTKusZzgg77HCmtMPIvVuu2qGjRWX
	 pDaAk0LOC60vUFddDrbwW11FcP7uMT+nC/EvO4LA4s67rMxesPvKAkYda6EqXXu2AZ
	 3EYPaspSyaLxxiEjOOL+cj8saBhSR72eU4BU+Hva7oaTqg030v6jH3SL8QpNiME6LD
	 tobpPoHn105u2mcJAGzdN9CEASKzqxNA2ccYFXJBT87+BBv1isu6wNCpsA1yZXOZe6
	 6w1E9OFvW6YoPSL7XzFZBy5MCeSber+nYv8+GpPizkrudo+EYGhMLIpSHE83unwaUC
	 9eCpNnEfrV4QA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 0/9] wifi: ath12k: MLO support part 8
Date: Mon,  9 Dec 2024 20:54:12 +0200
Message-Id: <20241209185421.376381-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_105424_330888_057DD1FA 
X-CRM114-Status: UNSURE (   6.81  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Getting MLO to work with QCN9274 is getting close, this should be the second to
last patchset. Small patches this time. Minor changes to data path to support
MLO, some interface combination rework and few fixes.

Please review.

Aditya Kumar Singh (3):
  wifi: ath12k: fix ath12k_qmi_alloc_chunk() to handle too large
    allocations
  wifi: ath12k: fix ar->supports_6ghz usage during hw register
  wifi: ath12k: pass link ID during MLO while delivering skb

Karthikeyan Periyasamy (6):
  wifi: ath12k: move to HW link id based reveive handling
  wifi: ath12k: add partner device buffer support in receive data path
  wifi: ath12k: add helper function to init partner cmem configuration
  wifi: ath12k: introduce interface combination cleanup helper
  wifi: ath12k: Refactor radio frequency information
  wifi: ath12k: advertise multi device interface combination

 drivers/net/wireless/ath/ath12k/core.c   |   5 +-
 drivers/net/wireless/ath/ath12k/core.h   |  17 +-
 drivers/net/wireless/ath/ath12k/dp.c     |  14 ++
 drivers/net/wireless/ath/ath12k/dp.h     |   4 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c |   8 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 213 +++++++++++++------
 drivers/net/wireless/ath/ath12k/mac.c    | 247 +++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/peer.c   |   2 +
 drivers/net/wireless/ath/ath12k/peer.h   |   3 +
 drivers/net/wireless/ath/ath12k/qmi.c    |  10 +-
 10 files changed, 414 insertions(+), 109 deletions(-)


base-commit: 400568fb3b022247c1603fdbdd6444b3ef14ffce
prerequisite-patch-id: 721655de1e9eb1b723c3340c80f52be7ab6e73a7
prerequisite-patch-id: 99576487c570edbaf46b35e8ba6b9e20ad9bf85c
prerequisite-patch-id: f0a242859176e986640595256e7f488561683309
prerequisite-patch-id: 532325a3a8da40d6b43ef643f38dca5389750820
prerequisite-patch-id: 1a0adfd0f7ad52c7d0ddd6466659e7a8a229013b
prerequisite-patch-id: e1a1418434e24374ef1ad04a49249436de602dd8
prerequisite-patch-id: 8847add439503b799079f8cfa043b15b57691d7f
prerequisite-patch-id: 017994ce11ee18d218464d1bb5ffb50ac8d941a5
-- 
2.39.5


