Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CD3C3ABB2
	for <ath12k@archiver.kernel.org>; Mon, 16 Sep 2024 13:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Irbl9EoTjr+urz93WnqRS2vptqXGtuqNgIQPPWPNPfg=; b=FtS+ZlnG8k58OYJAAYy3uRYoed
	noqb9U9Xg3SWeOzeqK2kmA5LNV+ZRhbwNmBevrbVM0viyHj033AqlI2awPTt1YzGqMzRILxAY6UDX
	4GZsnnz2Z3FgOqi7CAi4Dvfo25yBDLkrZTkQXig7lb3r2arhq5I4LKW9G2L8p/dFvFEVxMDN5NtwJ
	DbFjBFESQDivSjs4ptn0uHZLIWb0dIDGVU7d4pAyIKZfYjr/7Ec921PPzISvUoKLBJhS50jBYBwoy
	w0wLrOTWgH0Wj4mBlq4dwJkVsWbTskW5edDoDhYm49dAjrktiKBCZUU1ZPnhkSV7B1bf9Pzpp6lJf
	P9IbpHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqBYU-000000043Tf-1djY
	for ath12k@archiver.kernel.org;
	Mon, 16 Sep 2024 13:14:14 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqBYM-000000043Pd-46FJ
	for ath12k@lists.infradead.org;
	Mon, 16 Sep 2024 13:14:12 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 31D5B21A93;
	Mon, 16 Sep 2024 13:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726492445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Irbl9EoTjr+urz93WnqRS2vptqXGtuqNgIQPPWPNPfg=;
	b=05DyxjdAUjHbaUwLetQECpGMe7fNtoHZaUuHXtJVKzsY1yZ1+tlMlkx61arbHHgSX5T37R
	E/XmjdBpFTda5pi3F6Q/gC/Q6lqR8Z+R+okK9PYs8pfhpjqz4xMC0UiAS5O5EgG5niuP5v
	KakscmbIBPcAN0pP3MfEDeh6e9GN/J8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726492445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Irbl9EoTjr+urz93WnqRS2vptqXGtuqNgIQPPWPNPfg=;
	b=72jIsFByJbiFSGLtWKTueuQ/BM8xm4PGtc1+ybn+n5VPR/umA9YMKqfvJRpzltW7/rf0qo
	VmQy5yfxH4yO1fDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=05DyxjdA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=72jIsFBy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726492445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Irbl9EoTjr+urz93WnqRS2vptqXGtuqNgIQPPWPNPfg=;
	b=05DyxjdAUjHbaUwLetQECpGMe7fNtoHZaUuHXtJVKzsY1yZ1+tlMlkx61arbHHgSX5T37R
	E/XmjdBpFTda5pi3F6Q/gC/Q6lqR8Z+R+okK9PYs8pfhpjqz4xMC0UiAS5O5EgG5niuP5v
	KakscmbIBPcAN0pP3MfEDeh6e9GN/J8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726492445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Irbl9EoTjr+urz93WnqRS2vptqXGtuqNgIQPPWPNPfg=;
	b=72jIsFByJbiFSGLtWKTueuQ/BM8xm4PGtc1+ybn+n5VPR/umA9YMKqfvJRpzltW7/rf0qo
	VmQy5yfxH4yO1fDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 06A071397F;
	Mon, 16 Sep 2024 13:14:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aI9qOxwv6GZFGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Sep 2024 13:14:04 +0000
Date: Mon, 16 Sep 2024 15:14:55 +0200
Message-ID: <875xqvivu8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kalle Valo <kvalo@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: ath12k firmware regression with update 82318c966fd1
In-Reply-To: <875xqveok5.fsf@kernel.org>
References: <87bk0nc1yb.wl-tiwai@suse.de>
	<875xqveok5.fsf@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 31D5B21A93
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid,suse.com:url,archlinux.org:url];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_061407_409487_70BB38A8 
X-CRM114-Status: GOOD (  18.06  )
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

On Mon, 16 Sep 2024 15:05:46 +0200,
Kalle Valo wrote:
> 
> Takashi Iwai <tiwai@suse.de> writes:
> 
> > it seems that the recent update of ath12k WCN7850 board-2.bin update
> > broke WiFi on Lenovo Thinkpad 14 Gen 5 AMD.  Reverting to the older
> > firmware seems fixing the issue.
> 
> Just to clarify, reverting to an older board-2.bin seems to fix the
> issue. (Board files are basically calibration data)
> 
> > The report for openSUSE Tumbleweed is found at
> >   https://bugzilla.suse.com/show_bug.cgi?id=1230596
> > and for Arch
> >   https://bbs.archlinux.org/viewtopic.php?id=299286
> 
> For easier tracking can someone file a bug to bugzilla.kernel.org? Also
> please include more information:
> 
> https://wireless.wiki.kernel.org/en/users/drivers/ath12k/bugreport

Opened now:
  https://bugzilla.kernel.org/show_bug.cgi?id=219282

> > Let me know if it's already handled in Qualcomm and the fix is
> > expected shortly.  Otherwise I'll try to revert the change locally for
> > TW as a temporary solution.
> 
> This is the first time I'm hearing about this and to my knowledge there
> is not fix pending.

OK, thanks for the information!


Takashi

