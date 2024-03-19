Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F28C6FD1F
	for <ath12k@archiver.kernel.org>; Tue, 19 Mar 2024 16:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhQ1Cx52fdlhWCQ7Y100sxJZR3YCJfSLoeqDBDgxTu8=; b=WVLfu+GtSXRzgKBLOCNZzjK1pU
	Hiyi3jbe+8IRPb5WQsNeWon46+Fcxlxqu3ekzxJhEi+SOQHrWaBviRhrzE5VKd0EOCk6Rfe32meUi
	7/kJJ51/NKzePYqHhvd0j9xsboeQ8ArtF5pGVhipdCEpY/9z1uCVJ3lEDclLD4aeoE63tbQ2CKm9s
	0zQ26zMMbkkQDUPVyd46u12lFRqWfHrbZSz/Teei1PedO3WjzMaLzOfiln5a2a8U2vKh5kbiF483/
	GNLoxLvlge4XKymIhgC29AFozLDB5Y0/GZRsgyNf+OucQjD89vGWwHXCcsL8sQqx5JVKx+5H7G5r8
	IDudk/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmcZZ-0000000DSWt-2wLV
	for ath12k@archiver.kernel.org;
	Tue, 19 Mar 2024 16:44:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmcZV-0000000DSVu-3KZK
	for ath12k@lists.infradead.org;
	Tue, 19 Mar 2024 16:44:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5F333CE0EBB;
	Tue, 19 Mar 2024 16:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CA5C433F1;
	Tue, 19 Mar 2024 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710866654;
	bh=BhQ1Cx52fdlhWCQ7Y100sxJZR3YCJfSLoeqDBDgxTu8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZcFwo+8yzt83BDjt2w3N5cCgflUR6SodzRnTahJMG9bZxc+FDVacu3Xt+sMtgvukW
	 ml16TFCOjQwNpR2PTnGGSaVQKFChRhbMo2vCBGQLADSzgpcIqafsc1EDz3579moeUH
	 m4LBBQ2RRnu3y8NKoXv0+YoKQQm8oUhRd7ppQUVHHxEiY2ebmKqh/1+h3JGsYdj6wo
	 ipw5jRSWuNxcENaxydIX+Dck3GJtqBBm/aEAI6kuBehmfN3HJGaNff7VUyOwbCLOeL
	 FJqtOwLKwyGiaoNW+lVJzpWvvZ/yhyrufXqp7zAQV6S3TCYG9d+gemnfu3U2//qUEq
	 I8RvwAwh0hySQ==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/3] wifi: ath12k: Optimize the lock contention of used
 list in Rx data path
References: <20240226162310.629162-1-quic_periyasa@quicinc.com>
	<20240226162310.629162-3-quic_periyasa@quicinc.com>
	<87msr4gbps.fsf@kernel.org>
	<33d25f11-d54d-6161-383d-d3823d5f6d19@quicinc.com>
	<874jd3cszc.fsf@kernel.org>
	<1e9c36d9-0a2a-e458-a727-9630746b24e7@quicinc.com>
Date: Tue, 19 Mar 2024 18:44:11 +0200
In-Reply-To: <1e9c36d9-0a2a-e458-a727-9630746b24e7@quicinc.com> (Karthikeyan
	Periyasamy's message of "Tue, 19 Mar 2024 15:07:50 +0530")
Message-ID: <87il1ib290.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_094418_216899_56958514 
X-CRM114-Status: GOOD (  16.02  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> On 3/18/2024 11:39 PM, Kalle Valo wrote:
>
>> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
>>
>>> On 3/11/2024 6:35 PM, Kalle Valo wrote:
>>>> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
>>>>
>>>>> When a packet arrives in Rx rings, the RX descriptor moves from the u=
sed
>>>>> list to the free list. Then, the rxdma ring gets replenished, where t=
he Rx
>>>>> descriptor again moves from the free list to the used list. At the en=
d, the
>>>>> descriptor came to the used list with unnecessary list movement. The
>>>>> descriptor used list is maintained in the Rxdma ring structure, which
>>>>> creates lock contention for the list operations (add, delete) in the =
Rx
>>>>> data path. Optimize the Rx data path by removing the used list from t=
he
>>>>> common Rxdma ring and maintain as a local variable in the Rx ring han=
dler
>>>>> itself, which avoid lock contention. Now, to find the used list descr=
iptor
>>>>> during descriptor cleanup, we need to check the in_use flag for each =
Rx
>>>>> descriptor.
>>>>>
>>>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>>>
>>>>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>>>> Before looking at this in detail: When optimising something it would be
>>>> good to have before and after numbers showing the improvement. Otherwi=
se
>>>> it's just wishful thinking.
>>> I don't have numbers. Like you said, Its just a wishful think.
>> So do you still want us to take this?
>>
>> In the future please do provide numbers to show that the optimisation
>> really helps as intended. Otherwise we might even go backwards.
>
> This is a simple UDP UL throughput test case results on x86+NUC device
> with QCN9274 card
>
> Before:
> Average:=C2=A0=C2=A0=C2=A0=C2=A0 CPU=C2=A0=C2=A0=C2=A0 %usr=C2=A0=C2=A0 %=
nice=C2=A0=C2=A0=C2=A0 %sys %iowait=C2=A0=C2=A0=C2=A0 %irq=C2=A0=C2=A0 %soft
> %steal=C2=A0 %guest=C2=A0 %gnice=C2=A0=C2=A0 %idle
> Average:=C2=A0=C2=A0=C2=A0=C2=A0 all=C2=A0=C2=A0=C2=A0 0.24=C2=A0=C2=A0=
=C2=A0 0.00=C2=A0=C2=A0 12.54=C2=A0=C2=A0=C2=A0 0.08=C2=A0=C2=A0=C2=A0 0.00=
 23.33=C2=A0=C2=A0=C2=A0
> 0.00=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0 63.81
>
> After:
> Average:=C2=A0=C2=A0=C2=A0=C2=A0 CPU=C2=A0=C2=A0=C2=A0 %usr=C2=A0=C2=A0 %=
nice=C2=A0=C2=A0=C2=A0 %sys %iowait=C2=A0=C2=A0=C2=A0 %irq=C2=A0=C2=A0 %soft
> %steal=C2=A0 %guest=C2=A0 %gnice=C2=A0=C2=A0 %idle
> Average:=C2=A0=C2=A0=C2=A0=C2=A0 all=C2=A0=C2=A0=C2=A0 0.34=C2=A0=C2=A0=
=C2=A0 0.00=C2=A0=C2=A0=C2=A0 4.60=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=
 0.00 19.59=C2=A0=C2=A0=C2=A0
> 0.00=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0 75.47
>
> is it fine to capture in the commit log ?

Thanks, exactly something like that helps to show that the optimisation
is helping. Please also include your analysis of the results in the
commit message.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

