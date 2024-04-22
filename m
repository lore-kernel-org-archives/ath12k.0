Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BC2C4345F
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 12:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRLzMwNQWqifkcuyXpkJSk8uAE5GgMNVcKcMgl/Fd3k=; b=Nicht0/I1L5S6r6WftD1F2iXav
	nPIiHV1q98rs7uBE9B0uehk3SITHynNRKBOnHciNuiDkw9VitDWydwlYHMhWaDKqx7iR2xP+HlZcJ
	sVMk4c14jDWcPKu5Q4yPeOtLj8PK6506pBxTx34HwXa+oY2HwqrowO2A/r7ELRW1hqlcuh9SzRcx1
	rbqXTQ2aECHc7eZhqmZTW2so38bPJ63tiOW9EQ+o82MXSu0yJwn3KioVSaLUIbEjfoVlzHXBWvw6F
	ZiS+JahmcAyLYFQUiUdoiF761tdZjT/HNz89FXBs3ShqqTp8q4O2qeQfglryEg6RvxGxbn/5/+kJh
	q0m92/2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysPu-0000000DRvQ-3GSr
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 12:05:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysPm-0000000DRu4-1hSV
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 12:05:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4FB9CCE0A20;
	Mon, 22 Apr 2024 12:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74930C113CC;
	Mon, 22 Apr 2024 12:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713787490;
	bh=LEi8KqD0QT1mRT0jXH4fKgSapV5rZlrnBHIDJq5K6Ig=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tP9jtSeh7zHs4pnN3EebOqPrYYI55XYr4T/a9WLwb92P28kd62/gFPr+hOuI84hfX
	 KHM0NK10+JArt/ZoKj4MiArc2fahxeAua+Q4QivS9384LC28U01wlIKjEtAkb4mYIj
	 6cwpISC565Utuua1QLgQJbwe/ubjUzORQDWd74jCjuaaRVIT6pc3PeWvB8xx0VzHpP
	 3GMszWzEUrcpLYZvETB3PJdOcuA4TpJXHiP+vXM6GA4oec3mqqwhbr+8eo6KnjrA83
	 jYz/H806d/qXZc84gCLmfiRKgeZuNAn0E6jgt/qFPZ2Q+/IBzLAH9W1krwvxP0f49/
	 9lPaVnUNEbESg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] wifi: ath12k: Refactor data path cmem init
References: <20240409151415.1226109-1-quic_periyasa@quicinc.com>
	<20240409151415.1226109-5-quic_periyasa@quicinc.com>
	<877ch4z0z1.fsf@kernel.org>
	<6ac588c2-6206-c12e-e741-cbc507365bc3@quicinc.com>
	<823fe8a6-1e6c-49e9-a225-2012e77093ac@quicinc.com>
Date: Mon, 22 Apr 2024 15:04:47 +0300
In-Reply-To: <823fe8a6-1e6c-49e9-a225-2012e77093ac@quicinc.com> (Jeff
	Johnson's message of "Thu, 11 Apr 2024 08:20:38 -0700")
Message-ID: <87y195vc0w.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_050454_868461_5F19629C 
X-CRM114-Status: GOOD (  17.39  )
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

>>>> +	default:
>>>> +		ath12k_err(ab, "invalid descriptor type %d in cmem init\n", type);
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	/* Write to PPT in CMEM */
>>>> +	for (i = start; i < end; i++)
>>>> +		ath12k_hif_write32(ab, cmem_base + ATH12K_PPT_ADDR_OFFSET(i),
>>>> + dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET);
>>>> +}
>>>
>>> Here's a good example why I don't like functions returning void. How do
>>> we handle the errors in this case?
>>>
>> 
>> sure, will handle the error case in the caller.
>> 
>
> this is a static function with one caller. the only error is the default case
> which will never be hit. adding logic to return an error and then check it in
> the caller seems like overkill. why not just WARN() in the default case since
> this would be a logic error with newly added code?

I think the software will be more robust then all errors are properly
handled in a uniform way. For example, will everyone notice the warning
message? What if the function is extended later and then the person
doesn't add any error handling "because it didn't have that even
earlier"? It's also a lot easier to review if error handling follows the
same style throughout the driver.

I didn't do any measurements but the overhead from this shouldn't be
that large, maybe few bytes in the binary and few new lines in the
source code. I think that's a reasonable price to pay from having more
robust software.

This is why I want to avoid void functions as much as possible. Of
course there also are good cases when to use void functions, like here:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=6ef5b4c9598c928b3e2c4c4b543c81331941f136

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

