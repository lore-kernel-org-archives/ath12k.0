Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E200C67861
	for <ath12k@archiver.kernel.org>; Tue,  9 Apr 2024 11:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52K6ZsGlHshOaZhVpxg/PolkAJXc6RGy4HE4PA5BWrs=; b=A3/4fhIORHG7L75/yiBJiouGEa
	xh2vs2yEToLp0uuzpotYm9BqRJ/BU8jFaftNsBl+ONtzXt29W0Dpz5LzlmJAKkAaT/20PcKRGy9Gs
	zLV3mWGm7AY+fhVh/lLwrxY92adFRiw5sPE/Xg2pZLkeeK0lb/ZAIGMTQ1Lom5yk6OeDEKoHIQK26
	Bp4aI1vJzWzK3OZCwl/BmYxXr9TWrhLoC1pJ3B7vaBBoIgXLZ0Bd0IbwPmhrbtHM1OK2Ax6euTbva
	bl7jJ2M61I/9MdIOcklo6iOEosAf0lKUxAOXQA8EbGP+GBG9GWVEfbXX7BATSkVOA3ZsQcI4yi24B
	ZZq7uPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9or-00000001jU8-3BHx
	for ath12k@archiver.kernel.org;
	Tue, 09 Apr 2024 11:39:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9oo-00000001jSO-09Aw
	for ath12k@lists.infradead.org;
	Tue, 09 Apr 2024 11:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B803616AC;
	Tue,  9 Apr 2024 11:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1ADC433F1;
	Tue,  9 Apr 2024 11:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712662752;
	bh=52K6ZsGlHshOaZhVpxg/PolkAJXc6RGy4HE4PA5BWrs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=X7lF7Ui+Bfg2SJ+rdfvhr4yp/THmfMtSGethisFuz9zcMbWsFbpyJqjUrDgjgFoF8
	 uZ9SD3Wuvip/WO15vQAbn+OtUN6pfnzzbUqPsqkfXlqZPM7v+Dma+7tUHPXABOFILq
	 /l+B1bRY2eQtvb2twnkSQVJGRkYiELJvK2jaDMYdZ78VboO6OJCRQdcskS/2g2xDAa
	 klKB5RyovbgqZ+Vu8DLuS12X1gYiRRMl8BN+p/h/LqB61Jc2iJ8rnR/IuUyZJvmGsR
	 FPEx3Pj1y6AAbHNpbVAIh+w3kYKhSFSorD2IedyQqf82jPi6PbpdRWH2BQFRvxPqQf
	 2IzfUiwRQGqqg==
From: Kalle Valo <kvalo@kernel.org>
To: Gregoire <gregoire.s93@live.fr>
Cc: ath12k@lists.infradead.org
Subject: Re: WCN7850 disconnects and reconnects in a loop
References: <87ttkc1dkp.fsf@kernel.org>
	<AS8P190MB1205F5A75A6569B2E6F6C02687072@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Date: Tue, 09 Apr 2024 14:39:10 +0300
In-Reply-To: <AS8P190MB1205F5A75A6569B2E6F6C02687072@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
	(Gregoire's message of "Tue, 9 Apr 2024 12:49:33 +0200")
Message-ID: <87a5m222ap.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_043914_199698_BAAA60CA 
X-CRM114-Status: GOOD (  10.33  )
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

Gregoire <gregoire.s93@live.fr> writes:

> I've found a workaround:
> I had to add
> [General]
> =C2=A0ControlPortOverNL80211=3Dfalse
>
> in my /etc/iwd/main.conf
>
> And now I can connect and I don't have this issue anymore.
>
> are there any plans to avoid having to add this option in iwd?

To make it easier to track this I recommend filing a bug to bugzilla:

https://wireless.wiki.kernel.org/en/users/drivers/ath12k/bugreport

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

