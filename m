Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A3BC48260
	for <ath12k@archiver.kernel.org>; Tue, 13 Feb 2024 10:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SLJ/e62z5keo5AIeGYTm1RDAscuZBgXO/Z+69iU/PvY=; b=kWcKy9OlXIMDXRnDJmMp/DXAmn
	AhGtIMmKxwkWTWWD+hKrurjmaOVnqVF1sNVmpMVKo9iY+nMEzAYyn0PBzUD7GJ6gbf9aKYpPszOAj
	E3xMMtUnhZDw7pl1l4EXGYqMePsY77N7+baJIBjev16Z6bDu4fB+pCwA2PtqOGFWbZJIo26ijjmKS
	YXQE9WjrqBhdtf5wo6DWc7Lwswxa4iSHwJQPgHaykvJtHz94pLjDkOlcfPtvD/vYsfcQwtbHm5ws0
	cn1ai0hNVK9YkZZpo7KBa5Rbuzj9jS7Ym0oCkXH79CJwMHsyBnqc4g7D6tbO39q2asPYWv57BgXPX
	z21Y0uHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpj9-00000008lqt-2CdL
	for ath12k@archiver.kernel.org;
	Tue, 13 Feb 2024 10:09:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpj6-00000008lqF-21Gh
	for ath12k@lists.infradead.org;
	Tue, 13 Feb 2024 10:09:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4CE7ACE1A49;
	Tue, 13 Feb 2024 10:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C174C433C7;
	Tue, 13 Feb 2024 10:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707818957;
	bh=HiQZbdRmzgTCB8ES0rsIWJhMeBxKcVI2EgJVFYK5Yf8=;
	h=From:To:Cc:Subject:Date:From;
	b=avMTiGFZmj1wjnBPK3XnQaqWfS/7+BbASpyxX5lpSUDuWS63seveFw96r/Qvfst+f
	 bnU4gUmidsQcnjDMw1d/JdNBasC3KdDdQkfFd4wibVtwyOJAeaPoCWA3YFays2zQeZ
	 ZVIYqXZ5XbjcI1Y2tHw+SPOB8C5PfQpLG89+i/DaGw4bx6XjZyXhIZlfhe5nAWXUrm
	 iDnYF24eCvShjvczrifMxhg+rgAeQa0IMkbyX9DQs5EUPGZW6xabDNig4x3Ee6YVba
	 doJeEel5bUec3/Q4lQctn51QyUSmvnYDOuquxep9qnEP5IQpyN7jAnby6eoaFfZCLO
	 MyLifuYmoDJdw==
From: Arnd Bergmann <arnd@kernel.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Aloka Dixit <quic_alokad@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Aditya Kumar Singh <quic_adisi@quicinc.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: sanitize ath12k_mac_allocate() return code
Date: Tue, 13 Feb 2024 11:09:06 +0100
Message-Id: <20240213100912.459018-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_020920_715282_9B5C872F 
X-CRM114-Status: UNSURE (   8.98  )
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

From: Arnd Bergmann <arnd@arndb.de>

The return code has no initializer:

drivers/net/wireless/ath/ath12k/mac.c:8006:9: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]

Make it return -ENOMEM for allocation failures and remove the unused
variable instead.

Fixes: 6db6e70a17f6 ("wifi: ath12k: Introduce the container for mac80211 hw")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f2f7b2a60261..e93475ae8d07 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7965,7 +7965,7 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
 {
 	struct ath12k_hw *ah;
 	struct ath12k_pdev_map pdev_map[MAX_RADIOS];
-	int ret, i, j;
+	int i, j;
 	u8 radio_per_hw;
 
 	if (test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags))
@@ -8003,5 +8003,5 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
 		ab->ah[i] = NULL;
 	}
 
-	return ret;
+	return -ENOMEM;
 }
-- 
2.39.2


