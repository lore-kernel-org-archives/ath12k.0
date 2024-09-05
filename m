Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E32DCD6E58
	for <ath12k@archiver.kernel.org>; Thu,  5 Sep 2024 17:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pa+4iqXq6UpKyOArhjqHrXDV6Luu4+2smejVe6pxViI=; b=YFV1EhsCXvcJwDGVpyax8JRfFL
	fU+3sLr2rZKGfkGjCRX/uhjflRVHR6zg/Tq/8C25KYe9UuuCD2zy9YHMMyKclTrYZSs/ooy9SJHXW
	aYzazM6Qsx7HeLCCNODDfVRcxpThar0AnmYCtEmXXH+p+DzQ6EHhHN6Ehb0up4MazHbYpdYAMaeFc
	HGd5LkCKC3b3CohkQesQzTe8U4SV9/aR46NvQxZ7QOLzBhyIjpE3OCcYIK7oIxPOTzlGYilGMKMVO
	i07Fsx49SL/E7um3Hq5TFzYrZyUyw2RwlwvCAEjOs0nyhIS3KQTcVzwaqyf3/uD9Q4RvBkzoAyQxw
	SCDjrvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFyn-00000009FJg-1Y7b
	for ath12k@archiver.kernel.org;
	Thu, 05 Sep 2024 17:09:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFyk-00000009FJF-3gvH
	for ath12k@lists.infradead.org;
	Thu, 05 Sep 2024 17:09:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E3955C5CFF;
	Thu,  5 Sep 2024 17:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8E6C4CEC3;
	Thu,  5 Sep 2024 17:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725556145;
	bh=pl/XcPdW5xGCe4Xaf6IHJrZowKmeZWKJqDZdnAgDuSA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Ku8D5v2hKxf0HMwFdftuVA4yhOjewDGtqnPoGsHFcmcV9VXUI32CvnYUEpXdf9JB6
	 XrUUV1J40SDumoTvhmVusbHUhAPWRkaiIvAp/CRZnLP63O3A0hw1oeRtH2AmXNx6Ky
	 Mid5tGoLFgcw01qG7dRA9rJDIpbHT9ACeSRkCFV0r4+NIM6aW2NA+uZPikc0Oz8Xul
	 hkxmhz7oAGWQsmJwej7sgtinBmqz5FJUYFLcITUerrChsZEaSvXqIShOObZ9B8VHuh
	 ePOXY9J7KEBkHX/UUrv3/Hi3kagAjQIJSPdJyPi7ScWVQZ0d7Hyzw4BXEdPAEdSNQZ
	 oX1oaKQHjN5og==
From: Kalle Valo <kvalo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC 2/4] wifi: ath12k: cleanup unneeded labels
References: <20240821153728.2121600-1-kvalo@kernel.org>
	<20240821153728.2121600-3-kvalo@kernel.org>
	<1605f1b7d2267444370af84c37a3856f6b158c71.camel@sipsolutions.net>
Date: Thu, 05 Sep 2024 20:09:02 +0300
In-Reply-To: <1605f1b7d2267444370af84c37a3856f6b158c71.camel@sipsolutions.net>
	(Johannes Berg's message of "Wed, 21 Aug 2024 19:20:05 +0200")
Message-ID: <87cylihvtd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_100907_002772_F80D8DA2 
X-CRM114-Status: GOOD (  11.27  )
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

Johannes Berg <johannes@sipsolutions.net> writes:

> On Wed, 2024-08-21 at 18:37 +0300, Kalle Valo wrote:
>> 
>>  	/* TODO: Recalc radar detection */
>> -
>> -unlock:
>>  }
>
> I guess this is the sparse warning, but I think this is an error at
> least in clang without removing the label or putting a ; after the
> label, so you might want to fix it in the same patch.

Good point, clang gives two warnings on patch 1:

drivers/net/wireless/ath/ath12k/mac.c:7560:1: warning: label at end of compound statement is a C23 extension [-Wc23-drivers/net/wireless/ath/ath12k/mac.c:8376:1: warning: unused label 'exit' [-Wunused-label]

I'll fix these in v2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

