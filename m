Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7040C36010
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 22:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rIRJJ4S/TayJ4+nUYIORtcvDK6OxWOcGP6Kkkj7PNA=; b=Sp8e+QqXWPHviMz4Y2kuuRxVO8
	ci5cOGI/ZTfWpKt64J1C5FqBmkSjdnfIOKb++LQmEjdsKHM99MkzR1N/eD3YIL59y+Hq8GWHwdHmW
	UIV/jP5MInKGCwoyADvemp7CcoF1r+UwM3wDFJjXV+kHN4wym9XffWRik5J2S9hnmRO4x9KadxL0T
	j+iJuPoL+0dpHAR33TP+/M0oPwNBn7FHft1eEz1dLqubD6qG2lo164Bljxlt4LFr3fkhl/6b3clOV
	HWOOJXrcm2IfoezTHQZFYOwXBTjNa0i8Tmsv9CK5VCaKc6pv3Pdq7JdB6XTeRNp+iG3nItQJkeVxh
	Drhut7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2HiQ-00000005ciZ-27oo
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 22:46:46 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2HiN-00000005ci7-2DNz
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 22:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744152399;
	bh=2rIRJJ4S/TayJ4+nUYIORtcvDK6OxWOcGP6Kkkj7PNA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R8fvGUFsOVl6uXNandNtMPaQ04Ue899DwkjMyQPzH7lRfiUeWaU45WC227fUHEgP1
	 bc1zRagv7StnKg9KmYzBicImWyhftDah5CJQ+HPDhyyTc0rTC/eMsLTGWvvJ6qR0Ge
	 uDLR17cE3JYfN30SHDJl3mJZyqCxWQgpuMgltmK7T1QPjt+PSE0N529VytVnK/AdF8
	 vsLf9xbUxoVUj8k10ZGGyFHtTjzAHFBoeFXCdkv8xRbLoXIgt6hsrZHNsE34X5Uu7j
	 EhOGlg89DKTL1axQ7/StZ94ciSn+DQSQxC5YFglOutVs0EN7TJAv9sVY0dcRxaWzzl
	 hKNGrTb8x/fKA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZXLmG6lj2z4wcn;
	Wed,  9 Apr 2025 08:46:38 +1000 (AEST)
Date: Wed, 9 Apr 2025 08:46:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Jeff Johnson
 <jjohnson@kernel.org>, Balamurugan S <quic_bselvara@quicinc.com>, P
 Praneesh <quic_ppranees@quicinc.com>, Raj Kumar Bhagat
 <quic_rajkbhag@quicinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "ath12k@lists.infradead.org"
 <ath12k@lists.infradead.org>
Subject: Re: linux-next: build failure after merge of the ath-next tree
Message-ID: <20250409084637.3bd593c6@canb.auug.org.au>
In-Reply-To: <4ae387b2-0dd7-413b-b66c-1f136455e23f@oss.qualcomm.com>
References: <20250408105146.459dfcf5@canb.auug.org.au>
	<Z_R2lEVjqn2Y3_sP@gallifrey>
	<20250408113747.3a10275a@canb.auug.org.au>
	<26cafcbb-6a94-40ab-aabf-3c9943cfb925@oss.qualcomm.com>
	<ee51a503-6580-4f46-aa38-77f1b9ba6535@oss.qualcomm.com>
	<4ae387b2-0dd7-413b-b66c-1f136455e23f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JWrGHgMrQN9liPrMPP032YR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_154643_833189_6D1DD674 
X-CRM114-Status: GOOD (  11.85  )
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

--Sig_/JWrGHgMrQN9liPrMPP032YR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jeff,

On Tue, 8 Apr 2025 09:17:21 -0700 Jeff Johnson <jeff.johnson@oss.qualcomm.c=
om> wrote:
>
> On 4/8/2025 8:23 AM, Jeff Johnson wrote:
> > NM. Since the timer_delete_sync() API is already in my tree I can make a
> > one-off patch for this. =20
>=20
> please review https://msgid.link/20250408-timer_delete_sync-v1-1-4dcb22f7=
1083@oss.qualcomm.com
>=20
> I'll wait a bit for any tags to accumulate before I merge into ath-next

I'll use your patch in the ath-next tree merge today (if necessary).

--=20
Cheers,
Stephen Rothwell

--Sig_/JWrGHgMrQN9liPrMPP032YR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf1p00ACgkQAVBC80lX
0Gx8eQgAjxao8xiJ/KRusfbqLlrG/SC2w8+UCR3vkg7lzBVX4g6YhXhfEJ/+T5dd
grSvabJh7Rj4c6NIr0FGjdFJJGf7Ho2XHlfVHKRmqlb/L5MUNn1dygTy5SG3cVf/
7Pt+Ca3Mb9Sp+nwHMXqGHs0zXIesOEMKGTi/xHth+CCmlChdPL2/VyXG3t0uJVs3
C9daLXeFes/N8CMTBOjYnN71LetG+4jnLAwZIy23IHMzXymtB4QXiZzc3S9zfdxr
DyYCbhEtCJ9BOCYn3Kcc/x9jTGQ8ECmTDQijaCKE+rAZRxI2+nFPPk8EUdqqwuA1
XOgDITwe7jU+zkLEF+IYjzvrs0BLzg==
=z9yf
-----END PGP SIGNATURE-----

--Sig_/JWrGHgMrQN9liPrMPP032YR--

