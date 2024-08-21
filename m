Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EBDC52D6F
	for <ath12k@archiver.kernel.org>; Wed, 21 Aug 2024 17:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrSqzDct6naNhYKkMWoPVa7Redj5XZraa4GKg9pZnL8=; b=esRJ2ScYaq5E2fAt+Rm7gIs5bX
	ph0P0uX2+KGImXDzyifRcO7/VPHdHWsipXOH4LvZiT5DnFhLeTuoL1C8XmJkWPF+kx1yLHZ/MElfB
	zhzdoAHw8fO8giJHLpJf2iXL/T066ufCD8smqWOcyZK0+fGrQRqWuAmKG5Y+DoYXDfcpfKcp/JB7p
	7QNKl0MpMEa4owA0ULC09BAhMaGJe7pr9fveVMWmBLu1vLVLe1ZE50UGdwaOdI9p8qOBAJandgjnb
	y2HtyJhszN90VWTj3mzXWgcWOdbou9CjVsJwRSbTt68kxqkvFh50mMI3ohYBQhBKlMkyUwt0ZIUna
	BHZu4eRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgp0I-00000009twt-0051
	for ath12k@archiver.kernel.org;
	Wed, 21 Aug 2024 17:20:14 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgp0F-00000009tuR-3zvm
	for ath12k@lists.infradead.org;
	Wed, 21 Aug 2024 17:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=JrSqzDct6naNhYKkMWoPVa7Redj5XZraa4GKg9pZnL8=;
	t=1724260809; x=1725470409; b=yRfk3/aZ0W6H8uJ+FmZfzUnvfZOuENi/y0WVsujYOf9x9B7
	mcSYSAUGode2k54hLadcE5Tj0lm0eW8WGbfkc+jcmXBOM12/iyiuh3Q73QfLbTarQJ/VjjMnNYZUK
	EdzIRN4Flnhv00Z0WtBglG2FtxmN3KLMuOW1QtBGIvI3D2k72FOV5/3bVg2FSKs7ajuxAbdJJysYK
	XOfh3tYHJmBqoDbmQ1DhDQDo0vo2cAF9UCxoxdt/eUWmacu/HodBUYNCJPT32XL4s7DN7YSN7del/
	Y+aQ4spHFQ0TyQ15zL+yJ1MHEtWmb90n6i887+F+jh0zCi6AlxbjZLH/CHFNYOzA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sgp0A-0000000BDCq-1sxc;
	Wed, 21 Aug 2024 19:20:06 +0200
Message-ID: <1605f1b7d2267444370af84c37a3856f6b158c71.camel@sipsolutions.net>
Subject: Re: [PATCH RFC 2/4] wifi: ath12k: cleanup unneeded labels
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 21 Aug 2024 19:20:05 +0200
In-Reply-To: <20240821153728.2121600-3-kvalo@kernel.org>
References: <20240821153728.2121600-1-kvalo@kernel.org>
	 <20240821153728.2121600-3-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_102012_009985_9187499D 
X-CRM114-Status: UNSURE (   7.54  )
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

On Wed, 2024-08-21 at 18:37 +0300, Kalle Valo wrote:
>=20
>  	/* TODO: Recalc radar detection */
> -
> -unlock:
>  }

I guess this is the sparse warning, but I think this is an error at
least in clang without removing the label or putting a ; after the
label, so you might want to fix it in the same patch.

johannes



