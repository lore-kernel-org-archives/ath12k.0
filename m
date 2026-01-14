Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1F9D31A3A
	for <ath12k@archiver.kernel.org>; Wed, 14 Jan 2026 09:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufpRZ0O09Okc26dzuVpIdsUxMRmkbneXYKpFAjnsc3o=; b=fI/LVh2xP5LUxN+66jPCCYzhnw
	Tlt/orbsxzxJq0hQWBK/IoifjtnfggtJQ3ww8sgbG4WLD2z0+5KvSIJT6gc+XPS1Bug9hb5auc87H
	GOIRNkzmaAfV60TopzJfcCNrdV4ZfhrEoUx7TswpxGoE5qsk5TkH2KlmlCNC3yRe/Kuu2Ucz7nqP8
	b11XMXhhftDOWUigRX0wRr5iXVnst9ohrQCg7c+8Ie/MOmNEMK35h1wYuqceuotc+0qeVn9E84qGB
	1j11aSMnyfIO4xhSuPfiyScEvv8lTW7F1IzrFpdDk8+cO+8oFsjGBG2n5nXWgS3SL4whjh2q78i7s
	KYk4IxOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxU2-00000008cjJ-3Edi;
	Wed, 14 Jan 2026 09:48:10 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxU0-00000008chj-0BCq;
	Wed, 14 Jan 2026 09:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ufpRZ0O09Okc26dzuVpIdsUxMRmkbneXYKpFAjnsc3o=;
	t=1768384087; x=1769593687; b=JdaGAdE/M7EiZeTYzsilrAOXyrIr3fe4FJqFc7DRzRokCrf
	hH9+q4Q06a5p6RY4BQq1xtZCpBZsrNAK1v2MHYFRdo59gztVU0e7cDPmd8XeH3KsIsbEUg6gKLb0+
	RpHev/+Yd+vSZrtP1r1J0/A0E8nyMVVNK+8eOWuel2Sp2fL6YldHdVoks6W5NxmEcHSATayRXw+4U
	9Z7D9j9u7Ov1qcgZ0RYvN8BlKDCmFe+33gu7x7T/WChrrwMffIwPi+IP5moTLAHdgxTEf0P9KKfhm
	k2bVUejzkgzRUIPq1ngZ5rzx6WcN01/eSXXXhoikeZ9jAerBjSJYUf8xYbUIfDmg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vfxTr-0000000BZWw-3PcL;
	Wed, 14 Jan 2026 10:48:00 +0100
Message-ID: <33d998cc225a7aeef4731ebc53c28a32b241ca7e.camel@sipsolutions.net>
Subject: Re: pull-request: ath-current-20260113
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Date: Wed, 14 Jan 2026 10:47:59 +0100
In-Reply-To: <98386125-c0bb-495e-b2ba-2765aaed19d8@oss.qualcomm.com> (sfid-20260113_183400_758847_B264F10B)
References: <98386125-c0bb-495e-b2ba-2765aaed19d8@oss.qualcomm.com>
	 (sfid-20260113_183400_758847_B264F10B)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_014808_132698_1454D09F 
X-CRM114-Status: GOOD (  11.10  )
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

On Tue, 2026-01-13 at 09:33 -0800, Jeff Johnson wrote:
>=20
> Note to maintainers:
>=20
> This tag includes:
> 31707572108d ("wifi: ath12k: Fix wrong P2P device link id issue")
>=20
> That commit contains the following:
>=20
> Note to linux-next and netdev maintainers:

I'm a bit on the fence about this, I hadn't thought about it on the
prior -next PR much, but I feel like this is a process thing that
shouldn't get recorded in the tag for posterity?

I do appreciate the inclusion of this (*especially* when I won't notice
the merge conflict myself), but I tend to think it should be in the
email rather than the tag message, since the latter is something I use
for the merge commit message and it gets recorded.

Either way I have to preserve it manually to the next level, so it
doesn't really help all that much, although I guess in the tag there's a
chance I could see it again when preparing my PR.

I'll just edit it out this time I think since it's so long, but you can
complain and convince me otherwise for the next time ;-)

johannes

