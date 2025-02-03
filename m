Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54647C02197
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 18:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Trv5tWHJjz9G5MdDBDu3lKXjzQ8ZzNcEXXP0q7b788=; b=jbSUaS3M7VNJoPlnaKsBgSbVyH
	gpaef/bFVGsFJNpO/6ZtiTNBhldO5gF79pI2Z0ZdFftHe2nnvJGrOphiI4R29mCWkZSHj2Encgu9n
	n+4FtdSgUQCd+v+f/kBk2QrQymU6rbWUO3LPsnvycfROjiPt9uSvDNTxV4Jou7AhgX0lpDguntp0M
	jLdNUIThlsAm/Z/KZXKwZzvzQjZWVjNtZUE/u/8XOofxlJiF0WOiUgVmsMlzU8+HN15037tegYM3O
	MvxYHPVau/aZ1eSGSKPvaux0ODD7jdV8TSF1rLQ9bBidFewpsQPCtFhhkCh1zxYXxg6IeAZvbUfZH
	7LYxFUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0tm-0000000GDYw-0LRf
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 18:10:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0tT-0000000GDUq-0kUg;
	Mon, 03 Feb 2025 18:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 34B175C67C5;
	Mon,  3 Feb 2025 18:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93691C4CEE2;
	Mon,  3 Feb 2025 18:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738606197;
	bh=+FKLzDimaPYEkaWKrluNJjbsGd9rpbxlDEGIsfJb+rM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a1u0/WIfK18ypI3VwLM77yHsNhwEv9KmpcdUcQcJ4+//gcTPtZ8apHwa896QGv2Bi
	 jz5B44eXyIDTQD7hzCDFoHr5wfvOMsWM02f7Vwgj1XUao2q4UyIZQeExI7D7kQWdWa
	 u2IIiUQO7ePjqEtPxxvGmHBS+fm97TQ+JDhwPrqTGv0Xf8n8T/Iqb4y7u90Y9xZf3d
	 OMTbARzHyOR4CKe31U+vnI5tp+9SLpNSJ0q1J29wGm2wyPtWceRUCEchgIpFrY8gv9
	 WFrLoEw/WjVYpBs0gBRpEA82GtzGHAMsBuofoRv9MHtP9g6X7RdrgYgIe7l1iCupTH
	 9PwZQHAgGJEKQ==
Message-ID: <f21d8994-5acb-42d8-87c5-bb7ad4f52c0d@kernel.org>
Date: Mon, 3 Feb 2025 10:09:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless 1/2] MAINTAINERS: wifi: ath: remove Kalle
To: Kalle Valo <kvalo@kernel.org>, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250203180445.1429640-1-kvalo@kernel.org>
From: Jeff Johnson <jjohnson@kernel.org>
Content-Language: en-US
In-Reply-To: <20250203180445.1429640-1-kvalo@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_100959_262164_2A911EF7 
X-CRM114-Status: UNSURE (   4.97  )
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

On 2/3/2025 10:04 AM, Kalle Valo wrote:
> I'm stepping down as ath10k, ath11k and ath12k maintainer so remove me from
> MAINTAINERS file and Device Tree bindings. Jeff continues as the maintainer.
> 
> As my quicinc.com email will not work anymore so add an entry to .mailmap file
> to direct the mail to my kernel.org address.
> 
> Signed-off-by: Kalle Valo <kvalo@kernel.org>

With much sadness, and a bit of anxiety...
Acked-by: Jeff Johnson <jjohnson@kernel.org>


