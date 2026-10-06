Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87C7CA5FF0
	for <ath12k@archiver.kernel.org>; Tue,  6 Oct 2026 07:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1oLphuqmiswyZMKGrNkDTUIRMUMVNXDHs4za8xzywI=; b=eJtKyzGpphCgzvFqBsxw4aGUfB
	GgeDyYLgqGBjg24BEbbxnrx5Gs1+0zZQtLffOfxV+Fg2ZM8Hf1slZXVT/3fJhuLhq2wf4wt4hEAxs
	hRp2M49c/eeYPwEMlw3hZ87f4fMADLK0+/wIBDgyQXGxzpwLtIsWO6bWBsWAemlqzVm/B0gZmyKL/
	zznskz5T7GgvwoyEfAjG9PhpSxYEa0sHa7C/tVRN3BNdeGvlQksqb0lFF0OViVALlcgZiQvdrR56Q
	+Yt1yioS03QvcdKZMtQXX0Wu7WYeAqXN1QDdkavs3rp8ewLX+6KPFhM9LBeIbuXxqCccH6/BKxqEU
	bDGonaLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzOJ-00000000BKh-1JzJ;
	Tue, 06 Oct 2026 07:15:11 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzOH-00000000BJQ-11Gs
	for ath12k@lists.infradead.org;
	Tue, 06 Oct 2026 07:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=o1oLphuqmiswyZMKGrNkDTUIRMUMVNXDHs4za8xzywI=;
	t=1791270909; x=1792480509; b=oRwzHHCwclOpSe8GXfIdfLv89o4IN+xiC8spJ8SwVaO0QKh
	W/2kREZboH84e2jFy/t5xhZpg3XfI3m23tAGaDgwo8paJ6x1G52cG/FaXIzA56AvKBRTwwIIFSQ6e
	dQ4KGmo19VStQ9dNz/jeUdUqiPBWuVdzsWBYkRQM0kO6yUoNG9yTdYnxSdpjl19K23VmYiuMp7A5v
	prHestIgC7uQALxLbEYv1G+f3vcMeOwsU0fbgyhbMbEnsCSVmMS74yXoiEn0kpQNwPS22Ndz1KLzj
	o2T6VxYE8Z4plA6WsrNlAnlWnFxuQbc1R5KcN81tbI8ahbq2Tl4jMTz0o6d286Hw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xDzO8-00000006OuY-2f4T;
	Tue, 06 Oct 2026 09:15:00 +0200
Message-ID: <623f20912fee5ed614e3a884f54c116bb8f2944c.camel@sipsolutions.net>
Subject: Re: [RFC PATCH 00/12] wifi: AP side locking improvements
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Date: Tue, 06 Oct 2026 09:14:59 +0200
In-Reply-To: <3db68884-f6b5-499c-9959-7eec59ba40cd@oss.qualcomm.com>
References: <20261004214504.1636783-14-johannes@sipsolutions.net>
	 <3db68884-f6b5-499c-9959-7eec59ba40cd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_001509_564325_3938458C 
X-CRM114-Status: GOOD (  17.00  )
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

On Mon, 2026-10-05 at 19:05 -0700, Jeff Johnson wrote:
> With both the redux and this series applied, I prompted my review agent:
> prior to the 2 patchsets (18 patches and 12 patches) ath12k relied upon t=
he
> wiphy mutex to serialize many of the mac80211 operations. are any ath12k
> object references now subject to new race conditions with this entire set=
 of
> 30 patches applied?

:)

> The reply:
> <LLM>
> New Race: ath12k_reg_notifier vs ath12k_mac_op_start/ath12k_mac_op_stop o=
n
> ah->state

That's a fair point, but easy to resolve - we can just lock the wiphy in
the loop of notify_self_managed_wiphys(). It already can't go away since
we have cfg80211_mutex. Looking slightly deeper, we should guarantee
that we hold the wiphy mutex for a bunch of these operations to the
driver, and that needs more than a single line of code, but looks
totally doable.

> Pre-existing but Newly Exposed: ath12k_regd_update vs ath12k_reg_notifier=
 on
> ah->regd_updated
>=20
> ath12k_regd_update() is called from ath12k_regd_update_work (a workqueue)=
 and
> reads then writes ah->regd_updated with no lock at all. ath12k_reg_notifi=
er()
> writes ah->regd_updated =3D false also with no lock. These two were alrea=
dy
> concurrent before the series =E2=80=94 workqueue items are not serialized=
 by RTNL =E2=80=94 so
> this is not a new problem introduced by the patches. However, RTNL previo=
usly
> prevented the reg notifier from being called while a mac op was running,
> which reduced the window. That window is now wider.

I don't think it's correct about that widening very much, "RTNL ...
prevented ... while a mac op was running" isn't true for most
operations, only start/stop (roughly), and e.g. sta_state changes the
state here.

But you'll need to fix that locally in the driver anyway.


I'm working also on adding clang context analysis to all of this, but
I've only _just_ (yesterday) worked out our internal build systems to
have clang 23 to be able to actually validate it, and will obviously
need to redo the (very small) adjustments in cfg80211 on top of this
series. Then we can annotate such things with clang and the right lock.

johannes

