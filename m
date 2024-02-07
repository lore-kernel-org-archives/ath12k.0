Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163B7C4828D
	for <ath12k@archiver.kernel.org>; Wed,  7 Feb 2024 11:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTGqaMQhbo2iX3i0EYqp6cOiw8uoLRJfV4uaEOR8Uag=; b=4ip6hu6/DbUuNPaLe97YYxJHUt
	E7/i4zFv932OB9W0VcAOM6lOiqnlxqdqwufqQN3xzBLnHG5jxAx637pDY9H2fX4xqdjGT+rk9QHdj
	wbF99jOwRKkLefFdydqRMqWV+qc+sy2XK8OCjjK+LGDd2MKu9zoeMChf/EKjlGSJn/YLDnhKry9hx
	VJGnz7Bzgtj6x5SAUS2H5S3260fUGq1zegPzRIm3g77DQ9Mu4PL5BNgfdajQLq5nUP33NOUI46yFx
	D0BuxVBx3pLNdI96sf5Go9RoRV5WGTunYlra+iFmBa0wHyvCa2+G4tzwUe4BlaeU4F1Kn0UK5uR90
	DnbY0eEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXgC1-0000000AUxs-3HoZ
	for ath12k@archiver.kernel.org;
	Wed, 07 Feb 2024 11:34:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXgBy-0000000AUwY-1cNB
	for ath12k@lists.infradead.org;
	Wed, 07 Feb 2024 11:34:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A56361799;
	Wed,  7 Feb 2024 11:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2A9C43390;
	Wed,  7 Feb 2024 11:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707305653;
	bh=kzPaCB0sTA3tk0gwS+1UKQx8xv4Z0XE++dL4kqTEPec=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=AP00dMdDOhBx9FtryG+on9VOg4AyPnp6vT9ABQ1yRMRXtt25EpGR4EQijkX2A3GGR
	 L2c8at5kjUVUZian2CKxf6BqvSQQU3awCC3dKfo68JytgH8DQAX0Yz9kzFvLydnjfa
	 s/b4QybKx6jijMcVIiTpfM914pxmDIhmvH+d/kQbM86WTl/9mcZmSY48qmsPcqCB6k
	 9D0kGc4auQr3sXaSVdZ016rTt317TQTnoWNskM+VmSty2JAJxvTls7Tk44G8U8TIi9
	 r9+KeHOd3f9TOFXJv2izp+joPFuWD1oQfuowZhxd8P6apVA5WIC293CwFwfLFqEhcy
	 s6eK8nlHqVU3A==
From: Kalle Valo <kvalo@kernel.org>
To: david Atkins <david@3adesign.co.uk>
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Re: Multiple Qualcomm Hamilton cards on same host - none working
References: <LO0P123MB40577FE30E1B6D72A554624BD6452@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Date: Wed, 07 Feb 2024 13:34:10 +0200
In-Reply-To: <LO0P123MB40577FE30E1B6D72A554624BD6452@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
	(david Atkins's message of "Wed, 7 Feb 2024 07:08:08 +0000")
Message-ID: <87a5ocqzil.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_033414_493713_77C7C55A 
X-CRM114-Status: UNSURE (   8.23  )
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

david Atkins <david@3adesign.co.uk> writes:

> We need to run multiple wcn7850 (Hamilton) cards on the same host.
>
> A single wcn7850 works fine, more than one and all fail

Supporting multiple WCN7850 boards is a firmware limitation (and we need
some extra ath12k patches). If you can please submit a report to
bugzilla, easier to track that way:

https://wireless.wiki.kernel.org/en/users/drivers/ath12k/bugreport

> Logs from a working setup with a single card using Ubuntu 23.10.1 desktop install

BTW we don't support distro kernels as we don't know what patches they
have. When reporting bugs to us please use vanilla kernel.org releases
from:

https://www.kernel.org/

And even better if you can use the latest and greatest from ath.git
master branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/

And do include the output from 'git describe --tags' when testing
kernels so that we can exactly identify the release.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

