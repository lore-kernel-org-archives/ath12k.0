Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FEBC02199
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 18:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OQ6cIBYtDQqOLquKMrAIvQ0xXU0wCUXZNzvGoE/9Xo=; b=av/V28i3nBe+C5ATEIr0dkicHk
	n7rIBxxuKpMUGzSXV8dnxNbE3BrvqJnbzUZAodMWQAEBLJSvWBy7qaaItm0MZ5nNKq3dlWtupuoVN
	XaGX+ryNPNpsGRFa0fFL/OvOkAE2uCodTJ+2W2Rqv4CDQ+kHwW1UCLIFbOTrWSAOUGef10tcP2iZX
	coQBIZPRduDN900sSd4focxpu9Gl7+99W5elAYjxyZSwg8NPYhocbjIePXluajPHmeMzav3nIAe3z
	wAyYanA9s4A7LDmw6jBMWbslHp/JBIgKEi0SEI3+6gnAHp4Ss2BbxYvoUDd/8L2G4yHCe7rbOlBFZ
	1sgWRQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0oZ-0000000GCqP-3WBB
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 18:04:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0oV-0000000GCnF-0dqo;
	Mon, 03 Feb 2025 18:04:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE7C65C66FC;
	Mon,  3 Feb 2025 18:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53290C4CEE2;
	Mon,  3 Feb 2025 18:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738605890;
	bh=eNIW6WQcqPXhIWN6S46qWzShZTr4zretpTw8PTTRw9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MPP+tjQHgZHPt2+r5AYhupMEyj4Nkh3Ak81oPBn8bnZ4PmdwEhcAiJIdlrWqpynFT
	 yZ9u+SBv/a1tjViGGNhOSLtdEF/20tZEt6WVjuinRWOhZVTbkftLVi7XTSXtYdjltA
	 3H06+ELtAFsIVvQQB5Dlkwcu8MZgltmEYsMAI0siY8nKGYZ2Ho8PkiHbSi5F+uuVBj
	 L3t+Y+cR5NIfLXck3C0TP9S5MKxhUy+KrNi7nIuND9koTisbb0V9rqg6S1CijrRvZh
	 gSOvV1UXH8BrrEULK9/G4H1l6oObEJstg9U30MvAV5Si/VbCg0HbNlE28Ai3oGgXbd
	 jFY27HTRbUkmg==
From: Kalle Valo <kvalo@kernel.org>
To: ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH wireless 2/2] MAINTAINERS: wifi: remove Kalle
Date: Mon,  3 Feb 2025 20:04:45 +0200
Message-Id: <20250203180445.1429640-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203180445.1429640-1-kvalo@kernel.org>
References: <20250203180445.1429640-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_100451_233710_E25D374F 
X-CRM114-Status: UNSURE (   8.48  )
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

I'm stepping down as wireless driver maintainer. Johannes kindly voluntereed to
be the "custodian"[1] for the drivers until a better solution is found.

Link: https://lore.kernel.org/all/21896d2788b8bc6c7fcb534cd43e75671a57f494.camel@sipsolutions.net/ [1]
Signed-off-by: Kalle Valo <kvalo@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2048c75c3c42..6401e59ec2cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16341,7 +16341,7 @@ X:	drivers/net/can/
 X:	drivers/net/wireless/
 
 NETWORKING DRIVERS (WIRELESS)
-M:	Kalle Valo <kvalo@kernel.org>
+M:	Johannes Berg <johannes@sipsolutions.net>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
 W:	https://wireless.wiki.kernel.org/
-- 
2.39.5


