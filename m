Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E51DCD11DD
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 19:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHi1NCcjgbQrsX909aBPkyDgJxO80H1X0GsrKc/s0qk=; b=P2n8ta8fkEMNqhO4bSmWsstdAc
	eE+FEsQQhnB374dWDQThRhXJzdhzk3J9uOTAFMR/shStGK1pxR24Y15gf3UFxGGdqFpkwlKZJGAew
	zuDF7h3M0ZjoPfuXTESLEyY8PPH/FUEFsfGcJVPcoeUOkmz/1GRfTMm4/bQtvD5EA/CrBf91z3OaP
	mP9GZvVnCI+sFQIg3MgUK1O/evyROZNTblCIkKJdgOQAq202qzShi1vOKTlhVcsmjhugxbN8+qXWK
	1+d77WDSqZW+3v0grH9HbK4q3jA/EyO3ulZlXGLlS/Oo+VctpOatQJl+WOzUFyAdqMJxfdEMuIPmn
	sL48k9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvUT-0000000FOTz-3sfF
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 19:32:45 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvUQ-0000000FOTO-2rax
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 19:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=HHi1NCcjgbQrsX909aBPkyDgJxO80H1X0GsrKc/s0qk=;
	t=1711654360; x=1712863960; b=RZRn2qb/HIv5TfuCmCKwR5O2g4iw+Oivyk8Gj0G2fc6fJPy
	ceNuJp2Z4T3zUZnEhBOmmdkfhBgNDGtqTYW8tR2d0dvMIoi6oH3A3wYN8THfeHTGwIbL+esodjL3b
	t4+6Jovc8vW8If83yrT5JsjFSMWeRmRLcy2/R7PNdniAp+rXSpUceJLDL9n1G6JpUrfGMFqBq13ht
	TDiHssggkER7pPm1r1TIgJXwVP44IML0rVU3rWrGCLf4oTVvTBs0XpGSAtZSnxn/WucfOhLBgpsuo
	Aztfm7DQJk+1kfp3Pi4gHD+W22v6S6MB7e2FtenCK39Nc855kVX5V73ArvK6Zlng==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rpvUL-00000001GkI-02Oy;
	Thu, 28 Mar 2024 20:32:37 +0100
Message-ID: <1e0e09fa6c1d4111f48aba93c1e16d906f5f89c3.camel@sipsolutions.net>
Subject: Re: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware
 channel capabilities to user space
From: Johannes Berg <johannes@sipsolutions.net>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, Vasanthakumar
	Thiagarajan <quic_vthiagar@quicinc.com>, netdev@vger.kernel.org
Date: Thu, 28 Mar 2024 20:32:35 +0100
In-Reply-To: <20240328115739.78ec5650@kernel.org>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-3-quic_periyasa@quicinc.com>
	 <6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
	 <9d5c2f9f-19b5-af4d-8018-1eb97fac10d6@quicinc.com>
	 <9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
	 <20240328114903.1d0c8af9@kernel.org>
	 <485ca445f0f0c47179a338df2538e74d520627ad.camel@sipsolutions.net>
	 <20240328115739.78ec5650@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_123242_818979_893B22D8 
X-CRM114-Status: UNSURE (   7.89  )
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

On Thu, 2024-03-28 at 11:57 -0700, Jakub Kicinski wrote:
> On Thu, 28 Mar 2024 19:53:33 +0100 Johannes Berg wrote:
> > I suppose we could even define a
> >=20
> > nla_for_each_type(..., type)
>=20
> That's probably a good idea for the kernel! We already have a bunch of
> the loops with the if (type !=3D DESIRED) continue, as you mentioned.

https://lore.kernel.org/r/20240328203144.b5a6c895fb80.I1869b44767379f204998=
ff44dd239803f39c23e0@changeid

:P

johannes

