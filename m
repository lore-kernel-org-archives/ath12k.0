Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669A5ECE564
	for <ath12k@archiver.kernel.org>; Tue, 10 Sep 2024 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXq+ZcFe+uGF0qCrxYiYGxfjiCAC1RobJ6ZdNP4DdEY=; b=XWfyJy+yBEAUdlVukGqSZXIphL
	qOu01vzS7yREF5PHq/7IvyOiaQc0y0IR/XV/DEd7/Du2d0DYwMr2TmIo+c92a97pjRS3gupWdPUBD
	2u8p41qnlNLk77uIFhVDbMMWnO1Pz7Mo1Cs3AWoVfFXKJkNtzd5pr8pmGHPF33yKwTW33ODfNMBPV
	/13eJjOsjZqRZvdaA4v9jD6t8C5PX/be6gHfEJJUrgQ7KGZNhOQ5LYtgfYoIJS9ff5u/tKIGVvov+
	jvosN9OyFmvpHfezFxy7iYx0r/zQn6BlJupf9PQKrpBXRKxgIhrsHdT/PUfXlmN6XmrmsozotIBlX
	cMHsK57g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snzDo-00000005Q7G-0aUC
	for ath12k@archiver.kernel.org;
	Tue, 10 Sep 2024 11:39:48 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snzDk-00000005Q5v-1bWn;
	Tue, 10 Sep 2024 11:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1725968381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NXq+ZcFe+uGF0qCrxYiYGxfjiCAC1RobJ6ZdNP4DdEY=;
	b=o+Fo7BfDSVouUSQY03qg/6AK+OlXK3bfrIHp1yKtYB7K8ErGjrCXk31FwDVBJnMle/PugM
	0dn+8zS/4GAoqnfkWr1/JMmfUp8hebpCreiu7nZy9iVej8EeJ8AaiqX/CLlfEzhoHqyJCm
	zckQNnWNXsc51WacwLyPsHgPPCO0fgA=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org,
 ath10k <ath10k@lists.infradead.org>, ath12k <ath12k@lists.infradead.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Robert Marko <robert.marko@sartura.hr>, Kalle Valo <kvalo@kernel.org>
Subject: Re: New staging repos for ath1*k firmware
Date: Tue, 10 Sep 2024 13:39:36 +0200
Message-ID: <2248097.72vocr9iq0@ripper>
In-Reply-To: <87h6ang8v3.fsf@kernel.org>
References: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
 <3772134.MHq7AAxBmi@ripper> <87h6ang8v3.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2659000.7s5MMGUR32";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_043944_593090_0F418338 
X-CRM114-Status: GOOD (  11.34  )
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

--nextPart2659000.7s5MMGUR32
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Subject: Re: New staging repos for ath1*k firmware
Date: Tue, 10 Sep 2024 13:39:36 +0200
Message-ID: <2248097.72vocr9iq0@ripper>
In-Reply-To: <87h6ang8v3.fsf@kernel.org>
MIME-Version: 1.0

On Tuesday, 10 September 2024 11:23:44 CEST Kalle Valo wrote:
> As there are so many different branches I have lost track, do you have a
> list of missing firmware updates? We could try to push for updates on
> our own end as well.

Afaik, ath10k is missing various security updates - but I don't know the 
firmware version which has these security updates.

ath11k is missing the 2.9.0.1 release - which seems to be still required to 
get various APs working correctly (without a crash). Maybe Robert Marko has 
the newest firmware version (not the file - the version) somewhere.

Afaik, there are even newer ath11k versions - for example for IPQ9574 (which 
is completely missing at the moment in the repositories).

For the completely missing ones, I've submitted following list to QCA:

* ath11k/IPQ5018_QCN6122 (that might be rather complicated due to the way how 
  QCA designed this)
* ath11k/IPQ5018_QCN6122_QCN6122 (that might be rather complicated due to the 
  way how QCA designed this)
* ath11k/IPQ9574
* ath12k/IPQ5322
* ath12k/IPQ5322_QCN6432_QCN6432 (sounds a little bit like the QCN6122 
  situation)
* ath12k/QCN9274

Kind regards,
	Sven
--nextPart2659000.7s5MMGUR32
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCZuAv+AAKCRBND3cr0xT1
yzNMAP4vOWz42pBBdfOi7bFUKqGG5FMHqf+B0fLQbv2d2diGhgEAkyF9prdNC8k0
RX1aJrl/aoFbyY944ujcUZwra+h5ew4=
=2o8c
-----END PGP SIGNATURE-----

--nextPart2659000.7s5MMGUR32--




