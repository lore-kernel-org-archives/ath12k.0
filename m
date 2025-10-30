Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294B8CCF9F0
	for <ath12k@archiver.kernel.org>; Thu, 30 Oct 2025 14:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fELUXCyEO5u+hm/ZzD8bjXuY1M8yiutIcxsOu2hdzdk=; b=MMiPYd7E++MQ0k6O1cAQXQCHCM
	phL5G34l+RnH8wyzBIECl/+ERQfQnSJC9znuxI2WrQL+QS0bMJ1ZeUAbmET9GtkoFT4nnKgzWsE1m
	+L//FBOle9ZUJvV/FJmZPoISCTXyOjyCCOPIJ8yHgFvjvdkP28oPcJy9eYSayDK3nZJ4R9lURUUk4
	V5rDRgqy96gIETt+e9quJW3n/JCuiYZOKewA84nhpsijZ7XCjyirfn49Yu8D+zLjZ6fB5fsKenpY7
	t7JwYtMUYD7wAFp9c6Z7qjjWbiMBpxZy8pdPClxGmAW4dzPSwmRXb3X0GUplhwAmtayrsSv0DYJ30
	5j6467fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETgB-00000004J3T-3kPr;
	Thu, 30 Oct 2025 14:31:07 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETg8-00000004J2s-2E1R
	for ath12k@lists.infradead.org;
	Thu, 30 Oct 2025 14:31:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761834657; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fNAASr4B1bzC/pEJtTi+lgpiWt+fF15kBUFcIDcSqz/ijWH0e6WPKIoHtO5rFtNQzdhALl0UYpYRPtPZgxFL51pxZJFjaePVEh59mgT/SD+rTP6Rj5B6Rn7+KqSc6q1W1juba9sTRWI4XivJn87iOJYkKngiJugcV/CtNNi4wao=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761834657; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fELUXCyEO5u+hm/ZzD8bjXuY1M8yiutIcxsOu2hdzdk=; 
	b=DxQBGBaxvw4QEpBdEKNClzIlWQ1xl5tQUJhjacgJgtfCK89sBf1yt60c1R6+36QTt7ahZH7sUWNpnhyJLGdZJq4gwN4ys1moUw2aMDeO/kOV3xWUIO7ZT6iOb05VdQXX94+FEkHRd3dZ+GgmHQRU9xYJzlthB+Uz16tL6h+xxlM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=xv97.com;
	spf=pass  smtp.mailfrom=m@xv97.com;
	dmarc=pass header.from=<m@xv97.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761834657;
	s=zmail; d=xv97.com; i=m@xv97.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fELUXCyEO5u+hm/ZzD8bjXuY1M8yiutIcxsOu2hdzdk=;
	b=g78AxvLCrojp5U2OY3QRT6zsTK5xu7Di3fAfbwM9ehhaeosDmdlLXb1HlyC7ZHQC
	Noiryin0s2UGdzgsNbpWD5Kc9CWzkTKFN/ciK8RlQNaRsuRaF81d2VQJkArsP+1zYhM
	hPyykQC76u52bIA2wugZyje1n+Ehe/ZGJ66O0y7s=
Received: by mx.zohomail.com with SMTPS id 1761834653816426.06990330153076;
	Thu, 30 Oct 2025 07:30:53 -0700 (PDT)
From: Chien Wong <m@xv97.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath: fix comment typo in monitor mode handling
Date: Thu, 30 Oct 2025 22:30:41 +0800
Message-ID: <20251030143041.12027-1-m@xv97.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_073104_714674_ED2EF7B6 
X-CRM114-Status: GOOD (  10.60  )
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

Correct a typo in the monitor mode comment where "it make" was mistakenly
used instead of "it doesn't make". The comment explains that the brief
period where monitor mode appears enabled before being removed is harmless
in practice.
Also, use more common phrase "in practice" instead of "in practise".

Fixes: 3f6e6c3291ed ("ath11k: disable monitor mode on QCA6390")
Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Chien Wong <m@xv97.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 drivers/net/wireless/ath/ath12k/mac.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 3276fe443502..668307f28038 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10640,7 +10640,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	if (!ab->hw_params.supports_monitor)
 		/* There's a race between calling ieee80211_register_hw()
 		 * and here where the monitor mode is enabled for a little
-		 * while. But that time is so short and in practise it make
+		 * while. But that time is so short and in practice it doesn't make
 		 * a difference in real life.
 		 */
 		ar->hw->wiphy->interface_modes &= ~BIT(NL80211_IFTYPE_MONITOR);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4c8b7a527e74..c72198c6cc96 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14083,7 +14083,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	if (is_monitor_disable)
 		/* There's a race between calling ieee80211_register_hw()
 		 * and here where the monitor mode is enabled for a little
-		 * while. But that time is so short and in practise it make
+		 * while. But that time is so short and in practice it doesn't make
 		 * a difference in real life.
 		 */
 		wiphy->interface_modes &= ~BIT(NL80211_IFTYPE_MONITOR);
-- 
2.51.0


