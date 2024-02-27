Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60EAC5478C
	for <ath12k@archiver.kernel.org>; Tue, 27 Feb 2024 13:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cO/yFaRDYdY9PnNwJeKgzEQDhEeY2nxIZbE3S6T4low=; b=SED3cG34RfDSOt+aPgiGu7Yn2f
	yPkYtZHI934dxwMQsAhR2wjONFENy+7r6RDMo47y7uqU7XTQaQ8ICHD4vA7fwQj8BgGhI/rNRAOCt
	yNDJlpY3ubsWaNnZbKLWNlMrjNho7uup7KnwN87obDc75Tj1VYk/2Y+XUGFd9kywfGmxnsDDLCVzd
	tEfwVsJPhnIQN7/QREhYUHCRuV6M3kD3zqRmiLae7xG8yBORALoadedOqRN9CXndxrB7jPdQXvuVr
	gumcrP2C7gC2Hii0elJiAbqYi3z3M/qajNpUD9UTSJFz5qVQq9iCy3Kstglcmzk7eq7jbwhcbbAZZ
	6hp4kqWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rexQT-00000005Mx6-1Pjq
	for ath12k@archiver.kernel.org;
	Tue, 27 Feb 2024 13:23:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rexQQ-00000005MvN-2D09
	for ath12k@lists.infradead.org;
	Tue, 27 Feb 2024 13:23:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2C3B5CE1A27;
	Tue, 27 Feb 2024 13:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A887AC433C7;
	Tue, 27 Feb 2024 13:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709040184;
	bh=TUkZkkUGbM11amjg6L2bFOhq4Ad1EaBH2oZivW9MLj8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qnjpRWG10Z1GRIM7uPI78mrinLBuTcKaqqj4xGZY0OLDrQKXbSZy8od7d2L2LEfqX
	 K3n2hFb7Sl59E4Yb3v6D906va6CnV//7I1EE1PT1EbqKLQWSNk6PNOsbqUtgqKcWIr
	 OwwRQbcWNaaSf228gp3jggrQg3Q1uN/56W72Wc2FpzGtft68Yegp3MBFOql2hB/Ix3
	 5ipAMT0XpA3WXTpEI4JF3IHhQoKrimhQHod6me4IlIP+24fHbvT4UZXcqF/oubB8T1
	 LVP0CyhQDcjQDvLWp6l4+wfNR+bNZRqRvZD47Li33tcsIGhHERlbLoQtZH3PnS92a2
	 JAlHMO8sv/ukA==
From: Kalle Valo <kvalo@kernel.org>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4] wifi: ath12k: report tx bitrate for iw dev xxx
 station dump
References: <20240219095802.1147-1-quic_lingbok@quicinc.com>
	<87y1b7jkxu.fsf@kernel.org>
	<6f39eb1c-97f7-4029-a5f2-5ab36ff0f0a6@quicinc.com>
Date: Tue, 27 Feb 2024 15:23:01 +0200
In-Reply-To: <6f39eb1c-97f7-4029-a5f2-5ab36ff0f0a6@quicinc.com> (Lingbo Kong's
	message of "Tue, 27 Feb 2024 21:07:36 +0800")
Message-ID: <877ciq9h3e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_052315_111189_1AC10534 
X-CRM114-Status: GOOD (  10.29  )
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

> On 2024/2/26 23:37, Kalle Valo wrote:
>> Lingbo Kong <quic_lingbok@quicinc.com> writes:
>> 
>>> The tx bitrate of "iw dev xxx station dump" always show an invalid value
>>> "tx bitrate: 6.0MBit/s".
>>>
>>> To address this issue, parse the tx complete report from firmware and
>>> indicate the tx rate to mac80211.
>>>
>>> After that, "iw dev xxx station dump" show the correct tx bitrate such as:
>>> tx bitrate: 104.0 MBit/s MCS 13
>>> tx bitrate: 144.4 MBit/s MCS 15 short GI
>>> tx bitrate: 626.9 MBit/s 80MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0
>>> tx bitrate: 1921.5 MBit/s 160MHz HE-MCS 9 HE-NSS 2 HE-GI 0 HE-DCM 0
>>>
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>> Tested-on: QCN9274 hw2.0 PCI QCN9274 hw2.0 PCI
>>> WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>> Please use full englist words like transmit instead of tx. Also the
>> title could be simplified to:
>> wifi: ath12k: report station mode transmit rate to user space
>> Here I assumed this only works in station mode. Or does this also
>> support AP and P2P mode? The commit message should explain that.
>> 
>
> Ok, i will apply it in next version. Thanks for pointing out.

After rereading my comments maybe keep the title simple like:

  wifi: ath12k: report station mode transmit rate

But it would be good to clarify in the commit message what modes this is
supported. And what hardware families support this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

