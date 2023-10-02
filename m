Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A36E784BF
	for <ath12k@archiver.kernel.org>; Mon,  2 Oct 2023 16:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnF/0IJpm0qJUK8B8LXXghGWk+qgESwzbK0L+MTgKC8=; b=ijAriZdeYU2rzW
	/9pIU2sGcVXVWvXMsryEbAxJLhV9bVBddW7+Ld0tn7VWAeTbOdfdB4fiKufRRnPFfIDvWvN50xzgt
	tANgDzYn837h6BKMDi7ybdFnVeIZ0be2MixV7Aw8U+1g0oNoORusdGiqhpGv4UE7erS5Ud5zTAVEB
	P+B7emLQM6SGFe5TV60QTwJF0f9PN1yvqHiJmfa2qC7lTvp78FGE+pYmhjKWkOUwg40i0HUyIlcoY
	dAh5/4U7tchGMTYgXo8UhKeoWtwEQGVST7ymxxRg61K7bJxMi8V3EtJwO2zyzrjHefd7fDb1QiYw/
	2L1IAEmk0GXbXk5a+WTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLNn-00D2Om-2m
	for ath12k@archiver.kernel.org;
	Mon, 02 Oct 2023 16:02:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLNk-00D2OU-1y
	for ath12k@lists.infradead.org;
	Mon, 02 Oct 2023 16:02:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0728260EF9;
	Mon,  2 Oct 2023 16:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE3AC433C7;
	Mon,  2 Oct 2023 16:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696262571;
	bh=HuxJiuznms2W8lxP6HRykHp7BYb4KNtNZEOr+LscHgU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=FL06NhOIuzHuu2zLbQ7BQ99cT9nnu8JCzArSJXRp/urU0or7BIpSD7A10PWo+UzN9
	 EgwVhhCznoSyOUMlYpqg6QrlvNw0cPAdc/bLBCUAOhNMa/TC+sMEd4b3AHBODkF8IP
	 zF+u4fVAsdoMndA4mPgPJZ3wyQuj1y4CBxNvLkrV1+b0nmIVgVZ4yUschuZfzbMgvk
	 7ASI667rRPmexnoR7a4I8oPluTmjZwMe0qCpWbw4M3XTChBJlyyR78WulMG9jNNQN6
	 7b/nrXyWoCAgJyiGI/dCg/IUQjK575q/CuJdjbJGg3W92YkRlgiihe4+frQeFmjXbH
	 6ELVN8G6sYhcQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath12k: mhi: fix potential memory leak in
 ath12k_mhi_register()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230922021036.3604157-1-make_ruc2021@163.com>
References: <20230922021036.3604157-1-make_ruc2021@163.com>
To: Ma Ke <make_ruc2021@163.com>
Cc: quic_jjohnson@quicinc.com, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Ma Ke <make_ruc2021@163.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169626256833.3917291.8799520274083808418.kvalo@kernel.org>
Date: Mon,  2 Oct 2023 16:02:50 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_090252_713889_7CC6C28D 
X-CRM114-Status: UNSURE (   8.07  )
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

Ma Ke <make_ruc2021@163.com> wrote:

> mhi_alloc_controller() allocates a memory space for mhi_ctrl. When some
> errors occur, mhi_ctrl should be freed by mhi_free_controller() and set
> ab_pci->mhi_ctrl = NULL.
> 
> We can fix it by calling mhi_free_controller() when the failure happens
> and set ab_pci->mhi_ctrl = NULL in all of the places where we call
> mhi_free_controller().
> 
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

47c27aa7ded4 wifi: ath12k: mhi: fix potential memory leak in ath12k_mhi_register()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230922021036.3604157-1-make_ruc2021@163.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
