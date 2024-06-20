Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3F1C2BA1A
	for <ath12k@archiver.kernel.org>; Thu, 20 Jun 2024 09:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaQCLFxOzvafy7SADQ6EevO2dk1dnT58SpJoAHNL6TY=; b=NFtwQpt/qAdsBDlEEkIzJoquzE
	zmowj3iP45bK2r+uIW3ibqnzOoopSG5qnYLYRHmstTIQmbptSP8VmOXmtzCI4J4JFe7EfJzEhXxbO
	KvE44mjerj+t1LyKMU00ZKdwZN7NKxt1G5ZyWoQ03brfNyqQQPaz2LluZm9mJm51b95lyO9vI3O/b
	/7fNtZ+yOwAMF4GhARweaMkrf0RNGOnVo6sRxZUSmIM3+EPIVLDmYrlE7hdo4d3+tvnZ+24nth9Xb
	yCNyvRRdvoM4MkzDvidobe4MKMc/CQMy02bQFhrp50gF2sQfnr0Mxea+RjU1g6DeC2x4MHRH2Jn48
	p8DnQ9CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKDlx-00000004KDJ-36Aw
	for ath12k@archiver.kernel.org;
	Thu, 20 Jun 2024 09:08:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKDlv-00000004KCS-03cg
	for ath12k@lists.infradead.org;
	Thu, 20 Jun 2024 09:08:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2E8BFCE23E8;
	Thu, 20 Jun 2024 09:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B3AC2BD10;
	Thu, 20 Jun 2024 09:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718874476;
	bh=627u7/0jEcYoiKFGgf9woOedEhyyb1h7Agco3kbB6nw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fW14+hRhREOHBr880vl19z8aBPjF6eqvV2ucdhaf9wKNztUXuXy9LHNbhO1l5hj1p
	 0UqQUcDI5tSLs1C4cjuLis84SxZ5OZnKjyT6ZBscxmQB7y8hYwVDL7q+i5QsejMIVl
	 d4f4mVd+W03zJZMzY4XExurRcD1dcodYakrirvJXh+xNCcR8g2LbJ464bbAqqxktnL
	 LftAv74xROHOWIXWNVlsk4FiwHlzpK29igm07EW3a0zvQ2pIkU3yuZqm4P9Oq50WUM
	 bs97k+75rlXRZgOS1auJGpO6rOO++BFOAWoBcytPX7gimeHAsosVZBJ0wDFbIRGKIA
	 GVZMt9Wssx+Uw==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 2/8] wifi: ath12k: implement WoW enable and wakeup
 commands
References: <20240604055407.12506-1-quic_bqiang@quicinc.com>
	<20240604055407.12506-3-quic_bqiang@quicinc.com>
	<87msnjn0qs.fsf@kernel.org>
	<f66c2719-f413-4348-8440-97a169430043@quicinc.com>
Date: Thu, 20 Jun 2024 12:07:53 +0300
In-Reply-To: <f66c2719-f413-4348-8440-97a169430043@quicinc.com> (Baochen
	Qiang's message of "Tue, 18 Jun 2024 13:49:30 +0800")
Message-ID: <87plscj82e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_020759_254180_5A11C712 
X-CRM114-Status: GOOD (  12.88  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

>>> +int ath12k_wow_enable(struct ath12k *ar)
>>> +{
>>> +	struct ath12k_base *ab = ar->ab;
>>> +	int i, ret;
>>> +
>>> +	clear_bit(ATH12K_FLAG_HTC_SUSPEND_COMPLETE, &ab->dev_flags);
>>> +
>>> +	for (i = 0; i < ATH12K_WOW_RETRY_NUM; i++) {
>>> +		reinit_completion(&ab->htc_suspend);
>>> +
>>> +		ret = ath12k_wmi_wow_enable(ar);
>>> +		if (ret) {
>>> +			ath12k_warn(ab, "failed to issue wow enable: %d\n", ret);
>>> +			return ret;
>>> +		}
>>> +
>>> +		ret = wait_for_completion_timeout(&ab->htc_suspend, 3 * HZ);
>>> +		if (ret == 0) {
>>> +			ath12k_warn(ab,
>>> + "timed out while waiting for htc suspend completion\n");
>>> +			return -ETIMEDOUT;
>>> +		}
>>> +
>>> +		if (test_bit(ATH12K_FLAG_HTC_SUSPEND_COMPLETE, &ab->dev_flags))
>>> +			/* success, suspend complete received */
>>> +			return 0;
>>> +
>>> +		ath12k_warn(ab, "htc suspend not complete, retrying (try %d)\n",
>>> +			    i);
>>> +		msleep(ATH12K_WOW_RETRY_WAIT_MS);
>>> +	}
>>> +
>>> +	ath12k_warn(ab, "htc suspend not complete, failing after %d tries\n", i);
>>> +
>>> +	return -ETIMEDOUT;
>>> +}
>> 
>> Why the loop here? Looks really odd to me and no explanation why it's
>> needed. ATH12K_WOW_RETRY_NUM seems to be 10 so this can loop a lot.
>
> Host asks firmware to enter WoW mode using a WMI command. While
> receiving it, firmware might be busy so that can not enter WoW
> immediately. In that case firmware notifies host of
> ATH12K_HTC_MSG_NACK_SUSPEND message, asking host to try again later.
> Per firmware team there could be up to 10 loops.

Not really a good firmware interface, oh well. I added a comment to
ath12k_wow_enable() explaining, thanks.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

