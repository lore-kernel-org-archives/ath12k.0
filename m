Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CEDC54E5D
	for <ath12k@archiver.kernel.org>; Mon, 18 Mar 2024 18:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUoUwYuSwcJwDYFapI/L/yFIXHDPIxBHDbh+DhXtQOA=; b=vowimTglRSulc4DNMlc86g9KnL
	i5QeyhJz8O9m4n+Q8ghwSwzaYw3gUuAyOKT3kyIfYmmYid+ELdchw/eSpOz4sTeLsEa7qygYw0Epb
	/P8zB53r4pOaQuKtBqu0oURwFo4IS5XmHFLVQgsTWRrkYW3MBM17p2t4OhTfpMGoUkbcJFy6ubyZ+
	UKAXyI9cCCDpAt7EnzkPPidwvX+P10Jdy4GAm20j0QQiG/zcTEUG2MC5QMRKU8zo7aWg/ePbDxjGS
	FaDjDpUooYMuKI/qlntuWTMj4AIWsFyZklVFBp4LNKt2PmoRbyhiVJiVjexYOHEiXDy7SqKyVzvnc
	aWmGA/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHqP-00000009gzm-20xK
	for ath12k@archiver.kernel.org;
	Mon, 18 Mar 2024 18:36:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHqL-00000009gyu-3Rpo
	for ath12k@lists.infradead.org;
	Mon, 18 Mar 2024 18:36:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D65C60C6D;
	Mon, 18 Mar 2024 18:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FFEC433F1;
	Mon, 18 Mar 2024 18:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710786976;
	bh=qTUvLzwfd95RoXDB01Ll9lSqEOSRkGN4C5oDdatz7Z4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=XfUAskPtE0e0Wf6CQwqcgngxOar//CiR5jn3je3Vmy95isM/3c7Ghfcp1M9m46Gpt
	 vl+TVAcKMhro10d+pkQIHhnMPrBXzAHcxDoa0wkK+VMnT5Il2GwtO629ypmFdp7see
	 HpZ3C/P7b9cV9nMhTMb+S24hoKZpN0WhiL8C1ZEQ7pLwD2NdCrRd+4BExMJ1S+H4Nx
	 5pvfwSR+aVPDYi6fZNXAX/gU67c5YhRP1gpsRH3QVEJHN1o/tkTKq0C0GvOYRu1UFz
	 XjDEBj0XD3MOobAEgKOXbKVSAAaM0Faweih7hvptIDmIF5nrKyAbCQvoqZfbIBtBQI
	 PLUNZhspUMbig==
From: Kalle Valo <kvalo@kernel.org>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: Jonas Gorski <jonas.gorski@gmail.com>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  Karthikeyan Periyasamy
 <quic_periyasa@quicinc.com>
Subject: Re: [PATCH v4 01/12] wifi: ath12k: add multiple radio support in a
 single MAC HW un/register
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
	<20240312135557.1778379-2-quic_ramess@quicinc.com>
	<4a527729-2bf8-47ce-8275-d36b76bde95c@quicinc.com>
	<3178cf8c-d328-4fe2-b3be-f5c4c908f20f@quicinc.com>
	<605a673e-3686-47d0-b71b-1e314fde65db@quicinc.com>
	<87il1qf571.fsf@kernel.org> <87edcef4qi.fsf@kernel.org>
	<f768cfec-d20d-424d-85ef-3576434aca12@quicinc.com>
	<CAOiHx=kx03MKKyMcJPxYPZH=E7krZwfsDqq2xnow8qRB7D-aqQ@mail.gmail.com>
	<f542dbeb-debf-4335-9d49-4d12510f8bb4@quicinc.com>
Date: Mon, 18 Mar 2024 20:36:13 +0200
In-Reply-To: <f542dbeb-debf-4335-9d49-4d12510f8bb4@quicinc.com> (Rameshkumar
	Sundaram's message of "Fri, 15 Mar 2024 01:08:56 +0530")
Message-ID: <87zfuvbd5u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_113617_976861_311B4F0A 
X-CRM114-Status: GOOD (  18.49  )
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

Rameshkumar Sundaram <quic_ramess@quicinc.com> writes:

> On 3/14/2024 1:26 AM, Jonas Gorski wrote:
>> On Wed, 13 Mar 2024 at 20:18, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>>>
>>> On 3/13/2024 9:58 AM, Kalle Valo wrote:
>>>> Kalle Valo <kvalo@kernel.org> writes:
>>>>
>>>>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>>>>>
>>>>>> On 3/13/2024 5:57 AM, Rameshkumar Sundaram wrote:
>>>>>>> On 3/13/2024 3:23 AM, Jeff Johnson wrote:
>>>>>>>> and guess we have to figure out how to suppress the ath12k-check issues with
>>>>>>>> this macro
>>>>>>> ath12k-check complains about the reuse of ah and index arguments which
>>>>>>> may get evaluated multiple times if its an arithmetic expression, But
>>>>>>> areas where we use the macro in our code aren't doing so.
>>>>>>> Do you have any suggestions here ? or shall we go back and use this
>>>>>>> for-loop inline.
>>>>>>
>>>>>> The macro makes sense -- we'll need to update the overrides in ath12k-check.
>>>>>
>>>>> IIRC it is possible to avoid variable reuse in macros with typeof()
>>>>> operator (or something like that). I can't remember the details right
>>>>> now but I think there are examples in the kernel code.
>>>>
>>>> Here's the GCC documentation with an example:
>>>>
>>>> https://gcc.gnu.org/onlinedocs/gcc/Typeof.html
>>>>
> Thanks Kalle for the references, as Jeff mentioned below, we need to
> reuse the arguments since we write to ar and index arguments on each
> iteration.
>
> Defining local vars using typeof() without limiting their scope (since
> we are defining a for_each iterator{}) leads other issues like
> redefinition of variables in functions where we use this macro more
> than once :(
>
> Also even if we somehow manage to convince check-patch, we'll still
> end up evaluating index and ar arguments in every iteration of loop.
> This just gives an impression to check-patch that the macro is unsafe
> (although logically its not).
> Experts, what is the standard we should follow here. Please suggest.

Yeah, typeof() won't help here as we can't create a local variable. Or
at least I can't come up way to do that safely, ideas very welcome.

I think it's just best to ignore the checkpatch warning for now, unless
better proposals come up. ath12k-check has functionality to ignore
specific warnings (see checkpatch_filter array), I can add this warning
to the array.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

