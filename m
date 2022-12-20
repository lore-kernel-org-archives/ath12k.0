Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4028BC4167B
	for <ath12k@archiver.kernel.org>; Tue, 20 Dec 2022 12:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NsT9BcAOD6aqDa80Ee070OoH3u4pWlZEYbRI6pNX7WQ=; b=3G710x+aZ82VDb
	cusgke29og6geZVi57ECeGh/MJByXswqkkm9mkhhuPmIq+jrq7w1AVog75qBPEbkTDIa2Fzw+Lq3E
	pbwP9KRkUso7JLQPLr/N+pjS2H58PiF98gLmGd0Ry4XR+FqEbMGhNzvOY9qsiJJJh7Yu4R9SNumd+
	UT/xTKO5XQs2dRgYUr8X2045ffg1V3v3Zfft5L0n0sGd8LU4dPZUwf+rlb4qHtjuIigdrUDlU72hr
	0ECHEpod+/z3gehM+eUBdWMvpXyR2WB4rlWSWKyzEDJB+RP0Bhw54KV7w9OtMk8T3uRgpNkfZoj9Q
	Q+3Z6Oc3Km6Xs5BdSdnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7bOn-00EMCl-Hk
	for ath12k@archiver.kernel.org; Tue, 20 Dec 2022 12:07:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7bOl-00EM3I-Ba
	for ath12k@lists.infradead.org; Tue, 20 Dec 2022 12:07:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B8284B81042
	for <ath12k@lists.infradead.org>; Tue, 20 Dec 2022 12:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54F1C433D2;
	Tue, 20 Dec 2022 12:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671538021;
	bh=I0giWys/WuNUhEH0mVskkiDhpsbm4tMM5S+RvjQ5T/4=;
	h=From:To:Cc:Subject:Date:From;
	b=Z5mUEDgS8IU/zDJJMWjwaj3ctlMr8m0d5eePKy7FF2LmL/HrXuhqo3xmJLInxq9Pq
	 Fe0oppxmpyfAB1ECDmvWHLEb3piRm4BejkeTEbQ7KNexcSymkRZ0veUdZFIjGpNHA2
	 TJP35gpJV/4KtD0sAojzs3WpbHeaFOQ+XaIgWNi/6zPy7S/E2+6Q07P1PS93iYUsI0
	 EThGrRv9WZZLExqbNyPSJ4DohJe7FxIwbJkKTwEU+HiTQXtMlFY1Gxm6bzNGuCqORW
	 98D0N/u1rMhs0JBS8JounyGwOmc7IAdlbpHET46tojF0o1qT7HLuJAmPxLvV6mpNWg
	 puf0216w2SjoQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 0/3] wifi: ath12k: small cleanup in HAL and WMI
Date: Tue, 20 Dec 2022 14:06:52 +0200
Message-Id: <20221220120655.19389-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_040707_612550_00B2C232 
X-CRM114-Status: UNSURE (   7.21  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Small cleanup found during review.

Kalle Valo (3):
  wifi: ath12k: hal: add ab parameter to macros using it
  wifi: ath12k: hal: convert offset macros to functions
  wifi: ath12k: wmi: delete PSOC_HOST_MAX_NUM_SS

 drivers/net/wireless/ath/ath12k/hal.c | 63 +++++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/hal.h | 24 ----------
 drivers/net/wireless/ath/ath12k/wmi.c | 10 ++---
 drivers/net/wireless/ath/ath12k/wmi.h |  4 +-
 4 files changed, 60 insertions(+), 41 deletions(-)


base-commit: 58e4b9df840cad439a4c878f81bc105cac2197a7
-- 
2.30.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
