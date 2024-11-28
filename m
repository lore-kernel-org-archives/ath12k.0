Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AB6D70DE6
	for <ath12k@archiver.kernel.org>; Thu, 28 Nov 2024 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wIzZ9X5GibtCNJbeu0JE3WYZaRZlvUVcc+JderATG5s=; b=p8btR6Q0jgXHdnZ1YJA0TMu8oM
	a9khmaGTOC6J2xGiUFUhBhBdIwq4IZuQDTs39IvuwPvfX63nY2sVuuVHPol9j6UedLoN4HvLRwY50
	jZWoUI6uxr6wVDUaUMgqwdH9TFHkMSg+Xkv04v/PoYJlw88FfdCRD71BSmkPZi5OhwbYH31Etuhzb
	YpOLD76nSUwXfg4ll/cPxFqgULkV1cYj0XoSiPo3RwZlItquM54D/z3i3chFPi0bTcRHvXvgUXI+f
	T/5B0NkQLNrlnZCpT9HrJosBCzjB1LBxjNZ5jQLILdPV1SEZACUET4o+3Of7t/zjC8Mv0Y4JxX+Bl
	vzmMLOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGhjH-0000000G25P-06TV
	for ath12k@archiver.kernel.org;
	Thu, 28 Nov 2024 16:50:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGhin-0000000G20D-45si
	for ath12k@lists.infradead.org;
	Thu, 28 Nov 2024 16:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2208E5C4C52
	for <ath12k@lists.infradead.org>; Thu, 28 Nov 2024 16:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873D3C4CECE;
	Thu, 28 Nov 2024 16:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732812629;
	bh=ZgdaxH/SCC3shzUMy+EXteEN5fIGyCTeGJaMoznnk7E=;
	h=From:To:Cc:Subject:Date:From;
	b=qd6ju1Bp2lPhHnV/YP4zGrj7q7R+Djt4tJVXZi1wZt8TeVKQStuO13aTDccHC2Om4
	 gnCR1fGj5+Mh+mGuO4KHCP2YaEUECEDP97CF8ecdcT5W1ykxkMt2+pb2lU32O4fP+9
	 YOWufMLguZZ0wPHprKURv4l83klse+GiHEi/BgFz3vVreHZpTTdVZwAqLWBCqvrsQv
	 MtYzrlpQqtPh4jsdyWaeSDfBqXT660v6up4hfVtwjA2FkXba7gLthP8i2o7oL5tude
	 R91l3ugRzPmiKOzft6Nqt+2G0Ik0jj393DnQR/yObcsLYDFWW5g8IvINm+ltemXkSg
	 WCiQ9sRPk2xVA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 0/4] wifi: ath12k: MLO support part 5
Date: Thu, 28 Nov 2024 18:50:22 +0200
Message-Id: <20241128165026.2618331-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_085030_053748_78F3464C 
X-CRM114-Status: UNSURE (   3.84  )
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

Now we start refactoring core.c and adding some helpers. Please review.

Depends on:

wifi: ath12k: MLO support part 4
https://patchwork.kernel.org/project/linux-wireless/cover/20241126171139.2350704-1-kvalo@kernel.org/

Karthikeyan Periyasamy (4):
  wifi: ath12k: Refactor core startup
  wifi: ath12k: add ath12k_ab_to_ah() and ath12k_ab_set_ah()
  wifi: ath12k: add ath12k_get_num_hw()
  wifi: ath12k: introduce QMI firmware ready flag

 drivers/net/wireless/ath/ath12k/core.c | 81 +++++++++++++-------------
 drivers/net/wireless/ath/ath12k/core.h | 17 ++++++
 drivers/net/wireless/ath/ath12k/dp.c   |  7 +++
 drivers/net/wireless/ath/ath12k/mac.c  | 31 +++++-----
 drivers/net/wireless/ath/ath12k/pci.c  |  9 +++
 drivers/net/wireless/ath/ath12k/qmi.c  | 16 ++++-
 6 files changed, 102 insertions(+), 59 deletions(-)


base-commit: bc0785c7c353c6a0e34f5fc6138eb8a6fb15bc0b
-- 
2.39.5


