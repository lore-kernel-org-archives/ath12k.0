Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23268C47DB3
	for <ath12k@archiver.kernel.org>; Fri,  2 Feb 2024 12:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69mssu3XQQD5o5sQcH10XF03YXC+K3FBrIbBxyPauZg=; b=E7EtVNQqBi5IgieEzFQo74vHV8
	2ybbB4qJAQ2NO3NzNVZZcP/LELkDFtivqywuR6b4yJcBN6P1I0Om/TL64Ggbvg1C0pauIIft3WXMy
	e23AzSKIxZ8WT9dkjMRFXf1Q5SpRkKwIxYgW0tp3W+OUrXWxXZBTRd7jUVNyiz2P0hmm77BaEFOxA
	Me0c/jpwl3P4x6MEU/DVXaMNeFwrURotoDPGpoOdlC2R3t7LZOCYfosoMTaT/Uo9hfMIDzJHNvCQE
	2cheEdefOMTjK7bEFUut03bXyqCygEz026w9uDwLwtrcPH1JuFBZMJcAL9PQHbDqFPFUMP4oeh6ou
	uPcaVYOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsn1-0000000BUvZ-3Vss
	for ath12k@archiver.kernel.org;
	Fri, 02 Feb 2024 12:37:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsmx-0000000BUub-0KNy
	for ath12k@lists.infradead.org;
	Fri, 02 Feb 2024 12:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69BDC62523;
	Fri,  2 Feb 2024 12:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251A2C433C7;
	Fri,  2 Feb 2024 12:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706877418;
	bh=S9kXI/nhnyCQ2E9xStS/KEOinhoWXOUkKo3t3H2M95c=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=M+cPTIm1DVO7RaQ+3OZ9bpbFIvU8ENiPcpbdd+OAUAoNw5zUwCrFYx4X+jyFbd3hV
	 wZ3V+6CMBq94lD/UDRadU+sncEBqCPLLQ+g5QcRcoYBGjw8yuFu2YZNPcxfEQDgikp
	 h0CaCe1TfGxWtLv3vyixtYJZmQDOeZhrMVSkCDhdifYkG1S5jgk/6GKEeAoD8/vU3n
	 8jh0MP+Aq1Dn3p5oGUBQDpm3vKO/GG0AV/lxjLjxfWtCOrFYG+PSgu9CWBwf4Wfwi7
	 8iuvZ7ljdjqIS6/y+MlEFGcNQYHqMr/wKLTGYOtqwkYzvVPouw/rjKZGnN63hGAub0
	 mN6uNpXjrmk1Q==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Lingbo Kong <quic_lingbok@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] wifi: ath12k: add processing for TWT enable event
References: <20240122085336.3985-1-quic_lingbok@quicinc.com>
	<20240122085336.3985-2-quic_lingbok@quicinc.com>
	<ea2952a4-8343-407e-9a9c-3c93f4afd607@quicinc.com>
Date: Fri, 02 Feb 2024 14:36:55 +0200
In-Reply-To: <ea2952a4-8343-407e-9a9c-3c93f4afd607@quicinc.com> (Jeff
	Johnson's message of "Mon, 22 Jan 2024 09:47:36 -0800")
Message-ID: <87a5ojt53s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_043659_186255_3BCAE32D 
X-CRM114-Status: GOOD (  10.25  )
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

> On 1/22/2024 12:53 AM, Lingbo Kong wrote:
>> When ath12k send TWT enable command to firmware, firmware will return a TWT
>> enable event to ath12k. Through the analysis of TWT enable event status, we
>> can easily obtain the status of TWT enable command. It can be more
>> convenient to debug TWT.
>> 
>> This patch works with WCN7850 and QCN9274.
>> 
>> Tested-on: WCN7850 hw2.0 PCI
>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>> 
>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>> ---
> [...snip...]
>> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h
>> b/drivers/net/wireless/ath/ath12k/wmi.h
>> index 06e5b9b4049b..7570ef7be38d 100644
>> --- a/drivers/net/wireless/ath/ath12k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
>
> Qualcomm Innovation Center copyright missing 2024
>
> Kalle can probably address this in "pending"

Actually the year 2024 was already there, most likely some other patch
added that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

