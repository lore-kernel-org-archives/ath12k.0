Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E712DC433FE
	for <ath12k@archiver.kernel.org>; Fri, 21 Oct 2022 13:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7MZWKBmifLwZwXzqemSJHVcypPwgSDmyg96s/nIXtm0=; b=wwxSOAOKpQ6T2k
	Mtq/IdF35M0ig+L58nuKeDkUhuR4C0NCRWfJHW+Pu7TSlK2yMq99r2qeTxXPLdxiL5kmFzVpTGiek
	QqnOwwUsY0LcBJpExQf8NqdTl9vKIjzMR9CLOT5oL2zZz3qjOt9AhSRrZV3tam6vOeGrKzU26ePGF
	1e+FqaS332348+QLWhGMdbaYl45BuMhWaoE+YJayobY8zVK/Pi1sqqYMwiXCLfKBurSZLN5Mdlgfz
	D1eItd7sDaefimX+brO9nRX6KU9XhfUNOPHRTu0WdCUnlhjSEZS00qRblHBbViK9fCveNFwHUmRY1
	itWYNsLJOXRde+S7uOKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrqA-007pt9-C4
	for ath12k@archiver.kernel.org; Fri, 21 Oct 2022 13:13:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrq7-007psL-Aq
	for ath12k@lists.infradead.org; Fri, 21 Oct 2022 13:13:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3A3B61E9B;
	Fri, 21 Oct 2022 13:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42932C433D6;
	Fri, 21 Oct 2022 13:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666358010;
	bh=2Ck3h+6cyIC56TpNNxGsWM/DMQkNY2j7l2PmUhSU2Cw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NWDNQC+YC9BO6otVefhBh/7fWKrBtOEU4wvQmYeuWmHmzcp5kIgcwS6fFQ2NmOzNN
	 MpeVzlbjoqG+jfjoBLZ/JydnZVZHkLcitFzdk3OUgYfdJ0cC6RoiPzlK+4z00PL2pb
	 jGqX3+JrxdtxCnUokBYXTPVILlqe1hM0rs2wZvWLtFbKHN3JiWUUlhlWbsf2L1D1dS
	 gRhqdy4Orlbo7HtcpYy0JlmF9wVWSLzlOuVgrnZc8BX5LiH3z7nFibc1QQHA8gmEp/
	 VRVkw/WCytaIT/aTxboIepqkjMgLRQXsr9zA7vbrESs3nAWXqv2EdmK1lQhn90/LTb
	 e/7FY599WbDww==
From: Kalle Valo <kvalo@kernel.org>
To: "Sriram R \(QUIC\)" <quic_srirrama@quicinc.com>
Cc: "Jeff Johnson \(QUIC\)" <quic_jjohnson@quicinc.com>,  "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "ath12k\@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Re: [PATCH 15/50] wifi: ath12k: add dp_rx.c
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-16-kvalo@kernel.org>
	<576a0720-fe45-36bd-abd1-b772dbe380b0@quicinc.com>
	<SN6PR02MB43343C4EE7BBA09592CF8CDDF7249@SN6PR02MB4334.namprd02.prod.outlook.com>
Date: Fri, 21 Oct 2022 16:13:27 +0300
In-Reply-To: <SN6PR02MB43343C4EE7BBA09592CF8CDDF7249@SN6PR02MB4334.namprd02.prod.outlook.com>
	(Sriram R.'s message of "Fri, 14 Oct 2022 03:01:16 +0000")
Message-ID: <87sfjhiako.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_061331_430423_59E57D7D 
X-CRM114-Status: GOOD (  10.53  )
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

>>> +             paddr = dma_map_single(ab->dev, skb->data,
>>> +                                    skb->len + skb_tailroom(skb),
>>> +                                    DMA_FROM_DEVICE);
>>> +             if (dma_mapping_error(ab->dev, paddr))
>>> +                     goto fail_free_skb;
>>> +
>>> +             if (hw_cc) {
>>
>>hw_cc is a very cryptic name. is there a better name for this?
>>presumably this has something to do with hardware giving us unique
>>cookies so we don't have idr overhead?
>
> The hw_cc indicates Hw cookie conversion, which converts the cookie
>passed in the rxdma descriptor to a corresponding SW descriptor vaddr
>(which was allocated mapped during init time in ath12k_dp_cc_init())
>and passes back the addr directly during msdu rx rather than having the
>idr overhead. Since 'cc' was used across the driver to indicate this
>feature, we used it similarly here as well.

Having a comment explaining what hw_cc means would be really nice.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
