Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB1ACE7CF6
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWiHPKG7nokALxIXNWo90CDuihS1uRVjJN6sjqrRzx4=; b=tVXXTpjwIxp44NHhhGiF+0RTeK
	w4rG2RRYTKykPoFr/4TUlCe9zYozA9jmJ1qib/kiLHS/7nRpbwYWxjnt8wLQ2EuafLhtU8IyurkSh
	HWTj/Z4PYsq2tgylUpgNI9yD/BhhtJgZdfxNqQZyYZdgCBC+tmoOg45ojrv2HjJmalk6fNltmRW+b
	StAFA4yVh5bmsJVZHj4MedKpbzB6B9VMvW4XsIOHxy/4M0JGzMghKkFOePwcqIZH5ecywXZSJdoZP
	yHAJFz1dzjTz3nPANRfAw3c0kvtGlAjBph0wN+ojCg63T3KTJnC4xnbJBVmx78Xp8cnB9q/is14N4
	Yff98NWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svYMM-000000024I6-2xry
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 08:35:54 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svYEz-0000000232M-2VMF
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 08:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=eWiHPKG7nokALxIXNWo90CDuihS1uRVjJN6sjqrRzx4=;
	t=1727771297; x=1728980897; b=OdgWFqllnoE+kGqIAnQK1lpfK0Fa8qCpaHW7uTat4xTlHoZ
	5NLAFOUNNFQTuvv45dTuWqUNkc/IrI3v3LO9BbRDO6EzKzM9VcO6v6Vu6mu492hQiELB7Di/IF3yu
	qy16X1goo9EHfQZ//Ee9eLN3aCAT8V7hz0rPSx/PENdc8l9y958u1L3+wMGE/eMxz9P5PuznTr/Ih
	K9/oCbyS9D5gZJBYB7rzRY7rA8xR1kvzB0S0bzkiMjzCivUYTI4QfcOnrNycR0ufIjtZaH8R/1cT8
	nOBPYNYaFgNp9mqrF2gJaSVjHtmDOmYNDtdsXuERJZBSpOIpsb2pQ7rWgbqmhgVg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1svYEw-0000000Efym-2LfX;
	Tue, 01 Oct 2024 10:28:14 +0200
Message-ID: <d66a63e31e55249bc88faa5731abb2859fa2a940.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: fix assigning channel in activate links
From: Johannes Berg <johannes@sipsolutions.net>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Tue, 01 Oct 2024 10:28:13 +0200
In-Reply-To: <39b73ddd-5478-4599-a92b-00b274d2ce02@quicinc.com>
References: <20241001041518.2236297-1-quic_adisi@quicinc.com>
	 <0353d31db76afbd5d9bb2e7d42246ae3c8e14044.camel@sipsolutions.net>
	 <fd731cac-7182-4de3-afd4-0fc5892a9440@quicinc.com>
	 <c103db90ed53a75cae10baba0ae52dae85bf1c3f.camel@sipsolutions.net>
	 <5fe9fdf2-ae5c-4d15-a095-0203a814e4ba@quicinc.com>
	 <16ad03533ab6aca65c3fe9db94ae53ad11fdb9d1.camel@sipsolutions.net>
	 <39b73ddd-5478-4599-a92b-00b274d2ce02@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_012817_654293_CFE736A9 
X-CRM114-Status: UNSURE (   8.66  )
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

On Tue, 2024-10-01 at 13:56 +0530, Aditya Kumar Singh wrote:
> Yes please that would be of great help. Let me send a next version=20
> having the changes as discussed above and then you could pick that for=
=20
> testing and let us know whether it is working as expected by Intel driver=
?

Sure. I suspect it'll work better if you do the ordering as you had
described in the comment.

> It would be better if other MLO based drivers could also test this? I=20
> mean if possible they could also test and let us know if this breaks any=
=20
> of their expectations! Or if not test, at least ack this change?

I guess they'll just have to speak up here too :)

johannes

