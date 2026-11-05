Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFE9606A31B
	for <ath12k@archiver.kernel.org>; Thu,  5 Nov 2026 07:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UZkQeG8Q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=VPL5FfJl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BoRT1g7dlz6B1RXUbGcPf8lhXFO+4D4A2NHex2eXQRg=; b=UZkQeG8QcfqgcHoPPI6f8pFOu1
	IqFyU6UlGVY50B6Eo/Y+9A8HxtKJkOuaG9rqJJFVBp8q10oBpQatD+wFfItjzqQDuurVuPCtG+aYS
	7xgf3AjDWfN3tBbAmqS903WTTAqpfLG+zrxLZsatZSpjUgSFhJxxgPlRcmIgpGrz3R9DGrXi5Mpz/
	hPAXQUtVE9XB0m726mtWJM72KEZNg3peVrd2i5lDaUSb+KjFPPoxIXFGBcwJ0b4XD3ZBUJFR2JuNj
	W1DleZSmbQxHuOrugZn7PaS/5R2OYyj3KbtAAkTA90DbbP2YdyQrnbMRKR8KfMGXr6uo5v49GDr0c
	KevjbQPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrug-000000081Xq-2Bxv;
	Thu, 05 Nov 2026 07:29:34 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOruc-000000081Wy-3U5L;
	Thu, 05 Nov 2026 07:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=BoRT1g7dlz6B1RXUbGcPf8lhXFO+4D4A2NHex2eXQRg=;
	t=1793863770; x=1795073370; b=VPL5FfJlQKCC7LIPLwjQiQ915mPDUV+uoVmF42tnTvu+AJD
	4D85S+hmWz7DbJ68rz8FIl5B8GC6Di+AWKzg1EpTfOVRRAsNUO+K7NO/dkBZKB426WNlEATyw37PW
	HMz9LoEYgZW6zBNCs0cd1wqYoSF2WaSoFvqMdUqD3MLe4PbDQX2be5aNgBn8k+kwtIZZSXQaiouyc
	0llnAIjnqw2V7KE14PPdeqT73IadJQbFi7gIWIOaDi1LzuCATfMNiCaKSGqXn3lFzpI77c0p47M+u
	zemSdRA/vxZieSW4efcQn7NoNK6dJG/yk3N9uAuZBumWwkkPWjzPNciHqD5cnu+g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xOruT-00000007Q4g-2RYq;
	Thu, 05 Nov 2026 08:29:21 +0100
Message-ID: <6792cdaa627ba4755fd0836a74474977496f9670.camel@sipsolutions.net>
Subject: Re: pull-request: ath-current-20261102
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Date: Thu, 05 Nov 2026 08:29:20 +0100
In-Reply-To: <61e49149-5096-4440-b261-ffe2d250f6f4@oss.qualcomm.com>
References: <8e38f8dc-88f9-4974-8f98-687795fb360a@oss.qualcomm.com>
	 <61e49149-5096-4440-b261-ffe2d250f6f4@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_232931_197493_BFA009EF 
X-CRM114-Status: UNSURE (   7.05  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jeff,

On Wed, 2026-11-04 at 17:11 -0800, Jeff Johnson wrote:
>=20
> I missed the window for your wireless-2026-11-02 release.

Very narrowly too ...

> Since you have now
> fast-forwarded I hope you can pick this up so that I can also fast-forwar=
d. I
> have a series that depends upon a revert that went straight into Linus' t=
ree.

I did, but I was also going to wait until net lands in Linus's tree,
which should be soon (today/tomorrow) and fast forward again, so we're
really aligned. Hope that's OK.

johannes

