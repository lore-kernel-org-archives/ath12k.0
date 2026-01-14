Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C329D38FF1
	for <ath12k@archiver.kernel.org>; Wed, 14 Jan 2026 17:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNnp/CaZgp6m72jY/3vSQxfduj8evozXNkqRDUMz+cs=; b=OfMTuUkbCVAQLziEnND3x5plMO
	b7Hwi7seHheay9LfRSDGV3Iw5ohqe+90Y87eaEA01xKVa7ieScPK4GnBxvcad7EglHmHoxhishd1e
	tmSXLeIVCw6T5iwUOF00kH6lFG3RFgDsMc5TpdnqYVDQ+OYOhu0LS/iaIR9JGzNhjtNaGZHBRG4ty
	tCMWT+Y2Awnguh3OuckSLZB9Mi9Azb0caCO9LPjx/KDEHomDv/zq26u/5VNNvhKpKJpa1zj5I/nZu
	c+CyRkHX++7kSoma5eklnc/WSOlpaN4D5c+PvQ/7CvMEKrcRNtUu5VdvCskihxgjxrdd1j6aIiK7l
	6SxKxx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4MD-0000000A2yF-3VUC;
	Wed, 14 Jan 2026 17:08:33 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4M9-0000000A2wI-3Z0Q;
	Wed, 14 Jan 2026 17:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=HNnp/CaZgp6m72jY/3vSQxfduj8evozXNkqRDUMz+cs=;
	t=1768410509; x=1769620109; b=pc7Gf6MZ5nPrItskaREdmcVzTuWr7B6F2K4UD+/zIwpqqsT
	xoYAByRIWCwFmREgcjSVhikc8zEupSgBHHrIfdefq+F13FLJ50d3x8K/D++oH9z4pSO/CHxa67ozE
	x5Udp1qR6FnjExmPrheSi1W8mCY6bNwPQOzYR0i2aSGkP78e3roX/S0TGhpdU1bOC4baYU5fdYTqI
	wOW2+DIVp5xZlsRR/gI1DxjXpI00GJblv5WFvAe1k6Mr7DK/FPY9H4c4G8uVJaxDi1NCqWGdbLkF+
	rL3JveKxIDnktsx/uGTIzCAzUV2K3LECxIoNrm0fjAypNbkofwYWCuATuzxJ4E1w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vg4M4-0000000Bk8g-4Auu;
	Wed, 14 Jan 2026 18:08:25 +0100
Message-ID: <22746c254c4c43561e2e3deaf49dadf7c57dae17.camel@sipsolutions.net>
Subject: Re: pull-request: ath-current-20260113
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Date: Wed, 14 Jan 2026 18:08:24 +0100
In-Reply-To: <f12c186c-c76a-4d39-8591-4c8d7d04d307@oss.qualcomm.com> (sfid-20260114_161351_637731_0A0B26C6)
References: <98386125-c0bb-495e-b2ba-2765aaed19d8@oss.qualcomm.com>
	 <33d998cc225a7aeef4731ebc53c28a32b241ca7e.camel@sipsolutions.net>
	 <f12c186c-c76a-4d39-8591-4c8d7d04d307@oss.qualcomm.com>
	 (sfid-20260114_161351_637731_0A0B26C6)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_090829_888060_E6DB4F7C 
X-CRM114-Status: GOOD (  27.98  )
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

On Wed, 2026-01-14 at 07:13 -0800, Jeff Johnson wrote:
> On 1/14/2026 1:47 AM, Johannes Berg wrote:
> > On Tue, 2026-01-13 at 09:33 -0800, Jeff Johnson wrote:
> > >=20
> > > Note to maintainers:
> > >=20
> > > This tag includes:
> > > 31707572108d ("wifi: ath12k: Fix wrong P2P device link id issue")
> > >=20
> > > That commit contains the following:
> > >=20
> > > Note to linux-next and netdev maintainers:
> >=20
> > I'm a bit on the fence about this, I hadn't thought about it on the
> > prior -next PR much, but I feel like this is a process thing that
> > shouldn't get recorded in the tag for posterity?
> >=20
> > I do appreciate the inclusion of this (*especially* when I won't notice
> > the merge conflict myself), but I tend to think it should be in the
> > email rather than the tag message, since the latter is something I use
> > for the merge commit message and it gets recorded.
> >=20
> > Either way I have to preserve it manually to the next level, so it
> > doesn't really help all that much, although I guess in the tag there's =
a
> > chance I could see it again when preparing my PR.
> >=20
> > I'll just edit it out this time I think since it's so long, but you can
> > complain and convince me otherwise for the next time ;-)
>=20
> In retrospect I made one bad decision.

FTR, I didn't meant to imply that you made a bad choice here - including
this information was valuable. I just didn't think it needs to be in the
tag message, as outlined.

And I was scratching my head over what you said below when I read your
mail earlier, and again now, until I looked back at git ...

> I modified the commit text of that
> patch in my "pending" branch to add the conflict resolution information.

I hadn't even noticed _that_! I only noticed it in the merge / tag
message, not in the individual commit.

> Instead of that, I should have reposted the "pending" version with that
> conflict resolution embedded in the "basement" of the patch so that then =
it
> would be part of the email record on lore but not part of the patch recor=
d in
> git. And then for the tag I could have referred to that lore link in the =
PR
> email. So this was a good learning lesson for me.

Makes sense.

Do you just want to redo it? I don't mind backing it out, nobody pulled
my tree yet I'd think?

> Hopefully these merge conflicts will be much fewer once the refactored at=
h12k
> lands in Linus' tree in the next merge window.

Right.

johannes

