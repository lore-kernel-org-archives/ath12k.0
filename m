Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD98606A331
	for <ath12k@archiver.kernel.org>; Thu,  5 Nov 2026 05:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L2ggAmPz;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NV6fDwYz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xRL1ep3hIcctFNg5PU9cJMm1rmalbTnT9ajmmrpACBE=; b=L2ggAmPz9M4x7uqlFrqoCST9Ou
	N+GorDj63EGBbPNuQShdrFJZKWVc9XIYRgKUJaeDcKIasQSp6ILgZH9MuPVaoZeRdv5PUeiH0iwsz
	i6wwLbg+fwguNylOELJynOHqLI9YbVoQAAQ9ByPcLenb2M7wsXEPn1Cx7fBrTej5Frgwe9jXTUfxk
	t91/gDs/roK9vYKodIx39xB0oSVcH8tZVv4g4ioVktexxgiu5XqH9VYqP0sEEnbA9ORATp1ggThsK
	w3B3N+osqEeFjqYgYbEWQkorGc7DmZHvkC9b8LOqVX9XaPVeqn34iz0pwF2b+tK8Dn1mucK3icP7F
	NtcYX/xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpqt-00000007quz-2kI5;
	Thu, 05 Nov 2026 05:17:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpqp-00000007qry-1FJE;
	Thu, 05 Nov 2026 05:17:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11E0642D8C;
	Thu,  5 Nov 2026 05:17:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793855847;
	b=H8wSGYngmMGCICMbTxdiW3HHuYchmtyT2HSHQKkVtbu91f6FVFDn1rMha1ud6XPFpeD6
	 LA5mGQjwyrujF7C5t7scqI7Zg9mJ3GHJVS6OwhOpTrby2Siwffu0sivy4FEx+7GsXXQTB
	 f5D6LxMiPipU39JBBRTGR9WMlPJ3mh3ZjXFf1fEjb4nZ1QEJlrxS7QtVYCdsWNoAIAAGN
	 hZnHwRI/GhK3WzP84Sp7VE/PwwC1zux+tn1ybYUDNfTep6gAcYN0NyyZ8ujv97SsbikUa
	 upvvUID/svbZGLBSQdGhX7x3fdXntDeAFB/pRMK7YvYMLJvU3JSzUDeBFQf/9EqYQfA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793855847;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=xRL1ep3hIcctFNg5PU9cJMm1rmalbTnT9ajmmrpACBE=;
	b=hpgfM79+PKBI4Wf82vmF33ncfkh6r2By1sfPgBThWA00fKsEm+oh3OqTlZVJj9xlyvbp
	 KpO92xCf6zlG5Uo93AXiOOv80lDanFphzyazOyL8tGyZWts/kzEMLEHLkKjoT89vxdW/j
	 C8wL0iDtR44tCGohnm/3wRX6bEB5Kmu9a1Kq6rVNj3QrXVae1FFLqP1x+9FlHcUp+MgNc
	 9ysST8ZdnpKfdHW5OebZx4NV/VryMvrevTirvAvsjzePneJj4x4Fm7wbvNys6ZESQTY1j
	 JXmYyB0hZjHc86fneVQKrOiAzWqk1MgR1FsN/lXq6SCtXYAtMvwcYokh16POLTL869Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76DE21F000C1;
	Thu,  5 Nov 2026 05:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793855846;
	bh=xRL1ep3hIcctFNg5PU9cJMm1rmalbTnT9ajmmrpACBE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=NV6fDwYz4O0ThGDUNsjGzfrVlqSx/TnG4/UgxsP0yqqHEyngkrQBbS2eGe7r9Rij1
	 4ysw2QkKuT13a15B1Q1tl0pZujOweyH8XdKnv6l2MQ5R5wPdLoizC0ty+q8DQZj5QD
	 SHRljMpFhcgL7rA0FrfgUS//ubm7pgCpiTKtgScznzJnsOfIU87RI6QsPSvR/BSYho
	 sCB6UzUk404zfRGZHZ6J0HddmMFg6LhES7Kqj4zq+iHOzYmf2SwQ0jhRo3ZzrJRHe+
	 G9E0CzI8brx/tuVtjQRARWxU7IQfmWPnvZOU4FI95gpAk0VmxHqViw5kvYzVcPZF2A
	 adaTRQlcdQs2Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0377C470C6;
	Thu,  5 Nov 2026 05:17:26 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Subject: [PATCH ath-next 0/2] wifi: ath11k/ath12k: don't bit-reverse the
 firmware's PPE thresholds
Date: Wed, 04 Nov 2026 23:17:25 -0600
Message-Id: <20261104-ath-ppe-thresholds-bit-order-v1-0-0f569106cbc4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGUR7GoC/yXMQQrCMBCF4auUWTvQ1LRSryJdpMloRiQpM1EKp
 Xc31eXP430bKAmTwrXZQOjDyjnVMKcGfHTpQcihNnRtNxjTWnQl4rIQliikMb+C4swFswQStOf
 B+XH0/cX2UIlF6M7rj7/B8Uy0Fpj+i77nJ/ly6LDvX7Fh+GyKAAAA
X-Change-ID: 20261104-ath-ppe-thresholds-bit-order-436ac99c5745
To: Jeff Johnson <jjohnson@kernel.org>, John Crispin <john@phrozen.org>, 
 Kalle Valo <kvalo@kernel.org>, 
 Shashidhar Lakkavalli <slakkavalli@datto.com>, 
 P Praneesh <quic_ppranees@quicinc.com>, 
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
 Wen Gong <quic_wgong@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Carl Huang <quic_cjhuang@quicinc.com>, 
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>, 
 Balamurugan Selvarajan <quic_bselvara@quicinc.com>, 
 ath12k@lists.infradead.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793855845; l=877;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=m5qCJPR3zlN0I7usffBzkGSY2j42Ch9xFnvpnWZIrgk=;
 b=Z5yw6rhxUKTbuG0OPSbwUlFkZrVc4kVxxzD251A+6dAgW9FmfUZDyL05ogaZtDXVlN+ZWBzfG
 dD863UmHCdvAL086gJi8kz2T7tvy2dIbvyVY9oa5IZH2rfXEtyEG7sM
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k and ath12k build the PPE Thresholds field of their HE
capabilities from the firmware's WMI layout with each 3-bit threshold
bit-reversed (QPSK and 256-QAM swap places, 64-QAM becomes reserved),
while a peer's thresholds are converted the right way. Firmware that
reports 0 and 7 only, as IPQ8074 and QCN9074 do, hides it. One patch
per driver.

---
Christopher Griffin (2):
      wifi: ath11k: don't bit-reverse the firmware's PPE thresholds
      wifi: ath12k: don't bit-reverse the firmware's PPE thresholds

 drivers/net/wireless/ath/ath11k/mac.c | 3 +--
 drivers/net/wireless/ath/ath12k/mac.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)
---
base-commit: a3ddbb45768717b5c9f923489387cf55c838d1ad
change-id: 20261104-ath-ppe-thresholds-bit-order-436ac99c5745

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



