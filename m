Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5127E7716E
	for <ath12k@archiver.kernel.org>; Sat,  7 Dec 2024 06:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WS302FzxsUMqz5/SIjq4Dq3KB8bC9DgL1kzTjInTQxU=; b=O+V9sp/XNd/i6iBTVvSNxZkpwW
	DfM822NH4xg8EA3mwNrK4OrO4M9kiMhGGoBa7KELCu3pTT6S6Rd0cjk1fyD1w9aIKfgMWjbAx6Jhx
	jO/T10XYIRMVk4L7A7KSlL8fBZl5KrKg1cot4hG9M3c55huEeB/Joqa8kLgpE8MIARX/Dtqx0YIxx
	qhXUqP28mHw5KveINIdLmWKH7koIK0rLHzJiQl2OTEvVOWq5leQZeTM/WdR1oGaivhYW8JG/OmOMT
	z1Wj8MZF9PzPTAFvQWgSxGpZViNQgX3wahuB9eXItVUYg+cMudN79adev/xpA5fFPyIpd47PSA6n7
	vx6zcFvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJo1U-00000003TnV-2Fgh
	for ath12k@archiver.kernel.org;
	Sat, 07 Dec 2024 06:10:36 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJo1Q-00000003Tn3-3MXA
	for ath12k@lists.infradead.org;
	Sat, 07 Dec 2024 06:10:34 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7251331e756so3020867b3a.3
        for <ath12k@lists.infradead.org>; Fri, 06 Dec 2024 22:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733551832; x=1734156632; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WS302FzxsUMqz5/SIjq4Dq3KB8bC9DgL1kzTjInTQxU=;
        b=CIG7I/kmQ2SKTnDyN9kRaAvUlr0GIxUs1zOApXqq0jFu5+M1ouRwz6p2DttqOAkKdD
         dghfTEVnwaZnkaoRuKUWZ0y/6/+ohw50M/XmwHjDP1DmUVvIrCbJPy/kr690lIcATbgt
         nbRyzLoD/c0KYrA41JlqbAd5Hn/ebdHRltKeE9ex9LM3LNihL5v4NX9k5qtrX3O8Kazj
         1W3bfZ94IUY6lQ7K2M/GjOSAcnl/UZu+lae+LS7Ynq+1AYTGEVg3qPY23mAnbc1iLuee
         6bH+inuECgu+MEiladmSgLaE8Q8lmsjDeycx4UDwvttXE/bRCF9GpNWJR1Jdf6G4fJwq
         U7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733551832; x=1734156632;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WS302FzxsUMqz5/SIjq4Dq3KB8bC9DgL1kzTjInTQxU=;
        b=uhCh4TYfqyC+JF2GRdCaDoq5cHrXlyTDvVGriCHB6/8wA6K+88VtKrsSDKvm0azwlS
         39Taq6z8sQ/+vHzMZZHfDVYBLYd6pST1VmFBfu+7LvhGADWTSFfwi1CU82MdxmFhd4QI
         YSAfXlZ3pj/uzsfrz98zMPau5RjCHOCe+Hu3www5RMCWubLBdBXXXnDA1ZeLZ6+yCF3T
         5s7dP29DMk5iLhvcTYxV2kSHmrNJive4Pzl5TUrLVMVRCpbZiOy80mIlPFWZrEFRhuZV
         hEhmNNF4b+Be55afXBhhhlSkGQ4ROyRpZYp2+qYmebm5vfDEtxQEWxA7s8Ixj5Pum9zl
         4Xgw==
X-Forwarded-Encrypted: i=1; AJvYcCXYCj0fn/84Ku1yonM6cmSCiEQDk7DJQ3CJLgB88VRV4UhpBhLhPOnU0c8pl2LYio/PnpYRJkw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+lju10lQyU1wN7X6NqbphGfjbBNoDYaYlsBTkf4fhsdJLqErI
	ti/a9ZRu6NrGhMycfvykSudxO0YV7T5WR9dYp7bMmGaHbn6/VxSvq8/x4RLe
X-Gm-Gg: ASbGncvDL8HO8Ngo248vlr1SbOzYmnXDwHUBjbIS2fadjVB3ElEzJDCYMPZR2iA6LXG
	ZlBjZB+5wUgJF4WzzA7SrH9pERbGPL+KtMvDly0/XeNTxOfFzDKJ2soVhxFgr6v/kfE8dQoaSwX
	JQ90Qusl46/eBjJ85965uPmctBNc5xNnCYopi+3jkNkgWRtfwvmNTdJjHGoGzcIfM1LEIKMZWMW
	RBIu0iq94TuXeYlCq2yqSpnXPIomcfjrZxuTh/5lTKsV78VCRTjulZEtII=
X-Google-Smtp-Source: AGHT+IHKDVI0M1a9Yctm/CBV7psH86jb7o8aNJEMRvdEppICbZuFYbzAkh2rPSAoS8q4SjeJHMHktw==
X-Received: by 2002:a05:6a00:1747:b0:724:eac3:576a with SMTP id d2e1a72fcca58-725b81a3dfcmr9611046b3a.25.1733551831714;
        Fri, 06 Dec 2024 22:10:31 -0800 (PST)
Received: from HOME-PC ([223.185.130.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725b7f51b65sm2448612b3a.108.2024.12.06.22.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 22:10:31 -0800 (PST)
Date: Sat, 7 Dec 2024 11:40:27 +0530
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: kvalo@kernel.org, ath12k@lists.infradead.org, jjohnson@kernel.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next] wifi: ath12k: Fix out-of-bounds read
Message-ID: <Z1Pm0xsOVbV3rpjc@HOME-PC>
References: <20241206073542.315095-1-dheeraj.linuxdev@gmail.com>
 <8c019176-6bb5-467c-bcea-10517675de7d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c019176-6bb5-467c-bcea-10517675de7d@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_221032_845901_1A92A1EA 
X-CRM114-Status: GOOD (  31.50  )
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

On Fri, Dec 06, 2024 at 12:06:51PM -0800, Jeff Johnson wrote:

Hi Jeff,
Thank you for taking the time to provide valuable feedback. I will make the
necessary changes and send the patch.

> On 12/5/2024 11:35 PM, Dheeraj Reddy Jonnalagadda wrote:
> 
> The subject should be as specific as possible while still fitting on one line.
> Ideally the subject should be unique. So at a minimum I'd add "in
> ath12k_mac_vdev_create()"
> 
> > This patch addresses the Out-of-bounds read issue detected by
> > Coverity (CID 1602214). The function ath12k_mac_vdev_create() accesses
> > the vif->link_conf array using link_id, which is derived from
> > arvif->link_id. In cases where arvif->link_id equals 15, the index
> 
> How can arvif->link_id equal 15? Does Coverity actually identify a code path
> where this can occur?
In the code below, when the first condition in the if statement is true and 
the second condition is false, it implies that arvif->link_id equals 15 and 
the else branch is taken, therefore, assigning link_id to 15. The same
code path is shown by coverity. I will attach the link to the coverity report
to the updated patch.

	if (arvif->link_id == ATH12K_DEFAULT_SCAN_LINK && vif->valid_links)
                link_id = ffs(vif->valid_links) - 1;
        else
                link_id = arvif->link_id;

> 
> > exceeds the bounds of the array, which contains only 15 elements.This
> 
> nit: space after .
> 
> > results in an out-of-bounds read.
> > 
> > This issue occurs in the following branch of the code:
> > 
> >     if (arvif->link_id == ATH12K_DEFAULT_SCAN_LINK && vif->valid_links)
> >         link_id = ffs(vif->valid_links) - 1;
> >     else
> >         link_id = arvif->link_id;
> > 
> > When arvif->link_id equals 15 and the else branch is taken, link_id is
> > set to 15.
> > 
> > This patch adds a bounds check to ensure that link_id does not exceed
> 
> See
> <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes>
> and specifically:
> <quote>
> Describe your changes in imperative mood, e.g. “make xyzzy do frotz” instead
> of “[This patch] makes xyzzy do frotz” or “[I] changed xyzzy to do frotz”, as
> if you are giving orders to the codebase to change its behaviour.
> </quote>
> 
> So this should start: "Add a bounds check...
> 
> > the valid range of the vif->link_conf array. If the check fails, a
> > warning is logged, and the function returns an error code (-EINVAL).
> 
> again use imperative mood (log a warning, return an error)
> 
> > 
> 
> Prior to the SOB you should at least have two other tags:
> Fixes: <refer to the patch that introduced the bug>
> Closes: <the public url of the coverity report>
> 
> > Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> > ---
> >  drivers/net/wireless/ath/ath12k/mac.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> > index 129607ac6c1a..c19b10e66f4a 100644
> > --- a/drivers/net/wireless/ath/ath12k/mac.c
> > +++ b/drivers/net/wireless/ath/ath12k/mac.c
> > @@ -7725,6 +7725,12 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
> >  	else
> >  		link_id = arvif->link_id;
> >  
> > +	if (link_id >= ARRAY_SIZE(vif->link_conf)) {
> > +		ath12k_warn(ar->ab, "link_id %u exceeds max valid links for vif %pM\n",
> > +			    link_id, vif->addr);
> > +		return -EINVAL;
> > +	}
> > +
> >  	link_conf = wiphy_dereference(hw->wiphy, vif->link_conf[link_id]);
> >  	if (!link_conf) {
> >  		ath12k_warn(ar->ab, "unable to access bss link conf in vdev create for vif %pM link %u\n",
> 

