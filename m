Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64294606A322
	for <ath12k@archiver.kernel.org>; Sat, 31 Oct 2026 22:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rYsdjxAN;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UYI7hXmR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wmEdL1wxlI2opNeRSfFeBJ7usDo/UgVPde2rMRHJ6uU=; b=rYsdjxANHM3x+QiFcZJ7lcB6zZ
	5qjiEnY+QApD8Xxp+mNaAkPHvJUf/TsDMcIG7NnOxLiUJw4he2GYBHTu9mUTo25jAQwXHtyTALAAX
	jPNyN0CsaogAY8zrPlWEvHW8ZWte2+8KRgeME+KCMxKoXI46UeZ6wBUYjWlHOlwdguffarI6uzQ45
	HJF9aQoecjXWcSO+GfESFQ5mh6BqhGaSJ/dJEPULqLkiDKP8SI+35iQB3EI4P44o2ZtlrXeHxdSOr
	wKHea2QwJhdH5Pt+gTN7FrSuQAsO27xjuRQ/2UuhW3/puHujkmWU8K/C8Mj8tS+pdJK/QxfT/G3XF
	nhC0OYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNHkH-0000000DjC5-1Fs0;
	Sat, 31 Oct 2026 22:40:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNHkF-0000000DjBs-2FYa;
	Sat, 31 Oct 2026 22:40:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B07FB40F84;
	Sat, 31 Oct 2026 22:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D881F000C1;
	Sat, 31 Oct 2026 22:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793486414;
	bh=wmEdL1wxlI2opNeRSfFeBJ7usDo/UgVPde2rMRHJ6uU=;
	h=From:To:Cc:Subject:Date;
	b=UYI7hXmR1PKJMN52n/mY0BwYhBhkkrZLfhH68LmkhsKFVw8uYW5BC0+YtS7fHe/HE
	 W/UcUFdtw9GQ4yDc4kF10uJVbUmEl/2J0JXU+UD6HPikM7xDnrNfWnzUsPO1n4xMel
	 B6/6mKakuCh//MwEpEmmESZ7dIP5POWEQ0feWj/lsisH71TuHe+e5B7htgnQIbnbxe
	 QXITN+EdS8h+dkxc+wfnEgxdRmRQJX+NKDZw+z6QS1MRsn6ryYiS5T0qnlvyVBwCdI
	 91eR5+eZa3D03z2jNDyF2qKBs8xVwukedawDfs7Syg7uoRLAM3xl7MYO0Xi7KdMGMH
	 7lOqUwlpgTgog==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Subject: [PATCH v2 0/2] wifi: ath11k/ath12k: Fix MHI leak on power up failure
Date: Sun,  1 Nov 2026 00:40:07 +0200
Message-ID: <20261031224009.2323055-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

If MHI power up fails, for instance due to a missing firmware file, the
MHI device context and the RDDM image table allocated by
mhi_prepare_for_power_up() are leaked on probe error path in both ath11k
and ath12k drivers.

The fixes keep MHI prepared on the power up error path, so a firmware
crash dump collection in the reset work can still read the RDDM image,
and release it on driver unregistration or before MHI is prepared again.

Changes from v1 to v2:
* fixed double unprepare by introducing new "MHI prepared" flag (Baochen),
* added a similar ath12 memory leak fix.

Link to v1:
* https://lore.kernel.org/linux-wireless/20261028104336.1686334-1-vz@kernel.org/

Vladimir Zapolskiy (2):
  wifi: ath11k: Unprepare MHI on power up failure
  wifi: ath12k: Unprepare MHI on power up failure

 drivers/net/wireless/ath/ath11k/mhi.c |  9 ++++++++-
 drivers/net/wireless/ath/ath11k/pci.h |  1 +
 drivers/net/wireless/ath/ath12k/mhi.c | 14 ++++++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.51.0


