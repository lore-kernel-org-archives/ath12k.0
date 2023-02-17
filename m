Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D0FC64ED6
	for <ath12k@archiver.kernel.org>; Fri, 17 Feb 2023 16:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7D53lwoEDa2XAlr8XRNH5BbrNrjmGWR5NzMafQifdI=; b=npufXj13H413Yr
	MAOWVknHv8N9d3PDQjx4oZDFQdnsi3NRG4rHPlyvCtd/K264iIAZPbspvvlS87XPuCs2cTY3yc0nu
	MKCaRJpTtYeJs9YSCZIE/t6GKRoO447lIXWvkVdVlL1NAuDIwXxbIAq34eLNh/r+CHHGs/EDgu3gj
	qw7F9S3O+5M8nCO87gteJhUVGHhn9hsJZcrhXkjvMDaaWE8KXMKzXppzM6NUqW7g+2UtyZzOZGGR1
	zRdBpq6E3OHrgMmNfInz6wxGi0ln77G5i9x+pdGYxMFTQafvEU9L7AC+G9SR7UXYjjI8j5JpuP5G1
	E6hRUuVUVY+ODdYFBcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3Ie-00EzQd-LC
	for ath12k@archiver.kernel.org; Fri, 17 Feb 2023 16:09:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3Ib-00EzPS-NO
	for ath12k@lists.infradead.org; Fri, 17 Feb 2023 16:09:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 34BD9B82C83;
	Fri, 17 Feb 2023 16:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FF5C433EF;
	Fri, 17 Feb 2023 16:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676650162;
	bh=z8ad3IPFM8xp59zw3jM5/vmke5RHnre99d6D95D/pzI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=TFJMYEnBaVSVknRizyF9JWrV0Q/vxIqwcQBhkf/vRekrgZw3zLrxbOP1un4lmgdvP
	 cF/Qd6fPcwBDDcivYEyiP2GqRoo2BDGSV97+DBP2c+gCGf1WjRQK7imvN2hbqC3Vnl
	 G/jOAaa25JkuWWjxLqftPxwnbwYntlN4IcN0beIFkcd6SEo+Yj3lCsBA/Vp1Im73/m
	 OwNy1E/YxONZKRDO4BRibCe0tTqP50Oh5Y3Whmz279PF4k8D7qVSIEBYAXT5oyT8PY
	 wum6Gvh1tEHlFtlSc6ML4tZgswMfClOk33j4oKfA/oaRh0wWvJcxQ9RrNisGnWjXIO
	 RCqR1R0NbN9uQ==
MIME-Version: 1.0
Subject: Re: [PATCH -next] wifi: ath12k: dp_mon: Fix unsigned comparison with
 less
 than zero
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230215011453.73466-1-yang.lee@linux.alibaba.com>
References: <20230215011453.73466-1-yang.lee@linux.alibaba.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167665015810.8263.7706809167524564713.kvalo@kernel.org>
Date: Fri, 17 Feb 2023 16:09:20 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_080925_938028_B8CC79B3 
X-CRM114-Status: UNSURE (   8.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Yang Li <yang.lee@linux.alibaba.com> wrote:

> The return value from the call to idr_alloc() is int.
> However, the return value is being assigned to an unsigned
> int variable 'buf_id', so making 'buf_id' an int.
> 
> Eliminate the following warning:
> ./drivers/net/wireless/ath/ath12k/dp_mon.c:1300:15-21: WARNING: Unsigned expression compared with zero: buf_id < 0
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4060
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

731e1b36656a wifi: ath12k: dp_mon: Fix unsigned comparison with less than zero

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230215011453.73466-1-yang.lee@linux.alibaba.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
