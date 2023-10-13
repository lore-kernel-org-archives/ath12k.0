Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD92CDB483
	for <ath12k@archiver.kernel.org>; Fri, 13 Oct 2023 07:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WUYnGyZKRbMn8UB2srNr6ly4bSUs4zqmPc+gW3AQbXI=; b=L7DZF6JDUrMGir
	0I77SusSVcxDsKYaNRi+Ik8A76JnDdjytz96w8XikaG0bM+teSPb08qCksKtnxwh+g+U7M7nSFFRq
	oiR8xirDm/cmPF9oQB8ArKiHAMnE3zk/IVp81S/LRCydZJXHPiaJDg/nNAZ6vSutE3EOdvRr2Lslv
	FJVWLKy1XOdjERSkfrlR6UWYDfY79rF5WjIM35a5xd+uZ+RxYOSz4fUXtjX8b10nQQ6i25BHUi98k
	aQSdEhSnqVndnr36I2u7VfbwKSj3eD2POGNIBiUKu6/riW1k2FA2xqg0vW+Y30BfDqDAaAqkQQa28
	QhEkfe9e3idbisPyKQQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrCtg-002kFn-0L
	for ath12k@archiver.kernel.org;
	Fri, 13 Oct 2023 07:47:48 +0000
Received: from m12.mail.163.com ([220.181.12.197])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrCtd-002kDp-0n
	for ath12k@lists.infradead.org;
	Fri, 13 Oct 2023 07:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=2FP/I
	2HYvAdTtXOXfAHhCpnshFB9PypJYAVg1wtwkRU=; b=YWvQlSrhLrGqgUFYLb9bj
	Dzv6ST3gElzGD9PRpj+6XgdJvz9Gl9TLaRTWJa7s7f8cS/ttCxJb9xJxKatgeQ7v
	pv/0Sg5DDrie8nwFklTgNDPbb9FsV+bWlKStqA91iNQ6j6eCGtYM98sMjEGHeZOg
	LMQQijj5ttImm9/za4suso=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by zwqz-smtp-mta-g4-4 (Coremail) with SMTP id _____wDHb8cB9ihl+PW5AQ--.20384S4;
	Fri, 13 Oct 2023 15:47:25 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: kvalo@kernel.org,
	quic_jjohnson@quicinc.com
Cc: ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make_ruc2021@163.com>
Subject: [PATCH] wifi: ath12k: drop NULL pointer check in ath12k_update_per_peer_tx_stats()
Date: Fri, 13 Oct 2023 15:47:11 +0800
Message-Id: <20231013074711.2202850-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CM-TRANSID: _____wDHb8cB9ihl+PW5AQ--.20384S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruF45Xr1kGrWkGw4DJF4kCrg_yoW3Krc_Ga
	12vF4xXFs3Gws8Kr47ZF42qrWqvasrJFZ5JF4qqrWfCrW7JrWUAr98Zw1kAryq93WDArna
	9wsrJF4UX39YgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRMeHqJUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/1tbivggIC1ZcjGu80wAAs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_004746_094659_974FE67C 
X-CRM114-Status: UNSURE (   5.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Since 'user_stats' is a fixed-size array of 'struct htt_ppdu_user_stats'
in 'struct htt_ppdu_stats', any of its member can't be NULL and so
relevant check may be dropped.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index e6e64d437c47..a38a239669a8 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1339,9 +1339,6 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
 	bool is_ampdu = false;
 
-	if (!usr_stats)
-		return;
-
 	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
 		return;
 
-- 
2.37.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
