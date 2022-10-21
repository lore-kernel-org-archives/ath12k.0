Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4942C4321E
	for <ath12k@archiver.kernel.org>; Fri, 21 Oct 2022 13:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgaKHs8C9PrfL1uKHNaJGhP6vv6tPtK8/sy8gc5vynU=; b=a5NuBCIq5kpQbj
	5NBwE6UhQo/FHnTTuwIFex7cB6V6YYCwfgTE90471PEkDFE+Vpn0V4xF1rnsz+o0fFC0sedIn9SC3
	kNI1t0D/W9ZJpn4DTdYdIkyDxeWfihzGDcHaBSEryKDvWUuh6G1Wb7LC+ue7Wlo5NBFKv/LEfVDsV
	rl1MBSW72RvVDJ8UyoUOL3zwP3DQKL8EQKEPSqzzlgXb46E8aUcsVc8DYY9KhASQxJ8Iq5Qit/Qtg
	mvfHHfn5uS810YjnY6aGzOJjMogRHCM5pIukPLPBf6Js0CtnLPpxwQNX9FNUfxRGJI8gZnFnMhdeP
	+uZrRNSkVD9i/wEaXPFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols6I-007yO1-61
	for ath12k@archiver.kernel.org; Fri, 21 Oct 2022 13:30:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols6D-007yLG-Ji
	for ath12k@lists.infradead.org; Fri, 21 Oct 2022 13:30:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1711361E9D;
	Fri, 21 Oct 2022 13:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A6AC433D6;
	Fri, 21 Oct 2022 13:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666359008;
	bh=otm6vjOf917CVbDV4BVliAUxIoYgK/kcfD/iNX/POm0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WNs0oqAvXXccJyEmg2Lal3AB2MeZV0/H/A1uEFakznALFkUGRQa809OZeCJNJ3nmD
	 joLgF8DQMOenM9IIf49fINkHcnFs+QZ9jwLoadDN2tIk0gQ0jimyIdaNqqKFfue3Ap
	 qwGBdiLBxLJe3DdkantklD/BfY6CeRZJwmkpP9kZXfp/XYJGbWlZlzjRoBdnNiX23t
	 AmkweXspRocCm7dvyoaEypLll0ZuL/6Rr/TadOg5d5XA8ZMJdaj/rcA4AKB7gMpCae
	 FBYnt0cUZVYnp/IA9q/6wSBntXU2UU1JTFZU0ubIc2rJNGnfjaOKMpMTPxV8lLfuUc
	 zN58RYbVz73Bg==
From: Kalle Valo <kvalo@kernel.org>
To: "Sriram R \(QUIC\)" <quic_srirrama@quicinc.com>
Cc: "Jeff Johnson \(QUIC\)" <quic_jjohnson@quicinc.com>,  "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "ath12k\@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Re: [PATCH 15/50] wifi: ath12k: add dp_rx.c
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-16-kvalo@kernel.org>
	<b2cd5b02-60ca-c788-af71-9f36f6a8ede3@quicinc.com>
	<SN6PR02MB4334C052EA71CD13F0506E55F7259@SN6PR02MB4334.namprd02.prod.outlook.com>
Date: Fri, 21 Oct 2022 16:30:04 +0300
In-Reply-To: <SN6PR02MB4334C052EA71CD13F0506E55F7259@SN6PR02MB4334.namprd02.prod.outlook.com>
	(Sriram R.'s message of "Thu, 13 Oct 2022 05:54:54 +0000")
Message-ID: <87ilkdi9sz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_063009_732757_DAAFFE5F 
X-CRM114-Status: GOOD (  10.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

"Sriram R (QUIC)" <quic_srirrama@quicinc.com> writes:

>>> +static void ath12k_dp_rx_process_received_packets(struct ath12k_base
>>*ab,
>>> +                                               struct napi_struct *napi,
>>> +                                               struct sk_buff_head *msdu_list,
>>> +                                               int ring_id) {
>>> +     struct ieee80211_rx_status rx_status = {0};
>>
>>initializing just on entry seems wrong, see below
>
> We reset the whole struct once, and reset the necessary fields alone
> for every loop within ath12k_dp_rx_h_ppdu or similar places as
> necessary and pass the status to mac80211. The initial reset is
> necessary so as to reset all unused fields. This is an optimization to
> not memset the struct for every loop.

It would be good to document such optimisations with a comment,
otherwise people might be confused.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
