Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48F5E7717D
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 13:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2vNloXBDZaOIPNf+sHVtg6wPKoGLyZBHGP0RStlEPg=; b=2WYykfQB+ekvfLon5a/MvvevXC
	A2JC25LQHAgOKdVremNVYyAwIBIcP3UwSWE40KtwQM0+mJiL5HWvDC4SQ4Zz6ia2qQ+XssbOumsI8
	iXADabnmw3tPvhH0jXWduYpqXD7LbBxUfekJzZZGuI+Tu9skhDjj/oLDaY15OmN7m5QPPE15vp3tp
	2tAGj2uv6y2ZZrGDtnYqn8XLzDkLqiRocvMhST35RnP7HotyvjaKvzAOi9vczPdIAO8NfCvVAm2CF
	MkxYtUJPRDScySYnVIswNs8Ci9U93gEyfp+SVQ39ngYll6JRgO4oXb+a5mOdi8swzXktXa59Se/tJ
	lg4i3MAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdRE-00000007rFt-26F0
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 13:04:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKd3g-00000007keV-1UTC
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 12:40:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0BA17A41501;
	Mon,  9 Dec 2024 12:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B271C4CED1;
	Mon,  9 Dec 2024 12:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733748015;
	bh=0mvBxn0PSgu6FsrYzgn8Ezm4CL9y/d3xpE2xs78uGIc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=DvKX0PSSLEL7SzgRIFSjtJnTkDB+faBBGcovuhW2QCWLjthDYv0xCKQ9i/JhKK7NL
	 RuUXsQvFItOVdv5YTFk5qjZiWrmUfZjbJr7LbZhUTuDuqpaQZlj0laXNSkwM49KiGJ
	 +xTgITS+ALwCcaIL+hSC7/eYLCx+q2hZlO7YIKRBlnRevXIeVtTwBeoak0a+VieG4Y
	 YLYQT4+USZ9++lEbMsAowxhEOo60/uJ2qHZgZqRmqYAF4cnQ1yZH9ZvnKRvAiEgX/R
	 RGlJvl/PS+kQW+3KFLCn6LTqHIY8pSTEPmH9J9s9pwXcdVpj9qE5yj8+NV0CwKSnNK
	 6Q2hNQcy62axQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: ath12k@lists.infradead.org,  jjohnson@kernel.org,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 wireless-next] wifi: ath12k: Fix out-of-bounds read
 in ath12k_mac_vdev_create
References: <20241207071306.325641-1-dheeraj.linuxdev@gmail.com>
Date: Mon, 09 Dec 2024 14:40:12 +0200
In-Reply-To: <20241207071306.325641-1-dheeraj.linuxdev@gmail.com> (Dheeraj
	Reddy Jonnalagadda's message of "Sat, 7 Dec 2024 12:43:06 +0530")
Message-ID: <87r06hrpw3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_044016_458535_DDA5C9F5 
X-CRM114-Status: GOOD (  18.51  )
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

Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com> writes:

> Add a bounds check to ath12k_mac_vdev_create() to prevent an out-of-bounds
> read in the vif->link_conf array. The function uses link_id, derived from
> arvif->link_id, to index the array. When link_id equals 15, the index
> exceeds the bounds of the array, which contains only 15 elements.
>
> This issue occurs in the following code branch:
>
>     if (arvif->link_id == ATH12K_DEFAULT_SCAN_LINK && vif->valid_links)
>         link_id = ffs(vif->valid_links) - 1;
>     else
>         link_id = arvif->link_id;
>
> When the first condition in the if statement is true and the second
> condition is false, it implies that arvif->link_id equals 15 and
> the else branch is taken, where link_id is set to 15, causing an
> out-of-bounds access when vif->link_conf array is read using link_id
> as index.
>
> Add a check to ensure that link_id does not exceed the valid range of the
> vif->link_conf array. Log a warning and return -EINVAL if the check fails
> to prevent undefined behavior.
>
> Changelog:
>
> v2:
> 	- Updated the commit message as per the reviewer's suggestions
> 	- Clarified the description of the bug in the commit message
> 	- Added Fixes and Closes tags with relevant information
>
> Fixes: 90570ba4610 ("wifi: ath12k: do not return invalid link id for scan link")
> Closes: https://scan7.scan.coverity.com/#/project-view/52337/11354?selectedIssue=1602214
>
> Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> ---

In wireless we prefer to have changelog after the '---' line so it's not
included in git. Not sure if Jeff can fix this during commit or not.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

