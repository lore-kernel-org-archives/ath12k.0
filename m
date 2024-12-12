Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC5CE77180
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 08:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byjaAO52Z9xWgzLl47XHG2qbLePaKX8FSYnmaeELIG0=; b=BZEoT4cU5NflAwTwftyd7jgcik
	c4gvz9UBnZO2iOXrtx3GmC9vPJngC5XeN5FVPCgU111zl9KGQLlE0aKt04TgCOH7KrRWTWUOei+Ih
	B8cxfGZ/Gj51UbSJLgtDofCDyqUmcRT8e68OixTItQkC1BtyQHF7G54xY1j5RcrPZVw+FDzcdIN/t
	wfb6cwxfxOt/RKx3KZDUqLaiFRkoQPFlSJY/cDF2L/t8PRBgn1t2+oeUF66BxF4geDspjrK2HZvGb
	SeRCxgk3ANX16rhJNR8D7qqV7Crkkl6EfwZgs0TaMw2VwBdxyT1cJEE6SXz3NiWG9LjkCn+Zw9F9s
	y+qTCbYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeEs-0000000HFHM-0p0G
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 08:08:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeBJ-0000000HENB-32uP
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 08:04:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA8595C6782;
	Thu, 12 Dec 2024 08:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D98C4CECE;
	Thu, 12 Dec 2024 08:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733990660;
	bh=Jg+q5W0ecAfiWOW8Ozdw+LXP9f7Ce+N06C+ChU/uTTs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=uqQuNyvzdeAoAJ0sOHauXqHvEKFcXVkY1Lh7AzKzpKK8ypHhsywdtoAGbeX+VxD9j
	 TVxUW19qVKCQ2yaSHhp6A8wWPWps4oFTlvk7ZU0BcDUgDRmC3OWsSJR1bw+DMY8e2i
	 UjEJATPWVc0xG+W9JgSySQvUpSsjVX5GMg2tcd26pK4lsKoB5XxujI6MNrb242qJ+a
	 u8Wqp3Lvcy6v/MkrNYCAk2oGgXC/keAr5FkRK1AG/59VG+O3phtzmbf0NI17Duyizw
	 PviIIotzuBlDm9SoXzHn0SitDRGNVMmk1cR/irRTZvZ6ia6rrW2RahIek2C+nhd6QW
	 GAFT9kS40aOzA==
From: Kalle Valo <kvalo@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Gregoire <gregoire.s93@live.fr>,  Baochen Qiang
 <quic_bqiang@quicinc.com>,  ath12k@lists.infradead.org
Subject: Re: WCN7850 disconnects and reconnects in a loop
References: <AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
	<Z1hOweEsmXrIZByQ@hovoldconsulting.com> <87wmg6r7sm.fsf@kernel.org>
	<Z1lgBV6b1A6fLoK5@hovoldconsulting.com>
Date: Thu, 12 Dec 2024 10:04:18 +0200
In-Reply-To: <Z1lgBV6b1A6fLoK5@hovoldconsulting.com> (Johan Hovold's message
	of "Wed, 11 Dec 2024 10:48:53 +0100")
Message-ID: <87r06dpbst.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_000421_809281_722BB304 
X-CRM114-Status: GOOD (  20.41  )
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

Johan Hovold <johan@kernel.org> writes:

> On Wed, Dec 11, 2024 at 09:35:37AM +0200, Kalle Valo wrote:
>> Johan Hovold <johan@kernel.org> writes:
>
>> > I'm seeing iwd repeatedly failing to connect with reason
>> > PREV_AUTH_NOT_VALID with WCN7850 on the Lenovo ThinkPad T14s (and the
>> > Snapdragon X1E CRD reference design).
>> >
>> > I first noticed this with 6.10 when starting to work on the Qualcomm X
>> > Elite platform, but never got around to investigating it. I've confirmed
>> > that the issue is still there with 6.13-rc1 and that adding
>> > ControlPortOverNL80211=false allows iwd to connect.
>> >
>> > Looking at Gregoire's logs now, it looks like the deauthentication
>> > reason is different:
>> >
>> > 	(Reason: 7=CLASS3_FRAME_FROM_NONASSOC_STA)
>> >
>> > instead of
>> >
>> > 	(Reason: 2=PREV_AUTH_NOT_VALID)
>> >
>> > but the same control port workaround allows iwd to connect.
>> 
>> Is there a bugzilla report about this? Unfortunately I have not been
>> able to follow bugzilla lately due to MLO work but it would be still
>> good to file this (if that's not done already).
>
> Yes, sorry, I should have included the link (it was posted later in the
> original thread):
>
> 	https://bugzilla.kernel.org/show_bug.cgi?id=218733

No, I should have checked the bugzilla myself but have been too busy.
Thanks for the link.

> I only noticed that Gregoire's symptoms were slightly different when
> replying to this thread. Let me know if you prefer that I file a
> separate bugzilla report for the PREV_AUTH_NOT_VALID case.
>
> The exact same setup (kernel, distro and router) works fine with ath11k
> and WCN6855 (e.g. as found in the Lenovo ThinkPad X13s).

Good to know. We need to get this fixed ASAP, I marked it as P1 in bugzilla.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

