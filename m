Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DE2D6ED07
	for <ath12k@archiver.kernel.org>; Thu, 21 Nov 2024 11:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZM07zNneVbctyJEg1kxPH2q9CrbqgvI7oM/g0ZHTanU=; b=KTutCQeeslfNo0sH5ychnjbZbP
	Uuo6On6jdvHxFsvZou1kFcgwL56YdfKPB5JpYupW/mj1sBv6wl/t3iA/kv1BFjdBp85zlLcBEaCDM
	vKAXny52uTinGCbLYVrZr0jeOeqPtwhLs2aGeHqwhTJmBNU0kJ2dhM9FE87i1w0gcFfS8L5fpSjiD
	VW2Cnp+gwOB40Eq9e0QDKBCaFmuyzXLoOI70DjoC75fXI30JG/D/v3sl33SfXEPkv+gLPGnihBqBk
	xwu8w7PryhBawYM59JDtRFOdKeBaqbjN7tqGcc+S6lhwmRNfcDR7ptTQ7gUzc7KmpjyTTM39uNWKY
	K7fNiR1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4yf-0000000HQIz-0I0w
	for ath12k@archiver.kernel.org;
	Thu, 21 Nov 2024 11:04:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4yd-0000000HQI4-0jfm
	for ath12k@lists.infradead.org;
	Thu, 21 Nov 2024 11:04:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1AB02A4022D;
	Thu, 21 Nov 2024 11:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93592C4CECC;
	Thu, 21 Nov 2024 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732187038;
	bh=Zxgv+ecXrDVr3PTa2TXTJxpypgiivusBtQNTTCpXyIk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=e2F8nz8ZPfXLMk1B3n/+Ji2Y1Ch1cJ/HLF9FbxAj+lOxVs5XHQI6LNIa/QSzLJt4M
	 3oAbrjH8SlAO5We3RwAXRqXN1cAIQKGKRhtxk9MNcU13z5dvfKQJLj81E98bUxOc0g
	 dgvoXbVa7KGsPLCDqP+iRwXVg+eJ+uVwjSKhDDtYWSky7hGaDka0dlExRGEN4h1JDQ
	 OaDB2e5+aCWZNAOeINzMebXzf3FEQjIpo9IFp+nec925YJy4i2vi4mKrDOgVM2svkg
	 +TmMynAOubn9BUvP7hSSd9zEUPdyw5n1RRQE5bd7kS/J5xAwcfI5z3Fhf03lwmgNNY
	 eT57ExQDfsMlQ==
From: Kalle Valo <kvalo@kernel.org>
To: Mihai Moldovan <ionic@ionic.de>
Cc: ath12k@lists.infradead.org
Subject: Re: [PATCH v6 0/4] wifi: ath12k: store and send country code to
 firmware after recovery
References: <20241017030927.1695-1-quic_kangyang@quicinc.com>
	<6fbd8b55-305a-4b22-aac2-9e5ca41993e6@quicinc.com>
	<696369d4-2825-4528-93d8-e732796de1c5@ionic.de>
Date: Thu, 21 Nov 2024 13:03:56 +0200
In-Reply-To: <696369d4-2825-4528-93d8-e732796de1c5@ionic.de> (Mihai Moldovan's
	message of "Wed, 20 Nov 2024 17:50:40 +0100")
Message-ID: <877c8wyhk3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_030359_274590_26C23C6A 
X-CRM114-Status: GOOD (  10.65  )
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

Mihai Moldovan <ionic@ionic.de> writes:

> * On 10/17/24 20:55, Jeff Johnson wrote:
>> This series looks ok to me, but it conflicts with the MLO branch so I'll defer
>> this until the MLO branch is merged.
>
> I can understand prioritizing MLO, but would like to point out that
> without these changes, AP mode is essentially broken/disabled hard on
> non-2.4 GHz bands (and even the 2.4 GHz band is restricted to channels
> 1 to 11).

But this is not a regression, right? I mean, has it been always broken?

It is very unfortunate MLO is currently taking too much of our time but
we should get that done soon, I hope. But all help (review, testing etc)
is very much appreciated.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

