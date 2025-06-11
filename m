Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA98C71134
	for <ath12k@archiver.kernel.org>; Wed, 11 Jun 2025 19:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9H0Ww5lmGaGfECqfT83dmaagSG0+b1DXzL6WMNSqqSM=; b=cQmUotZaKaBoY9HwrIK+5UA6sq
	IR6EV+fkKwKfTCJPRK8ngwrGG6wfiHoZxpsNXxkOrf6qfnWUBzEq4xxcCoeUneFVjpq2RKb4MFrg+
	lKly5tWWk+aGtOGGcwDJ5y307AMvRoOSOlRCkAOQZe1w0IpoCgtvJTALW1PRsfRas7SifpxAdkruT
	zbkAGvpeyROkL0JlYakX1mrjMCKvjBC8qfyJ1JorMICDdkeVQVSYiTOWvL/02TYmbzexjm76e8aDd
	wSILokDBTCE8Rb7JFuKqGrhIuqEgoaLZw2E8zD6Z9R2UolV2p0y23g9+n/Abs1gcPSE6xGrJnxQIr
	DCrr7JGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRXR-0000000B2fX-2oxc;
	Wed, 11 Jun 2025 19:55:09 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNFZ-0000000AMtn-0wbq;
	Wed, 11 Jun 2025 15:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=9H0Ww5lmGaGfECqfT83dmaagSG0+b1DXzL6WMNSqqSM=;
	t=1749655223; x=1750864823; b=Gys4Y9KHtMuGYVnCfgoU5Qetk4799RFJ+8CbxUBYrlpgnzg
	Rkb4wKmcnSNiYt1SSdAdUZ9pbRSYtX3R8beeg9p7uBnFPbYzLysxQoLw/9RQVnW3CpOgY6BxGr61I
	aiaN5xpLS4ihJZLpASzLhI5DxiEJYP3hK4l460IzBNiV80NTkUbPZF2x92EVz9WDm5J+ZCbtlhyV3
	FI+5viQPI+/kGxW8shOBa6vtt/fH8GHqNLiHbR6S4/FjbJJ6S+NnDkERhQsNLDIA8LqzJyQ8/HCd2
	AX6DNByjMyIUJX2vCDVgn6CtkbPoBdj0tAOVH+4HQefeO3Scs4OL7iUsAKcVjE+Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uPNFT-000000029JR-2xhO;
	Wed, 11 Jun 2025 17:20:19 +0200
Message-ID: <55613e9bc81cb0a17ce65df5ef71abe0710d11ab.camel@sipsolutions.net>
Subject: Re: pull-request: ath-current-20250608
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Date: Wed, 11 Jun 2025 17:20:19 +0200
In-Reply-To: <2ecbedb6-401e-4023-9eff-8123e2c90c45@oss.qualcomm.com>
References: <6574640b-a383-4c16-bbd2-710f362ed644@oss.qualcomm.com>
	 <2ecbedb6-401e-4023-9eff-8123e2c90c45@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_082025_263001_AC8CB6F7 
X-CRM114-Status: UNSURE (   5.90  )
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

On Wed, 2025-06-11 at 07:16 -0700, Jeff Johnson wrote:
>=20
> I'm accumulating some more patches for "current". It would be nice to get=
 this
> first set pulled so that I can cleanly fast-forward and apply the next se=
t.
>=20

Oh .. I forgot to push it out.

johannes

