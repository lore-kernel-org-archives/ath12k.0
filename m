Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A1CC47258
	for <ath12k@archiver.kernel.org>; Wed, 17 Jan 2024 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOwGgA7CuNK/bgZgI9jpUuqpi4lVV0FTcpx+xraXjeM=; b=ohuijkFdhs4YPTS3XiF0ZZDYkh
	J+uQ3uFDaY+tIGOKpct/9HaSZ4plz8ZFaBJLsqrWyePghRJbJnEbtIHaUfDXzG13maW1Vl+0ji9ft
	7vF5HxvfPaWxL00kWDueeH/OOAUwW6w8zznA4sVgCUb96zPeKyBVeZOSc8vCspsvCIBa/wXBijqVO
	brM63FUJHOiSWY8SVR7d+HqpCP1b3Pkpww6nwNtZeacnsfc9JRfpT3CiarEisXMqP8n2drKgS6aQl
	V2ONgD1gAzhA8J+tQ6OPSo/VkPs9dyY3BqYNS2WozgbstdWoBYri62hvrz/bs8vRB8tAt3Bo4TyiZ
	Q3lJd8VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ4BT-00FUYE-22
	for ath12k@archiver.kernel.org;
	Wed, 17 Jan 2024 11:34:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ4BQ-00FUWQ-0c
	for ath12k@lists.infradead.org;
	Wed, 17 Jan 2024 11:34:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 81B53CE1BB4;
	Wed, 17 Jan 2024 11:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482F1C433F1;
	Wed, 17 Jan 2024 11:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705491249;
	bh=pPKNBBEMNaE9AOSgKnLD5IFuAu+Lw4zwpaYb11q4AVA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pKe5wN71vM4bB7WDKT0WaRco/mNR34Tqp/fHZmTNulsVlXkC+Tb53d1kEP7xxXMpi
	 BRx8UP6+Mdxp8PlU1b+AIjmwkZaq8L8Sv2Vx4flgabItKJfxA8IxOoCjYCJarPh/UU
	 j0KBFtvPWrO47wVvuCLimvAV5MQL7LEIWaIAAhemyG1iEta/nyKS1UHAJsst3ucIo+
	 4NVPvUkm7RjF5s8Tfc2z90vFgLoKxORMjkbps2IwYkvwnL61im9XqrsZalWy67TluV
	 2c5RdBwjWWCWxrI+2zbjyGyjqAX24GPdVjpb4RaX5lpfzWSSRQdNzeEsU4sTMosJQS
	 qcwygC9ofc9rA==
From: Kalle Valo <kvalo@kernel.org>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v7 0/4] wifi: ath12k: implement some functionalities
 through reading ACPI Table
References: <20231013114434.81648-1-quic_lingbok@quicinc.com>
Date: Wed, 17 Jan 2024 13:34:06 +0200
In-Reply-To: <20231013114434.81648-1-quic_lingbok@quicinc.com> (Lingbo Kong's
	message of "Fri, 13 Oct 2023 07:44:30 -0400")
Message-ID: <87ply05h3l.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_033412_431297_3E9F91EB 
X-CRM114-Status: UNSURE (   8.43  )
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

Lingbo Kong <quic_lingbok@quicinc.com> writes:

> Through reading ACPI table, implement Time-Average-SAR(TAS), BIOS SAR,
> configuration of CCA threshold and band edge channel power functionalities.

The coding style felt more like for a vendor driver style than upstream
driver so I made quite a lot of changes, too many to list. But for
example I did changes in naming, code compiled only if CONFIG_ACPI is
enabled and whitespace cleanup.

The updated patches are here:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=98dbc0c37b480117959221cafa6326e54667a53a
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=c3d84c46ff4029fdfe15036be4f0a0d1839d31c6
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=04ec37eb823d9d9cba01531a938c53e8a142486f
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=fdd99edcb8ce2433fd243b5ae1b57668eab48ef0

I still have at least few things to do which I'll try to do soon:

o find a correct place to call register()&unregister()

o move wmi functions up in wmi.c

o consolidate wmi functions into two functions? (duplicated code)

I'll let you know once I'm done. As I don't have any device with these
ACPI settings I would need help with testing.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

