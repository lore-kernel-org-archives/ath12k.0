Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61785CF45C5
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 19:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GjqNiKKFojuLMmaBmWkZoBBFUEPAi0Ka0pw1kQpeYE=; b=G+hyQb6dGEkleYw4nh+oi5MA9b
	tRcJRNnqGhCSk8iBWN8+YBKeQ0+3J4TO5IZbUukSjRWp1v/kcDzJxvd/RFDJG1aP06F9U0ZgW+/3M
	NGgB8pVuF2d+df9Af+yi03ilPZrKA6hXXgBgsBFukbmBoXQ5UJ/vkLNxZZVVWB+L02x0VTbEWOi9S
	E/fId+d/KzGVA26EBLILzkg8uqeQhlbyJPZptHUtIFb7PvqyyhwC80+/5LDMNe+mGar/bX+SNXgkY
	dyW37JyD7AizyiGR/ZzfR0z5Nt0jS6qt28IA/+ZJGl1HqXDkvFue704D+sWPHpC85zLslDufmCUjc
	pCwwJdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNQt-00000005yXx-0XbZ;
	Mon, 12 Jan 2026 19:18:31 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNQq-00000005yXT-3rZo;
	Mon, 12 Jan 2026 19:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=8GjqNiKKFojuLMmaBmWkZoBBFUEPAi0Ka0pw1kQpeYE=;
	t=1768245508; x=1769455108; b=fKJCTqYPESsR6P+mTUzmu8kTUPkfm/uZpFG2a36CNOsnDcS
	e517sEbPXQdFCX4ZYwW0ZFebfQCjn29mk+P7swkpGyU1VeQUwvOZXiRdW1KuLWk2fqmHDwqzeUbJL
	0CnO7ilUkgA0r9klkX4obxQRpudQF3jUC6HypGBgY7tEwKQ9skGPi8sf6oB222O2iwH5d8aI+0vWP
	Sf2Qkso37MUYY6M3E2yHf953bLkmkbpHCkN0aJ8wRRf+/6coqJPOzHa+fvQ6CepSshrRYzb5npEBe
	yzsUOGnR2LcrE3JZMsqzDWQCJXS/ToUDXV2rdyuvaVBEDsGXy5rtzWsxEuXfUxQg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vfNQn-0000000A1Pp-10Ag;
	Mon, 12 Jan 2026 20:18:25 +0100
Message-ID: <59cec65b29ded381c85d1be943d88e956a4b7e74.camel@sipsolutions.net>
Subject: Re: [DESIGN RFC v3] AP Architecture for Wi-Fi-8 Multi-AP
 Coordination (MAPC)
From: Johannes Berg <johannes@sipsolutions.net>
To: Abhishek Rajkapur Suryawanshi <abhishek.suryawanshi@oss.qualcomm.com>, 
	ath12k@lists.infradead.org, hostap@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 12 Jan 2026 20:18:24 +0100
In-Reply-To: <05381371a41f154058429f0a1079204c4a454f45.camel@sipsolutions.net> (sfid-20260112_201230_217667_8E744336)
References: <653a4207-38f8-408c-8067-c4960c11a71f@oss.qualcomm.com>
		 (sfid-20260112_195259_393455_5899DC2E) <05381371a41f154058429f0a1079204c4a454f45.camel@sipsolutions.net>
	 (sfid-20260112_201230_217667_8E744336)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_111828_956501_F5E0540F 
X-CRM114-Status: UNSURE (   9.27  )
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

On Mon, 2026-01-12 at 20:12 +0100, Johannes Berg wrote:
>=20
> Why do you always want to let firmware be in control of everything?
> Seems at least for some of this you'd really want the upper layers to
> control it for purposes of coordination? How does the FW even know which
> other AP it can coordinate with, isn't that something a network
> controller would determine?

A less generous reading of this could be: you guys want everything to be
controlled by FW, so you don't have to open-source it in hostapd. Now
you realize oops, don't really want to do all the security handshake in
FW, so we need to ask hostapd and then we need keys and stations and all
this stuff. So let's build something nobody else can use, upstream it
and we get the best of both worlds - others will maintain the mac80211
code for us anyway.

Am I wrong? Is there a technical reason for not simply doing MAPC
discovery/agreement negotiation etc. in hostapd as well, based on
driver/hw/fw capabilities, and then you don't need all these strange
"triggered by firmware" flows?

johannes

