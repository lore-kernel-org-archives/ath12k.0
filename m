Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFAA606A327
	for <ath12k@archiver.kernel.org>; Tue, 20 Oct 2026 08:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BVW4N1qd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=oglU7Wey
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BXTzKcczQ/ZL6VWZ1Sg8e1Q5TT0707z9V2mf3N+p8I=; b=BVW4N1qd9CGid5GhhU1JK481fJ
	82JahIsyb1fIhpn05JEVNSzUjAJxptsrRukrMGtJp6MC94Hino3pvw7nI+goYKPu7U4Jpl9La9fBW
	069PtgLkcd6RJINL2HWJAMvfL/v1oEIC3bvHSqGOWJvjlBg/fhNSbIYgwn3mVmZQVAndCDErO6fv9
	3NnHAO4IAsC5KUMXXGMwTQesDszUqgcsHoJ6ddrAVaV7FL583tOybLZcXZCBbjgdxTB/TBqvxrVtI
	1CNOHr6nniSR2/RIem5MhiC7zzJjQl53J1965okny68HLCRQaqslr4lcn4mqOVtud/He9yiO6uRos
	FVTqLDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5O6-00000009CzS-0Zdf;
	Tue, 20 Oct 2026 08:40:02 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Ny-00000009Cwz-1NZu;
	Tue, 20 Oct 2026 08:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=1BXTzKcczQ/ZL6VWZ1Sg8e1Q5TT0707z9V2mf3N+p8I=;
	t=1792485594; x=1793695194; b=oglU7WeySzaMqdq96z5/0DkA1FsCOctK6XWitbmjs7rvE10
	kDHz/RvWn2/PZLRxWJ7Xpk6evGRRNyAslZQm6yrH60PlzBlC5Y+ADrHa3aZ/MYr9JffofAJxgiuQB
	eIZvcjvPUcho/e4xdkrdIvfNpeGLOB57l3xEbTT+6HXfkrCsHOHTaC+PT7S/G64PbHyoqCEactdd2
	K13JaTZ9TunLpdTHbClTOa1/Evc+nXUitF5CPLfOupsa0xunSajeckex0gksw9hPbGzYy6EIRL9fX
	P6qp1e4jm/GBKGMezotDhlf78RiLn5FXZ+9ND36MVhtW3kQGlNJyBqkwQpUd1PEQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xJ5Nr-0000000G3Yr-0pZv;
	Tue, 20 Oct 2026 10:39:47 +0200
Message-ID: <b4c5587803cf01eb14a196d8968cc33d9c953f66.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/3] wifi: ath12k: fix MLO station firmware crash
 recovery
From: Johannes Berg <johannes@sipsolutions.net>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Jose Ignacio Tornos
 Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 20 Oct 2026 10:39:46 +0200
In-Reply-To: <f0c329ad-a13e-4bd3-b630-c0137a5f42c9@oss.qualcomm.com>
References: <20260804175004.1761075-1-jtornosm@redhat.com>
	 <20260804175004.1761075-2-jtornosm@redhat.com>
	 <aaf175a7-86e0-4da2-a3fc-df87d906f800@oss.qualcomm.com>
	 <1c8bd087a5cfd54fbe2825f2fa19a7851357ba86.camel@sipsolutions.net>
	 <f0c329ad-a13e-4bd3-b630-c0137a5f42c9@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_013954_363913_93B0C5DF 
X-CRM114-Status: GOOD (  10.60  )
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-10-20 at 16:37 +0800, Baochen Qiang wrote:
> >=20
> > There might be a chance to disentangle the RTNL from this given the wor=
k
> > I did recently on disentangling it from cfg80211, but then on recovery
> > *failure* we have a problem with cfg80211_shutdown_all_interfaces().
>=20
> Hmm, I wonder whether the restart work could take rtnl only around
> cfg80211_shutdown_all_interfaces(). From a quick look,
> ieee80211_reconfig() itself mostly only needs the wiphy mutex, except
> ieee80211_add_virtual_monitor(), which asserts RTNL. Though any rtnl hold=
er that then
> needs this wiphy would still end up stalling everyone while the recovery =
runs.

No, it's not that simple - it would have to drop the wiphy mutex to
acquire RTNL, but then userspace can come inbetween and use the failed
device.

johannes

