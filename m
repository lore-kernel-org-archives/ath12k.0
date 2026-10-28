Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83813606A321
	for <ath12k@archiver.kernel.org>; Wed, 28 Oct 2026 05:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TbBHnV3O;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=g4pzlv7+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8dYAfOXJbpf0cjqVZmnxuZ04yPrZrQrcWgodKK7vItE=; b=TbBHnV3Ow/K1WAM55cHaroerY7
	Q1QXGGVZOe9wrwTuJZeeZLH0ANAWAM8HB30ZoScwz/lf7MdgGkdYdswz9ZAgfmSfCWzuwOOB7N3XL
	FwPz31DqFhxiD+eAguFFT/Ry6ts6VdkndJ7r5RFFiGwxSi1ilYq2xDOqZwCuJWryJrDoKwUlmmkoA
	f3kE+vgCYPNy+9bbTe0ZRo/+Wc282ahwZFpa1kNwwpXrZPygMk+DiddWc92s+TTKtKd23kyE74VPC
	dYGV0gfWOxAHDBJ57TZRY88/RntPegXJuaUA2Gz6kAFiKL+VCXdegYuch3YQeCejzjUifPZoqlWRC
	t0Pb3ImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvyN-00000006MBE-0lAW;
	Wed, 28 Oct 2026 05:13:15 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvyI-00000006M4h-11Sf;
	Wed, 28 Oct 2026 05:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8d
	YAfOXJbpf0cjqVZmnxuZ04yPrZrQrcWgodKK7vItE=; b=g4pzlv7+CJCwYsjf3t
	02F9US2tnUeAAPP44T1N7qqx8MJTwBCh95t0+EorZU6WdcZGPOekibMnWXV/ixGG
	CFU5U69zmGqIj/Dh4cGlo/75iFEckJQ94c3LvkhWCmCZnptyFxaGAuUZ0Vew0PEI
	s4HBQsHglcF2q1VgbFt3gdzzc=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3_3lYhOFqTkVqDQ--.14113S2;
	Wed, 28 Oct 2026 13:12:57 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Miles Hu <milehu@codeaurora.org>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Bhagavathi Perumal S <bperumal@codeaurora.org>,
	Wen Gong <quic_wgong@quicinc.com>,
	Aloka Dixit <quic_alokad@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH 0/5] wifi: ath11k/ath12k: validate capability TLV lengths
Date: Wed, 28 Oct 2026 13:12:49 +0800
Message-Id: <20261028051254.147628-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_3lYhOFqTkVqDQ--.14113S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrury7uw15XF1fXFyfCw43trb_yoWfAwc_Zr
	WrKr9Fvw47W3WUtFWUKr17ArySyrWkWF1kGFWUtFyUtFs7ArWYvr93CF98uF10yFykAr9a
	9rs8Wry8ZwnF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8BMKJUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhlKhGrhhFkXBAAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_221310_672512_536EC66E 
X-CRM114-Status: UNSURE (   5.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Several ath11k and ath12k WMI parsers count firmware TLVs and later
consume them as arrays of complete capability structures.  The generic
iterator validates that a TLV fits in its enclosing message, but these
tags have no minimum-length policies, so a short element can still cause
an out-of-bounds structure read.

Add policies for the DMA buffer release, hardware mode, DMA ring, and
extended MAC/PHY capability TLVs used by these paths.

Jiale Yao (5):
  wifi: ath11k: validate DMA buffer release TLV lengths
  wifi: ath11k: validate hardware mode capability TLVs
  wifi: ath11k: validate DMA ring capability TLVs
  wifi: ath12k: validate DMA buffer release fixed TLV length
  wifi: ath12k: validate service-ready capability TLV lengths

 drivers/net/wireless/ath/ath11k/wmi.c | 8 ++++++++
 drivers/net/wireless/ath/ath12k/wmi.c | 8 ++++++++
 2 files changed, 16 insertions(+)

-- 
2.34.1


