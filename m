Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE9AE7717F
	for <ath12k@archiver.kernel.org>; Tue, 10 Dec 2024 04:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=da6AsHE3Yk7Iu5Y2wCs+pnA5htOu4IQpp1PaojY+e3U=; b=T8J3ewTMPFvHDh77e+bcSFSOqt
	NGP6Bij8WF1XNuHjtQ8Y9iL71P4z9igHVSNj9McFSMotEWYmTOeU6pfXsJeBOjjquSAEjOkuZL64z
	U0GdEA4078srT1Z57BB+1VV/xriyD+M9try5G9H/og90DKZkIC7FS1UcE6WhekOIdqMJ/q+huCa3u
	VmnrTXODAhoivYxVeAX4WnjaqhECK6KqWaoW1zsA15dDlkD1TDOjMqZypoTMdanRIbBTcIHPcZqx4
	PMFmhurwOUgZm9NkxtxDq5SEoYc2jmKEdJU4y2zPEBw/4tpUNaUUHFJwVt+V2YqEYChV2sviDSW0W
	RMzRRWVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKriL-0000000ABMx-1h1V
	for ath12k@archiver.kernel.org;
	Tue, 10 Dec 2024 04:19:13 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKriI-0000000ABMT-0Wh3
	for ath12k@lists.infradead.org;
	Tue, 10 Dec 2024 04:19:11 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-216401de828so17414315ad.3
        for <ath12k@lists.infradead.org>; Mon, 09 Dec 2024 20:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733804349; x=1734409149; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=da6AsHE3Yk7Iu5Y2wCs+pnA5htOu4IQpp1PaojY+e3U=;
        b=KJxnRl2PlTZJLYd0wg/7vZhKqlkw98IyXp3dAgPoXUOT+IHnKWkaOXqgRhjwS8QU8W
         HgopQ+P65dJ+PQLCDnqv0OQJyS8TgVDXQbZzajXomfWHJxq2iA+1639/tzsbEgJO2UJx
         AL2JfiOPB0v3gBgJJrUqZ1m834fO0kh/A7XKGzEBs4y973a5QC8Ocp37X06Qc9bynoAv
         NmRBu0TctFPVT6fxYYp3VPPxNd5ySXzOTW+sSjNAi22wEMxPljFj/HPkTF1YftLoD4Ss
         VQqL+eapytk5feLRzjiXOESzthVeZKlr6WJbUs6FtzH3liguBMj4M+WfDBJQmMfNzzwn
         KkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733804349; x=1734409149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=da6AsHE3Yk7Iu5Y2wCs+pnA5htOu4IQpp1PaojY+e3U=;
        b=HOod4/K0F/ddj7vsc6wkWTs+ftQv11pEJuE/KUKn1j+KagEOTafC+3WOiMc1waok3q
         RK2UGRUOVne3uT35Q2+ky0RlE+8jERUDklOveNNYUwJ8Mp+BKxbhJWlh3At77/JX0Yv3
         Mt060/O14LkwmGmNUeFupGSEsn1yiyc8l3Cr0r7oSgHNB4rnDxdP+AQbA+JHPktgk88v
         kXrEQzEOGQBgDNwKv66OgKbZBKQQVY7EcCAmBP4YLtuAe7UBUOWhThCswtknjNQ7fm4N
         jyr1b407UkGyuCbfDT0a82zambYCCP9u0lvGpHKOnjO7s+NDwreyWMwo/CBrc3xHA6Zq
         +3Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXXpAei4ZJBnBebMiXwsAX43mgroqwwwVnENGmnfILYKUTyzU4ujDVIwB4hGhajJ+WhFjcbImE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDJX29ePC9/uQiHA0uiCVa0gvVNCx4vMi53DasXZp+KFCj4rAS
	6ZVW7I8l/Ohk/dVLYtHtLrDvbl14YV1DhFbKVkAemOvuwlXJYVZT
X-Gm-Gg: ASbGncvaa+ypHK+f+d+Im/m2rHq5QDHGOxswIOgHdCa76m1+i8KWGwLCkpm8JgEOmfa
	SG0vwk5/37HHGkIwFmalFbB/9h+mXCcW2RUru6grMAcv7taIm8wMkYP2KjGe0Q/VuWSys4nZmlx
	3WgYBPrZi266KqJrqslIZKgTO2Prsd9xemZbywyPZTlB7+85eg7XT4Ag+JA32cEU/9Ec9ZPDA52
	QhPdqB4zcFinS3V2iYKWi79w/vxZ4l1R2NJs/5l8lbWg3J3re0X43A5ZUU=
X-Google-Smtp-Source: AGHT+IFfgCMQaMB8Kpin1tc6oNoG54Lk9s6R9r0BKlNu56dLiRQin18Y4EQqibfwk5KkVLKohEpC6g==
X-Received: by 2002:a17:902:d2d0:b0:205:4721:19c with SMTP id d9443c01a7336-2166a03eecdmr46675515ad.37.1733804348735;
        Mon, 09 Dec 2024 20:19:08 -0800 (PST)
Received: from HOME-PC ([223.185.132.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8efa2b9sm80119605ad.168.2024.12.09.20.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 20:19:08 -0800 (PST)
Date: Tue, 10 Dec 2024 09:49:05 +0530
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: kvalo@kernel.org, ath12k@lists.infradead.org, jjohnson@kernel.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 wireless-next] wifi: ath12k: Fix out-of-bounds read in
 ath12k_mac_vdev_create
Message-ID: <Z1fBOUqYGB5hNP1e@HOME-PC>
References: <20241207071306.325641-1-dheeraj.linuxdev@gmail.com>
 <cd5ef876-d849-4d7b-b8b7-94377e8720f0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd5ef876-d849-4d7b-b8b7-94377e8720f0@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_201910_166453_074EAEBC 
X-CRM114-Status: GOOD (  43.08  )
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

On Mon, Dec 09, 2024 at 10:39:36AM -0800, Jeff Johnson wrote:
> On 12/6/2024 11:13 PM, Dheeraj Reddy Jonnalagadda wrote:
> > Add a bounds check to ath12k_mac_vdev_create() to prevent an out-of-bounds
> > read in the vif->link_conf array. The function uses link_id, derived from
> > arvif->link_id, to index the array. When link_id equals 15, the index
> > exceeds the bounds of the array, which contains only 15 elements.
> > 
> > This issue occurs in the following code branch:
> > 
> >     if (arvif->link_id == ATH12K_DEFAULT_SCAN_LINK && vif->valid_links)
> >         link_id = ffs(vif->valid_links) - 1;
> >     else
> >         link_id = arvif->link_id;
> > 
> > When the first condition in the if statement is true and the second
> > condition is false, it implies that arvif->link_id equals 15 and
> > the else branch is taken, where link_id is set to 15, causing an
> > out-of-bounds access when vif->link_conf array is read using link_id
> > as index.
> > 
> > Add a check to ensure that link_id does not exceed the valid range of the
> > vif->link_conf array. Log a warning and return -EINVAL if the check fails
> > to prevent undefined behavior.
> > 
> > Changelog:
> > 
> > v2:
> > 	- Updated the commit message as per the reviewer's suggestions
> > 	- Clarified the description of the bug in the commit message
> > 	- Added Fixes and Closes tags with relevant information
> 
> As Kalle already mentioned, the changelog should come "after the cut"
> Please refer to:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format
> 
> Namely:
> One good use for the additional comments after the --- marker is for a
> diffstat...
> Other comments relevant only to the moment or the maintainer, not suitable for
> the permanent changelog, should also go here. A good example of such comments
> might be patch changelogs which describe what has changed between the v1 and
> v2 version of the patch.
> 
> > 
> > Fixes: 90570ba4610 ("wifi: ath12k: do not return invalid link id for scan link")
> > Closes: https://scan7.scan.coverity.com/#/project-view/52337/11354?selectedIssue=1602214
> 
> there should not be a blank line here
> 
> Also I just joined the Coverity "linux" project. I have access to the
> dashboard, but don't see that particular CID. Since you've been a member for a
> few months, is there something special I need to do to see that CID?
> Or is this CID in a project other than "linux"? I ask because I'm looking at
> A CID in the latest snapshot of "linux" and the URL is:
> https://scan5.scan.coverity.com/#/project-view/63541/10063?selectedIssue=1636666
> 
> So I'm guessing your CID is from a different project?
> 
> > 
> > Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> > ---
> 
> to reiterate, the changelog goes here, with the latest version described first.
> 
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
> Note that I don't need you to send a new patch if Kalle ACKs the current one;
> I can fixup the patch in the "pending" branch. But I would like to make
> sure I can see the CID in Coverity, so please let me know if I'm subscribed to
> the correct project.
> 
> /jeff

Thank you for the feedback once again. The Coverity issue is from the
"linux-next weekly scan" project and you would have to be subscribed to it. 
The link to that project is here:
https://scan.coverity.com/projects/linux-next-weekly-scan?tab=overview

-Dheeraj

