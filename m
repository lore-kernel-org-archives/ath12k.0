Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E10EEB569
	for <ath12k@archiver.kernel.org>; Fri,  8 Sep 2023 18:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nuNUV011mwvq6DUft688wiuZNC4nx+Q8uZ/VhLcRRCM=; b=IryYLQMh3C+Jkg
	lSlwEiEIM5NVF/wcb96cRRf2k/rsYqwEFWDMdXQ6Ob5VtIxPuV6szkSFlKDmqJagyIWun7uPNb4m9
	5QQU9MGNIb8jI2j64mEFkbeBYRal64NNMNZOJTnXuWbRoaJFlCcteFk1T6lKpQvJxKokTz9J2aUmc
	XKzoc7tKTyZN2QnuL/5Z4yjzEu4zus/G/YUyNpVj4ZUwnFWiwD+MSV3H/YSiAqctI9jDttdImFn0O
	1eblVaBuKb2Xp+dYyLRfFH7mfvOEAdOHyjGL+5kgNBlSvIoTuWpdtgTeoOh7hlXP1iKZN2mgpLE7a
	/od2Oid40cBbgB4oQdzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeg23-00EFbU-1M
	for ath12k@archiver.kernel.org;
	Fri, 08 Sep 2023 18:16:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeg21-00EFZa-0W
	for ath12k@lists.infradead.org;
	Fri, 08 Sep 2023 18:16:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B02596150C;
	Fri,  8 Sep 2023 18:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7BEC32774;
	Fri,  8 Sep 2023 18:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694196996;
	bh=FU1lqmmuZW2SGaZg71bx0OH1zvUJpmq4tL2t7nuLsQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TUQ1R8PprR6dT+Oa2LGT/yat693BUnlICASNNySvutIFifQ1/iXoZGCKCgZ5mCjyU
	 U5yC6EY5JNGFjTjGqPXLE+RrVxGqahkMEe7grb5PCNCQTbmy/3zJCqmb63M6TkB7op
	 YCqyaLyUfxI8ZLr8Ioiqud3yo6grrICdY+LKMqhaBcNNRqIt1vGgMiW8hTgE5F3mSA
	 +Orc0Hg/xjzdsZtu05qIFqeSv0rr8QAncjDCuXLyizlwc82BobY+qwCQisEwzY1ffR
	 Yae3I4qCb1rAIwKkQls13MhF5+h+4xKESaZxkEFxVANKC6MCXPDJsfeLWSV0C184fs
	 j00t6iz/OYX5g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wen Gong <quic_wgong@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	quic_jjohnson@quicinc.com,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 14/41] wifi: ath12k: Fix a NULL pointer dereference in ath12k_mac_op_hw_scan()
Date: Fri,  8 Sep 2023 14:15:28 -0400
Message-Id: <20230908181555.3459640-14-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908181555.3459640-1-sashal@kernel.org>
References: <20230908181555.3459640-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_111637_238125_67A5B85C 
X-CRM114-Status: GOOD (  11.40  )
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

From: Wen Gong <quic_wgong@quicinc.com>

[ Upstream commit 8ad314da54c6dd223a6b6cc85019160aa842f659 ]

In ath12k_mac_op_hw_scan(), the return value of kzalloc() is directly
used in memcpy(), which may lead to a NULL pointer dereference on
failure of kzalloc().

Fix this bug by adding a check of arg.extraie.ptr.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230726092625.3350-1-quic_wgong@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/mac.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 58acfe8fdf8c0..4cae50c396486 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2752,9 +2752,12 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 	arg.scan_id = ATH12K_SCAN_ID;
 
 	if (req->ie_len) {
+		arg.extraie.ptr = kmemdup(req->ie, req->ie_len, GFP_KERNEL);
+		if (!arg.extraie.ptr) {
+			ret = -ENOMEM;
+			goto exit;
+		}
 		arg.extraie.len = req->ie_len;
-		arg.extraie.ptr = kzalloc(req->ie_len, GFP_KERNEL);
-		memcpy(arg.extraie.ptr, req->ie, req->ie_len);
 	}
 
 	if (req->n_ssids) {
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
