Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6C8C3ABA2
	for <ath12k@archiver.kernel.org>; Mon, 16 Sep 2024 13:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3rZ6HOCUKX2P8DuHTgXzM9aOEQQvefvUSV4L2m3aqA=; b=orRyf88wnf7dfV75ACiffVSVw4
	dz0o1k5KeOjnc0dqdzd6QU1AsK5HcWjIZY5q1YW53tWgMowd9MphSbHJEj420p0JA8QkKCfLYDVcS
	A2FOgAhJuaz/8Csx+eptsocnZUX79eraS3CEgsfE8qfoioeqR1JBAXTjo1dX52D5SxrnGxWLVZd7v
	GJJHDuLEWprHVE0oxZCguOMO233bVvg7B1ucBEiirQ9OUXIGvxyB5C91dx43HLeDi4DbgprdhaeDF
	vPJ3Ov4fMEj0vpoiO3zb/Z5IHTDVruuK6rTGHVEoK1Hsyl2gV+h2cH04Bviyb5dV0zdWvBKknJeTu
	pyBtctug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqBQP-000000042wO-3Oxm
	for ath12k@archiver.kernel.org;
	Mon, 16 Sep 2024 13:05:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqBQN-000000042vt-0QWb
	for ath12k@lists.infradead.org;
	Mon, 16 Sep 2024 13:05:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11FBE5C3AFD;
	Mon, 16 Sep 2024 13:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D628C4CEC4;
	Mon, 16 Sep 2024 13:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726491949;
	bh=RMwMLkJh3YIgZ/58xtZg63tgS5MnB+406c9amhG2MnA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qajCUoRS4Mby7Nj3VPRNFWZ3UCjssfuHLsNKGUpvxwFjuV8LstG7mFzXGMbdq45jD
	 ystXs78PB7W7Y2JpKB2eY0emgp93NWXal5kcvnKL17Bgqw2RNaUHvZvQuXV8HXDTmv
	 lO3ZXMEA6YhSUJwDKgzdHm8Gac842ZdxNp4yJSHfXHWfrqGimSUS4/KT9aw/HvWHCD
	 IXu1VYTkuASAlPlhdnbho/1/gZZKUHtytTNUub2sGIUm0nrRFVVaYv6duOJRjllsxr
	 u/0unoBisSFkGBqxkSGMzc5S7cAewMynB+4U2h8XusWHgIrju1fGD+gB0WCJVZ+LXP
	 XMCdfkEYMCgAg==
From: Kalle Valo <kvalo@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: ath12k firmware regression with update 82318c966fd1
References: <87bk0nc1yb.wl-tiwai@suse.de>
Date: Mon, 16 Sep 2024 16:05:46 +0300
In-Reply-To: <87bk0nc1yb.wl-tiwai@suse.de> (Takashi Iwai's message of "Mon, 16
	Sep 2024 12:44:44 +0200")
Message-ID: <875xqveok5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_060551_226787_82F53930 
X-CRM114-Status: GOOD (  12.90  )
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

Takashi Iwai <tiwai@suse.de> writes:

> it seems that the recent update of ath12k WCN7850 board-2.bin update
> broke WiFi on Lenovo Thinkpad 14 Gen 5 AMD.  Reverting to the older
> firmware seems fixing the issue.

Just to clarify, reverting to an older board-2.bin seems to fix the
issue. (Board files are basically calibration data)

> The report for openSUSE Tumbleweed is found at
>   https://bugzilla.suse.com/show_bug.cgi?id=1230596
> and for Arch
>   https://bbs.archlinux.org/viewtopic.php?id=299286

For easier tracking can someone file a bug to bugzilla.kernel.org? Also
please include more information:

https://wireless.wiki.kernel.org/en/users/drivers/ath12k/bugreport

> Let me know if it's already handled in Qualcomm and the fix is
> expected shortly.  Otherwise I'll try to revert the change locally for
> TW as a temporary solution.

This is the first time I'm hearing about this and to my knowledge there
is not fix pending.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

