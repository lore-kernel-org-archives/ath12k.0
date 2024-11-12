Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462FED32D8B
	for <ath12k@archiver.kernel.org>; Tue, 12 Nov 2024 10:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deX+X5OyhVUDqiBpAZK797O8AG/MOqswSou/CCpIm9M=; b=nBLhrQKTCDNrf+BjtCN7OSsJUU
	qv+7OzBQwtCZ2PZxQbUxy9K8srd8Tv/MjG07r62w0/WCt/OnQkNWZ4tqcwUFeWcv9V1CJPBHsHFYJ
	D+X44RZXESu8iTF9PykK7zY5KIYWe+ABMwr5BYhtr8mTjSZJHm+JRSbigvCqsgUriVgIo+FN5COa/
	rK3tbfFhXJhpJBJKN5gV7xAhDXNBh6YCtaSm04BWKrq4Sx3KlLtjZpvV3hcN0SDuW5Ia3uhmvLSYe
	ZchV82V3P3qtLw387SWKO0a1Np15iPUrMiqbopyC4yeEgdq1bLiveEN2AKgRkyKObarm2NqJMIUJo
	7016/p6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAo4F-0000000320M-4Bts
	for ath12k@archiver.kernel.org;
	Tue, 12 Nov 2024 10:24:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnuL-00000002zez-2eXL
	for ath12k@lists.infradead.org;
	Tue, 12 Nov 2024 10:14:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA63E5C554F;
	Tue, 12 Nov 2024 10:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9068DC4CECD;
	Tue, 12 Nov 2024 10:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731406440;
	bh=JOL53HhCG+jCAg5RprMfpeMshNGT3dJE9VpaSRZ3Q2I=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=k8Z7EnP8E4ROUfNXBXvCffHzpj7zHij1LE1EdzZ+b7eh6cX4QIXc3ZuYLmzKIWQPg
	 swvfUWWdc2zCJi8gmXYVVbUhOcGTfDXXIuyfhDN6rLOJcJYRgRvt4ikBMlFn3ccK77
	 wGoO6bfHuXRgf9gBHstXKHGixFf3OXnIVQnHrNN0+dLiFA+Goo8hUw/yXbMKimkhgc
	 qo1C8hz/kev96vmhcFXb2Y70OiSbEqdvfdWda2i7OvZQqXjZLve3dYvbNRwmdJ1wU2
	 bKcQYkrGxqr3wDDwJCKG6E5ezMcb+vssse06CDjeVjGnHFXDjByg4qCwMrXIVT2xE4
	 wXhgMtY8zMRHg==
From: Kalle Valo <kvalo@kernel.org>
To: Karol Przybylski <karprzy7@gmail.com>
Cc: jjohnson@kernel.org,  linux-wireless@vger.kernel.org,
  ath12k@lists.infradead.org,  linux-kernel@vger.kernel.org,
  skhan@linuxfoundation.org
Subject: Re: [PATCH v3] wifi: ath12k: Fix for out-of bound access error
References: <20241105101132.374372-1-karprzy7@gmail.com>
Date: Tue, 12 Nov 2024 12:13:57 +0200
In-Reply-To: <20241105101132.374372-1-karprzy7@gmail.com> (Karol Przybylski's
	message of "Tue, 5 Nov 2024 11:11:31 +0100")
Message-ID: <87frnwwyhm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_021401_732462_74F47BBD 
X-CRM114-Status: UNSURE (   7.96  )
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

Karol Przybylski <karprzy7@gmail.com> writes:

> Selfgen stats are placed in a buffer using print_array_to_buf_index() function.
> Array length parameter passed to the function is too big, resulting in possible
> out-of bound memory error.
> Decreasing buffer size by one fixes faulty upper bound of passed array.
>
> Discovered in coverity scan, CID 1600742 and CID 1600758
>
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>

I assume you only compile tested this, it's always good to mention that
in the commit message. But no need resend because of this.

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

