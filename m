Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DB8C4345F
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 15:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UnC8HCnM+fJJKHRUq75rgBdYZvvwGhzvDdh6KuyXpI=; b=KxfyqyCz5LjGIUVcWYeihunssq
	srJ1wnCdmHKrzkB2xHI8e/rNsJck9zPbldRyOl1ioVUaGiCmxBZJufGmremtmsW3ojzCICPJs8a6c
	KkddukU+3L2zKO0BQ/AOr1A6v1SWakNr/ijMQ2RlAfA5kHNv05WoFWqBRVXPODrz3iX6gtlfG9ozu
	Inwyl3R8FLofzkh8Jwl3Yo3T0UdoMFczc3H6/5p2rGdVr2CgAu7p4MPY+HPR9UiEYHY3Pth2MvcLB
	4jMy6vzyhbuEqy4E6vVAbsq5yvwYz7fKfvHd/Ukog8w7l6VTbtUP4vyb6+j7OodRCQpkcAKIViapk
	/shXlh/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzebn-00000004jOo-04va
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 15:32:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzebk-00000004jNj-19CY
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 15:32:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 821EDCE173A;
	Wed, 24 Apr 2024 15:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52A4C113CD;
	Wed, 24 Apr 2024 15:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713972745;
	bh=XrkNSGs3Aj/yb8aXtepxwow2X1by+i5AVY6vSibR06Q=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=rXL8SPOiImbcI6Bgo9igIAdFFaWx4cUTjjxmI7akFGVewG1l+s3sioGMyDzBIfemO
	 5hu02/2kQHjqE5rnq/9Bgi3j0pU/0sWBmV6GZI2+QttJKMWYE7VFvT7lJDamf1nmsm
	 fY4bCE1MkvRWpFLKbP72Fd7G1BSv7cxLTh/qQJXDJ+6ACo+OhjGgJyJp0h5FQ80YMx
	 oLEwTXYROpgq6Z3E7cvlMhuRqccNBW2h3GKlTibncjZBVDhyGsVVStbr1eyU59/XM5
	 CB4sq9qtTSt8aQMQgXTDsDOG2Th+JEgSQcc4H2X0jx7fZ9leeD/asEVM9AH+F/gHEb
	 rEYmgV8DDqvJA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] wifi: ath12k: add support to handle beacon miss for
 WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240412094447.2063-1-quic_kangyang@quicinc.com>
References: <20240412094447.2063-1-quic_kangyang@quicinc.com>
To: kangyang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171397274283.2560403.15597584841282293691.kvalo@kernel.org>
Date: Wed, 24 Apr 2024 15:32:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_083228_568437_8C84D58A 
X-CRM114-Status: GOOD (  10.26  )
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

kangyang <quic_kangyang@quicinc.com> wrote:

> When AP goes down or too far away without indication to STA, beacon miss
> will be detected. Then for WCN7850's firmware, it will use roam event
> to send beacon miss to host.
> 
> If STA doesn't handle the beacon miss, will keep the fake connection
> and unable to roam.
> 
> So add support for WCN7850 to trigger disconnection from AP when
> receiving this event from firmware.
> 
> It has to be noted that beacon miss event notification for QCN9274
> to be handled in a separate patch as it uses STA kickout WMI event
> to notify beacon miss and the current STA kickout event is processed
> as low_ack.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Reviewed-by: Nicolas Escande <nico.escande@gmail.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

b0afabc4d7e0 wifi: ath12k: add support to handle beacon miss for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240412094447.2063-1-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


