Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6470AC021B3
	for <ath12k@archiver.kernel.org>; Mon, 24 Feb 2025 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8BwX2NT2SrvrWsSF8l8qypvWFWcTpR1Sxh2dY8xskc=; b=Uy1lL0HT3OlIZylM3B6hn1p4mq
	5N7itfmzfc41HYbf7SduqoZttTorKyWuYNd/5gmsrI9M8DSraTwyopjEhN+oi4IbhDFEfAvvHxgWy
	uGd7RpIGPrEYYoRFxJkSVjn/3N0CQvfuxsbf9QDejG8Z3t89UFiXVEGstufhMZfbhOXXH0nSikAxQ
	sy9PMHcEb7PFhw/FK5hwop7MPWThj1yrPEPAegx+itpnwS/XJjPYyhSyPymPrOgtMbHuUb4KFv3AX
	z50m03Op6ociFTX3l0OjTTPCRNRT0llmJqHtayR+4Q3qqsR5Ws4SS5PoSlp32PMLxG214j2v18DYu
	RF4ulfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmV2o-0000000CyTt-0flJ
	for ath12k@archiver.kernel.org;
	Mon, 24 Feb 2025 09:46:34 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUso-0000000CwdO-3ClG
	for ath12k@lists.infradead.org;
	Mon, 24 Feb 2025 09:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=C8BwX2NT2SrvrWsSF8l8qypvWFWcTpR1Sxh2dY8xskc=;
	t=1740389765; x=1741599365; b=HxhiGOiikhL/lro+OV9acfJQv7WF6rr2vunqbGgE5k6iM42
	JEjto8jr3fiE5XfMN9BGYqDWP51ybXet6cacKkbk7jljJntSrBRwnc9ux2uGHS3oVPBGrEOUrEQka
	mOkSgo8P7xtOVJouUMN94Y98c0IRVohQXIsinJjpQGzTTrPsO4xDFihbH1j0g+a0KbjrqWpuMNp85
	nuupBYaVnwRgF4wqYhp2H+9KtlVQUIkBFUMwpIt4DChyzmEEbndI5aDWmoc3n67474CQBx4CfEj2c
	EeUOT+xiiO3eEof9NQ4HV5FeqT286jrorOZE7sGebrhbpTnpVoQqHYGUzNpw1yRA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tmUsM-00000008d0U-21g2;
	Mon, 24 Feb 2025 10:35:46 +0100
Message-ID: <3e486a87c6b385fc37d087e2bae7f32a5f15221a.camel@sipsolutions.net>
Subject: Re: please use tree tags in patches
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>, Aditya
 Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Mon, 24 Feb 2025 10:35:44 +0100
In-Reply-To: <7c7498fd-ede6-407b-b583-e9b8caf56bda@oss.qualcomm.com>
References: <ec3a3d891acfe5ed8763271a1df4151d75daf25f.camel@sipsolutions.net>
	 <7c7498fd-ede6-407b-b583-e9b8caf56bda@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_013614_813084_148204F3 
X-CRM114-Status: GOOD (  11.55  )
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

On Fri, 2025-02-21 at 10:27 -0800, Jeff Johnson wrote:
> First of all, thank you for adding any automation which improves the live=
s of
> the maintainers. Aditya has been working on that for the ath.git tree as =
well.

Cool. Do you have additional tests that should feed back to patchwork?

> ath.git contains both ath-current and ath-next branches in the same tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=3Dath-=
current
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=3Dath-=
next
>=20
> So we can use:
> 	[PATCH ath] for current (this branch gets little use)
> 	[PATCH ath-next] for next
> if that helps your automation.

Yes please. I've picked up those trees in my config/workspace now, so it
ought to work and report back, but we'll see when patches are posted.

As I just said to Ping-Ke, we can hopefully also improve the auto-detect
logic, but I didn't get there yet.

johannes

