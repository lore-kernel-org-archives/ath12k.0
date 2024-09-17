Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71136CAC595
	for <ath12k@archiver.kernel.org>; Tue, 17 Sep 2024 18:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+oo0Z82OsBWaJ8CxqodFzKN2Abf81DP+5dSsbuuW9i0=; b=VB95td8UQcSgA6bpgLa0OKt9oD
	Lbba0xBQci3yC9eSGgDbpz68HIAuw23eCTeQaL/6JripixO6iF95amKotlVhsUbRbB3WMZp/O4eMo
	js7uySp1CqRWM/c9HNF9jaZOW4UYz2zYunO8me+gOS8qheZbx4OEHWEw+97BowWbhUHr6sLysxoTU
	hM6MGQzCXgWydDbzzzbnk8Wzm4t9VYaTHoVUCkfNg3m2TgyQ71fIiVEwLmV19jx2YjhpGXAyTRt7G
	dX/C4Ave6D55lLvS+QzZ4/SbpqwycL4rwoIyZvGB7Z6cv1x3dGPHXKKI0tLv8Riz/+4kZdKwz3Mfn
	+SbPh6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqcoq-00000006gR9-0Ru0
	for ath12k@archiver.kernel.org;
	Tue, 17 Sep 2024 18:20:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqcon-00000006gQR-1rfn
	for ath12k@lists.infradead.org;
	Tue, 17 Sep 2024 18:20:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D83C5C5B07
	for <ath12k@lists.infradead.org>; Tue, 17 Sep 2024 18:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E997BC4CEC5
	for <ath12k@lists.infradead.org>; Tue, 17 Sep 2024 18:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726597252;
	bh=+oo0Z82OsBWaJ8CxqodFzKN2Abf81DP+5dSsbuuW9i0=;
	h=From:To:Subject:Date:From;
	b=h6bxOJYa/k2N+R7Wqo4ELA2alrJy9Wa64Oi9NC/0IxKacso23QS2JReZYfaLawE4a
	 uVP2V75+WroGHAHJ4IAbDgNdpp8VgsmDU+BbG6HRIU6etjgo8/6zWssNn8RXZPOYZa
	 8O2iGheUjB+0cVp+GkadBa+lbD5ouL/8VsGx2SRS553GlP4gZjLGaBKN6kEIIrGX3B
	 P5bztLZ50vQhbDPF5f94HfpA2nRa3Yktb6q7OrUCfqg7gav9tZq/KoALo2Tbl3mdIZ
	 Ier/OPy7PdmLpOeTJA580aUkmATJiToVctIUCWVMKxMxEgUVqOknIdgiYN4ak9shXM
	 68JB4QcgF4xlg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Subject: ath12k MLO testing
Date: Tue, 17 Sep 2024 21:20:50 +0300
Message-ID: <875xqucfb1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_112053_566190_F115B668 
X-CRM114-Status: UNSURE (   7.17  )
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

Hi,

We are currently working on getting ath12k MLO implementation ready for
public review, but for now only QCN9274 AP mode is supported. In case
someone wants to test this, the patches are in ath12k-mlo-qcn9274
branch:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=ath12k-mlo-qcn9274

And this is the firmware:

https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/tree/main/QCN9274/hw2.0/1.3.1/WLAN.WBE.1.3.1-00162-QCAHKSWPL_SILICONZ-1?ref_type=heads

Consider these as alpha level for now, there are still major bugs and
things might get accidentally broken while we are working on the
patches.

The changelogs are available in this thread:

https://lore.kernel.org/ath12k/87a5g6cqe9.fsf@kernel.org/T/#t

As always, feedback is very welcome. Then reporting something please
include the tag you used:

git describe --tags

Kalle

