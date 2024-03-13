Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31698C54E66
	for <ath12k@archiver.kernel.org>; Wed, 13 Mar 2024 16:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5VgZ4sVo+32qjIlgEb9gMJ+qtOEmXni3Yh5d1+FR5U=; b=ms7ONfDExxborNIHNt5WZl/2YO
	GgeIFVT5wNNwuRs5oel1b3Va6tDgVL+tgn3xLOuijYpFy8aNcN4XT7FG/JxYxrLoH6fV6LffSc4kl
	0SHpKkIrG+sMuKIq1xM4dPaAbMAaGnrqs2InJ5Bw8Wy4lwhz4ITE7qriC5Ti3TyzsNC5/TzMDgBxz
	090ElR75BEYDQB/Et74GzOn9mfEDN19g7eUdAj7qZnHt2w7lxQ1+lfriqCZh85PVMZQ5mON8OKCkP
	LsEnyLEZOq2z1Pyvdpv0GEy5VQfDB9lWBOrFmcy6a1KtM0lwOdhhVBT/tAVg56kl12gp4zhrFvPFZ
	x/5FG/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkRwL-0000000AtgL-3kAr
	for ath12k@archiver.kernel.org;
	Wed, 13 Mar 2024 16:58:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkRwJ-0000000AtfL-2y1i
	for ath12k@lists.infradead.org;
	Wed, 13 Mar 2024 16:58:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7FA62CE1B45;
	Wed, 13 Mar 2024 16:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A80FC433C7;
	Wed, 13 Mar 2024 16:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710349128;
	bh=iWmS2Spgv1Gr93S5/dBCQwU7XXs/+racpo5Z0qjdcOM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=R9+UVPHDlgOeLelpwakkprs8Z4KeTK82X9TwrOfFkkLbTOUchIIj5x4DgSRkLDOZ/
	 NM6GlgXWyedip6qYiT/zHvQI19NViamWFRZh44NMTyDbngJYTqUKXpzRopv3wZIB70
	 0w2DBRuvlAJ2OUVXrsZC5FKz4bJpVKo7Zix4wWDgdTDAmepoZNNyjjz+pNmdKxfpc7
	 HE7gwH/SRkTchmzf5KwOzz6ROwlYm3UbZtD7HaTiAGtru55KB5FhdSXtK129/aNfHf
	 4dg6YMexRZvDXQHQ9wV2NCI7fXKPKazdeh0KE+Yn0M/AZa61EfTF0dxTPUyd9Ra4an
	 ytgV8LW3w9VAA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Subject: Re: [PATCH v4 01/12] wifi: ath12k: add multiple radio support in a
 single MAC HW un/register
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
	<20240312135557.1778379-2-quic_ramess@quicinc.com>
	<4a527729-2bf8-47ce-8275-d36b76bde95c@quicinc.com>
	<3178cf8c-d328-4fe2-b3be-f5c4c908f20f@quicinc.com>
	<605a673e-3686-47d0-b71b-1e314fde65db@quicinc.com>
	<87il1qf571.fsf@kernel.org>
Date: Wed, 13 Mar 2024 18:58:45 +0200
In-Reply-To: <87il1qf571.fsf@kernel.org> (Kalle Valo's message of "Wed, 13 Mar
	2024 18:48:50 +0200")
Message-ID: <87edcef4qi.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_095851_958210_80719CA6 
X-CRM114-Status: GOOD (  12.63  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>
>> On 3/13/2024 5:57 AM, Rameshkumar Sundaram wrote:
>>> On 3/13/2024 3:23 AM, Jeff Johnson wrote:
>>>> and guess we have to figure out how to suppress the ath12k-check issues with
>>>> this macro
>>> ath12k-check complains about the reuse of ah and index arguments which 
>>> may get evaluated multiple times if its an arithmetic expression, But 
>>> areas where we use the macro in our code aren't doing so.
>>> Do you have any suggestions here ? or shall we go back and use this 
>>> for-loop inline.
>>
>> The macro makes sense -- we'll need to update the overrides in ath12k-check.
>
> IIRC it is possible to avoid variable reuse in macros with typeof()
> operator (or something like that). I can't remember the details right
> now but I think there are examples in the kernel code.

Here's the GCC documentation with an example:

https://gcc.gnu.org/onlinedocs/gcc/Typeof.html

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

