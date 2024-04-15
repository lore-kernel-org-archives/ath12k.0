Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7567CC4345F
	for <ath12k@archiver.kernel.org>; Mon, 15 Apr 2024 16:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXJQQOlrbIA1pOEdKVgj9S6k+TeF7Q4sVkElWGjebRw=; b=OUnDjHJ6AoDOJ6MGQvkrdptDvc
	PJBClY7Te3ZZHJEOuLj43bWlOONfII8HSWb5dUvPMEz5EXcj68XyhYrH1K8oxx8j4X1UpMyxoxFKw
	2tDUl8z9oSkw643oEluox423Plz1Ben5LCJ5d7Svyxks43A34+WL/ZlPZX6QL5z0WbrrWoacqLHsG
	hGDR84qZ35xZgbtzVNZSodObB/ldSVC2rrCBM9dpgBOOKZ2uS9FySziBnJpXHnAHU933537O14Adw
	8oHhGKh7XmlFXAAX+rR64fiDOywrxKt+RNuwnTPjfUPrHYTFngTOijq/SrgDej51GzDDjEQJAguah
	7DtUEEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPBL-000000094RX-0h2x
	for ath12k@archiver.kernel.org;
	Mon, 15 Apr 2024 16:27:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPBI-000000094QQ-0OoR
	for ath12k@lists.infradead.org;
	Mon, 15 Apr 2024 16:27:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BD870CE0E3C;
	Mon, 15 Apr 2024 16:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388F3C113CC;
	Mon, 15 Apr 2024 16:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713198461;
	bh=JmE3OhAUrf+9FlekMukywTyl1WYIiSH0C2eGbw3iFIE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=plbaAq1kP4Muwf3ilWhWunxX0x4lpWyMvzSBtvzWWUpDJai9UkqBESHSPaC5UAlDa
	 kLWi7TMi2dEKbDsydmQKeRU7PcIGmsiXWQBKhySXYB3tzJxN5ZztzsVlZbnGtT9Kb6
	 PudkQWbxlwCh1ONU7AeFXJV0ObVhhxuZJ1zHuKKwz+QDvzwhLNcNB+yht4BYfhudWD
	 ObktfKubZIVbfKorEzVbawe8erFMF4hsfAtiqKfjf8LGIwJB/ag4mH/QHff11nTgzT
	 YZp0Wy753CpyrzMiHGkf6krD3ll840gt7eyJW6LrEqqS10vhi470gMf0KEGb6ho+O8
	 vy57Lnrx1ozew==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: enable WIPHY_FLAG_DISABLE_WEXT
References: <20240411165645.4071238-1-kvalo@kernel.org>
	<e8618364-e547-41e1-b18f-4cddeafd3371@quicinc.com>
Date: Mon, 15 Apr 2024 19:27:38 +0300
In-Reply-To: <e8618364-e547-41e1-b18f-4cddeafd3371@quicinc.com> (Jeff
	Johnson's message of "Thu, 11 Apr 2024 12:41:48 -0700")
Message-ID: <87h6g2y4jp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_092744_586228_52B045D2 
X-CRM114-Status: GOOD (  14.42  )
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

> On 4/11/2024 9:56 AM, Kalle Valo wrote:
>
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> ath12k will support Multi-Link Operation (MLO) in the future but not yet. A
>> major change with MLO is that cfg80211 will disable Wireless Extension (WEXT)
>> user space interface. To avoid having inconsistent user experience, first
>> supporting WEXT and later not, disable WEXT already now.
>> 
>> Now ath12k claims that WEXT is not supported:
>> 
>> $ iwconfig wlan0
>> wlan0     no wireless extensions.
>> 
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> 
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

[...]

> Currently on my version of Ubuntu when I switch to Hotspot mode I'm seeing:
> [   55.189623] warning: `iwconfig' uses wireless extensions which will stop
> working for Wi-Fi 7 hardware; use nl80211

Do you know what entity is running iwconfig? Or was it you running
iwconfig manually?

Please note that this warning is shown only once, all following WEXT
usage (of any process) is not warned. Linus proposed doing a per process
type of warning but we never implemented that, I think we should do
that.

> So are userspace folks aware of the need to move away from iwconfig?

I hope they are but difficult to say. We have been trying for years to
get rid of WEXT but the progress has been really slow. This warning is
another attempt to make everyone aware as with MLO WEXT will not work.

> Is there a Ubuntu / Network Manager fix fir this?

I would hope that Network Manager doesn't use WEXT or especially run the
iwconfig tool. This is why I suspect that you run iwconfig manually.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

