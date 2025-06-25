Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35C7C7EE30
	for <ath12k@archiver.kernel.org>; Wed, 25 Jun 2025 11:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53IdKav1bU6blJHU1p31URhJ/rPqdZumRwC79AQrlgE=; b=4kfuB6y3TAJLAsY15HcOyxa+7c
	llOSgc0jfZi7OnxCfQ40NPmVDA9BJhZPm2SSKvodqjhm0JuZApsNRrO7jzJyV43mYnXeTYnwqtuLU
	lIMVnLQqUL7kj5LwXsHqP7aDOo6Qe2oV31gZTNf4pX3W8P52oOkAKQFjCvpZ6V9nuWxOGNnj9T5rg
	i0j7xknMNZ2vqUSHHG8BNOMV9zGDDtctGvzK+Ox5yinhkstHcuZlOY5TVk7nf1DG2goiZqulDY8do
	k/3plVMPEcLRziUK553fJgWmEKVKqAietiI9bZ9JLzzIRFYip3sGqRKShjNXG3N2sczKb2yYlyVzF
	+3eBxlrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNvo-00000008PWy-32kD;
	Wed, 25 Jun 2025 11:04:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMms-00000008CSq-20ar
	for ath12k@lists.infradead.org;
	Wed, 25 Jun 2025 09:51:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C082FA52067;
	Wed, 25 Jun 2025 09:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E48C4CEEA;
	Wed, 25 Jun 2025 09:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750845085;
	bh=nsyYLD5tEsSDiZwhTUu9p+LYrIKoWaOimwLJ+QPz3TA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dDu98FBIEG1MEJZdAQZ8KBO68A32+ex0scuqy993yoe1dLovihqHl1p3SaK0DxNLS
	 H14OHHGhXFYk5H6lrwkIy+OBNxaUwC5THfx7L57G9r/fpVQO7+k65EYcTfIRJyhFkl
	 KoXA9/G4qOdnX1bDCzLYiurrdTFtCRGVe7adiP26WCIQvVUVBorfgIG9CZzTkITyX+
	 uKFMSWsAu/7wKOu1YpxCdlJY3JMxrhZ14a40WS2F5VUHfXJ31UN68mYPz5GEp+VF83
	 9DXFvKip96+zJIWQB6PMJOf1R2c73l7as6m3t6JYfUEnoKpWKKLlobYGItXIxnhdS3
	 KxSXXNyAOv/Ng==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uUMmq-000000000eR-22uF;
	Wed, 25 Jun 2025 11:51:24 +0200
Date: Wed, 25 Jun 2025 11:51:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
	Gregoire <gregoire.s93@live.fr>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: install pairwise key first
Message-ID: <aFvGnJwMTqDbYsHF@hovoldconsulting.com>
References: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_025126_581286_49976B28 
X-CRM114-Status: UNSURE (   9.96  )
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

[ +CC: Gregoire ]

On Fri, May 23, 2025 at 11:49:00AM +0800, Baochen Qiang wrote:
> We got report that WCN7850 is not working with IWD [1][2]. Debug
> shows the reason is that IWD installs group key before pairwise
> key, which goes against WCN7850's firmware.
> 
> Reorder key install to workaround this.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=218733
> [2] https://lore.kernel.org/all/AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
> ---
> Baochen Qiang (2):
>       wifi: ath12k: avoid bit operation on key flags
>       wifi: ath12k: install pairwise key first

Thanks for fixing this, Baochen.

I noticed the patches weren't clearly marked as fixes. Do you think we
should ask the stable team to backport these once they are in mainline
(e.g. after 6.17-rc1 is out)? Or do you think they are too intrusive and
risky to backport or similar?

[ Also please try to remember to CC any (public) reporters. I only found
  out today that this had been addressed in linux-next. ]

Johan

