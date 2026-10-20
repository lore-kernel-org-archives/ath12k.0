Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62263606A31B
	for <ath12k@archiver.kernel.org>; Tue, 20 Oct 2026 21:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dp8ufTtw;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=mD2I4jbw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QK/YljhqoxIaQvyPSrRlCKIVyw6mUGuU9xXtkL4C7Ow=; b=dp8ufTtwlQk57AvEWadWp7yug7
	QjyfiU6ohbzSKRwz56KsjxmoRwQ3cDv0oc3esKfQFJy5VurbyIdACBrnJfKRy4YewQg/nNrJdNyEG
	02AaFVY2h/QnRi4VWR/ZAASFPRMiKXDMXW7ABzEaYr43pzqb15GvaN9+SN9esnjMjoYCg0J967qZX
	MunnGC8igopJPJmxn4iVmYQuUKLDYPC5KpyL+wvTiacXA7XbnNaA34F8n97LKFob0VH00hpYfQbNF
	s6caHCexeHFM3TRNngGt6/3bKj/bHzM3QB2IcHrjSZhQuhyiA3UnATgyo6G0ulPop+yPfBbi53SPw
	fcGpemxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJHq3-0000000AjGl-1aXT;
	Tue, 20 Oct 2026 21:57:43 +0000
Received: from mail-43102.protonmail.ch ([185.70.43.102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJHq1-0000000AjGH-0rlz
	for ath12k@lists.infradead.org;
	Tue, 20 Oct 2026 21:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792533457; x=1792792657;
	bh=QK/YljhqoxIaQvyPSrRlCKIVyw6mUGuU9xXtkL4C7Ow=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mD2I4jbwM1t2n0zEzBF58s3i4Yl9x031D0cRFJ22yO0dYhu9eGMXJejJiuPB7Sxdg
	 SItKeeMleUAQ2UDulZwBqDAnEviCud6SHDEqcR3VQUVfyTXZn4xVx3qnci/7StLixs
	 tXdYLLX7wYv01FdvQwZEP4//8zv7y/h9SMn3YNWbKmc1BTFMNOmAnxJiQ0ZpYkgCXL
	 CSNDgmpWbrg8hDEq2kTNis4Uwa9h6e4VsnXh76etbphLkBk2gIxm5GNCwFOwkmgoWk
	 xJ+UfkOOowW7EyCxPHCiGKuUOjsozkxGK6wDnfhdLl1xV/qnncYgpOyqO26o/+JVsn
	 vRP9ByPhtpgRw==
Date: Tue, 20 Oct 2026 21:57:32 +0000
To: Jeff Johnson <jjohnson@kernel.org>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: don't count a vdev restart as a started vdev
Message-ID: <179253344933.341.13555520643136725760@pm.me>
In-Reply-To: <20261020213505.31624-1-birk.skyum@pm.me>
References: <20261020213505.31624-1-birk.skyum@pm.me>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 16f2dbbdf0422d27200edafa112b129d38041074
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_145741_395473_366486B7 
X-CRM114-Status: UNSURE (   6.29  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 11:35:05PM +0200, Birk Skyum wrote:
> With this change the Yoga went through the AP's next switch of that
> link, from channel 128 to channel 36 at 80 MHz, without a single
> timeout, and the switch completed in under two seconds.

A few minutes after I sent this, the AP also widened the same link from
80 to 160 MHz on channel 36. That is a bandwidth-only change like the
one that started the timeouts without the patch, and with the patch
there were still no timeouts afterwards.


