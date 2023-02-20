Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFC4C05027
	for <ath12k@archiver.kernel.org>; Mon, 20 Feb 2023 08:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1raU+f3PJu0XpaE6qWR81Cm7sLI6vYue5wzdMLCTcU=; b=u+tKxJxk7lmOEq
	9HsSKUKh6qx99mJ2GFMVYm1tXL4Ndgfdg+msKi8qwzmBMHrGJHSiWXSzJVTtrWwKO5WBvFEezBeBw
	sJnEh3bWchVwGGDTO94YloNaBKU4RTUqrkII32MGF1l6cn2IO+Ge1GOJm/5sCy/vFJMfvVPzYQoSe
	0DPAeigbZIUoJoCbFD/28teXbgXjp//goB5peoiNX8mxXuJNfyCGOOnWUOXgHaDYLm8W9vZLy+EwU
	KJpPyciEs5QgpCdUUvWqpfGsPWm1KqLDO0Z3OWZVCpgKNBrH2FH7EfA0uQc4J01qViP5jAUVdyHFd
	/rBLWbWFK/v/MXzjZTPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1ee-003LaY-2z
	for ath12k@archiver.kernel.org; Mon, 20 Feb 2023 08:36:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1eV-003LYL-2p
	for ath12k@lists.infradead.org; Mon, 20 Feb 2023 08:36:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8980660D14;
	Mon, 20 Feb 2023 08:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC1AC433D2;
	Mon, 20 Feb 2023 08:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676882162;
	bh=lote9b8ZjlQAz5KsQvHp/Q5FbH1kp4EcSqoIPKfV4qA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=J8OxOqWN+C3Vx/tq9E3zKsVKnJdWBkwDhKS3MHNedd43jWjegrBhPK5TCj9p94PiN
	 JKM+zRKh/+8H9MnLYe9rbwytHgGZqNWDntHli/0aKb6gpnpnEM2Fi1r3s55JkfmVnn
	 Loau/Ku5rZl/rF/t1GWOZ1OP6EznbDuIVg/ymR0f+AGmvjz2Mvya6sSyai41nlSlLa
	 CcLMCnLW0SgjrlZiZM+0NtOHU8v9KLBeyQ9qVDXqdPF4fbv6ASfGsHB4Zk3Z+WoS5i
	 ooBuUK97bvC2K1gI5dUjTmo/AeGSDKz28AfIxrmY4msJpGrvn2T7ZTmlha5YgqWBwQ
	 zL3Klfu2Axz/g==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: use kfree_skb() instead of kfree()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <Y+4ejiYakhEvEw7c@kili>
References: <Y+4ejiYakhEvEw7c@kili>
To: Dan Carpenter <error27@gmail.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>,
 P Praneesh <quic_ppranees@quicinc.com>,
 Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
 Wen Gong <quic_wgong@quicinc.com>,
 Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
 Baochen Qiang <quic_bqiang@quicinc.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167688215685.14547.14754982829823195768.kvalo@kernel.org>
Date: Mon, 20 Feb 2023 08:35:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_003603_416160_1FB2F87D 
X-CRM114-Status: UNSURE (   6.51  )
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

Dan Carpenter <error27@gmail.com> wrote:

> Sk_buffs are supposed to be freed with kfree_skb().
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

8c464d16809f wifi: ath12k: use kfree_skb() instead of kfree()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/Y+4ejiYakhEvEw7c@kili/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
