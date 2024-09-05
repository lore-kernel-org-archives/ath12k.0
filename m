Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A2BCD6E56
	for <ath12k@archiver.kernel.org>; Thu,  5 Sep 2024 16:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sW1EK/XcAglVymOrd0ta1krchzIQR7zxbGX0dcseqZc=; b=AuZTrVMF7FksqrkOaFsPaiOKeJ
	LsPoXHBFv+x/OX9KXuZEfYGg5Cut5g8HVc3DE4mo0N9YWxi9Zs7meDxWhNsN5zk1TGc7+lw/XQtdy
	wVI4R9FUr+IjgLBp07M4RIG9dJnvNNjZjvIgaHANHrU3Sae5PM8EJkCCaWMAGnmkvwq+aqDzE0PRW
	HBIImkdSQhzvhIS8mXigre09GzQAmHVIhxi+j6i1TUf6VZtlMmNkPkP/YIXcXbOfWZKra9UZpLgDO
	ovx5eYhx0+NLT/VKKhCzTwu8tYvkF0zMr6e1yKyCIwnGaTFY0VBz5ODfNY+2weVSDEcAUg4iM+rUx
	qzPtf7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFg4-00000009Bub-15Od
	for ath12k@archiver.kernel.org;
	Thu, 05 Sep 2024 16:49:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFg2-00000009Bu8-1FTc
	for ath12k@lists.infradead.org;
	Thu, 05 Sep 2024 16:49:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22479A446CB;
	Thu,  5 Sep 2024 16:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B41CC4CEC6;
	Thu,  5 Sep 2024 16:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725554985;
	bh=gOUAkgewpVDUJacIk/hhD/4iQglVJoqr44Ovm/akqe0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Jv5BpnxLCDx8ojnSea8cJT75bKa+e4knY4sXzaC6RJZQididZGVbb6gS+ohHWuc0b
	 S4CRmSg0Y/OdXp3/sIs2crWFMLjffxjKKfWVU4k2hiLTd8RWEIPDTkueg4T8SX3QXI
	 aETvhetgohLNUwtCUQGdReudoeDK/VjXoD2qrIwMSFrpg9ryOcM/ORnf1jgYfSGDgq
	 a39VBD901/rZlJ8vMEblJjC4R2vQM4hJGJV5bDtddMZ7/fLcOUKMu5Tl05BCt3E9dr
	 9zKRCh9ohAy6JopFjg4eKn+oy+kN8tCzLkw2zhMLpyiz9BQBLCPPSAdkn7YWuG4VRv
	 jnxc30Kk5gCcg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH RFC 2/4] wifi: ath12k: cleanup unneeded labels
References: <20240821153728.2121600-1-kvalo@kernel.org>
	<20240821153728.2121600-3-kvalo@kernel.org>
	<5ae832c0-8395-4d9b-a226-04255682c6d3@quicinc.com>
Date: Thu, 05 Sep 2024 19:49:42 +0300
In-Reply-To: <5ae832c0-8395-4d9b-a226-04255682c6d3@quicinc.com> (Jeff
	Johnson's message of "Wed, 21 Aug 2024 09:55:55 -0700")
Message-ID: <87plpihwpl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_094946_421632_54636327 
X-CRM114-Status: UNSURE (   6.87  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 8/21/2024 8:37 AM, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> After removing the conf_mutex in the previous patch there are no unnecessary
>
> nit: s/ no / now /

Will fix, thanks.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

