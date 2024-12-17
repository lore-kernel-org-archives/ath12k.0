Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50ED2E77184
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QJYSjuT+cUwWzuuR4DjeqJ+I1E+Dad80bRgXUPbWeck=; b=07B/2+KfexW+428UBnWq9nIWn1
	n9Gjeg6vWEsn3NYS5eNog40Op4oBVhv/TbWL/zDH3mNtjERFbo+oqs50IsVoGivxTwsQxuyNprLSo
	adsNEiKvurnI93/sqH+cQ79rzoDxoYBp3xo4Lsl88FoW3y6EgTNrUaugM4dt41Z9itg6m0fIRBtTs
	iEBdtBh+Ovg6I5Gn2oXF0s7Y8buy2/ZRehoN31CaXN/S0hCElCYwZwj8UPOaIC3W/dsXS/PpLbNfN
	ZCH0Mp2QZYX/K5lY6IVTtTOG7tqaKDqfg/g4+uqWRj5XxQsecd5ObM74U+JXIi0JHg8ANvai6IICt
	3vZ5uS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe9A-0000000EkFK-0QMA
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 20:26:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe97-0000000EkDe-1MT6
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 20:26:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 955DF5C5937
	for <ath12k@lists.infradead.org>; Tue, 17 Dec 2024 20:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDD1C4CED3;
	Tue, 17 Dec 2024 20:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734467180;
	bh=kEAdCKgicdHpId1rmo7Q9EFxHtgkjHwleVYsu9P1css=;
	h=From:To:Cc:Subject:Date:From;
	b=Pg9Ap9KWmA76pkg9g0UuOCwgwu/DOvgF0uEovLKF2KldPaxS7F+jV+qtjnrWfKkHj
	 kbUmaXjsbytYxEx9khpEitoXzxuA6G+i7K1mTk1v4Xuw2iWccMBdB4dzBMwQ/cIJ0g
	 biQyeo29dDldwgM8Y19/DSLvg/jsLiw1JYDqU1e7Tj3b6DRV1FbR/8ykqiNR+jk6YS
	 sz9/NHvPqiri0/KtxIXwQhQDosHHR5qoFSbZoCBS1xkW0LicO6Xb9iwd2dYB4D5DpE
	 DjzkSyJUC1cLQoIGU4OeR28LlTr/c/ZAx8VfzDz9quUV24bP6PsmGJOuBKRi2TgLSL
	 Tk0hwCbQbKT+Q==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 0/4] wifi: ath12k: few fixes for clang warnings
Date: Tue, 17 Dec 2024 22:26:14 +0200
Message-Id: <20241217202618.1329312-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_122621_400346_E9EF9044 
X-CRM114-Status: UNSURE (   4.16  )
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

While build testing Jeff found some clang warnings, here are his fixes. Please
review.

Jeff Johnson (4):
  wifi: ath12k: Decrease ath12k_mac_op_remain_on_channel() stack usage
  wifi: ath12k: Decrease ath12k_bss_assoc() stack usage
  wifi: ath12k: Decrease ath12k_sta_rc_update_wk() stack usage
  wifi: ath12k: Decrease ath12k_mac_station_assoc() stack usage

 drivers/net/wireless/ath/ath12k/mac.c | 114 +++++++++++++-------------
 1 file changed, 58 insertions(+), 56 deletions(-)


base-commit: 9a448415ed0c46edeb9170091a03b620986ca0b2
-- 
2.39.5


