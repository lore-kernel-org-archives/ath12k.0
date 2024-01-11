Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB18C47077
	for <ath12k@archiver.kernel.org>; Thu, 11 Jan 2024 16:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIXfCdl40NOifOF/knJco4CrrkhkptGFhIRvkrGI6aE=; b=OiiAa5956pPmLsYffp6IMOVtwH
	kadEYGlYOPElXkto8RwTpEaGjnUdSBqfscwWFrRcQgzLGtfnzN1aq+fVH3ib4RTN158CSAf386W2H
	g9WdvTmZWuBcSgbAdeiavxHxpxOw1+ULSifslvXCXaLOLIqeO933D1LXfIEu1jgdtmI8qGblzOtDQ
	1sThIMv3PfQ1SdgMD5b0lY2D8vhZXeuazuxQuvuEJEsUbKl8lEVyDYnPcMHKk441uoTphjG5KYmMF
	JYz5tMS4KAGlORQxnku7dilsmpDtuL4dmHLBT6edz01sprLuH+87O56rtGzYb1IgpT32aMJPI7DfN
	6qAuos/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNxjK-000Ytc-0H
	for ath12k@archiver.kernel.org;
	Thu, 11 Jan 2024 16:16:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNxjG-000Yss-2S
	for ath12k@lists.infradead.org;
	Thu, 11 Jan 2024 16:16:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C4109CE1FC1;
	Thu, 11 Jan 2024 16:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3879DC433F1;
	Thu, 11 Jan 2024 16:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704989784;
	bh=586IbbjpftFDYfmI3BMiCS90jeVviDYs5I9sZzMsMyc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=lmjGXbOK+8pKz6/XdJ0Nh46R9sVv4Wqjy8w7QFxuFZDhZ7vub6lcmTnYN3SxHkPu8
	 N6G/3lM6cAl4YRdJz7UmUxxIBUqlpHgOgrX8cIPw5mrbOcDNCAj3gK4lN3BEQVmiNi
	 XaNx1FkBf6PAEC+wYpyanX27WhtyYqg0y6oUT/Wf0wSApf9cch5E/DNo0hy7bJvnZh
	 gYkSWkw2Cg+rNCY//OrQBid3a3ltJD+lIy++HqxHFoj+SMLJ92Zt1CxbZjUaIi9XDb
	 p+/M0MiSURqZk3C1+Cg70W78aeQBebofzLV2F8CC5imXIhstBNdXkQdgUv+Xi1iobP
	 7ZXJl3DcqnGog==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath12k: add processing for TWT enable event
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240103050926.14115-2-quic_lingbok@quicinc.com>
References: <20240103050926.14115-2-quic_lingbok@quicinc.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170498978118.916301.14993323516499040896.kvalo@kernel.org>
Date: Thu, 11 Jan 2024 16:16:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_081627_149326_CFA93D49 
X-CRM114-Status: GOOD (  11.47  )
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

Lingbo Kong <quic_lingbok@quicinc.com> wrote:

> When ath12k send TWT enable command to firmware, firmware will return a TWT
> enable event to ath12k. Through the analysis of TWT enable event status, we
> can easily obtain the status of TWT enable command. It can be more
> convenient to debug TWT.
> 
> This patch works with WCN7850 and QCN9274.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Fails to compile:

drivers/net/wireless/ath/ath12k/wmi.c: In function 'ath12k_wmi_twt_enable_event':
drivers/net/wireless/ath/ath12k/wmi.c:6675:48: error: passing argument 2 of 'ath12k_wmi_tlv_parse_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
 6675 |         tb = ath12k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
      |                                             ~~~^~~~~~
      |                                                |
      |                                                unsigned char *
drivers/net/wireless/ath/ath12k/wmi.c:367:44: note: expected 'struct sk_buff *' but argument is of type 'unsigned char *'
  367 |                            struct sk_buff *skb, gfp_t gfp)
      |                            ~~~~~~~~~~~~~~~~^~~
drivers/net/wireless/ath/ath12k/wmi.c:6675:14: error: too many arguments to function 'ath12k_wmi_tlv_parse_alloc'
 6675 |         tb = ath12k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath12k/wmi.c:366:1: note: declared here
  366 | ath12k_wmi_tlv_parse_alloc(struct ath12k_base *ab,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath12k/wmi.c: In function 'ath12k_wmi_twt_disable_event':
drivers/net/wireless/ath/ath12k/wmi.c:6704:48: error: passing argument 2 of 'ath12k_wmi_tlv_parse_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
 6704 |         tb = ath12k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
      |                                             ~~~^~~~~~
      |                                                |
      |                                                unsigned char *
drivers/net/wireless/ath/ath12k/wmi.c:367:44: note: expected 'struct sk_buff *' but argument is of type 'unsigned char *'
  367 |                            struct sk_buff *skb, gfp_t gfp)
      |                            ~~~~~~~~~~~~~~~~^~~
drivers/net/wireless/ath/ath12k/wmi.c:6704:14: error: too many arguments to function 'ath12k_wmi_tlv_parse_alloc'
 6704 |         tb = ath12k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath12k/wmi.c:366:1: note: declared here
  366 | ath12k_wmi_tlv_parse_alloc(struct ath12k_base *ab,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[7]: *** [scripts/Makefile.build:243: drivers/net/wireless/ath/ath12k/wmi.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [scripts/Makefile.build:480: drivers/net/wireless/ath/ath12k] Error 2
make[5]: *** [scripts/Makefile.build:480: drivers/net/wireless/ath] Error 2
make[4]: *** [scripts/Makefile.build:480: drivers/net/wireless] Error 2
make[3]: *** [scripts/Makefile.build:480: drivers/net] Error 2
make[2]: *** [scripts/Makefile.build:480: drivers] Error 2
make[1]: *** [/home/kvalo/projects/atheros/ath10k/src/ath/Makefile:1911: .] Error 2
make: *** [Makefile:234: __sub-make] Error 2

2 patches set to Changes Requested.

13509671 [1/2] wifi: ath12k: add processing for TWT enable event
13509673 [2/2] wifi: ath12k: add processing for TWT disable event

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240103050926.14115-2-quic_lingbok@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


