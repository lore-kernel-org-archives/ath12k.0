Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E85EC27C53
	for <ath12k@archiver.kernel.org>; Wed, 12 Jun 2024 12:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4QnWHv8dLIoq+vheL78UIzoMLHsB6bqRQNiyBcbXwY=; b=2HZNMx3eVN/e7wL6dzslvyiD7Q
	gsKdPKP4vxp2oRJldV1ftflKtOKF3nQ8EOYwYuFamwaYgtoD+ZtnZTZRqgByKejOcR2FdFyp9zg/T
	oc//+LDjLdxfA/FRjeQJRXwpw7rHOH7h4WuNWhPXIgzHwh/IF+NgeJfVNVCoaEshfyL4B94Ne0Pwy
	GEFwubKQLtBClHOP08WQ2IXx6Zd+7L1xhjd8VlvMFlY372Z3XawotJbfWq7+mqBaXoaHf/ozGuHwS
	tiEubtw+VAzuTFTFLPoEbx+W8yxbVDpk3h/xpyR9Sf6q5kpiPwGRzfb+wyiue+EyVhO+vMT2rDT64
	XKtFUmMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHMjh-0000000CX1C-0Sh3
	for ath12k@archiver.kernel.org;
	Wed, 12 Jun 2024 12:05:53 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHMje-0000000CWzA-2KG6
	for ath12k@lists.infradead.org;
	Wed, 12 Jun 2024 12:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=E4QnWHv8dLIoq+vheL78UIzoMLHsB6bqRQNiyBcbXwY=;
	t=1718193948; x=1719403548; b=HWgPuMBOj9Bf9IVV6/p6ctZdhNAA1l4cwX7bNVzaLfXy9uQ
	PoL6+w5KDZMbEVyO2AdVLTuOuF0cNoJPvfOxW00wiRbnDJ5/gb7z7FPhjkVAHM/KttkSiFnoVxSEG
	1cOkuMGXZFKUtIr5zQhxwVVFI1j934y7Q3vjAJbe4qDOYDqN3EIDtFsCnl2yVVSgkuAHAWFfu+dUm
	eYk3OrZr5lkJoUTvrkU0GYyr2hELwlYnd296fKMjspz6tLagV9CiRIAX7LM8BD9zARDs33u/fDjmh
	9DJRKF2K2GaPTPwxJOm63XwYFYogoBpu8Y86/JLhxBAjkad/r00qnc1wbXGvRHiA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sHMjY-0000000AEjC-0yRF;
	Wed, 12 Jun 2024 14:05:44 +0200
Message-ID: <fa7c2aeef854f89eeb03a01a21a8d511417c92b6.camel@sipsolutions.net>
Subject: Re: [RFC v3 6/8] wifi: mac80211: extend ifcomb check functions for
 multi-radio
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, Karthikeyan Periyasamy
	 <quic_periyasa@quicinc.com>, linux-wireless@vger.kernel.org
Cc: quic_adisi@quicinc.com, ath12k@lists.infradead.org
Date: Wed, 12 Jun 2024 14:05:43 +0200
In-Reply-To: <096940e3-713a-4533-ab0f-e82bd647e205@nbd.name>
References: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
	 <bc603fc671010bb720e75881ef0e22d81ec6e2eb.1717696995.git-series.nbd@nbd.name>
	 <a337de2e-fe3e-18ed-b55b-9ea2cd21baed@quicinc.com>
	 <1f32cb6c-6be8-4e3d-8e8f-2d3c728875a9@nbd.name>
	 <479752f5-221d-746b-7513-ba27ef547ac1@quicinc.com>
	 <096940e3-713a-4533-ab0f-e82bd647e205@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_050550_692492_58DDECB7 
X-CRM114-Status: GOOD (  12.07  )
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

On Fri, 2024-06-07 at 13:04 +0200, Felix Fietkau wrote:
> > >=20
> > > Use the sum of the number of interfaces from each radio instead of th=
e=20
> > > maximum.
> >=20
> > Oh, then legacy user have misconception of the global interfaces
> > advertised and try to fail for the allowed limits.
>=20
> Sure, but that might be an issue either way until user space is updated=
=20
> and users start looking at the per-radio ifcomb data.

I'm kind of with Karthikeyan here - this could be understood as a
regression, since you're now telling userspace something you can't
actually do.

> The global data is simply not enough to describe the details of the=20
> radio split.

Obviously, but that doesn't mean the global data as advertised in the
existing attributes must be *wrong*. It could be a subset, and the
superset data is only available to new implementations.

johannes

