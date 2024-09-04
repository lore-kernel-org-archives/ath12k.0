Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F6ACD4853
	for <ath12k@archiver.kernel.org>; Wed,  4 Sep 2024 16:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4NkclKvvJocPcfAwT4PXyb+F9199lam+t/N8Aw6nXU=; b=NWb/S6BjdScexVWma3QkC8tsdk
	1rKbR3+nEa+jfOVEhKc05FUahKx7YSHpb2bh5MMG1wvxf96aqj7p0JqQR9loX5FwT55nC9Szx/2Js
	W4udvijrpq0r7BNtgcEQG2Et9posRjPrxDOiYd+2neUWyre0S77Kp9im4uR2O65gBMKwrn5TxCdZl
	Md7cQqCpd8r2g2hiQfC4lBzn4UOpBxfv7fEX77vOR4uo5gyNcVOSD9IS0z4AOD7A/46sB9uf82RFM
	Ox9ZF4L29zniOw2Vn73vt2kJBzOkUoWg5Un0j+djxSWftCTTO4XAwWcdspm0DJ2Le+qUods4lJKF1
	3OZlfUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sltAg-00000005KFg-2cEa
	for ath12k@archiver.kernel.org;
	Wed, 04 Sep 2024 16:47:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sltAd-00000005KF6-2IYQ
	for ath12k@lists.infradead.org;
	Wed, 04 Sep 2024 16:47:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9B6BFA445EC;
	Wed,  4 Sep 2024 16:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9081EC4CEC2;
	Wed,  4 Sep 2024 16:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725468470;
	bh=X66EKTKKlLp0zzrFK7FAl5dyY0nwJPplilZx9JvjO8o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=vNyJNrnWeiY8x1WdnAlyKaLRFT9inNHSRu+kcoUeJahW6ZJ5d9xwnL8+zp31VIS9T
	 UVjOVaCZJnTb1ImfT9EFO21qMvPkUq1GDqEjw35IB2cdqLIhii2CaOQ4bb8w5017NH
	 YVL+YKFmeGvlzTCy9VzkbvtYKkvihUFBndPc4TIC1yo74lHWPns1oVrVCP3k+eBBwZ
	 sbL2nUZUDd+e6G9F+q2g4G9orkH/VVBZutesOVQL5KUBeWhhBTYl9f1AihYMhu/Nc7
	 6hHz81mrPeb/QEyuQPXPXVJVuzwFKJ4E9jWniFvNtSLHkjME91v+QaJlRQ1o+riwas
	 U67cAlLu+i26w==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: avoid deadlock during regulatory update
 in ath12k_regd_update()
References: <20240830023901.204746-1-quic_bqiang@quicinc.com>
	<f613591f-bca5-4481-99e8-d294703f67dc@quicinc.com>
Date: Wed, 04 Sep 2024 19:47:47 +0300
In-Reply-To: <f613591f-bca5-4481-99e8-d294703f67dc@quicinc.com> (Jeff
	Johnson's message of "Wed, 4 Sep 2024 09:33:05 -0700")
Message-ID: <87frqfcqmk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_094751_670492_DF4B2D9F 
X-CRM114-Status: GOOD (  13.55  )
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

> On 8/29/2024 7:39 PM, Baochen Qiang wrote:
>
>> From: Wen Gong <quic_wgong@quicinc.com>
>> 
>> Running this test in a loop it is easy to reproduce an rtnl deadlock:
>> 
>> iw reg set FI
>> ifconfig wlan0 down
>> 
>> What happens is that thread A (workqueue) tries to update the regulatory:
>> 
>>     try to acquire the rtnl_lock of ar->regd_update_work
>> 
>>     rtnl_lock
>>     ath12k_regd_update [ath12k]
>>     ath12k_regd_update_work [ath12k]
>>     process_one_work
>>     worker_thread
>>     kthread
>>     ret_from_fork
>> 
>> And thread B (ifconfig) tries to stop the interface:
>> 
>>     try to cancel_work_sync(&ar->regd_update_work) in ath12k_mac_op_stop().
>>     ifconfig  3109 [003]  2414.232506: probe:
>> 
>>     ath12k_mac_op_stop [ath12k]
>>     drv_stop [mac80211]
>>     ieee80211_do_stop [mac80211]
>>     ieee80211_stop [mac80211]
>> 
>> The sequence of deadlock is:
>> 
>> 1. Thread B calls rtnl_lock().
>> 
>> 2. Thread A starts to run and calls rtnl_lock() from within
>>    ath12k_regd_update_work(), then enters wait state because the lock is owned by
>
> checkpatch complains that the commit description exceeds 75 columns
>
> at a minimum you should avoid exceeding 80 columns
>
> Kalle, do you want to reformat when you pull into pending?

Yes, I can reformat it in the pending branch. But I'm busy right now so
it might take a while.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

