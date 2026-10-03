Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78B1CA5FE8
	for <ath12k@archiver.kernel.org>; Sat,  3 Oct 2026 09:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AFojHjA+4FDN4JhFb5+uFEMCc+xZ9O93LXDyh2k/6GM=; b=46mEh5Ysg3R6UOI7t3tSAA3LTP
	L7+YzakATqS8TiB71IKoxrEQb6WYJVLK4/shHgYMpE1UPplKEZUofKLVl4yeFO4YMiXOgSdnuLFE8
	oQznsNPCI3987lhPqJkncezAc9LjTnwyHYVjKExbByeGyK4a9Yc7/3MKaYDuQ58oO83tizxAdxtVk
	Y/g/z9t7Wlg08vO2MdjdBxXzlCiDJY/TQyoEMpsACWyIXlhd5hkrVx0jqXZtMaQ4DGUxLat8ZNnyE
	YCmR1/R3As2RrwLlUviCjkMsEGCKRDP6RBfXpycsPEzAbyGWamIwvi9LHyZx9WmCGPPxr/Ej8oq8a
	y/xed2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvvr-0000000DG0p-2JVp;
	Sat, 03 Oct 2026 09:21:27 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvvo-0000000DFyn-06c1;
	Sat, 03 Oct 2026 09:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=AF
	ojHjA+4FDN4JhFb5+uFEMCc+xZ9O93LXDyh2k/6GM=; b=NbGJkTcVNbx9d34ixE
	FIMoN7zt/+04JJqHuln4jZqRxm6xwFd41lIBUgKlbaVfCrefiJc5D8PgIEQ2Qvk7
	Rb84NX0YrHwe/wvCYoIsu6cCkZwR0A9nCWJ1q9lorRETwhArejV7XgCADevC2uCU
	rTIei32CLCWzd07tRBnM6YyJY=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3n1YCycBqC7WjCQ--.62376S2;
	Sat, 03 Oct 2026 17:21:07 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	Shashidhar Lakkavalli <slakkavalli@datto.com>,
	Bhagavathi Perumal S <bperumal@codeaurora.org>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>,
	Sriram R <quic_srirrama@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
Date: Sat,  3 Oct 2026 17:20:57 +0800
Message-Id: <20261003092104.520135-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3n1YCycBqC7WjCQ--.62376S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrWxAw4kuF1kKryUKrW3KFg_yoW8WFyDpF
	4fu3Wa9F1xZrsrtr1fJw4xJFyrWan3CF1YgrZrCa4ruF4rCF1rtF1Yq3WfXFyUAFWxG3W2
	93yUtr1fCr92y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piY9akUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgQ+eGrAyQShsQAA37
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_022124_694072_0472816C 
X-CRM114-Status: UNSURE (   7.70  )
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

The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
the current entry. idr_for_each() retains radix-tree iterator state across
the callback, so that removal can invalidate the walk.

Use idr_for_each_entry() in each cleanup path. It performs a fresh
idr_get_next() lookup for every iteration, allowing the current entry to
be removed safely before its skb is released. Keeping the existing locked
removal helpers also ensures that a concurrent TX completion cannot find
an IDR entry which points to an already freed skb.

Changes in v2:
- Rework the ath11k and ath12k pending management TX cleanup patches to
  remove each IDR entry before freeing its skb, as pointed out by
  Rameshkumar and Jeff.
- Use idr_for_each_entry() for the pending cleanup callers instead of
  leaving freed skb pointers in the IDR until idr_destroy().

Jiale Yao (5):
  wifi: ath10k: avoid IDR mutation during TX cleanup
  wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
  wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
  wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
  wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup

 drivers/net/wireless/ath/ath10k/htt_tx.c |  7 ++++-
 drivers/net/wireless/ath/ath11k/core.c   |  3 +--
 drivers/net/wireless/ath/ath11k/mac.c    | 33 ++++++++++++------------
 drivers/net/wireless/ath/ath11k/mac.h    |  2 +-
 drivers/net/wireless/ath/ath12k/core.c   |  3 +--
 drivers/net/wireless/ath/ath12k/mac.c    | 33 ++++++++++++------------
 drivers/net/wireless/ath/ath12k/mac.h    |  2 +-
 7 files changed, 44 insertions(+), 39 deletions(-)

-- 
2.34.1


