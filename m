Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FEDC636D6
	for <ath12k@archiver.kernel.org>; Fri, 17 Feb 2023 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXoACHhAj11kFEGXLhEEHYK1EAO3IgrUxWvCe9RRQtI=; b=jMf9gFY9bTw0SQ
	xHoYqs4+kRxTITKUCWRvKkL2LPaPvpmAVL83EUuo2hIZqPwL5XhqnrYFnSV8B7GkBDsX09JLT+NNO
	JGwU7k1z0qHtlBW4xgWULg3gmWsltoYXj9ucdrvD+nGo6W1IonJzaUs3ngf513ZrBhyI6UCYwvUZO
	wlyk40rlt2f6VV+zIsaccHzwL+zJQ+z5g6lsyXaB6OgWkG0YPF5J0iwBUwLs+mIDCK1BzJtHU9lFx
	PraL8jqiC8+UhlP+gBgn9MK1r59tFrcrjHtJscM8+0uj8znqx8wjhSFDBDBb3zurvyY5Dr/bBoIvi
	+acS8LU1x1RxvDAWhbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3UR-00F1oU-DH
	for ath12k@archiver.kernel.org; Fri, 17 Feb 2023 16:21:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3UN-00F1nD-FW
	for ath12k@lists.infradead.org; Fri, 17 Feb 2023 16:21:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0230461C30;
	Fri, 17 Feb 2023 16:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F851C433D2;
	Fri, 17 Feb 2023 16:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676650894;
	bh=TuXNu3KLEBuwBD34TiklRTFUXZfjkU9djzAPGLfs2Ds=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=FJbjRoyWr9mTlyVQ99ff594eBfcDE8JNQCJR9Vyq44Q9Io48kiVV2P4IP7Av7bujg
	 /9BjKFqx0iMXwxzQaWtX18PCw0OHb8wCS6hVmvdWT8JBAhNP58NR+zgqjdd1jV3NGE
	 ujRJEkEp2r8ts+3RkDjA+eo0w0wnwJX9zeCML5QQyS5kRvvSKcPzIEZq4qcLUlE9e/
	 Uv/Kxohr0mMj6WgsSgUA5MeXzCnjPQjyqw8mbxll9psYsed++0JNPvyaL9eRS+Vgqq
	 XTMSGFbLZgnQdx8MSaBGW+/Y5rU6jovI0J523nPZZvB0+MNPTEiyDGidBtM0LomQnu
	 TkSm57ML2Bn5Q==
MIME-Version: 1.0
Subject: Re: [PATCH -next] wifi: ath12k: dp_mon: clean up some inconsistent
 indentings
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230215012548.90989-1-yang.lee@linux.alibaba.com>
References: <20230215012548.90989-1-yang.lee@linux.alibaba.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167665088778.8263.12054691463411607206.kvalo@kernel.org>
Date: Fri, 17 Feb 2023 16:21:31 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_082135_582543_8E154148 
X-CRM114-Status: UNSURE (   5.52  )
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

> drivers/net/wireless/ath/ath12k/dp_mon.c:532 ath12k_dp_mon_parse_he_sig_su() warn: inconsistent indenting
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4062
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

df8e8db22c25 wifi: ath12k: dp_mon: clean up some inconsistent indentings

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230215012548.90989-1-yang.lee@linux.alibaba.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
