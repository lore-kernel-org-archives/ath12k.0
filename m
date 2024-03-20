Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA5BC54E58
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gyl51L5YnMG8XOwnU+N6uQKoOsZ6YYUkn5KfjJ9fKhI=; b=CilkMC5yTM2y1qfzpesshcb5ui
	zomWKvWGs6gVWP11CW62klwYo6xctf65ntoq+1Q0Ut6ZFj8eCYhz7GkdrU6Y16y9+Z7pn9aLyAUWN
	pO9LFiOZc89BJvHsOJDalKXOxX6IEMh3PPXWb47IezEflfniqqmHpOexKHg9Ad7vU8txPVRG3xIux
	8+JAivbqUGCkR3eMur2uVd3C/Jmtpnob4+pRbrfHosYReLa1GAPR3gI9+MYZXByfF2XnY7JzBqr1R
	XnT5R2OqgGAnV7y3ziBm7x0lt2qaj+0p6Hmu3dzZ7jIIrXrpZ8b2uMRAwsB8VPU4s+4KU+dnapldI
	uUt1cNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmyh9-00000000HUO-0mxH
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 16:21:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmyh2-00000000HOr-1L5g
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 16:21:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EDAD5CE1177;
	Wed, 20 Mar 2024 16:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53ED4C43390;
	Wed, 20 Mar 2024 16:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710951689;
	bh=vTs7t4xU5VMTH40s70BaU2pClrhkQhFRClxkaEd26q0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Z3cJKaAJTSoOVOUzwBUdKTavQYFGkR8W66/D62ILgLaIUa4dPVvl718TX2A82Rl6c
	 FQD084yioiGXLapdVzZ6ckJTyYS2CJ3baEorjsgGfgf5zVvnMnxRMq+xeyVa0/QqpW
	 WEDlyEMa5N+vlSX4zxny3CHX9I3qa+70nVVPbmiZWm1Vk5Gd1VGVUB13qA6TOiJfH4
	 1YEOHe1JsPpHOHaTy+UY8daPAmqqisiBzSFyMilhkBNPWQD9UjcWlb1U34v7thMM8p
	 AjY/uA52h/G8X4kNxOS0HIyGVQsr3RsSucbNIfeX98mQ5qWiaCFbQ6opIUsj4HHBm9
	 WQrixVskqoJIw==
From: Kalle Valo <kvalo@kernel.org>
To: "Owen Mesh." <owen.mesh@gmail.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath12k@lists.infradead.org
Subject: Re: ath12k: driver does not show tx bitrate
References: <CAHohoUjGROZ=E-D_qJp3S6dLUwA-PfAWBCU7pAkPVBJqkG=QQg@mail.gmail.com>
Date: Wed, 20 Mar 2024 18:21:26 +0200
In-Reply-To: <CAHohoUjGROZ=E-D_qJp3S6dLUwA-PfAWBCU7pAkPVBJqkG=QQg@mail.gmail.com>
	(Owen Mesh.'s message of "Wed, 20 Mar 2024 18:47:56 +0300")
Message-ID: <87sf0kan7d.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_092132_706527_9630F87C 
X-CRM114-Status: UNSURE (   6.02  )
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

"Owen Mesh." <owen.mesh@gmail.com> writes:

> I found a small bug in ath12k driver with wcn7850 adapter.
> ath12k driver does not show tx bitrate.

We are working on adding it:

https://patchwork.kernel.org/project/linux-wireless/patch/20240219095802.1147-1-quic_lingbok@quicinc.com/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

