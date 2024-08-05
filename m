Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83890C3DA4A
	for <ath12k@archiver.kernel.org>; Mon,  5 Aug 2024 10:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3uyJfB7xdXAAhxmIh9XWrXgAAe1SAeummDvxEFthts=; b=25vEK/rJCzc8W3qxpGbu0xHSfM
	uCOx44hWXctfNh4Zc2eTLuZW4/Jt/hJtxy5GKbYFSh+BUMdz5KU6o+u/1xftJo4wu/qaqo7XYlQ4y
	ZVdlQP2g88RANsi/IDk7lAkd8/DopHpyPWDZVY6zjfpkW35W/yCHIOotgUJuZVwWy+LnQw39YNxUK
	ZKbrp3AraOhONVJXkix951OIbRg/vGhOO/iHK16J9vOXLKInjRIflMES3Ct1nh0iufNLK1zV2ra1B
	vjZhFfJY+J4hybWlLPKj2DYNcCD0OctFlShaV96/eHTitAswNbxXDQLVUUToDtNcioh6njo+mQCaR
	kNERhkEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1savDx-0000000FZXd-35a7
	for ath12k@archiver.kernel.org;
	Mon, 05 Aug 2024 10:45:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sau8P-0000000FK9E-0wHd
	for ath12k@lists.infradead.org;
	Mon, 05 Aug 2024 09:36:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5CA55CE0A6A;
	Mon,  5 Aug 2024 09:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8D3C4AF0E;
	Mon,  5 Aug 2024 09:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722850565;
	bh=2bhgdALTqEX3RTZsyFzr/KHTebMxOVLhVwovoaQlv38=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=MVj8qL3iInDFRXnFmKrd2vCR61SNYQ0jVxSvwkLFVP/CiDdb9OaO+1JeVe0HfKwvO
	 xLKSzHeLEbH296/blWQlgKsMqZjUtPwCgHYtve/0qyOkg6wEKGHtKirCFLnRkCsudG
	 S/E/BvO23UFMb0icp1Av+2ceCt59LnjP2loseZyPZT1/riGt6X1a/H31UVmPW0gA7z
	 QGup3AQGe4zkY7AXYal+1P1lC08yngbm4EcY2dkWKvY7HChsjntQOo4hWzlSiwa5hp
	 1YAr2tPUHpFHyIQCqGUuF7pM8IfKk4T5f8FxGUXVfPasHnboQzFSdiGmF3wFRVI3M8
	 TtivFF5mxZu/g==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  <kernel@quicinc.com>,
  <netdev@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: use 128 bytes aligned iova in transmit
 path for WCN7850
References: <20240715023814.20242-1-quic_bqiang@quicinc.com>
	<87ed788enl.fsf@kernel.org>
	<90077fb2-42e0-42ab-b5a1-b4b73ff201d5@quicinc.com>
Date: Mon, 05 Aug 2024 12:36:02 +0300
In-Reply-To: <90077fb2-42e0-42ab-b5a1-b4b73ff201d5@quicinc.com> (Jeff
	Johnson's message of "Thu, 1 Aug 2024 11:04:18 -0700")
Message-ID: <87jzgv71ml.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_023610_145307_63DB6FF6 
X-CRM114-Status: GOOD (  11.23  )
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

>>> @@ -279,6 +334,23 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
>>>  		goto fail_remove_tx_buf;
>>>  	}
>>>  
>>> +	if (iova_mask &&
>>> +	    (unsigned long)skb->data & iova_mask) {
>>> +		ret = ath12k_dp_tx_align_payload(ab, &skb);
>>> +		if (ret) {
>>> +			dev_warn_once(ab->dev, "failed to align TX buffer %d\n", ret);
>> 
>> Why dev_warn_once()? I changed it to ath12k_warn() in the pending
>> branch.
>
> My concern was that if this is an ongoing issue that you'd end up spamming the
> kernel log. But I guess the rate limiting will reduce the spam to no more than
> 10 logs in a 5 second interval

Yeah, ratelimiting used by ath12k_warn() should be safe. It would be
consistent to have ath12k_warn_once() instead of using dev_warn_once()
but in this it's better to print the warning more than once so that
users don't miss it.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

