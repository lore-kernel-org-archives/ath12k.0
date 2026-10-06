Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DF1CA5FFC
	for <ath12k@archiver.kernel.org>; Tue,  6 Oct 2026 07:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6VCxIoRLnavcfWlTZ/l3aFzZ4khwANHfmIrxFMbKJw=; b=1wF0EbXfT7oJHC9u/lJhM8qGZm
	ibaNPNnXcZqrFolcSQOoD8rpQ5LTE4Cmp48AFC/JqHqgAmTRS2mQBGIS0YtDr2p52ilfXN4kk7ozN
	dsuzVwFvu+rJSX5Kj9Vk3hAAWBoPXlauL56KAtUPxi+YMZc268M9/UAVMdOJOPtTiewyKB7LL78wO
	dFTarNaH4dNtviLI0ZY5biqroT25sv3dMXe0/y2k2kz/gF88icWof7qHCfeuBcwY/KIuQvjSTR7wd
	UKrYAZzURl0Wjo657HhM1AwtZOFr31R1NyCnP9KK9umX+9JiP3XNs7toiIMhj/13NgcOyYcuBDRUa
	rI+C7tFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE01a-00000000EqO-0TWo;
	Tue, 06 Oct 2026 07:55:46 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE01X-00000000EpQ-3Pxr
	for ath12k@lists.infradead.org;
	Tue, 06 Oct 2026 07:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=/6VCxIoRLnavcfWlTZ/l3aFzZ4khwANHfmIrxFMbKJw=;
	t=1791273343; x=1792482943; b=dWvdex17D4hHNYo9WuFJoxHuZotmO3MFAaOvZEUfxl8JWxL
	9gE08NVKXwAjPHhMwUh306bFrBTiexymif4V7NLUpzS94j1onm4h2ge0WStZhQ4nCVtF/KSlk5kok
	srcNO9jLCAxU2lOBR6cG0AZOJFlydUl1AQwala1DSWoFC+bePgyeZjBjwzJzIP1a+CBKucHNyag8B
	HbBAEVzFqsjnuX/ayBuaW12RVQUJDUvVR8/D3CCi9XpcxOWAzd7WMLWvdupRYNLXoLPzUcC77mXaI
	FUqiW4h5Jr1ushLZrmv5T1vqBwwEKByu7RGr/IwtjbpcODCNgI/I7JblGiu21X5g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xE01T-00000006Qha-1hDg;
	Tue, 06 Oct 2026 09:55:39 +0200
Message-ID: <52f1488ca882edc3901a7559dc4afee4fb8351e7.camel@sipsolutions.net>
Subject: Re: [RFC PATCH 00/12] wifi: AP side locking improvements
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Date: Tue, 06 Oct 2026 09:55:38 +0200
In-Reply-To: <623f20912fee5ed614e3a884f54c116bb8f2944c.camel@sipsolutions.net>
References: <20261004214504.1636783-14-johannes@sipsolutions.net>
		 <3db68884-f6b5-499c-9959-7eec59ba40cd@oss.qualcomm.com>
	 <623f20912fee5ed614e3a884f54c116bb8f2944c.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_005543_854557_FECB931D 
X-CRM114-Status: GOOD (  16.49  )
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

On Tue, 2026-10-06 at 09:14 +0200, Johannes Berg wrote:
> On Mon, 2026-10-05 at 19:05 -0700, Jeff Johnson wrote:
> > With both the redux and this series applied, I prompted my review agent=
:
> > prior to the 2 patchsets (18 patches and 12 patches) ath12k relied upon=
 the
> > wiphy mutex to serialize many of the mac80211 operations. are any ath12=
k
> > object references now subject to new race conditions with this entire s=
et of
> > 30 patches applied?
>=20
> :)
>=20
> > The reply:
> > <LLM>
> > New Race: ath12k_reg_notifier vs ath12k_mac_op_start/ath12k_mac_op_stop=
 on
> > ah->state
>=20
> That's a fair point,

Actually, I think it was wrong: ah->state is only used within the
NL80211_REGDOM_SET_BY_DRIVER block, which is already only called in
reg_process_self_managed_hint(), which already holds wiphy mutex. It
might be correct about ah->regd_updated in this case, but then it found
that was _already_ racy.

> but easy to resolve - we can just lock the wiphy in
> the loop of notify_self_managed_wiphys(). It already can't go away since
> we have cfg80211_mutex. Looking slightly deeper, we should guarantee
> that we hold the wiphy mutex for a bunch of these operations to the
> driver, and that needs more than a single line of code, but looks
> totally doable.

That's probably still desired so we have _any_ locking, but needs to
drop the wiphy mutex in ath12k and rtw89.

johannes

