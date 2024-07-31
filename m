Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0ADC3DA7F
	for <ath12k@archiver.kernel.org>; Wed, 31 Jul 2024 11:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hWV8EUJ3HNnXxMDdbXwKPeU8E+HJUYJTC1r+BW4Qjo=; b=T/1J8WWluhF4cPE81+PTgP1gYL
	DBLZMB9Wd3JwxMUTg5nbj1OEYrMh75/1P7MRSSX749r/dpXsw2vGeiGAGivydB+H93K7UyJCHzvOP
	vhyKCM3fqZPVn6JUzLFtpaBi/sNN3D/aq1Jh21N7947zwpzKJZ7GYlFlDqfTCgfpQkWCN7ni5Sboi
	U2+hXjk3O6jlrXx7WLR70KYLIvnvo5D17QONWkr4uRkyHqOG2cVO+FuV7Z6lsjGqBIuj0tp9Z7q+e
	O/RjzPknuZMK5t3yLZYUbqci4F/+1OXa1wNRids2OlxfuscBJleVWrJffTa0/6MTzuR3GzQBPfQLU
	mOik72Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ7L7-00000000sE3-3wwV
	for ath12k@archiver.kernel.org;
	Wed, 31 Jul 2024 11:17:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ7L4-00000000sDH-35sD
	for ath12k@lists.infradead.org;
	Wed, 31 Jul 2024 11:17:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 57F79CE136C;
	Wed, 31 Jul 2024 11:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A906AC116B1;
	Wed, 31 Jul 2024 11:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722424666;
	bh=DTQTgoWxZvK8RJ9XSayQaAZYAsA0HP8BXtkfqrTKbcI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KKl2B+Q3qQ+25lL3TXbx7rcuBG5Q4THHwdmW5lyB79GOOn4sdqYqmqGjYC0FHrxkq
	 kn/wM6RrtTiwT7gFYM8BJfZglt79UvSyBCn3hm64zHX1A5Jgd1MFsAQ6+O9+aXQoKr
	 ANWdwSpoEZ8aq68dYFy4RUOjCrgIklvT0hFcJweA4Gw/Ib8umpynjmIMLDco0Q1P2t
	 WvljoUph5W/EzqotjucweW8VNezNCwZzsDr9W3vocADkIvfh8tqSCUVMqlKk9rRbia
	 3LvzYr5YTjWnfuPfFGD/ai5myWtS4RTicDaayeMe2376DD47GYpMthby7pjk1lIT0S
	 ZteDAZ9qh0b6Q==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: kangyang <quic_kangyang@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 04/11] wifi: ath12k: fix struct hal_rx_ppdu_start
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
	<20240725120035.493-5-quic_kangyang@quicinc.com>
	<aa2b6791-9d18-479b-a80d-722b99592cb8@quicinc.com>
Date: Wed, 31 Jul 2024 14:17:44 +0300
In-Reply-To: <aa2b6791-9d18-479b-a80d-722b99592cb8@quicinc.com> (Jeff
	Johnson's message of "Thu, 25 Jul 2024 17:17:49 -0700")
Message-ID: <87y15hkdyf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_041750_967885_6C33E26B 
X-CRM114-Status: UNSURE (   5.85  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 7/25/2024 5:00 AM, kangyang wrote:
>> From: Kang Yang <quic_kangyang@quicinc.com>
>> 
>> Current struct hal_rx_ppdu_start in hal_rx.h is not matched with
>> hardware descriptor definition.
>> 
>> So update this structure and related code.
>> 
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> 
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
>
>

Jeff, your reply was empty.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

