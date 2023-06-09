Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5960DC7EE25
	for <ath12k@archiver.kernel.org>; Fri,  9 Jun 2023 13:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66IuS6Feu74CCUrFwn4v8sgZsVHYJFUdb/xdkY3YFkY=; b=gBGmdRACQZE6V+
	AWsjilmVE8upuQ+oF+fpxbKeVtFYnrIlXTB9pHBw9kbdy9Vn0A1puO8qZFLS9f8gxySiUYXHk+bvV
	+tDHHD8qCfDsuFqljoQW645g6a2f1BiBN+VVB4xl6tXa3FFjBEOdA7lAa774TrY+bCjR/UOLQRk7+
	eWE8pAM1EjDB80H9mlOssdbTChXtAa2PUjK6r1777MSYjOW7EeJYd59ZFUbYdRBbFqwRLTHXMyPzd
	QLTtZ11f6yloSezOfuCaYxjXQ/6eh/w+HCLvJooS2cMvBcGgxda9WQ02pQ5vtUhvWh5Pg295jzRjL
	qkTihA7X4Fe5sWeGdyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7cDm-00D8Xn-03
	for ath12k@archiver.kernel.org;
	Fri, 09 Jun 2023 13:32:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7cDj-00D8XM-0u
	for ath12k@lists.infradead.org;
	Fri, 09 Jun 2023 13:32:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CBD81648D7;
	Fri,  9 Jun 2023 13:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528E9C433D2;
	Fri,  9 Jun 2023 13:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686317522;
	bh=Rw3dAMIdjdiaMCdDJYrhk/RgPHgoQhkwsP1VueIBGOg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Agdjl8FdSMrhueNuwn7Cch6xWahUS1ArVpQRVWQUhRa0UQFV1HJ7NBhZUGiAO3/pp
	 gJlh421wysxOQiRXMsBrXrtJluqcrX2l5/iQmkMYNPuB0ebs98428bkEaeelojJ4vm
	 gITf6unjME5FOfSnAO3AuoJQqsZkI1oNQaYRJIzq5+tO9AstfDkcqqusaabV3ceii4
	 gXRT45rTkZGQsVwniZhN6fqrBBwkJtDv76JHN6CMBjuAJmsE332gXil5hq1v5sMFbv
	 TKapFjCil8f0di8toqMk9u2bqsZC0ouZgGBEocPTJ4KwpxgbfnJOBWR5v9bMhKRAu6
	 eboGFz0wKr40A==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: Avoid NULL pointer access during management
 transmit cleanup
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230518071046.14337-1-quic_bselvara@quicinc.com>
References: <20230518071046.14337-1-quic_bselvara@quicinc.com>
To: Balamurugan S <quic_bselvara@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Balamurugan S <quic_bselvara@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168631751914.7235.13826635338122633209.kvalo@kernel.org>
Date: Fri,  9 Jun 2023 13:32:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_063203_396074_95A58CA3 
X-CRM114-Status: UNSURE (   6.72  )
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

Balamurugan S <quic_bselvara@quicinc.com> wrote:

> Currently 'ar' reference is not added in skb_cb.
> Though this is generally not used during transmit completion
> callbacks, on interface removal the remaining idr cleanup callback
> uses the ar pointer from skb_cb from management txmgmt_idr. Hence fill them
> during transmit call for proper usage to avoid NULL pointer dereference.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

054b5580a36e wifi: ath12k: Avoid NULL pointer access during management transmit cleanup

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230518071046.14337-1-quic_bselvara@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
