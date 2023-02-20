Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5F1C05027
	for <ath12k@archiver.kernel.org>; Mon, 20 Feb 2023 08:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G313eRCMmiXR5dCq1Ewu4SBdHLTCbwas8DqRUslwUb0=; b=LW4KrSfxlANBxJ
	RYkhZEcvolq6NXH1l0dDPYvp80Q4ZlpaTLySC6FTmfUkhdp2NUKmAQQKUeuWdOgDUcCZe8omor7iM
	RRp3PYKuq0DbNmHjLUr2WOvgvHNZ+yFZFot9eK2hAr8zbQVEuzN/sFj5jRHxfMpscRf5z4+NL+sxy
	RDiqA/0cddVQD8Tv1+0NT8yMrW5tJT72JF/5VQEbYBySTlen3GisrOsGEvkTmeAdlGLN53UwxFX7e
	qzsHRt3if8Fnmu5OsiQqY1i2By2OXhYtIfD6jiuaipzMNKgYb73ywReWiLyikiXrZz/O1DqFfFfPY
	lafqrAMvGnl+eqCtApPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1nh-003NUW-AL
	for ath12k@archiver.kernel.org; Mon, 20 Feb 2023 08:45:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1nd-003NTG-1d
	for ath12k@lists.infradead.org; Mon, 20 Feb 2023 08:45:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 356BE60CF7;
	Mon, 20 Feb 2023 08:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD6DC433EF;
	Mon, 20 Feb 2023 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676882725;
	bh=0wTN7oW3rrs6FmwbULgoC20s6jWSMg1bdkb9tqdgGDk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=LIhht1LZjILKKOD/6LmKz6LUmiZ7UkToMU8W0aZy+QbCvc/p+Tt7gIFGwRjVyGoLE
	 84ljRazPWPYsxzr4ZnBhIZEHKkTCWIEUSvM1+ogtbkCwlY/0tcqpO+Vnu7Gwo4M2bk
	 Bpo2ugBE+jApelY4sqy587oJK0+7UeexvG8/jGuKuwepNl7LxmoOI6gpJc4ZmG9oCk
	 RNDUM8CsyV2upxDm51wQ/NAwEJiixrIGuCnfqTPmqb6NwHN3wkO9YQZT8SFpUEpMvT
	 QcpKzQpesSlIJrm7jLdEgcMM/Hty5FspD4BPkg6LnAWDi1+7KSbxwZo2/Od+R7xZ/c
	 7El7BzZxKKBQg==
MIME-Version: 1.0
Subject: Re: [PATCH -next] wifi: ath12k: use kfree_skb() instead of kfree()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230217072739.181304-1-yangyingliang@huawei.com>
References: <20230217072739.181304-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kvalo@quicinc.com>, <quic_jjohnson@quicinc.com>,
 <quic_bselvara@quicinc.com>, <quic_srirrama@quicinc.com>,
 <quic_pradeepc@quicinc.com>, <quic_bqiang@quicinc.com>,
 <yangyingliang@huawei.com>, <liwei391@huawei.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167688272149.21606.14556668506385773594.kvalo@kernel.org>
Date: Mon, 20 Feb 2023 08:45:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_004529_163064_B049E345 
X-CRM114-Status: UNSURE (   7.28  )
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

Yang Yingliang <yangyingliang@huawei.com> wrote:

> The sk_buff should be freed with kfree_skb(), replace
> the kfree() with kfree_skb().
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Dan already submitted an identical patch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=8c464d16809fa02982f6341ea598ec5d07457f19

Patch set to Superseded.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230217072739.181304-1-yangyingliang@huawei.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
