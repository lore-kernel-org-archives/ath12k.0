Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F109C98338
	for <ath12k@archiver.kernel.org>; Sat, 26 Sep 2026 15:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N90PVcEBaJjmtFZtExELpFQU0K3QU2o0KNqwUaSuAI8=; b=LBGkVPfosjoZaPH1WpsgWjK2Ik
	PQ684zL6M64zlvCGRJd1BQecP4ZeIM/1YH5EjGKIxpsLBIW4zfxwPwQz3NN7CS2vhjGfp4Lxv/WMv
	llPuCbI5uy4I7/W+AIprcNud6tcQP9amTjbygl1yie/xLOi2JtKHQv6QP7sN1VwOKJc8MRNzbOZR+
	N8uUH1qRmaHCT2f6cnji03xpXRGZf+DAnTIa8NwThwuNWyAISpPO8/aLkOhOk6n4mSV7EEkSNuI2h
	o8vMFxYJdqTZo8x8PObkOPfZWoPbwty1eMq7MpuzKimkcVl7lgoyeKMxPwsfAB3BbpJne4q5hBC8P
	PzlOaUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUe8-0000000Fbib-2eFq;
	Sat, 26 Sep 2026 15:49:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUe5-0000000Fbfk-34xQ;
	Sat, 26 Sep 2026 15:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=N90PVcEBaJjmtFZtExELpFQU0K3QU2o0KNqwUaSuAI8=; b=OLDDT7CVu1OiodaFd0cXqIu8iN
	y7Vm+xbUMC7kNkUO76YPpVpkEkXfjrbcOc0rvJOZCA5VPE9LY9K5nmfe2bYcZBZCAZCIWIUmLFO9G
	UdD8RdyV3ohrgyqA/CCJVM+3FBv7919vdoPZUvFS1/Z7tiKG8vS/3eJotxHST09KVoXB0px6z5m4f
	WveBRlXhdsKE5Puio58VrnZnGvBSxwrRQNFIC2daZAnAvkB7Bm/BZMwuEmHtQrOlehJW6Xi7WJfkE
	Z/wcGuZh5XkNcIjyvsinm0MIrXOLU48oSD1hGscQXLKFt5lUkAzQP+Fu8EKmKvt1CYf5IwNEDuj6p
	LvycDkSQ==;
Received: from m16.mail.163.com ([220.197.31.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xAUe1-00000000GIC-2tq9;
	Sat, 26 Sep 2026 15:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=N9
	0PVcEBaJjmtFZtExELpFQU0K3QU2o0KNqwUaSuAI8=; b=EiLm0ZvCe5CBHYTiLl
	W9lY7Yjk1P4AVlRDElfr5VxaNsuCIdp9fzP1fEqz04TBwVk6hZ5GXKIQGXX+4Wyn
	C4yc6fvzAohOPPB4N1S9lXUQ+V9Vx1zqEhQrk4z+mLvkKpoDR2HmQ6xFCMg1CvlF
	BE4qimdsMkxwrF31lecIHr7UA=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3F4pL6bdqlpIIBA--.11355S2;
	Sat, 26 Sep 2026 23:48:28 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Michal Kazior <michal.kazior@tieto.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	Bhagavathi Perumal S <bperumal@codeaurora.org>,
	Sriram R <quic_srirrama@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/5] wifi: ath: avoid IDR mutation while iterating
Date: Sat, 26 Sep 2026 23:48:19 +0800
Message-Id: <20260926154824.75224-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3F4pL6bdqlpIIBA--.11355S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrKr4xur4kGr1xCw4xXr4UXFb_yoW8JF15pr
	4fu3W3uF1xZr97tFnxJa18WF1rWFn3CF4jgrZFk3WrWrn5CF18tF98tF1fZFy7GFWfJw12
	93yUtr1fCryDA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piY9akUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQwWUGq36Uz7GgAA3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_164858_261360_2E2A9732 
X-CRM114-Status: UNSURE (   3.74  )
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

The ath10k, ath11k, and ath12k cleanup paths walk an IDR while their
callbacks remove the current entry. idr_for_each() retains radix-tree
iterator state across the callback, so that removal can invalidate the
walk.

For ath11k and ath12k full teardown, keep the callback limited to
releasing the supplied skb and leave IDR teardown to the following
idr_destroy(), matching the established SCMI fix. For selective per-vif
cleanup, use idr_for_each_entry() so each iteration starts with a fresh
lookup before removing a matching entry. ath10k also uses
idr_for_each_entry() because its shared TX completion helper must retain
the per-entry removal.

Jiale Yao (5):
  wifi: ath10k: avoid IDR mutation during TX cleanup
  wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
  wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
  wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
  wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup

 drivers/net/wireless/ath/ath10k/htt_tx.c |  7 +++-
 drivers/net/wireless/ath/ath11k/mac.c    | 46 +++++++++++++-----------
 drivers/net/wireless/ath/ath12k/mac.c    | 46 +++++++++++++-----------
 3 files changed, 58 insertions(+), 41 deletions(-)

-- 
2.34.1


