Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F976D1039B
	for <ath12k@archiver.kernel.org>; Wed, 26 Nov 2025 17:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AIOlAWyWaTjRliFd4nmSQlOjMUhMfH4Q0yg0lI8kJl4=; b=LvQJio/u32q41AJUhcJKaY8fPB
	1aRhCPNAnXjSwRrG4zt2xzlm+3cLjt5qsx4Nr7Ll4ehmalAfG8L5szx+S7Oc1n5Y5qQvoDcRZL1pA
	Xl3mJV5k8MiUc8hV0WH5TzuHH/INCNCFMKY5lV53an/rBdYSJKLsA5EUixjmWfJxWKUK5LvAaQQfs
	xUslaAzFn+DaEg77z9dAQe+c/4o3JQ9thkOvPpFPhEb3fWrDEdgUvK5fTJAc6ADX1eSmlCqqrVwDQ
	nyX+0epXZcPdQJJ51c/yxp+zQLOWRBQOz2EcDUyFy/JIwv7+wy430pU3LJ8ecl8D+zVvVis77XhDz
	0N4+4Orw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIua-0000000FMHN-0XkA;
	Wed, 26 Nov 2025 17:02:36 +0000
Received: from mail-106121.protonmail.ch ([79.135.106.121])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIuX-0000000FMH0-2ZNb
	for ath12k@lists.infradead.org;
	Wed, 26 Nov 2025 17:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=uuv37uwupzbuzfgdf23znnfovi.protonmail; t=1764176547; x=1764435747;
	bh=AIOlAWyWaTjRliFd4nmSQlOjMUhMfH4Q0yg0lI8kJl4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OuDAd5toQyWlIpy3kAtolh9j4Qfqn7KRfU6uOmqAfXWceyM5BT62NZ/F2qpz37LDR
	 Iscg0z0eD+cb8pijTZvl+7+z7CZ/4gFNY17fUeA1QpHe9gujyWaZmAG4VsXnkd0ZpP
	 RHKBGqMQ/XYvNs/Os014P47VLd8EPry0s4BN1+hxOHq9oOoGgRffP76zLKJMof5Sr4
	 AyP6QNKAzUJrsaRK2WhFbcQR6FwWJnp2dG1xtNCGL+nU/BgM6ZEb04VbsNqGiLpt0p
	 Z/HMd+VeGU5frxKx6evPtmzhxJ9Ib4WgaR8R2+7nNn01evVodGK5ulg99IDZJG2s9/
	 hOe4DRpM3Blwg==
Date: Wed, 26 Nov 2025 17:02:20 +0000
To: ath12k@lists.infradead.org
From: Alexander Minchev <adminchev@proton.me>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath12k: remove redundant pci_set_drvdata() call
Message-ID: <20251126170213.27959-1-adminchev@proton.me>
Feedback-ID: 99141252:user:proton
X-Pm-Message-ID: 31056a73fd1cbf5979bf38ab2e7430a6e6ba5cfe
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_090234_270869_54CA2F17 
X-CRM114-Status: UNSURE (   3.79  )
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

this patch removes a redundant pci_set_drvdata() call in
ath12k_pci_probe() and keeps a single call after initialization is
complete.

I noticed the same double function call in ath11k's pci.c in the same
context, but I do not have ath11k compatible hardware to test a similar
change there.

Thanks,
Alex


