Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB5B606A323
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 18:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=age9YKgR;
	dkim=pass (2048-bit key, unprotected) header.d=adriel.eu header.i=@adriel.eu header.a=rsa-sha256 header.s=dkim header.b=BqYndvZZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wP2uKJAR/PdPYRR58NON2g95Mn0ql5N7em5CuGJSfP0=; b=age9YKgRTSpwkLYewSxBGMDejz
	9dhCfzFRvy9Q2mtWaRZV3KjX/VePsQuPzy6nsDhIKBSh/1WTGDLqbjkGnaHEnqr1a9rOHk0Tf4GQK
	/knIFWVRSRGTiMfWjkLATbMlXzL1lnTZ/9zwngp8L4d1PMOZ4lieyqt4DVqXLFgoS7rQM/HaxLkKI
	Phgb0P4P60YqTaSv99pLLH4uk7V8gmgtF56HfTbCC1VxfgQ7Id6CuqudiGI7AIIKh0ExSjl9iA56D
	6VcNqzmibrIu/njlZp2u4rbQp1ypw60c3ZtxSicN14VlIOtvOWFoS4nBDGzA7LyucecXpSxni0PdP
	jv/slYjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr21-0000000CMSs-0Jke;
	Fri, 30 Oct 2026 18:08:49 +0000
Received: from mail.adriel.eu ([51.75.77.166])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr1t-0000000CMPE-3RqD;
	Fri, 30 Oct 2026 18:08:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7243426194F;
	Fri, 30 Oct 2026 14:08:29 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adriel.eu; s=dkim;
	t=1793383711; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=wP2uKJAR/PdPYRR58NON2g95Mn0ql5N7em5CuGJSfP0=;
	b=BqYndvZZynu4yoErIJySJAEvgQUdgHQuRJs7LYSoGsbLpmaZv0vuObuBcueAQYgf68fE82
	ZyblxR5539Oa+x2sh9E8GSaF7EOTdJmReDRK61ZO58+IiZvEBFWC4aEn4DEsvpv2+q/UKb
	U6VhmSoP5W2n0SJTxHcxvhkxBO7fOtoCsqTqMlYzOtZirfX52q/86YXkqkeE8EojdVOway
	FWqS02HP/ZBeVD93IIHpiDFk0f2Lqq9B1eqR+1IxLVn+Ttm5WB4wQ5g1ofiYqeA22ehqgW
	RTKkGTPT29O7YwMel7290bXMnVWn8HbackRafvfH6ATAuYtVmBFroHzZlscc+w==
From: Adriel Santos <adriel@adriel.eu>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 0/2] wifi: ath11k/ath12k: fix a double free when the first fragment's descriptor copy fails
Date: Fri, 30 Oct 2026 15:07:03 -0300
Message-ID: <20261030180705.1702009-1-adriel@adriel.eu>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_110842_336368_EABEC806 
X-CRM114-Status: UNSURE (   7.12  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In both drivers, the RX defragmentation path queues fragment 0 before it
copies the fragment's REO destination descriptor. If that GFP_ATOMIC copy
fails, the caller frees the skb while it is still queued, which leads to a
double free or a use after free plus a NULL dereference on reinjection.
Both patches move the copy before the queueing.

Patch 1 was tested on IPQ5018 on an OpenWrt backports tree, with forced
allocation failures (details in its notes); patch 2 is compile tested
only.

Both bugs were found during an LLM-assisted review of the RX fragment
handling, and an LLM coding assistant also helped write the patches and
run the bench tests described in patch 1's notes. I reviewed the
analysis, the code and the test results, and I am responsible for both
patches.

Adriel Santos (2):
  wifi: ath11k: copy the first fragment's descriptor before queuing it
  wifi: ath12k: copy the first fragment's descriptor before queuing it

 drivers/net/wireless/ath/ath11k/dp_rx.c       | 22 ++++++++++---------
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 22 ++++++++++---------
 2 files changed, 24 insertions(+), 20 deletions(-)

-- 
2.47.3


