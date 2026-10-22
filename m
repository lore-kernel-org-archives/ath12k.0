Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1930606A322
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PtP4aofC;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kfQjMjbR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=InOhwMgahGJyb6tOkMeBMHX6+1D9KY8fWjWr1Ll22Rw=; b=PtP4aofCyPLQaNUq/OXy3ixMP2
	9K0q3ZZGXhelb57LimbOW5C1XUI8F0VkwOuBzcG7JSHBYo6zRPN4dGKgn0idqdyy4tMMflDP+XtIV
	1SiWaBC9E9nIMvXoebDa5yGCqQhy3QDrt8HMShfP0DDVvnKJQVAkh8wlzuugVPpyY9b+ku5cypYeh
	kVcH7ym352z1Qy8mhGSUT6hMIRcmjjAIKa8aZXUJsJlA1oSek9vElkOx3fkLW6c3og9hP9Fu2Tucw
	JhmetrO2F0ZcG5CAnG3zN4VlWQtkDZWM4DH751mOaO54u8/8+LpgsdM8v2sYCbL9mVQBgDfKPA3w7
	HBNCyufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmVe-0000000DUTI-2nDj;
	Thu, 22 Oct 2026 06:42:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmVd-0000000DUSd-3joM;
	Thu, 22 Oct 2026 06:42:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 15BF2601F1;
	Thu, 22 Oct 2026 06:42:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792651360;
	b=wG4eV1eJY9bxsFDzF5oOiU+7yGLpZHjZD4F6X2E2wz+k2hC9li8iamZtLzTk8nqetVuL
	 UxKZsFYvhk81LeecQHboeHI0hxd1rj2fhGiGRG3TgfDlQXr61pZKiuUdzGParH1V78zEm
	 2jiFT6SaQ233g/rgdU3NxS0vEoUDB4ffGNzXrzo3uL+xrtiBsu1+qxo9S/Bh1cjibhYwH
	 nB2717UZ8RkK8xAW6fb953pZAqpWKgIa7Tjy1L5C9ifoGu3Kd/gFi91SyEF/oixnpaWP5
	 8Y2zt56HVFfywYaa/8r8RIozbOhEmHZV9Sfd1VblzKeVJE7zwenMPENnoguKG5jrv4A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792651360;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=InOhwMgahGJyb6tOkMeBMHX6+1D9KY8fWjWr1Ll22Rw=;
	b=j4YBUvK3fO2yvzzZi0YNlvezFLKlADr5cQt7//YynEGavqFMSBFNIcTRSjL1UVvn0mSQ
	 SqP3mH10Kl9RB3P6KMqRAfvhgUxwefVDJqk7/LhzstW3hp5vePJ+3vwh19dHALr0MTFe3
	 Ga1ej6/jfBqSwZPqoYg829YiOcArs5siL3gzxFJ55vLam2uOcaVprNIFLuPErZDHjE/P3
	 Khkt74uMQw1y5MYm7L1VvhjweW4XMzn+kjaaTdrrMKq3mJijWj1GubWDK9aNVxSKuXWFA
	 BEfTbS5jPHKupjFW+QxafEWVbzBaBlsZBazTCDj75amZqAFXJrVPk5Fh36BIYoyShIQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 354DA1F000C1;
	Thu, 22 Oct 2026 06:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792651360;
	bh=InOhwMgahGJyb6tOkMeBMHX6+1D9KY8fWjWr1Ll22Rw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=kfQjMjbRE+fWIWapQF5rODqSkaos6NNzbGi9VaXr5sq6eZYp7EGb3ZZdnNFwt/Tf/
	 5NV2TlkR+AbwH+HmVIjFDf3wZUEgBj+7gHDGu2udu2FM3X4euULZH5p9HU5iXb5/xG
	 mCDzHymNDkJxghUyhlttWsJ2T36VedGSPni4j7nKw9F6mt9ers/p4Kn8k07H7TTOgQ
	 R0vqJgICC25zli96bOfDY/s9lFb1qMCmB248YkZYzUC54b8ATPOIS3W976Av2fdDQu
	 3F6JsA59Vvx91ZkldnakMFx6K1Kojs1yg0ZG4erwht24oH6hFffhGQgpKbcQoOTuXL
	 3QaU7iFrjCgmw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B99C14349D;
	Thu, 22 Oct 2026 06:42:39 +0000 (UTC)
From: John Macias via B4 Relay <devnull+dencity7.gmail.com@kernel.org>
Subject: [PATCH ath-next v2 0/2] wifi: ath11k/ath12k: bound READY MAC
 address array reads
Date: Wed, 21 Oct 2026 23:42:36 -0700
Message-Id: <20261021-rdy-mac-array-bounds-v2-0-cf7f45f868dd@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFyw2WoC/32OwQ6CMBBEf8Xs2TVtTWniyf8wHEq7Qo20ZlsIh
 PDvAt49TmbezCyQiQNluJ0WYBpDDiluQp1P4DobW8LgNw1KqEoKqZH9jL11aJntjE0aos/oyQh
 njBZKGtjQD9MzTEftA2zpMNJUoP45eWhe5Mreume7kEvi+XgwyoP4PzZKFKg9KVM1Rit7vbe9D
 e+LSz3U67p+AcxXqDnUAAAA
X-Change-ID: 20261015-rdy-mac-array-bounds-de70c7750217
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, ath12k@lists.infradead.org, 
 John Macias <dencity7@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792651359; l=1870;
 i=dencity7@gmail.com; s=20261015; h=from:subject:message-id;
 bh=x634za5mpA5H7Frs7sJ8rHx/6pRCwtwzuVGuauUUndo=;
 b=yaLCM504EmJZP6hNt0Myf5YCfZ1kgaq5TM0OZFN40E16PNsE/PADW/nPDvEmFiNMFcHI0nUoy
 Zddlo9Wx0AuBQV544WoGKR0KpxRpo+LvEDRx9GlO+z2AjEbrcDfMVNj
X-Developer-Key: i=dencity7@gmail.com; a=ed25519;
 pk=z7cMHA0B6NULvJzsST/bbOOegMB6xCo9+/ytQure7B8=
X-Endpoint-Received: by B4 Relay for dencity7@gmail.com/20261015 with
 auth_id=1198
X-Original-From: John Macias <dencity7@gmail.com>
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Reply-To: dencity7@gmail.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k_wmi_tlv_rdy_parse() and ath12k_wmi_rdy_parse() copy one MAC
address per radio from the READY event's fixed-struct array after
checking only the count advertised in the fixed record, not the array
TLV length. A firmware READY event with a short array makes the copy
read past the end of the TLV value.

These patches check the array length first and fall back to the
driver's default per-radio addresses when it is too short.

Found while bringing up an IPQ8074 v1 device with older firmware; the
issue is not specific to that hardware. Verified with a userspace harness
around the unmodified parsers under AddressSanitizer. Compile tested
on ath-next (W=1). The ath11k change has also run on an IPQ8074 hw1.0
board on every boot since 16 Oct; its firmware sends a well-formed
array, so that covers the normal path only. The ath12k change is
compile tested only. Neither has been tested on hardware with a
malformed event.

Jeff, following your pointers on my earlier ath12k RX-ring RFC, these
carry a full-name sign-off, an Assisted-by tag, and state the testing
explicitly. This work was developed with AI assistance.

---
Changes in v2:
- Drop RFC.
- ath11k: note the hardware run and add a Tested-on tag; no code change.
- v1 was accidentally sent twice; apologies for the duplicate.
- Link to v1: https://patch.msgid.link/20261015-rdy-mac-array-bounds-v1-0-5de276b752a3@gmail.com

---
John Macias (2):
      wifi: ath11k: bound READY MAC address array reads
      wifi: ath12k: bound READY MAC address array reads

 drivers/net/wireless/ath/ath11k/wmi.c | 6 ++++++
 drivers/net/wireless/ath/ath12k/wmi.c | 6 ++++++
 2 files changed, 12 insertions(+)
---
base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
change-id: 20261015-rdy-mac-array-bounds-de70c7750217

Best regards,
--  
John Macias <dencity7@gmail.com>



