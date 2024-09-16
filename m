Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F72C3ABB2
	for <ath12k@archiver.kernel.org>; Mon, 16 Sep 2024 08:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZqcnlsLJqjXmYvJ05qRNpVPNDl25zfeySVBi1qo0m4=; b=enCgY8PdFflwBGc7PNjXrpvCXH
	mI2vJwzNSK1MVpvccNex2gBuh8Fy1x8QNM6uaRx2MFDnlj2i1KDG8x3sTPzWX9Q4L6AOofI1faie9
	NrxV6UZoeVpqKVKmYRiLWhn//TdHB+fah4xAkZpaMxrBeLaAeOQl7zDQfcBQXLFSrhKLPVMlwrNDN
	9JphrNOlxghEmT2bmB4UEfUSFHWx5KcpAwVHc5Xsb5Tb3eZkHtxywf7kfm0Ycx0VpDQ0zxMYrxcVu
	kJN2dVTE3S9ipgoTE8A19Y1Id49SqYFCyMRB8GPN+h7E0mPHFRM3jQ+ozR5cSRzfZkIYYDPjsan/u
	CW/8YP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq765-00000003QVq-2Bqo
	for ath12k@archiver.kernel.org;
	Mon, 16 Sep 2024 08:28:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq762-00000003QVS-44Uz
	for ath12k@lists.infradead.org;
	Mon, 16 Sep 2024 08:28:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3EE5BA419FE;
	Mon, 16 Sep 2024 08:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0ADC4CEC4;
	Mon, 16 Sep 2024 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726475313;
	bh=XCBP1xoBGDEuQab2cXOiryeiFZLSAn77N8KmjwrQdOk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fgUNOLomUjdTKVVWTmo8IX3WvYh2SDFoh8PWeMyrFGH+1JWI7Z1tPy0LMElNTTDpG
	 WwsDQYWH00YTqy9oXtj6HSO+oFZYHR8atNS0e/xLxwCyv7M7XR577gUENtbh/eyv4n
	 4E/qdgAadwFIs5AUScZz1Wws5cHdM8hg4Ogtbmtx4viuzaKy4tjiIX595KiY0uRX4z
	 1qDa5NskxDerlAoKiW4O2FM9CeaxWVtSADsBcCNaFjOXB/qALL2ChFqlTW6LF/dcW2
	 JJ9CM5vkAxK03fVDY5HEQvgk1XvndBwY8oTiZydq4buZGHBYxRhuxzIP7fjTQJk5Ik
	 L8ZsTbEA5JEZw==
From: Kalle Valo <kvalo@kernel.org>
To: Benoit Masson <benoitm@perenite.com>
Cc: ath12k@lists.infradead.org
Subject: Re: ath12k driver on Debian 12 - High ping latency and MLO support
 query on 6.11rc7
References: <CAGHj7OK5tvjfUkb_oFMwk041mo_41WV0Uu-h2v_0_YQqjTrFyA@mail.gmail.com>
Date: Mon, 16 Sep 2024 11:28:31 +0300
In-Reply-To: <CAGHj7OK5tvjfUkb_oFMwk041mo_41WV0Uu-h2v_0_YQqjTrFyA@mail.gmail.com>
	(Benoit Masson's message of "Sun, 15 Sep 2024 18:30:18 +0200")
Message-ID: <87msk8dmts.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_012835_097313_F3FCB063 
X-CRM114-Status: GOOD (  13.62  )
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

Benoit Masson <benoitm@perenite.com> writes:

> Hello ath12k developers,
>
> I'm testing the ath12k driver on Debian 12 with a custom 6.11rc7
> kernel for an M2 QCNCM865 card.

You didn't provide any dmesg out but I assume this has a WCN7850
chipset. Please provide output from 'dmesg | grep ath12k' so that we
know what firmware etc you are using.

> While generally stable, I'm encountering two issues:
>
> 1. High ping latency/jitter:
> - ath12k: 3.5ms to 55ms (40ms jitter)

Is this from network to ath12k or from ath12k to network? I recommend
testing both.

Usually Power Save Mode causes latency, have you tried disabling that?

> 2. MLO support:
> - When connected via MLO, performance mirrors 6GHz-only connection
> - Doesn't appear to utilize all three bands
>
> Questions:
> 1. Are there any recent patches addressing the latency issue for
> kernel 6.11rc7?

At least I can't think of any fix right now.

> 2. Is MLO fully supported by Linux/Qualcomm for this hardware? I'm
> willing to test any proposed solutions or gather additional data if
> needed.

MLO is not yet supported. Once there is something to test we will
announce it in this ath12k list.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

