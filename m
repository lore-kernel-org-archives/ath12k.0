Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79639C021BE
	for <ath12k@archiver.kernel.org>; Thu, 27 Feb 2025 08:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7C+0lqY/EdZ414tGuEKVPpob8c2v9e2BIuDXx4PtYU=; b=Vhuon2h/ejY280RvcTRigtJHf2
	A4Z1uwYM/KUqKM5Td3bUOV43QkDCJHoy4IJRvqCDXDO4J+1/agQ0RL0+P7bO168lKvO+9XArjY2WL
	D64tHnFXG15A/ixAaeelhzRexmbvLR0RXpZjqwxx3luu5s55qt7K3fR9qtqlNlGooYO8niqM0X8R1
	mm0k2ls+lGObFsNZ6cy3tifeTaiXBhOc8WBlL6uf5DJ4XL7xLyK8shbaYrPogbsr8uvsEL0MigGar
	R/JP3MQ4hu5E26sElTnMFwT0XEJaIe7vmsvRNuhHW6gE7adFVDj7DXokf8ddUakz73qQBtAGh6KT3
	U8DgHyfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZSJ-00000006jEU-0z4X
	for ath12k@archiver.kernel.org;
	Thu, 27 Feb 2025 08:41:19 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZR7-00000006j14-2E84
	for ath12k@lists.infradead.org;
	Thu, 27 Feb 2025 08:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=h7C+0lqY/EdZ414tGuEKVPpob8c2v9e2BIuDXx4PtYU=;
	t=1740645602; x=1741855202; b=TVo0fduKTnEVjGV/YV7OJYugNXPR3TNShRCb/r9hrHxUlEW
	q0WUGhVMhbiAk0I9rWAtL/QVIPjL5b10Yxl0yFwFSyJLdewI+DMm6+UWNSe5CYyi8eaVNJLvP7Tn7
	JDUJO3ZNCl/iqZIxdtgAbDyIvOlEIuL96Z2x5POH0L2eQ3iD/31WKTetTXdC/RFvDqAzRSnPBUtY/
	9vmg4yO6mShNoZn2id+UOfLn/GPF2HbAPeyyc6lPy0cnTom2m9a2sBVMTUlIcrnGbFoH7HcLaGROr
	2+T53wpNWns5CBhXpynTw9l/40Vc+ELTOLmxuDqthJPqwKEmC4xKhdXMgLBDRj2g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tnZR0-0000000CV3L-2A77;
	Thu, 27 Feb 2025 09:39:58 +0100
Message-ID: <bac3fdc3bd39e45150e5b7d60be01b5d732a04bf.camel@sipsolutions.net>
Subject: Re: [PATCH v3 0/5] wifi: mac80211/ath12k: add support to fill link
 statistics of multi-link station
From: Johannes Berg <johannes@sipsolutions.net>
To: Sarika Sharma <quic_sarishar@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 09:39:57 +0100
In-Reply-To: <20250227045824.91480-1-quic_sarishar@quicinc.com>
References: <20250227045824.91480-1-quic_sarishar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_004005_586181_EE584B7A 
X-CRM114-Status: GOOD (  11.41  )
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

On Thu, 2025-02-27 at 10:28 +0530, Sarika Sharma wrote:
> Currently, station statistics are filled at deflink for both non-ML and
> multi-link(ML) station.
>=20
> Hence, add support to fill station statistics for the corresponding
> link of station.
>=20
> Depends-On: [RFC,v3,00/12] wifi: cfg80211/mac80211: add support to
>             handle per link statistics of multi-link station
> Link: https://patchwork.kernel.org/project/linux-wireless/cover/202502131=
71632.1646538-1-quic_sarishar@quicinc.com/

That can't work for the automation...

Also, even _with_ that, this series doesn't apply on wireless-next,
likely because it requires some changes from the ath tree.

Given that we want to run the automation now, that really means you need
to adjust your workflow to send only series to the list that can
actually apply on a single tree...

So I guess in this case it means you should split it. In fact I'm not
even sure why this is one series in the first place - the first patch
fixes an issue but it _doesn't_ introduce any API or anything that'd
actually be _required_ for the remaining patches, so it shouldn't be a
single series anyway.

johannes


