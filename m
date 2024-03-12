Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF04C54E66
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 10:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pGjI9oKZCB4wqhNgGSmY1JvKeg2YfoJocYC/kShyN8=; b=OMbdHs5wPlFNm3J8+mF12muUMN
	FTraraZPgMl9lC40haOxnuHN5/3dzFGhquQyLWYxy13JOeKtGnQ64h0Pt9xg1aHT+cAYq0dcaNaO/
	ITpLiBnf3c963fQsPN401bmmfmxfl9qH+Pz6B1REB6fasIc1/PL7BNlOwHyY3i9L/chccNh1YF5Nq
	HQpcstWdXnEZPOUzLSR1Tg+IFp/SuUtXgJGw/LFWzsvek5+FEWb5lsrN2fefMb05UyaQLxwjh6Y2Q
	zqFy1jdPCGUQsmBU7kz31wTpm6u8hFZXXQG2c8chl6l1mCZNGpAZBs0GZknyT38hlmYmCcaBKGQYs
	buG85CiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjzCW-00000005ISx-3bbu
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 10:17:40 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjzCU-00000005ISQ-1zXo
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 10:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=4pGjI9oKZCB4wqhNgGSmY1JvKeg2YfoJocYC/kShyN8=;
	t=1710238657; x=1711448257; b=BxfWG7iwzaXAGCOuL/Fsc+rooBq1s0V/YCoR7uQqMBk57cC
	8gHPj8yr96XcT1QXaOXuFsCorAedDzoO6tOTPT+JRMJvlQnYBp7li9STS3/521a30UWrszXqElbUg
	ojjkCPyv9k9c3pSIojRkSqK0udAkEwVjtUzdNIqK4xuEVUIhLnFr+AhGPHB1TywwXy1B/9SdYXNVF
	zCasRer6WQwQF5cU4gvPySZwCxjwpRBHBxQsOQZmEDzf3mp7z79ypCm2rwQPlRVbQsuGIV457PAlE
	IWAUdPWRNl9jph8vNsoK9jdO28Ji6sqz4CyCwe/IyS0VsbE82YdEzaG+qRiwJsbQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rjzCQ-0000000DndJ-3rMY;
	Tue, 12 Mar 2024 11:17:35 +0100
Message-ID: <84b85c7f409ec38a34ffe040f4d1e90253854c21.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] wifi: mac80211: supplement parsing of puncturing
 bitmap
From: Johannes Berg <johannes@sipsolutions.net>
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Tue, 12 Mar 2024 11:17:33 +0100
In-Reply-To: <4c1adfca-96aa-4b41-86b0-2fe5ad3e6cfb@quicinc.com>
References: <20240312045947.576231-1-quic_kangyang@quicinc.com>
	 <20240312045947.576231-2-quic_kangyang@quicinc.com>
	 <8cc7e7f7b2914385b481ecfdd7bc3f67fc4546b3.camel@sipsolutions.net>
	 <4c1adfca-96aa-4b41-86b0-2fe5ad3e6cfb@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_031738_555547_17224E2A 
X-CRM114-Status: GOOD (  10.77  )
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

On Tue, 2024-03-12 at 17:22 +0800, Kang Yang wrote:
>=20
> On 3/12/2024 4:16 PM, Johannes Berg wrote:
> > On Tue, 2024-03-12 at 12:59 +0800, Kang Yang wrote:
> > > Current mac80211 won't parsing puncturing bitmap when process EHT
> > > Operation element in 6 GHz band or Bandwidth Indication element. This
> > > leads to puncturing bitmap cannot be updated in related situations, s=
uch
> > > as connecting to an EHT AP in 6 GHz band.
> > >=20
> > > So supplement parsing of puncturing bitmap for these elements.
> >=20
> > Hah, yes, I just noticed that too and fixed the second part yesterday,
> > and was still thinking about how I could test the first part :-)
> >=20
>=20
> Should we add validation for puncturing bitmap in=20
> validate_chandef_by_6ghz_he_eht_oper()?
>=20

We already have, no?

It calls ieee80211_chandef_he_6ghz_oper(), which checks
cfg80211_chandef_valid(), which includes puncturing.

johannes

