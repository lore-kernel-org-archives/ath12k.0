Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5140DC4345F
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+eupiIIC3zcFVNwOSflZiCwKLV+wdtCtjNUcI/UrXQ=; b=JABEvOnU1LvEoMyEl6LXT0xQxV
	zY1a57PrkKcUVwx6sSy1qYBsjDUe8fAUndi9jRio/PdZ08GBSf9P3JUlSR6i9wmbiNJDmZkjz22tZ
	Nc62q+htkZJU1SZ/R4NU/PqoVOqwPrZjw67ZnnRJQo18aDrB5/6slNFAZI/OfSJpp4nKv5lqk+Vvv
	iPGRKWI+jMJoXwr1QBlfPM5ljwqf6xoKe6bjn7PT3obeO8Ap7M758LOfCPpkZraD0vUVVfhUjydLQ
	Fa9OefpbDcCzHwPN/AqlyfbnwPVDgQmfc1OFnHiwtADaaLJKGvUV1k6RYc/cV9zFzNzLCLgMvPJgG
	LEzQ9pqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Pbo-00000002ZjM-2XLM
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 11:55:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Pbm-00000002Zi3-3Ghz
	for ath12k@bombadil.infradead.org;
	Mon, 29 Apr 2024 11:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=H+eupiIIC3zcFVNwOSflZiCwKLV+wdtCtjNUcI/UrXQ=; b=sswC/bsluWAs74bUhHArPBynOQ
	8joxUZDb/NoSXushtz8Eyf1FrFpjsd/jUox4X2wu3bfU/NxwIHS/3xFhybivSrvkbTZjgLQb+xkLn
	YJvAnq0mDYG9mi8tySrfRbYfdJ+Lpv5IjpmhyBj0AYjVcfPyYZP6BPC2oAy5amUwnYD1Bt/JBTg9Q
	lvzDcBYp1RCEU00s/jNVlMnDh4XfDK89IQa1MulmqZsgWQGkw//8Vwt2epVXtNGOahH0pGlqPosUd
	Qli24D7kIx1gs6H4xv4cjQekAyX9cRElElzIBFE4Unypt3lTwE+anisDsoWWdeziSxUkE29hq+ZDA
	Mdbsim8Q==;
Received: from dvalin.narfation.org ([213.160.73.56])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Pbi-0000000CN8x-0ubV
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 11:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1714391699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H+eupiIIC3zcFVNwOSflZiCwKLV+wdtCtjNUcI/UrXQ=;
	b=OfOWaGlsrxHQUtnjPxjUGxcgZl4smIQfKE9ivJdnbTn0x6uFS2VWkErWoe7ZZKuKT5BcO9
	HBumQi5kw/CsApcKqEqF3PogADmqGMtJQx4sNaVpjSu/B+lJvagcoyJGzF/X6hO4ZiaJrt
	PSwN4Tg0aCxCiGwypJfI2S6ISXOkktk=
From: Sven Eckelmann <sven@narfation.org>
To: ath12k@lists.infradead.org,
 Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: linux-wireless@vger.kernel.org, Sarika Sharma <quic_sarishar@quicinc.com>,
 Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Subject: Re: [PATCH v3 1/2] wifi: ath12k: Don't drop tx_status in failure case
Date: Mon, 29 Apr 2024 13:54:54 +0200
Message-ID: <2323473.ElGaqSPkdT@ripper>
In-Reply-To: <20240429114841.413901-2-quic_kathirve@quicinc.com>
References: <20240429114841.413901-1-quic_kathirve@quicinc.com>
 <20240429114841.413901-2-quic_kathirve@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4887899.GXAFRqVoOG";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_125542_566114_4E42173C 
X-CRM114-Status: GOOD (  11.04  )
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

--nextPart4887899.GXAFRqVoOG
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Mon, 29 Apr 2024 13:54:54 +0200
Message-ID: <2323473.ElGaqSPkdT@ripper>
In-Reply-To: <20240429114841.413901-2-quic_kathirve@quicinc.com>
MIME-Version: 1.0

On Monday, 29 April 2024 13:48:39 CEST Karthikeyan Kathirvel wrote:
> From: Sven Eckelmann <sven@narfation.org>
> 
> When a station idles for a long time, hostapd will try to send
> a QoS Null frame to the station as "poll". NL80211_CMD_PROBE_CLIENT
> is used for this purpose.
> And the skb will be added to ack_status_frame - waiting for a
> completion via ieee80211_report_ack_skb().
> 
> But when the peer was already removed before the tx_complete arrives,
> the peer will be missing. And when using dev_kfree_skb_any (instead
> of going through mac80211), the entry will stay inside
> ack_status_frames thus not clean up related information in its
> internal data structures. This IDR will therefore run full after
> 8K request were generated for such clients.
> At this point, the access point will then just stall and not allow
> any new clients because idr_alloc() for ack_status_frame will fail.
> 
> ieee80211_free_txskb() on the other hand will (when required) call
> ieee80211_report_ack_skb() and make sure that (when required) remove
> the entry from the ack_status_frame and clean up related
> information in its internal data structures.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Thanks for porting and testing both patches on ath12k.

Kind regards,
	Sven

--nextPart4887899.GXAFRqVoOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmYvio4ACgkQXYcKB8Em
e0bp6A//YzB2dprLEdV27QypAs5E3l/3pnIf+iSCoH0DuZApGLCt3IyS6Q6cLtMJ
6TuHe4995GhjVVmvD2p9g+MAfcD5olfJVFKB5QUb8wdgQtKwiSoDeKUkxVCM+1EM
TeHYdTcDBCJqnGwR06+BECdk+pWfh7zli3L/8UyLbCX3dlFGvaZAo1Hmu0N+nTbN
ALyc6PtyZPWOMYJTbZEBZ145BNHOW2adz15dDCdiSmcRcZLugmm6fDZwAwPadZkr
vthJ0yVR/yF+uMPrCH9mKa5fWVjV2GI6he1ioY+6GprJ5KOZzG5K3UGKdBrjydcZ
eGx+t8LZqc9wPU4TyaOG3S7IF4INLI0WaJFTEMAoyQEHQHzvP4OuR+YvAOtNqbvL
PJOA6HW68tFIZHidq+rVReOZirLhC7cdNV/iK/iyWremwJJX0mFT9OsIa5aIXzEH
Cn2O6sCHfKEgMZrsy0yRtLXcrmsakupqYyYnsjyHGZy35bPIbXDdFaE0TLNwLx1T
Y/1PNvOMlv1laH65Xzrw+W1IABsfiUIB7+ipCEchGljwR2rO9nXamaFoA2XjT5iz
OAoT5qe5UPxvHpssfFn3swT8ALsjVx7MuCbiWgvx86/CEbNnbL/f/+k4wkGLJPIr
TILIfybyNUutmbI6og9C7szeE0yzsX6y6/Y00JzEedI1Ui6m8CA=
=ZGBz
-----END PGP SIGNATURE-----

--nextPart4887899.GXAFRqVoOG--




