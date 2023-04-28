Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7013CC77B60
	for <ath12k@archiver.kernel.org>; Fri, 28 Apr 2023 16:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=up5GYlk7URUSGYjCyt6hxAT2kZ+7QnVX+nM75LJfXno=; b=pc0yTpPbez7jMB
	hZ+JgOuGjxmXRL69fWOdaJiBzu3uB1zhpz8Zn5H1m1hcQd1XHgiySNxYjkmVWmETfBxB7gPpv8G4m
	9r2fWAo7Dff8CfHxGUytX/rpgcrdMSZSgPWqWlyRwMkUGx2a/gYdeU+83O7CMoZgKlV5yY1ImColi
	Fgc4FzxE/FFPks4VY5nzk7vptgM2fXluL//AzWJo7HF1WQo4kCWca1bLL0f+xDMtxFfJDXrZYrBhg
	kCcEXwLxEvQ4sTkau119QcwSUMZL/gJtfnaX4m+oQoJbEXgqTybxJSs8ZQF49bNpDwXP6SNVURWRO
	Qy2c/AXaZEfD5aDi+bvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psRLv-00BHQN-33
	for ath12k@archiver.kernel.org;
	Fri, 28 Apr 2023 16:53:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psRLs-00BHQ0-2y
	for ath12k@lists.infradead.org;
	Fri, 28 Apr 2023 16:53:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C658D61117;
	Fri, 28 Apr 2023 16:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E734FC4339B;
	Fri, 28 Apr 2023 16:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682700823;
	bh=JWcTQJX9/X961Kb33b8lpvZkffh9I4opvz78Yme+I34=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=LElNgJk2lRyREgMTcx1yV5uEziuSRyP/8kL6p5ughYoSg6JCZcnc2PYQGnrX5Hcji
	 07HM8oodBhOnfk9Zv7cG9SXbL9TsT7BCcXFceWQ7PQySmwOtkXXvd9NB9Swnh9CEza
	 3k4GQ02Lra7IvjvXEMM+qwcQRhSNW6QWuzm8s01e/G1ismv7kXBwMH/Up5v+X1Iesy
	 puXFqwWlcWH4PKP9hkE+70FdOr7ESP6s2VHchcRXk40Wu3iKJ1Gsl5GcXWWAA9wiyv
	 u20+rw6IN0yaIbCy1Lw/6P1V96K76uI/9aChA36hupNd13w0M8FTruGpdI5z9jXwty
	 h5drrQMjELaAw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: Remove some dead code
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To:  <c17edf0811156a33bae6c5cf1906d751cc87edd4.1682423828.git.christophe.jaillet@wanadoo.fr>
References:  <c17edf0811156a33bae6c5cf1906d751cc87edd4.1682423828.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168270081882.13772.3615961159220627233.kvalo@kernel.org>
Date: Fri, 28 Apr 2023 16:53:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_095345_015046_411717AA 
X-CRM114-Status: UNSURE (   6.71  )
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

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> ATH12K_HE_MCS_MAX = 11, so this test and the following one are the same.
> Remove the one with the hard coded 11 value.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

33f83a23f4cc wifi: ath12k: Remove some dead code

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/c17edf0811156a33bae6c5cf1906d751cc87edd4.1682423828.git.christophe.jaillet@wanadoo.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
