Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0334C3DA7F
	for <ath12k@archiver.kernel.org>; Wed,  7 Aug 2024 21:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lNYgyyduqWNxgYtLW+nx5b5Z5RouJ+QUC7x18aRp2c=; b=NbpnDW2UhUQExfoTj7KrTxGzb9
	rXXcftnz7ZMGCvndVFK7TnD6t64lSn3wiGKDfFGFlgTJ+9DIXwB+RZDLDhw2RpliUt2B05k7SOCEb
	W+WDSDLNGggA3pp0ihT4Wnd5TSj63oeDTvFkSN9litBaLxwnSzPnoLWg11QtN760fQO7u5+JcrSXi
	lgvTirWXl/6X1771Yrseo/C1ado2GDU0O7msUlGSWmks89AZbOrD8HwKieAGPfOvrmZII0f509Jdn
	FBGmTbFIQL/yyV07cMKihlMYFsLVM+jlcV2uRKHpK2/nsknDsVmszhxy5lGkuGNsAbpFR6NosuDJM
	fK5MCevw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbohC-00000006OhI-28sc
	for ath12k@archiver.kernel.org;
	Wed, 07 Aug 2024 21:59:50 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sboh8-00000006Oek-0szg
	for ath12k@lists.infradead.org;
	Wed, 07 Aug 2024 21:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723067979;
	bh=/lNYgyyduqWNxgYtLW+nx5b5Z5RouJ+QUC7x18aRp2c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MbbntmnKzTGoiDDdTw5hxGSbhQVK/2QGMSWVrF1vacCGy6bYYdXVuY7rMKY1UJa5X
	 cyZesAnxJ4cTw0rwqRWEMrvbLqM31CPmjpX9yW3Q6d/5I9b7JPyIgKtfH++f513RDY
	 i9XAzTx9b++Ru0Rr5o3TB4icmjK73HCTxTQpf0do8C1pZW9T0VE2anTGr7QdFP58c4
	 r2vYKKKXTiSBKUTv6HCUB7DbZAm5cDxsAfY907syVUYgMW0W1RkqUTeA9L+1wY5Ssw
	 0fbf3AAp+YgDhWbYOriAwze8JJ4GGDM+AjhfeIBa3OkISBmri6zZwnNEo6abhRWyeq
	 TXB7lfq6IOWQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WfPGg1R6mz4x42;
	Thu,  8 Aug 2024 07:59:39 +1000 (AEST)
Date: Thu, 8 Aug 2024 07:59:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: linux-next: request to include ath.git tree
Message-ID: <20240808075911.2c096333@canb.auug.org.au>
In-Reply-To: <87wmks50fw.fsf@kernel.org>
References: <87ed7163yd.fsf@kernel.org>
	<20240807080423.45efb506@canb.auug.org.au>
	<87wmks50fw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y9l/9f.IroInhR7WVArfaBC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_145946_905608_445AB710 
X-CRM114-Status: UNSURE (   7.59  )
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

--Sig_/Y9l/9f.IroInhR7WVArfaBC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kalle,

On Wed, 07 Aug 2024 09:09:07 +0300 Kalle Valo <kvalo@kernel.org> wrote:
>=20
> Please add Jeff and our ath10k list (all our build reports go to the
> ath10k list):
>=20
> Jeff Johnson <jjohnson@kernel.org>
> ath10k@lists.infradead.org

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/Y9l/9f.IroInhR7WVArfaBC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaz7i8ACgkQAVBC80lX
0GzqWwf9GzyPoKGJO51ko+sZEJvxExBZsAD4NIts8I2WXxIOdqrMWfHS2thshdwW
7zx1miYAD3cOPQMZhqD9YYg88BqC/R+9/xB/HWnfKvzgN0j6l1SVN0iLJwCgGfKj
I0bmCQcgzdP96HmZ7YDJuVRiWTGdk6/MqDT6pnxtDSr3EA/9EY3dgwU5qhOXkdUb
7h1SqD3hYGdRYk+Q1zzDOs8bO/4SE3Qo/Q4p7dE1AjGDNcKDdffHkxmRAEVvH6zW
Ko/V5X0N6kH5wxmL4hIF31oFj1EfshmCRKjQZoqROks/ftgfs66wJp0XUZjQqL5p
8+8d/JrsP9AcxvlASDvV87v71zIBLg==
=HHuc
-----END PGP SIGNATURE-----

--Sig_/Y9l/9f.IroInhR7WVArfaBC--

