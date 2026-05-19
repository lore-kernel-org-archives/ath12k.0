Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CFBCD4F3C
	for <ath12k@archiver.kernel.org>; Tue, 19 May 2026 14:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STpS87w81sZnuEpga9ltOybAp1UYGjlXwJ5efc3idxE=; b=fZxwRdgkLcEivgmp9VhZWL4C0/
	qrzE320fuL8kinQ9tt8a1KsY61d7BTe/hS2tnCGbVvWAyVDKx8DrOu2S/VkX6YiJ12t1r54YgGAbb
	DcRFP2/0N7MhMaOQyfkTqrckmOlOt5IeaeYvqZyE2QWAtZVyCwpMfUlHzmmTraqZhI7LwL5gWXvH+
	RAKdtGbLRxJL7q3saLjinzzjc//jnOmfsK6Qe3L+3uCGK5GsWsrWUAO3QxmD9R8PIRB3pTRN8GQsE
	W+5UqJnu+AZaRjUftevRxZaWV/LVvjykCPod43uMKVP7SRCDZScGrxG1ON7uFyqazzLPxo8q589O2
	b0eWwh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLMD-00000001oS9-3kIt;
	Tue, 19 May 2026 14:23:41 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLMB-00000001oRB-47sy;
	Tue, 19 May 2026 14:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=STpS87w81sZnuEpga9ltOybAp1UYGjlXwJ5efc3idxE=;
	t=1779200619; x=1780410219; b=lmE/Op9NB4OJF45K2QQkIYMM11kS1D3de0Gd5lIx5/3cZZ3
	ijO3KmmikvJpmAoTBqy0OTnPC0iZZZdjE/TeZQppyU33AHClTyfnnKe5KM+c2Vu9kp6NE7knQKxdu
	a4b53OZQGL9afQNsYREeXh35iyj2BrteEyaDuqGHfPdULzQC6+ebTNPK8JoQ0PGdiVFZ6p7e27VrD
	upoVa1pe4GxQwIKhUOyQQFqa8YR8wquWIGJosmQuy59PDu9bQ1zEgkCbXMgpyRzPNT6RLQjgb9uva
	tAwBgzh4UDwWZdkSlWn+g7BEvSfND+clt4+/WZgwfjpomM/RcAf3DIoYf4IkgSMg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wPLM3-00000006szv-2KCx;
	Tue, 19 May 2026 16:23:34 +0200
Message-ID: <8fbec573f20f11981773007f8b55ff543c462c11.camel@sipsolutions.net>
Subject: Re: pull-request: ath-current-20260512
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Date: Tue, 19 May 2026 16:23:30 +0200
In-Reply-To: <d88a1d9b-853b-476c-8f01-22fe24590892@oss.qualcomm.com>
References: <8756e3ff-52bc-4003-99ed-cda3170f118c@oss.qualcomm.com>
	 <d88a1d9b-853b-476c-8f01-22fe24590892@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_072340_019860_76063495 
X-CRM114-Status: GOOD (  12.54  )
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

On Tue, 2026-05-19 at 07:21 -0700, Jeff Johnson wrote:
> On 5/12/2026 7:28 AM, Jeff Johnson wrote:
> > The following changes since commit 7666dbb1bacc4ba522b96740cba7283d243d=
16e1:
> >=20
> >   wifi: cfg80211: advance loop vars in cfg80211_merge_profile() (2026-0=
5-08 09:20:03 +0200)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-cu=
rrent-20260512
> >=20
> > for you to fetch changes up to 54a5b38e4396530e5b2f12b54d3844e860ab6784=
:
> >=20
> >   wifi: ath10k: skip WMI and beacon transmission when device is wedged =
(2026-05-12 07:00:00 -0700)
> >=20
> > ----------------------------------------------------------------
> > ath.git update for v7.1-rc5
> >=20
> > In ath10k, avoid sending any commands to firmware when it is wedged.
> > In ath11k, fix WMI buffer leaks on error conditions.
> >=20
> > ----------------------------------------------------------------
> > Kang Yang (1):
> >       wifi: ath10k: skip WMI and beacon transmission when device is wed=
ged
> >=20
> > Nicolas Escande (3):
> >       wifi: ath11k: fix error path leaks in some WMI WOW calls
> >       wifi: ath11k: fix error path leaks in some WMI calls
> >       wifi: ath11k: fix error path leak in ath11k_tm_cmd_wmi_ftm()
> >=20
> >  drivers/net/wireless/ath/ath10k/wmi.c      |  15 ++--
> >  drivers/net/wireless/ath/ath11k/testmode.c |   1 +
> >  drivers/net/wireless/ath/ath11k/wmi.c      | 131 +++++++++++++++++++++=
+++-----
> >  3 files changed, 120 insertions(+), 27 deletions(-)
>=20
> Johannes, since this hasn't been processed, please drop it.

OK, done. Sorry about that, had a holiday last Thursday, kids were off
school Friday, and I haven't really fully caught up.

johannes

