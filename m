Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AEBC25B78
	for <ath12k@archiver.kernel.org>; Fri, 17 May 2024 09:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jfFpRbNQ4JylrNPf/Ju6XAY6qQjrc+0U9vxW7VwdqA=; b=MhPNSkMrlmo1PkPxxMq8KomGMj
	NkgOHeygxAHc99WmSib3lZ6bzEvYhu/mTllCRY+ur4kMeCAqFnVXjbcX4hiR2Szso9Z/d7OIKKav6
	aWXgY5WcByueOMweI0bOxwaMtn/4J8xEt064DXB66+3R2v5lElZ2yqVir+AfAiPacUVnwwTPVwmaa
	9nti8muN3c5RCu7Nw4rpodrXxbXQuwTXHKC7T8UsAt4WOp/JjyzgrupmuOaN92uy5ca3OhVvxHsjc
	zgSydRXQioIZ0fYp4EdQ6oiHpX1I+YBcANT2Kv/jlXWviE32Uevf1oS2eCjFKQyWxoPRYsYuFzqH6
	KTaTidOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7uEU-00000007PnU-2Gbg
	for ath12k@archiver.kernel.org;
	Fri, 17 May 2024 09:50:34 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7uEM-00000007Pj3-2n1J;
	Fri, 17 May 2024 09:50:31 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6034E37344;
	Fri, 17 May 2024 09:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715939422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8jfFpRbNQ4JylrNPf/Ju6XAY6qQjrc+0U9vxW7VwdqA=;
	b=aqPS27rfYVOIlQYJQqRWN1OB2KuGqplKO0xASvAy99Em1LNhKAq/Z45rrmqOfomt6ymSXF
	OiEv1bW+ZdpI213w3TR/RlpBxADCOtSoygZG2IWVCeRjyU7fk9xYWgYywcz+IS9+rfxp20
	iBC1DT09pzE+KgT4PXFcXk6IVt2gReU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715939422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8jfFpRbNQ4JylrNPf/Ju6XAY6qQjrc+0U9vxW7VwdqA=;
	b=ybHcdzifmrWaHz4fudlW6TywmF4wPptrNP5A3fPjgJZxiNP8yysPTURMY+P9YDVx2v+UNY
	h72YrP3bBg//bVBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715939422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8jfFpRbNQ4JylrNPf/Ju6XAY6qQjrc+0U9vxW7VwdqA=;
	b=aqPS27rfYVOIlQYJQqRWN1OB2KuGqplKO0xASvAy99Em1LNhKAq/Z45rrmqOfomt6ymSXF
	OiEv1bW+ZdpI213w3TR/RlpBxADCOtSoygZG2IWVCeRjyU7fk9xYWgYywcz+IS9+rfxp20
	iBC1DT09pzE+KgT4PXFcXk6IVt2gReU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715939422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8jfFpRbNQ4JylrNPf/Ju6XAY6qQjrc+0U9vxW7VwdqA=;
	b=ybHcdzifmrWaHz4fudlW6TywmF4wPptrNP5A3fPjgJZxiNP8yysPTURMY+P9YDVx2v+UNY
	h72YrP3bBg//bVBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DB2D13991;
	Fri, 17 May 2024 09:50:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rHjlDV0oR2boBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 17 May 2024 09:50:21 +0000
Date: Fri, 17 May 2024 11:50:38 +0200
Message-ID: <87r0e0zs0h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux trace kernel
 <linux-trace-kernel@vger.kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers 
 <mathieu.desnoyers@efficios.com>,
	Linus Torvalds 
 <torvalds@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-rdma@vger.kernel.org,
	linux-pm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-usb@vger.kernel.org,
	linux-bcachefs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ocfs2-devel@lists.linux.dev,
	linux-cifs@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-edac@vger.kernel.org,
	selinux@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-hwmon@vger.kernel.org,
	io-uring@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-wpan@vger.kernel.org,
	dev@openvswitch.org,
	linux-s390@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	Julia 
 Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH] tracing/treewide: Remove second parameter of __assign_str()
In-Reply-To: <20240516133454.681ba6a0@rorschach.local.home>
References: <20240516133454.681ba6a0@rorschach.local.home>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RL6rcqepr6awpd9qb5xxedoiwq)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[efficios.com:email,inria.fr:email,imap1.dmz-prg2.suse.org:helo,suse.de:email,goodmis.org:email,linux-foundation.org:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_025027_456883_B61E8D93 
X-CRM114-Status: GOOD (  21.10  )
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

On Thu, 16 May 2024 19:34:54 +0200,
Steven Rostedt wrote:
> 
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> [
>    This is a treewide change. I will likely re-create this patch again in
>    the second week of the merge window of v6.10 and submit it then. Hoping
>    to keep the conflicts that it will cause to a minimum.
> ]
> 
> With the rework of how the __string() handles dynamic strings where it
> saves off the source string in field in the helper structure[1], the
> assignment of that value to the trace event field is stored in the helper
> value and does not need to be passed in again.
> 
> This means that with:
> 
>   __string(field, mystring)
> 
> Which use to be assigned with __assign_str(field, mystring), no longer
> needs the second parameter and it is unused. With this, __assign_str()
> will now only get a single parameter.
> 
> There's over 700 users of __assign_str() and because coccinelle does not
> handle the TRACE_EVENT() macro I ended up using the following sed script:
> 
>   git grep -l __assign_str | while read a ; do
>       sed -e 's/\(__assign_str([^,]*[^ ,]\) *,[^;]*/\1)/' $a > /tmp/test-file;
>       mv /tmp/test-file $a;
>   done
> 
> I then searched for __assign_str() that did not end with ';' as those
> were multi line assignments that the sed script above would fail to catch.
> 
> Note, the same updates will need to be done for:
> 
>   __assign_str_len()
>   __assign_rel_str()
>   __assign_rel_str_len()
> 
> I tested this with both an allmodconfig and an allyesconfig (build only for both).
> 
> [1] https://lore.kernel.org/linux-trace-kernel/20240222211442.634192653@goodmis.org/
> 
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Julia Lawall <Julia.Lawall@inria.fr>
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

For the sound part
Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

