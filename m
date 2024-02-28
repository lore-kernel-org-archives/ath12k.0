Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244A8C47DD9
	for <ath12k@archiver.kernel.org>; Wed, 28 Feb 2024 11:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJrFYkiimenby7scTrSNqW73fAngxJIhNfdjHTfbjKs=; b=A+YzpRbbshbBhjZmVvyrCUknIp
	J/oekU8dToilJ1tU2iebx/TQPdj3Bsn22X9n/aSfid6oDLgmhPtU/cA1iLix8azGXM/QW4jNhVno4
	dbh/NpZ59XhZmtGUgJKrNOeRWn0aqOQiCzqNDZHaRzTGMSZJlDjcjazq7XRKUbnJfUf2IDRjEwDmG
	vrGKNbS2kJElhou02xiFGmN3zAVWNMlkLa3rI8L+U0nskVgAnR6OFmJDTOIuwU6Oz4xHKDisXVs2v
	oPH2/3CdbuD4AmeX7FUYetmO1TI3ywD2VjgMKhc1xpa9RHdtPsqXJrqSSQwo7E+r9n8WGjwfByH4n
	qoNR/Rsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfHnS-00000008vUq-3672
	for ath12k@archiver.kernel.org;
	Wed, 28 Feb 2024 11:08:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfHnQ-00000008vT6-02XN
	for ath12k@lists.infradead.org;
	Wed, 28 Feb 2024 11:08:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B79CA617F4;
	Wed, 28 Feb 2024 11:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3170C433F1;
	Wed, 28 Feb 2024 11:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709118497;
	bh=nWtnBXCOiEAE6N6Poj4iIqORASAy4SEX/HILGhosxcc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ldM6SftM94+WBTcIHvtV1+O/g/2o4pqNh1cJp7NIfJcR3hdGjOlEoiwZaEB3c5BMV
	 bWF49fDh/3V51206KFURxf9jmNd432ncovy1DVQfr0RlEf9XDzWue42CCt9oTgKCnN
	 iVaO9InonOJ8sFfXW5uPqeU5mHknbh19D6OkAc/R5TIFiitGaVV6BZeRfRvmh13cIm
	 6HzUEZNUcfSG3L76gbxIGkagEaeS6YC/pRc2LF1mXnH6XLVNrbVbzRKSYHKMVMdTFW
	 PcYFtJlxWpvXRP/bRypIv2Nb79TLEXs0sl1DP7HyKedZYf7ijtkwPaDkuk5cU1cK8u
	 BG+HdD3HUzeog==
From: Kalle Valo <kvalo@kernel.org>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4] wifi: ath12k: report tx bitrate for iw dev xxx
 station dump
References: <20240219095802.1147-1-quic_lingbok@quicinc.com>
	<87y1b7jkxu.fsf@kernel.org>
	<6f39eb1c-97f7-4029-a5f2-5ab36ff0f0a6@quicinc.com>
	<877ciq9h3e.fsf@kernel.org>
	<4e67118d-80e4-422e-aa39-73b891ee6042@quicinc.com>
Date: Wed, 28 Feb 2024 13:08:14 +0200
In-Reply-To: <4e67118d-80e4-422e-aa39-73b891ee6042@quicinc.com> (Lingbo Kong's
	message of "Wed, 28 Feb 2024 15:21:30 +0800")
Message-ID: <87a5nkkfs1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_030820_193907_A413EDF5 
X-CRM114-Status: GOOD (  15.14  )
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

Lingbo Kong <quic_lingbok@quicinc.com> writes:

> On 2024/2/27 21:23, Kalle Valo wrote:
>> Lingbo Kong <quic_lingbok@quicinc.com> writes:
>> 
>>> On 2024/2/26 23:37, Kalle Valo wrote:
>>>> Lingbo Kong <quic_lingbok@quicinc.com> writes:
>>>>
>>>>> The tx bitrate of "iw dev xxx station dump" always show an invalid value
>>>>> "tx bitrate: 6.0MBit/s".
>>>>>
>>>>> To address this issue, parse the tx complete report from firmware and
>>>>> indicate the tx rate to mac80211.
>>>>>
>>>>> After that, "iw dev xxx station dump" show the correct tx bitrate such as:
>>>>> tx bitrate: 104.0 MBit/s MCS 13
>>>>> tx bitrate: 144.4 MBit/s MCS 15 short GI
>>>>> tx bitrate: 626.9 MBit/s 80MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0
>>>>> tx bitrate: 1921.5 MBit/s 160MHz HE-MCS 9 HE-NSS 2 HE-GI 0 HE-DCM 0
>>>>>
>>>>> Tested-on: WCN7850 hw2.0 PCI
>>>>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>>> Tested-on: QCN9274 hw2.0 PCI QCN9274 hw2.0 PCI
>>>>> WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>>>
>>>>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>>>> Please use full englist words like transmit instead of tx. Also the
>>>> title could be simplified to:
>>>> wifi: ath12k: report station mode transmit rate to user space
>>>> Here I assumed this only works in station mode. Or does this also
>>>> support AP and P2P mode? The commit message should explain that.
>>>>
>>>
>>> Ok, i will apply it in next version. Thanks for pointing out.
>> After rereading my comments maybe keep the title simple like:
>>    wifi: ath12k: report station mode transmit rate
>> But it would be good to clarify in the commit message what modes
>> this is
>> supported. And what hardware families support this.
>
> Hi kalle, Could you please offer your opinion on this commit message?
>
> wifi: ath12k: report station mode transmit rate
>
> Currently, the transmit rate of "iw dev xxx station dump" command
> always show an invalid value.
>
> To address this issue, ath12k parse the info of transmit complete
> report from firmware and indicate the transmit rate to mac80211.
>
> This patch only applies to the WCN7850's station mode.
>
> After that, "iw dev xxx station dump" show the correct transmit rate.
> Such as:
> tx bitrate: 104.0 MBit/s MCS 13
> tx bitrate: 144.4 MBit/s MCS 15 short GI tx bitrate: 626.9 MBit/s
> 80MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0 tx bitrate: 1921.5 MBit/s
> 160MHz HE-MCS 9 HE-NSS 2 HE-GI 0 HE-DCM 0

Looks good, except for readability I would add an empty line after "Such
as:".

I noticed that the signal patch depends on this patchset:

https://patchwork.kernel.org/project/linux-wireless/patch/20240219111417.1185-1-quic_lingbok@quicinc.com/

In that you should submit both patchses in same patchset. But please
wait until I have reviewed the signal strength patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

