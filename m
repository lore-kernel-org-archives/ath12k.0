Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D8FC19F4F
	for <ath12k@archiver.kernel.org>; Fri, 26 Apr 2024 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dLohxwrmKgRDmw4a+e1NbQs8+ywqrx+CdH1UDUV2Fc=; b=Mn8vMHRMYpNWHSVKmFAclWcgfP
	guBKg2WRDf3pwUkk04OFgiA48yjA2VpNoTFLqJUiCne3bcIf7bxv3HumTlOPPPZnz3gwLeRYZT6iV
	ZsXaU7n2h++/lhkjm+Gw3vRZ/2dtgtmJJ2IzjmVO+/bru8tH58+4XqHn8obOhXLn4NbLWG4MgoARh
	xs2BGyXuut3CGWCfFwXlVZd9V3MgU8n+IKgKfesuLBKpEm+8P7R9Ng3VwS2hD+81u8WH/u1drPNDk
	FSMfth1u7kJdYtbKtue0TmtrfdFIQPx9KPKbS4JVMRHCCRZ5/saqJzbYZBgdgUQLXLnvt1AI9zWmO
	iVzbiXQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Jgs-0000000CKqQ-2uyO
	for ath12k@archiver.kernel.org;
	Fri, 26 Apr 2024 11:24:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Jgp-0000000CKoI-04Ju
	for ath12k@lists.infradead.org;
	Fri, 26 Apr 2024 11:24:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 779BFCE1C1E;
	Fri, 26 Apr 2024 11:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF223C113CD;
	Fri, 26 Apr 2024 11:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714130663;
	bh=R9JX84BXKQf4UHZRk81RPQG7Gd4aJssAqnYn3UH2Ef8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=j+ccKbVZI0l10IW8Vlgc6LbKc7gEG8ExC8lik04Y0zdQbiVfZdcXbFYoeo/CfdaJh
	 fFlwlrWdlEUqzzULPbCif5e8w7201DTFNIKQnNjpIxc9CmJuTzf/vygG4LZya98U/E
	 +abl9PL2/BaXEx6q4vPrjXES/e2jNaIjUD5XWolwVoOnUDsnkv6Uwq9E9c9n0nUMiX
	 5ZZf6RLBhDwG28sVTHSxCAZ1STBk68gHfiw2xS/FjvVH2NkNOXKx4UwFqz0no39Et4
	 /bmo2vdcu3XlVhLeOUouWENjRA/ui99sZT4BVsV+9dqUeWjBXGkwVlqrJdKGrhGF/C
	 d1OPcWelWMCAg==
From: Kalle Valo <kvalo@kernel.org>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] wifi: ath12k: report station mode transmit rate
References: <20240419032122.7009-1-quic_lingbok@quicinc.com>
	<20240419032122.7009-2-quic_lingbok@quicinc.com>
	<87r0etsp6u.fsf@kernel.org>
	<c01db4fc-03a0-41f6-9f16-bfa3b2c08007@quicinc.com>
Date: Fri, 26 Apr 2024 14:24:21 +0300
In-Reply-To: <c01db4fc-03a0-41f6-9f16-bfa3b2c08007@quicinc.com> (Lingbo Kong's
	message of "Fri, 26 Apr 2024 16:01:19 +0800")
Message-ID: <87r0esqsd6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_042427_541218_8E748668 
X-CRM114-Status: GOOD (  15.83  )
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

> On 2024/4/25 18:37, Kalle Valo wrote:
>> Lingbo Kong <quic_lingbok@quicinc.com> writes:
>> 
>>> Currently, the transmit rate of "iw dev xxx station dump" command
>>> always show an invalid value.
>>>
>>> To address this issue, ath12k parse the info of transmit complete
>>> report from firmware and indicate the transmit rate to mac80211.
>>>
>>> This patch affects the station mode of WCN7850 and QCN9274.
>>>
>>> After that, "iw dev xxx station dump" show the correct transmit rate.
>>> Such as:
>>>
>>> Station 00:03:7f:12:03:03 (on wlo1)
>>>          inactive time:  872 ms
>>>          rx bytes:       219111
>>>          rx packets:     1133
>>>          tx bytes:       53767
>>>          tx packets:     462
>>>          tx retries:     51
>>>          tx failed:      0
>>>          beacon loss:    0
>>>          beacon rx:      403
>>>          rx drop misc:   74
>>>          signal:         -95 dBm
>>>          beacon signal avg:      -18 dBm
>>>          tx bitrate:     1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
>>>
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>> [...]
>> 
>>> +static void ath12k_dp_tx_update(struct ath12k *ar, struct hal_tx_status *ts)
>>> +{
>>> +	if (ar->last_ppdu_id != 0) {
>>> +		if (ar->last_ppdu_id == ts->ppdu_id ||
>>> +		    ar->cached_ppdu_id == ar->last_ppdu_id)
>>> +			ar->cached_ppdu_id = ar->last_ppdu_id;
>>> +
>>> +		ath12k_dp_tx_update_txcompl(ar, ts);
>>> +	}
>>> +
>>> +	ar->last_ppdu_id = ts->ppdu_id;
>>> +}
>> A code comment would help a lot. Why is ar->cached_ppdu_id needed
>> here?
>> And if 'ar->cached_ppdu_id == ar->last_ppdu_id' is true why do then
>> do
>> 'ar->cached_ppdu_id = ar->last_ppdu_id'? The value of ar->cached_ppdu_id
>> is not changing here (unless I'm missing something).
>> Also I'm worried about locking. How is access to ar->last_ppdu_id
>> and
>> ar->cached_ppdu_id protected?
>> 
>
> Thanks for pointing to this.
> you're right, the ar->cached_ppdu_id haven't used in here, so need to
> delete it.
> i missed something in here.
>
> So, change the ath12k_dp_tx_update(struct ath12k *ar, struct
> hal_tx_status *ts) to
> static void ath12k_dp_tx_update(struct ath12k *ar, struct hal_tx_status *ts)
> {
> 	if (ts->flags & HAL_TX_STATUS_FLAGS_FIRST_MSDU) {
> 		if (ar->last_ppdu_id != 0)
> 			ath12k_dp_tx_update_txcompl(ar, ts);
> 		ar->last_ppdu_id = ts->ppdu_id;
> 	}
> }

Access to ar->last_ppdu_id still looks racy to me.

And why do we need to track last_ppdu_id? I don't have time to start
investigating that right now, a code comment explaining that would help
a lot.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

