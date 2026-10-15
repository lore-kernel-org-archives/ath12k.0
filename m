Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D49CC6B33
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 09:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAEnMHXSGbODnoHINQmdECLQl9knKinv4Jxofdnbb10=; b=Mbm6jt+6U4gFQu/1BbzBEq0F3P
	a+e5CGzSYqEGJW5hU38T3XZ9PbxBXql4x0mzFJax3fcgMovMp4ZruUvORxKkYgF3ASCq+sX7Ka6BG
	IsmLZMYHqLMs1MnA5kJlTSZsMGa1tmBy4i9HZgpt2tgCAq7EBsEYQ356MnDP8IMecqSNMgpoiFwW3
	SZoXLLAyvHB3iJ87+ttta38qnV9tOiQRjHeHXlE8ApKL/ROUVxPjDJPjEhP06cNpfrnQLJdm8Yun0
	4Ud9se6E2qtw5XCnE1c5rhSGuI8G9UTq53MhnYUOE2JMh0UdXyXFPPMw7GlASUA/YZpICv23sEa6J
	X0UkRlQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHI5I-0000000HKmX-3KCf;
	Thu, 15 Oct 2026 09:49:12 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHI5G-0000000HKl5-0E4C
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 09:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=zAEnMHXSGbODnoHINQmdECLQl9knKinv4Jxofdnbb10=;
	t=1792057749; x=1793267349; b=MpDniADGyukLPRC/Us2QFbuj4QFn/kJ42sgOO3GrjeWnooh
	twh/x9eJ3JdWCCAlTUXmEJX8/9flEb2MD19VzCTan7j4ATgnCzl7vr6YneR5QPGx4Qx2gD6O24GUe
	rkxLIy/+1mFE5+07cgNC2svhnbvWnForFzanLzSoTvsRcHNKrn/1Lb7YzDeoIn6chBsET+pDXjf/2
	YkZy+l5kV4tq1oAkEFIPULX+MxW6MkMsK1CPtzM2F0wdrUOgMNNud8XczxSibQHr036AgBmHmnBbC
	V4XSnYkEgge7yEmQASVDqSfj40Cl2VplqbFV4pNF1l7494o9UnU+uKkIs6Q3Ts7g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xHI56-00000003OQo-0Aca;
	Thu, 15 Oct 2026 11:49:00 +0200
Message-ID: <1aa920b5ece0378fcab80fc56b68bc6bf41ffee5.camel@sipsolutions.net>
Subject: Re: [ath:ath-next 6/34] net/wireless/nl80211.c:20114
 nl80211_pre_doit() error: 'wdev' dereferencing possible ERR_PTR()
From: Johannes Berg <johannes@sipsolutions.net>
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Jeff Johnson
	 <jjohnson@kernel.org>, ath12k@lists.infradead.org
Date: Thu, 15 Oct 2026 11:48:59 +0200
In-Reply-To: <202610140243.w1Zrwq4k-lkp@intel.com>
References: <202610140243.w1Zrwq4k-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_024910_114791_745F3E9A 
X-CRM114-Status: UNSURE (   8.52  )
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

On Thu, 2026-10-15 at 12:40 +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-n=
ext
> head:   cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
> commit: 13c20e8be3278e54f4758941998a3ee746644d8d [6/34] wifi: nl80211: pr=
epare for unlocked wdev-only ops
> config: sparc-randconfig-r2200-20261013 (https://download.01.org/0day-ci/=
archive/20261014/202610140243.w1Zrwq4k-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.3.0
> smatch: v0.5.0-9187-g5189e3fb
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Closes: https://lore.kernel.org/r/202610140243.w1Zrwq4k-lkp@intel.com/
>=20
> New smatch warnings:
> net/wireless/nl80211.c:20114 nl80211_pre_doit() error: 'wdev' dereferenci=
ng possible ERR_PTR()

It's a bit needlessly worried, because:

> 13c20e8be3278e Johannes Berg        2026-10-09  19979  	wdev_ref =3D nl80=
211_need_wdev_ref(internal_flags);

This is

static bool nl80211_need_wdev_ref(u32 internal_flags)
{
        return !(internal_flags & NL80211_FLAG_NEED_RTNL) &&
               internal_flags & NL80211_FLAG_NO_WIPHY_MTX;
}


so NL80211_FLAG_NO_WIPHY_MTX must be set

> 8e3d9039d280c6 Johannes Berg        2026-10-06  20029  	if (rdev && !(int=
ernal_flags & NL80211_FLAG_NO_WIPHY_MTX)) {
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20030  		if (need_rtnl) {
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20031  			wiphy_lock(&rde=
v->wiphy);
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20032  		} else {
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20033  			/* without rtnl=
, things may have changed since lookup */
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20034  			wdev =3D nl8021=
1_lock_and_recheck(rdev, netns, wdev_id);
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20035  			if (IS_ERR(wdev=
)) {
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20036  				err =3D PTR_ER=
R(wdev);
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20037  				goto out;
>=20
> Smatch is worried about this goto.

while we can only get to that goto when it's not set.

I guess we can still set wdev to NULL here to avoid the dependency and
potential future bugs.

johannes

