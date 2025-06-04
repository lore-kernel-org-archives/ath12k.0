Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A66C61CE7
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 14:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GYaTHM+fsRm0h29/YOZVDLnHV4cCv8NsEKq3BhyqKzk=; b=bfPRwuLLBAMRWlWdDTKIPQYPL+
	qSC4zE+zTh/qDoX5SOd9J/mvk+/fOG0qaCO8RQLMGiryiiSRKHhuiGesyRyv59k3jI3EgRyuRMc58
	UrQnT1FdCVKESo0wdXHTJg1gSCwiCPJ2uuBAY3auJT+8Cq7KXSJ8LWaQixmb3/GJDUH7y2obNhXv2
	ZnUUGeAh9Yr2fwGNqwn4NTNvZKnxPTDgaKVV563QIx+79nIvuWneR29+NZslVlpHQB9nf+QCaqGNa
	+j+Z/Gx1Oiy6Fes9jc6Jya+xcCz0U8/dimnYW3LdCJ3aqLW1L45fESbL/8ChVwpfZFroswTLJTQd1
	thKSBqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpNJ-0000000Dc2C-2VIv;
	Wed, 04 Jun 2025 14:45:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpNG-0000000DbzE-0YCW
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 14:45:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 551B3A50423;
	Wed,  4 Jun 2025 14:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2613C4CEE4;
	Wed,  4 Jun 2025 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749048349;
	bh=jCU35/+TKbgORi0NUC6EDs8hyiwRSH9wrJqZBXO2lXQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ME07JsVZauyPsfZRf0dc2C5+jipj5QEb0AEbo4ebssUeyozBPuIZ26dsuDXfrpSbv
	 upkSTYbg/vZgtCNKKIaD/LXk2uavHjrlr1I71jtS25PqwwLFl+UQCbmdD0WTz0xaRf
	 kpcL+LjZ/3gviyZlZ+ObZCzuw8dyf93j0MAoQBC2OmcxPb+ggO5ZIEybIsjW0icQLJ
	 0qLexdjRIQtMctYefE3eg9HPQQnm0S5Eglo9pTWGXGcnkP0l2j/TytMjoEqh5cAyTC
	 6sxxoVf7owE6AP5ZUTciG6QnopTooUIK54ElNbwsP8kcmqTqOCK9u9ZJz+jDhIr5HE
	 szAhc+7ff5OGw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uMpNC-000000007OW-1iOK;
	Wed, 04 Jun 2025 16:45:47 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Remi Pommarel <repk@triplefau.lt>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 0/4] wifi: ath12k: fix dest ring-buffer corruption
Date: Wed,  4 Jun 2025 16:45:05 +0200
Message-ID: <20250604144509.28374-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_074550_237886_F64FAE64 
X-CRM114-Status: UNSURE (   9.15  )
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

As a follow up to commit:

	b67d2cf14ea ("wifi: ath12k: fix ring-buffer corruption")

add the remaining missing memory barriers to make sure that destination
ring descriptors are read after the head pointers to avoid using stale
data on weakly ordered architectures like aarch64.

Also switch back to plain accesses for the descriptor fields which is
sufficient after the memory barrier.

New in v2 are two patches that add the missing barriers also for source
rings and when updating the tail pointer for destination rings.

To avoid leaking ring details from the "hal" (lmac or non-lmac), the
barriers are added to the ath12k_hal_srng_access_end() helper. For
symmetry I therefore moved also the dest ring barriers into
ath12k_hal_srng_access_begin() and made the barrier conditional.

[ Due to this change I did not add Miaoqing's reviewed-by tag. ]

Johan


Changes in v2:
 - add tested-on tags to plain access patch
 - move destination barriers into begin helper
 - fix source ring corruption (new patch)
 - fix dest ring corruption when ring is full (new patch)


Johan Hovold (4):
  wifi: ath12k: fix dest ring-buffer corruption
  wifi: ath12k: use plain access for descriptor length
  wifi: ath12k: fix source ring-buffer corruption
  wifi: ath12k: fix dest ring-buffer corruption when ring is full

 drivers/net/wireless/ath/ath12k/ce.c  |  3 --
 drivers/net/wireless/ath/ath12k/hal.c | 40 ++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 10 deletions(-)

-- 
2.49.0


