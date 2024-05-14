Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EBDC04FFE
	for <ath12k@archiver.kernel.org>; Tue, 14 May 2024 05:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEMe86DZjiWu+B7DYA4EBNXdAQMEdwUSKzNOcTEXCww=; b=P1HPfmhfUmqbnr1xrcKt7oqaR2
	YvdvvhdOO02C3GqxQT5vS6xCB6DfGWMIVtyKlYiI5lwhnlgDPANJskX3pbY+rWxkFG9ojUo6V+6V1
	VCiG+6IjB8BrNhuZR5qS62h5StJsSQa61/SoyzKa0R9vcm6Kxk+tzBhuNYV2qi8Cl6ZwWQd28a0LY
	ShHFVe1nPHC9JX1T7si55yPxsfeNYIuSb1Ly12Dqu+yMb1FX3vMJVFo3hlBNfoHJ+lMGhGE+3kVRi
	55dJquG8FgkTHl0ol83F7IynXeVI3u3mHmVnyzh/iWGQxDKVk9ZYmsLBw7qQxt9Tb581zHlcF5Xiu
	eUgAyw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6kfD-0000000F2PE-0SAC
	for ath12k@archiver.kernel.org;
	Tue, 14 May 2024 05:25:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6kfA-0000000F2On-0om9
	for ath12k@lists.infradead.org;
	Tue, 14 May 2024 05:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 31EF7CE0AC0;
	Tue, 14 May 2024 05:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F24EC2BD10;
	Tue, 14 May 2024 05:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715664315;
	bh=rZZB79t2PiwYA0ClpI5vhMgbF5TFDvqhiJewr2oOdCk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=vHsBaPfb/vLbHsV3/t94ogIG5DmvXyvDSF2GPCxBT/JOceRG86KbIjuzPLZYQQbM8
	 /F0SgJJwCX0zCPvojf7rRDblUQ1dzUYuNdJJ1DJj3zsL2YdNVX5lcYeAR54hzU7nvL
	 PIxnyrsX4w9srDPImDKw3GvtOs1z4tra6OUTOgpplMzlHSuLJqGGWZlG2KGtlnyjx2
	 d3Qu/RHJUvmrBmIAyiBbSjxnSaFwvppiWB8iYF+FW3Mwm1LQbusAuKnUGxoksxQX82
	 OPfHZEQ4ehX7UwZ8Nq+W9Qds0j/uXsh0L1DRmjKkQk+97fDXRNlaEpi6QIZe1WRNK9
	 O0xNuDUIM9XWw==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/2] wifi: ath12k: use correct MAX_RADIOS
References: <20240511013644.3103905-1-quic_periyasa@quicinc.com>
	<20240511013644.3103905-3-quic_periyasa@quicinc.com>
	<7916534b-ee14-4b95-b339-d614ce9393f1@quicinc.com>
	<23354bb4-4d12-da14-1764-ea71ab05ff45@quicinc.com>
Date: Tue, 14 May 2024 08:25:11 +0300
In-Reply-To: <23354bb4-4d12-da14-1764-ea71ab05ff45@quicinc.com> (Karthikeyan
	Periyasamy's message of "Tue, 14 May 2024 06:37:29 +0530")
Message-ID: <87cyppdky0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_222520_436458_1008FB75 
X-CRM114-Status: GOOD (  11.68  )
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

> On 5/14/2024 5:01 AM, Jeff Johnson wrote:
>> On 5/10/2024 6:36 PM, Karthikeyan Periyasamy wrote:
>>> The current value of the MAX_RADIOS define is 3. However, this value is
>>> incorrect as the maximum number of radios supported by all devices does
>>> not exceed 2. Therefore, the MAX_RADIOS define should be modified to 2.
>> Use imperative tense: Therefore, modify ...
>> 
>
> Sure, will modify in the next version.
>
>> What is the observed problem, if any, with the current code?
>> 
>
> No problem observed but it leads to unnecessary space allocated for
> the hw links in the group and also it gives incorrect perspective to
> the code reader that ath12k support max three radio platform.

Information like this is always good to include in the commit message.
There's less guessing that way.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

