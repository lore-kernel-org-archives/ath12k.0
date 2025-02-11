Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9B6C02198
	for <ath12k@archiver.kernel.org>; Tue, 11 Feb 2025 02:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrwYLkPaZu6AzANx50orYDsvna7IavtON87rF1I0qck=; b=omLeyeDqno4H1SDiExFMDGJ1zd
	gO6fElgLhzgvuW6YrMepYsju6OIlCa7GF4odsPzH7doJKTIVbDdZNSxvLJqTSDn4xXs9gGBfK0iVU
	smXRwpay8eFoAXUqyMO2AYvJbESHsutLzfpbu2tzL6PO0mxCXnOVkmoL0kpzo79SEAMYrNDjjJCxD
	eYjZEVnGAeQLW1HuxEF431Z0aZG+duRXi7I9NfJPGK3b1vlIhDwTJzYR724Dtc7F+buChKF4yHbf/
	vwc2TGGsJJ1gOqvMsOe/Qjphx96MU+ZJqvhOEgg3+572y+c1iAraDIxG0hxaQis8XfJiL5njufmwY
	uencTnGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thg1L-00000002H5S-2II3
	for ath12k@archiver.kernel.org;
	Tue, 11 Feb 2025 02:29:07 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thg1I-00000002H4j-2cwy
	for ath12k@lists.infradead.org;
	Tue, 11 Feb 2025 02:29:06 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4YsQP33ppkz9sW9;
	Tue, 11 Feb 2025 03:28:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1739240935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IrwYLkPaZu6AzANx50orYDsvna7IavtON87rF1I0qck=;
	b=PVTR7L8BR9QA2ygX1CHN2RG1B/0/+Nqy3UPFqWI5gGK5VWlLYjwLaU9tHEF43F6Ep9u651
	w0dtL1MX8VZ6L8gt5aIZJKcgU9lTMaqVE3iIcj6CV2x471fFg6KIsT6YG3I0hSRFXVh7Ob
	yA+JoZMrXgLB2hyY0sYYzS3VQBBQ6J+yO2sHFueS8JKV0LKrkECBK2E0eWo3O03EVAxHs0
	Twn8pVZUlqv+yhsTnnj0LeZ5JaBgVWbMbILQyJANv0j41cIM44uMOZBKPTokacsWooZCPH
	J/DJcLb6KjQ5jJjlqYA6nV22j0AkvWAi/Msg6tVhPSwOyt8Jq0RoOgAPpHG2YA==
Date: Mon, 10 Feb 2025 21:28:52 -0500
From: Ethan Carter Edwards <ethan@ethancedwards.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kalle Valo <kvalo@kernel.org>, 
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Harshitha Prem <quic_hprem@quicinc.com>, Kalle Valo <quic_kvalo@quicinc.com>, 
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: Fix uninitialized variable and remove goto
Message-ID: <mmutvwbsr3h33hxr364zr6f3whmyxp73od3fihsbynek2pkvjd@6bqaqfkwkf4m>
References: <20250209-ath12k-uninit-v1-1-afc8005847be@ethancedwards.com>
 <a7ca4e4b-c432-4f2b-81c6-c7b06cd12de1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7ca4e4b-c432-4f2b-81c6-c7b06cd12de1@oss.qualcomm.com>
X-Rspamd-Queue-Id: 4YsQP33ppkz9sW9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_182904_897484_67FB4D2F 
X-CRM114-Status: GOOD (  27.66  )
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

On 25/02/10 05:08PM, Jeff Johnson wrote:
> On 2/9/2025 8:36 PM, Ethan Carter Edwards wrote:
> 
> commit subject should be as specific as possible.
> suggest you at least mention the function
Will change. Thanks!

> 
> > There is a possibility for an uninitialized *ret* variable to be
> > returned in some code paths.
> > 
> > This moves *ret* inside the conditional and explicitly returns 0 without
> > an error. Also removes goto that returned *ret*.
> 
> ath driver convention is to declare function variables at the beginning of the
> function -- please do not relocate the definition of 'ret'
Will fix.

> 
> > 
> > Addresses-Coverity-ID: 1642337 ("Uninitialized scalar variable")
> 
> Is that an official kernel tag? IMO the proper tag would be
So, it isn't "official" as far as I can tell, but it is widely used in
other commits, especially by Gustavo Silva. 

Also: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=778e2478d19574508861bcb1806d6e34d095587c

Coverity-IDs: is another option I have found. I have seen Closes: a few
times as well. I'm not really sure what the best option is, honestly.

I'll use Closes: in v2. LMK if you want me to use something else.

> 
> Closes: https://scan5.scan.coverity.com/#/project-view/63541/10063?selectedIssue=1642337
> 
> (is there a shorter URL?)
Not that I know of.

> 
> see https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
> 
> > Fixes: b716a10d99a28 ("wifi: ath12k: enable MLO setup and teardown from core")
> > Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> > ---
> >  drivers/net/wireless/ath/ath12k/core.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> > index 0606116d6b9c491b6ede401b2e1aedfb619339a8..ae75cdad3bd6b6eb80a35fee94c18d365d123cbd 100644
> > --- a/drivers/net/wireless/ath/ath12k/core.c
> > +++ b/drivers/net/wireless/ath/ath12k/core.c
> > @@ -908,7 +908,6 @@ int ath12k_mac_mlo_ready(struct ath12k_hw_group *ag)
> >  {
> >  	struct ath12k_hw *ah;
> >  	struct ath12k *ar;
> > -	int ret;
> >  	int i, j;
> >  
> >  	for (i = 0; i < ag->num_hw; i++) {
> > @@ -918,14 +917,13 @@ int ath12k_mac_mlo_ready(struct ath12k_hw_group *ag)
> >  
> >  		for_each_ar(ah, ar, j) {
> >  			ar = &ah->radio[j];
> > -			ret = __ath12k_mac_mlo_ready(ar);
> > +			int ret = __ath12k_mac_mlo_ready(ar);
> >  			if (ret)
> > -				goto out;
> > +				return ret;
> >  		}
> >  	}
> >  
> > -out:
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)
> > 
> > ---
> > base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> > change-id: 20250209-ath12k-uninit-18560fd91c07
> > 
> > Best regards,
> 
> replacing goto out with return ret and unconditional return 0 LGTM.
> 
> can you respin a v2 with the other comments addressed?
Will do! Thank ya much.

> 
> /jeff

