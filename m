Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63503C54E67
	for <ath12k@archiver.kernel.org>; Tue, 26 Mar 2024 18:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/2CwER7eN94A/ZCQZv0fy/PugSq6elQ9dUZaLkyi4A=; b=MaJbyF4Aj5c6eZkcq33ZCY1a6G
	qwPKw8bBBOMC7zjCAy9msipQjmBqTPadjMVundsVBDe7muOCRPRSc9DXSeRt5PDINqfPaWoa6XXyo
	U2AYWgPW83Hya39KgzUgje8/t93s5qIA7JQ6Sv/GbVXKOnngwBpK//qw8wRHgnEt40zxosDuMTYNF
	ZS1Z58tUSX0iwIARPLY5X2DhTvTlW/t4m6CX/ZB0mG2aSr2p2Cqs8Tsl07S9dnmRBqQHa0T80WKNG
	wL8WRgfLyk6Ix7I2mWWekkBbHKC9WKJQLJHq0z3+z6VWqaHgc/qqdKFe0uHSgD2RZJhHkw0oAEwIJ
	xMZ3u0uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBbZ-00000005wtr-04ky
	for ath12k@archiver.kernel.org;
	Tue, 26 Mar 2024 18:33:01 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBbT-00000005wqN-1K4V
	for ath12k@lists.infradead.org;
	Tue, 26 Mar 2024 18:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=v/2CwER7eN94A/ZCQZv0fy/PugSq6elQ9dUZaLkyi4A=;
	t=1711477972; x=1712687572; b=fk95fLDkvubLn98/qIzuqgVh36WLyeX1iTZGPcSWkTQtVTe
	FIwyzrciAqm8YiNLOfRWHXitOhcn1wM2Yiz/rPN7fvc1d/9dJ6wZp8fPV8RDfuzXE0dawMHU16MzR
	rpmH1X17cL54C2hgGykf7dwFx9qQ6izhVRdkpVUi98otR8g3/uTfl2vWXpWd6m9ai2KDr8lVnp9ZA
	ZrRMTTCWTX2b5c9IIJjcWTPj9ofHt3h/hG8DwhX3CENtgJK2PkaIdHuNDlLyziWFPf97OIK1jJzMA
	nybpkFRGjmIT5HaZLS8HtV9sEaHt9iwgPGboxClOJnPFoLLYdRzYVtHzbvkTGupw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rpBbO-0000000Ftbs-1wiK;
	Tue, 26 Mar 2024 19:32:50 +0100
Message-ID: <a313c313ab41325843092dc8445386dd802ed115.camel@sipsolutions.net>
Subject: Re: [PATCH 01/10] wifi: mac80211: Add EHT UL MU-MIMO flag in
 ieee80211_bss_conf
From: Johannes Berg <johannes@sipsolutions.net>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Tue, 26 Mar 2024 19:32:49 +0100
In-Reply-To: <b4fb2e9f-b7af-42da-be97-9ae1560ebad2@quicinc.com>
References: <20240325201031.10837-1-quic_pradeepc@quicinc.com>
	 <20240325201031.10837-2-quic_pradeepc@quicinc.com>
	 <8efc258b698acd504c1fc699d026b906bf383894.camel@sipsolutions.net>
	 <b4fb2e9f-b7af-42da-be97-9ae1560ebad2@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_113256_533835_ED6466B9 
X-CRM114-Status: GOOD (  14.23  )
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

On Tue, 2024-03-26 at 11:31 -0700, Pradeep Kumar Chitrapu wrote:
>=20
> On 3/26/2024 6:00 AM, Johannes Berg wrote:
> > On Mon, 2024-03-25 at 13:10 -0700, Pradeep Kumar Chitrapu wrote:
> > > Add flag for Full Bandwidth UL MU-MIMO for EHT. This is utilized
> > > to pass EHT MU-MIMO configurations from user space to driver in
> > > AP mode.
> >=20
> > This ^^ doesn't match this:
> >=20
> > > + * @eht_80mhz_full_bw_ul_mumimo: does this BSS support the reception=
 (AP) or transmission
> > > + *	(non-AP STA) of an EHT TB PPDU on an RU that spans the entire PPD=
U
> > > + *	bandwidth
> > >=20
> >=20
> > which doesn't match the implementation ... Wouldn't be a bad idea to
> > actually do what it documents though, I guess?
> >=20
> Thanks Johannes for review.
> can you please help clarify what you meant by "actually do what it=20
> documents"? This will help me to amend next revision appropriately.
>=20
> I have tried to describe what this flag is trying to represent.

Yes but ... you document AP and non-AP STA, but only implemented it for
AP?

johannes

