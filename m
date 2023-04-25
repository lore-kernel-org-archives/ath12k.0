Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD247C77B61
	for <ath12k@archiver.kernel.org>; Tue, 25 Apr 2023 11:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yYqcFJ2f3haDYImil0TvQJ9rUVr7LwmKMU4Bn5/Y1Fc=; b=y3d5Np0tsz6/VV
	xSnzaF8m74IOXB1FP00vnTV9Wu6OUrs0K2vWKDxsk1SnGBRDIiS7sBgN2Hoomu3a0c99TQC8cKi77
	29cRvZd7TERsb4X2iiWO7A9xRYSY5bO5YrDO+Jq9Q5j2xdYYu1E7p1rin6A0YcfNLbMoD0ZrKRAJj
	haPTIsVEnLpW72qpt9kEL46/XndxrvpUFpLj11CBZsdzja+hRa2W8RdtWUCPbzSqYPnLYgGuACDtu
	w1FXRMGeYfLmKPbNewzGMyxIQg7ca3ffdyGIsBx+qUKtAMDa/epa6QVX4bSwCEsS5J1GX4kbB3kQY
	VQGanRXAxDI43lFjMqxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prHIZ-00115z-1n
	for ath12k@archiver.kernel.org;
	Tue, 25 Apr 2023 11:57:31 +0000
Received: from smtp-21.smtpout.orange.fr ([80.12.242.21] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prHIV-00114z-1F
	for ath12k@lists.infradead.org;
	Tue, 25 Apr 2023 11:57:29 +0000
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id rHIOpwV85Od5IrHIOpk006; Tue, 25 Apr 2023 13:57:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1682423843;
	bh=t3xAngYVnplShoMkDBT5wxr82rgMk9+s4xEzp+xQcGk=;
	h=From:To:Cc:Subject:Date;
	b=sLPw0Pw00uQk6bgsbUFMY+a4XjocYbk7duiHnLMdWW1BUkx9fWjVLP1NbmvOG8Gx5
	 Vi64m3fz2Gb18SOghspqNFubQlmjD+Usnvswdh5OFSbdGdaItUIlFhNkBdhxPYTDGp
	 0EQ0AG/mRUeuUjKQd2I4wbh2Z9EsPhzxoiQlBYuSJWuFt9gAdVkD0S3ClkPctw2/gz
	 cyj7XhOoTsRh9UpiZZkMD5xlLlHIoUa35C+Op3twgEMNobeEEwsTicbCeAZEfU69nQ
	 gPhVQLauG1wjWlUwecBQ/mCQ3coZ0bx/783BiRYLC4z20BU5IU+Bj6ONHlt7hbHK1m
	 zSHIxeo2nNRCQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 25 Apr 2023 13:57:23 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH] wifi: ath12k: Remove some dead code
Date: Tue, 25 Apr 2023 13:57:19 +0200
Message-Id: <c17edf0811156a33bae6c5cf1906d751cc87edd4.1682423828.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_045727_832529_DD398987 
X-CRM114-Status: UNSURE (   7.15  )
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

ATH12K_HE_MCS_MAX = 11, so this test and the following one are the same.
Remove the one with the hard coded 11 value.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index e78478a5b978..79386562562f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1362,11 +1362,6 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 	 * Firmware rate's control to be skipped for this?
 	 */
 
-	if (flags == WMI_RATE_PREAMBLE_HE && mcs > 11) {
-		ath12k_warn(ab, "Invalid HE mcs %d peer stats",  mcs);
-		return;
-	}
-
 	if (flags == WMI_RATE_PREAMBLE_HE && mcs > ATH12K_HE_MCS_MAX) {
 		ath12k_warn(ab, "Invalid HE mcs %d peer stats",  mcs);
 		return;
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
