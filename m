Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239E0C7115C
	for <ath12k@archiver.kernel.org>; Wed, 25 Jun 2025 11:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAQ4laQClsoq9OWP0Wg0wPKxJ5PgqipjIY56zOHItu0=; b=GlItIjBXef7ICvQAD3fNFQ9Rod
	KGPmBvRB9TKCEfFhd746VgWZZKpgrwPRYLJuSBup+hVtUvbFpfRpM3vlgeD4eCMuGlrLYkWIEMPuX
	foDU9n5AX1DYhgc+xxDE9Wc4DY8TkSlpFkF18ScwpM/HPnJKeDz5PH46bbz7HVqf/TNHoVhYnigdM
	7ILF/KRLGbKSoMjB6yZjjdyWii4cZpR5cuYRQbDrNm+rYmGITmhkUYaazMS+clA8U3EcSWdPmzveV
	tMt81C08nViQYzzCEcVv7rxxoiV9onnfDcZj9ggZwcB2gUSLGgGIjrwV6O0c9A3EsOYAsog6lU6ZY
	MRF56qYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNxv-00000008PtY-3grS;
	Wed, 25 Jun 2025 11:06:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMsZ-00000008EKE-0IWO
	for ath12k@bombadil.infradead.org;
	Wed, 25 Jun 2025 09:57:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FAQ4laQClsoq9OWP0Wg0wPKxJ5PgqipjIY56zOHItu0=; b=hvXiC23J5sNglTSNPKIQpZ1b6c
	1DIcrKgsEeDaVjtHnp2nr41Sh63nCcLuHs85MRcwnQnY8IZVRN+6Zu26r6x6sKstaMZX7l4vuALOB
	USHs7O00+NHzgBpyqtDY8uAA2AhR+1EYPvOMmyrIp2KYSyDwA8AjS+QoAlbX39TO6evO9KeRdsyG7
	r7pvLSbuQ8QYDpyR0sTXH6swS4nwLJA/Y5lNwobnzdvJRpUcZk0gP5kd615Z4OHbgoCckHsIg2GBc
	NRGs886PrJfsWpZu1HgoBE7TZd9FmE/6lJ9Eh0JtrQ6amigZE7SZr08JTHsG3SoKqMNnuWjTN+nbE
	RIluQtLQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMsW-00000005lOV-0vPZ
	for ath12k@lists.infradead.org;
	Wed, 25 Jun 2025 09:57:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 450FCA5053E;
	Wed, 25 Jun 2025 09:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53E8C4CEEA;
	Wed, 25 Jun 2025 09:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750845433;
	bh=f4RENiwLBVhuyLQAFjaQUlkCoYQnZdYn0zbqjSly6QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HQNhiLqmCr0pV7QbIcqtxdntHWOzrfobVWjaj97rE9HSnhrVQ3xOYDaO6gPP0AUq0
	 zgsUKcPC4Gk8WQSstKDzKwNUK6nM1hv8C84n/Rg3Lny1kh7l7k+CwuVNWmN74ufjrt
	 vjrfmilfmiZziIVN/3TGIAm7OIosgjJJUS3DbpTDCjIh+HD9H8CFBEX5mlJWX8226w
	 kSUMUK6oOyqdv9Jyo3n4cWVqfT9K1+Rl2p7iSPMkZcCrwuj2X9IvcNsoLFtc9Mrn1t
	 6j1IdCV3di6Udg0jrbGNazsODsv2ueq3z/iwDBPDSLyubz73jd1NeE/9xWGlLrHIxf
	 OfFcw9buke5tw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uUMsT-000000000pB-1Xq8;
	Wed, 25 Jun 2025 11:57:13 +0200
Date: Wed, 25 Jun 2025 11:57:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Gregoire <gregoire.s93@live.fr>,
	Baochen Qiang <quic_bqiang@quicinc.com>, ath12k@lists.infradead.org
Subject: Re: WCN7850 disconnects and reconnects in a loop
Message-ID: <aFvH-eKxTOVm3r2U@hovoldconsulting.com>
References: <AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
 <Z1hOweEsmXrIZByQ@hovoldconsulting.com>
 <87wmg6r7sm.fsf@kernel.org>
 <Z1lgBV6b1A6fLoK5@hovoldconsulting.com>
 <87r06dpbst.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r06dpbst.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_105716_437823_06D22171 
X-CRM114-Status: GOOD (  24.91  )
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

On Thu, Dec 12, 2024 at 10:04:18AM +0200, Kalle Valo wrote:
> Johan Hovold <johan@kernel.org> writes:
> 
> > On Wed, Dec 11, 2024 at 09:35:37AM +0200, Kalle Valo wrote:
> >> Johan Hovold <johan@kernel.org> writes:
> >
> >> > I'm seeing iwd repeatedly failing to connect with reason
> >> > PREV_AUTH_NOT_VALID with WCN7850 on the Lenovo ThinkPad T14s (and the
> >> > Snapdragon X1E CRD reference design).
> >> >
> >> > I first noticed this with 6.10 when starting to work on the Qualcomm X
> >> > Elite platform, but never got around to investigating it. I've confirmed
> >> > that the issue is still there with 6.13-rc1 and that adding
> >> > ControlPortOverNL80211=false allows iwd to connect.
> >> >
> >> > Looking at Gregoire's logs now, it looks like the deauthentication
> >> > reason is different:
> >> >
> >> > 	(Reason: 7=CLASS3_FRAME_FROM_NONASSOC_STA)
> >> >
> >> > instead of
> >> >
> >> > 	(Reason: 2=PREV_AUTH_NOT_VALID)
> >> >
> >> > but the same control port workaround allows iwd to connect.
> >> 
> >> Is there a bugzilla report about this? Unfortunately I have not been
> >> able to follow bugzilla lately due to MLO work but it would be still
> >> good to file this (if that's not done already).
> >
> > Yes, sorry, I should have included the link (it was posted later in the
> > original thread):
> >
> > 	https://bugzilla.kernel.org/show_bug.cgi?id=218733
> 
> No, I should have checked the bugzilla myself but have been too busy.
> Thanks for the link.
> 
> > I only noticed that Gregoire's symptoms were slightly different when
> > replying to this thread. Let me know if you prefer that I file a
> > separate bugzilla report for the PREV_AUTH_NOT_VALID case.
> >
> > The exact same setup (kernel, distro and router) works fine with ath11k
> > and WCN6855 (e.g. as found in the Lenovo ThinkPad X13s).
> 
> Good to know. We need to get this fixed ASAP, I marked it as P1 in bugzilla.

For the record, this appears to have been fix in linux-next now by the
following series:

	https://lore.kernel.org/all/20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com/

Johan

