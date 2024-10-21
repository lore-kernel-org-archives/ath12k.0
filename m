Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C764CD0E6D1
	for <ath12k@archiver.kernel.org>; Mon, 21 Oct 2024 08:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ci1Zhtb/g4p2x/VNsT2aDdGkYgx9s/x/J54Oy2ew2ho=; b=hvglNLb1wgN5V8HNtOg44I+wwH
	M8FKBkqMsmCmDGgJGohnoz2mpxh2zWYg98+HkG8jGz7wOIpMgzQHJ8+wZFlAqNqwFVQWc4GiZAyDG
	YMfNPSQQAH9MAFjVipUbmi6uufdk1P2M/UAbclOtaR+OHlCzscNyq7d63tMdO6MpRXoxugmhy5jhp
	vScu76Dw3r+q3PRurV+sN7rPlct+PBWIQ6rVNiF0ppejkAxQg45HmMTIsnbTcMn0dsxEQlUgbEnvv
	ptawKaGs1ieu7sPymLQ2JREkAJcVSGAOG6+bfANh4nFDt7fxvH6Tn7YI5VKgHrOih9JzGa/tmyuQF
	Q3uYNM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2o7k-00000006cSt-2231
	for ath12k@archiver.kernel.org;
	Mon, 21 Oct 2024 08:50:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2o7h-00000006cST-0dnm
	for ath12k@lists.infradead.org;
	Mon, 21 Oct 2024 08:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D58965C5656;
	Mon, 21 Oct 2024 08:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386A6C4CEC3;
	Mon, 21 Oct 2024 08:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729500644;
	bh=3YaSTT+stxn3bZ4gbBZDptrOG0BxVJxtFbkNlEAnLXU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=adE2+KTyQ01skbGHzPYI/+Zl1WXRSTGsqPX1JNY3taGXXogqYYGRxdD3iMER/Trt4
	 SLoPt4kilPn7F5AS6SWO91DbewCUvqGDKp0JjkQHITzlchn35Sz1glnp0MwELoHg7l
	 eUgX2511BB8AzjsqeJSH6bhLO6z9LeOzyyNXpKGqB/p9EVNBQOGHgkED+S37NH+0mW
	 ul2i6AXuIpGPUFqB1//q5yth0xor+4q6qq1ufQ7ByydaolRshKzCn7/g78pxYW5MZg
	 jQQoZAU7ux95U8/0V9/j++x2q/npjCiW9+vK0xTv1IfJBBFKcGMQ3VLcPG7m/dMa0n
	 xEotvTZ9p/IgQ==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 03/11] wifi: ath12k: fix struct
 hal_rx_ppdu_end_user_stats
References: <20241016065700.1090-1-quic_kangyang@quicinc.com>
	<20241016065700.1090-4-quic_kangyang@quicinc.com>
	<875xplrgj5.fsf@kernel.org>
Date: Mon, 21 Oct 2024 11:50:41 +0300
In-Reply-To: <875xplrgj5.fsf@kernel.org> (Kalle Valo's message of "Mon, 21 Oct
	2024 11:45:02 +0300")
Message-ID: <87sespq1pa.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_015045_480356_60999533 
X-CRM114-Status: UNSURE (   7.84  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Kang Yang <quic_kangyang@quicinc.com> writes:
>
>> Current struct hal_rx_ppdu_end_user_stats in hal_rx.h is not matched
>> with hardware descriptor definition.
>>
>> So update this structure and related code.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
>
> What about QCN9274? The commit message doesn't mention anything about
> that.

I have the same question for patches 3-6. Also I would like to
understand the backwards compatibility with older WCN7850 firmwares.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

