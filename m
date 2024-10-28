Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4486D13588
	for <ath12k@archiver.kernel.org>; Mon, 28 Oct 2024 07:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsPLlTvJSloJufVSb5zcWeZX7zhjSTi0+7mK/mas5l4=; b=z3tWKMlN9Y0zwHrBSD6DcVQ4U7
	lZeGCcLK1nJ4zzl4st1iJgPz2ziFS9tHhqHt4VXXcKXkU1v3dy05TKIwsJm3gBNpEBU4ozTgCBkwF
	EVo0HfJJ9hn+Gn98TCGdWXPiq2pXQIzzc3W2ZG10R9kEuXpCMVVMzkvKO0r6srCCiWensWbhZxtqx
	QzOjdtTppio57vFaerRuY3NEoGja3iQOSaAkEP5N5kn7CkbElII6s3VOzqAFJm8Elm+d2j1TVk4iw
	HUoKVsVjelUSbV8xVf5f3SAf5pdAIoDHIoEV3E6/xBDn/HLvwHA1Tje8up8xfBUJm5cb36+pC94SW
	F/keeEXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Jw7-00000009p67-1JVX
	for ath12k@archiver.kernel.org;
	Mon, 28 Oct 2024 07:13:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Jw5-00000009p5l-1Cff
	for ath12k@lists.infradead.org;
	Mon, 28 Oct 2024 07:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 398F15C5416;
	Mon, 28 Oct 2024 07:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39660C4CEC3;
	Mon, 28 Oct 2024 07:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730099588;
	bh=dgAVDT6Vy5fKwsG0YhvrZR5x3z6l+4Zs1cbZfEruAe8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=G6bOOBlmoG3qwvjs7wR8dyuQtkzLIw93t78OYh12hImyQdaWvdkDbi5e81k65gMvW
	 s/q2+DfqjR40fAFkelgC0PZMETYBVLAhoSAYMHOg7iH+o6e5R571fn/yNU5V+l1ih3
	 jbTgbQHZ11tK6tETC0u7509iLSqVkbIMaDNVLDUgcDU9ZHPbxcB1JySsGmNrSkrHxW
	 N3yI4XqsU13h5QzuDnadbIyPf+ysSbhwxZm0TOHc9RjWcXHP1a19EV2t5Ta+5JYht3
	 tuE3lQ7kjtn/cSeQgZuMI7jvZ7gaepc7ZtyOqtqaofig+WU0CVsy6H4vwJR54nsry5
	 PEmdpnj4rGWAg==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 08/11] wifi: ath12k: delete NSS and TX power setting
 for monitor vdev
References: <20241016065700.1090-1-quic_kangyang@quicinc.com>
	<20241016065700.1090-9-quic_kangyang@quicinc.com>
	<871q09rgg8.fsf@kernel.org>
	<f605fb9a-28ad-4aa8-a66a-085a7229f629@quicinc.com>
Date: Mon, 28 Oct 2024 09:13:04 +0200
In-Reply-To: <f605fb9a-28ad-4aa8-a66a-085a7229f629@quicinc.com> (Kang Yang's
	message of "Mon, 21 Oct 2024 17:21:11 +0800")
Message-ID: <87h68w3dkv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_001309_391202_37CF6D8F 
X-CRM114-Status: UNSURE (   8.53  )
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

Kang Yang <quic_kangyang@quicinc.com> writes:

> On 10/21/2024 4:46 PM, Kalle Valo wrote:
>> Kang Yang <quic_kangyang@quicinc.com> writes:
>> 
>>> ath12k_mac_monitor_vdev_create() will set NSS and TX power for monitor
>>> vdev. But this is not needed for monitor vdev.
>>>
>>> So delete them.
>>>
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
>> Does this fix any known issues? Or is just cleanup?
>
> Clean up

Ok, please always mention this in the commit message. In essence you
need to answer to the question 'why are we doing this?'.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

