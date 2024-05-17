Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E21C25B7B
	for <ath12k@archiver.kernel.org>; Fri, 17 May 2024 09:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HO8Bz9GyifotSrZV7QjN+iGapa2oFgA0NCUBiN/L4cc=; b=Chcr4OPAfuf7w7e/tvLlgCRc87
	3edU9OvG/nf7MbZBDd1rmeiNvh9L4wYcrOjesqolWcuLFdlkqpD+8T0xOroN8Ck862AVirLgN3LUV
	kVpUQ+kk9CVT59EzvBIIxA6dICUWiX4nU0oytnGUkWc043DPgrFD8dW86L+7BH5hzjFQzlGZ0foDh
	jIS/y6mZPXz8Yi+sAgzPqsNXVA5Wh+md/k1nL7FuP3h6M0xDxjqL/PsLh/ke7VQGLHXnS70VTqivc
	NirSK5HyI+QgNHp7wCfD4Hh7puzz/DBGEehvRWJl9ONTWHzUIL4iJboK7K0ob/Z+th4I/8t4Fmuup
	oLLVzW5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7u36-00000007NvC-1nmK
	for ath12k@archiver.kernel.org;
	Fri, 17 May 2024 09:38:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7u31-00000007Nrs-2yCM;
	Fri, 17 May 2024 09:38:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CB043CE19B7;
	Fri, 17 May 2024 09:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F69BC4AF07;
	Fri, 17 May 2024 09:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715938719;
	bh=vcW+W1wogmO6WY+GSQu3IAR/P96Rw6SpWddj5psVWwk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q7nnnXKoCoZCRE9y8qfd0GjlbgMZcow94ZBAhyo/a3WB7eilpoBw2+BvdmX0v1BZf
	 e7OVkid9omI+gvcN303kxsn1XDNSTYdJqgftO+q7xqgbBFEfRALDNx6MNApEOaSItp
	 R/U+wW3wKfdgVg1pSTt+l5Ktt5O2287ep0H8zh6uS0rANv32EVrNlYH0N2LN0Wkz4S
	 7JyAvYOZKqMfev4RirENIqVjY9S2NBz5t0xMnmDlB0lD8J6a25LhI7NPYbYJS3uooO
	 gi0eyy/jJtvOQvPPH73HE5rAvo90fxUfGOyoScW2xWZLVtSxLMRh/mH25kBaP3Lv2i
	 C+gw9xG0H/JCg==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5b2f2a584c6so196808eaf.0;
        Fri, 17 May 2024 02:38:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXomiWh9mrByi6nIsPXgO5UXwFs0MoCyMVvEZyGVEQwJMaO4Dfid79TzLzbR8iU9y+RuCEB30mTeDzq9j0YAVDTdrBM1V32IwrXwYTC1nEDF+sQDVXYlw5TcZ4h7bS+ch1ZRcZOiwqsdDHrCG9Wcr89c5pihuAnXW2Bz5SzYffX+1Gn
X-Gm-Message-State: AOJu0YzjnRrbWAfeks7plJCt+XqVbkw0Tc042VkdbNvk5OoeqHH9x/Rm
	rSCPjiOttY25Wt8R/0wP/gE3Dqk14Q0TY1xURuvl1BHld8dvMZO7jld8r7KSgHw1N7ef72wTS1d
	IjlM31TUBMoGQv3dR4cvVjXfHMO0=
X-Google-Smtp-Source: AGHT+IGDE99s+s68qJbXMtkzFnMd5s/9OBNB6sR0+sCICB0PpLHU9X3BbBFmCRlDywLZhowLPWB9T1lJ6YvckXBFFDs=
X-Received: by 2002:a05:6820:2602:b0:5b2:8017:fb68 with SMTP id
 006d021491bc7-5b2815cd95fmr22153827eaf.0.1715938718475; Fri, 17 May 2024
 02:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240516133454.681ba6a0@rorschach.local.home>
In-Reply-To: <20240516133454.681ba6a0@rorschach.local.home>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 17 May 2024 11:38:25 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hGNNvUq-BNHynaWr-5YVC6ugki81R70SG4uu34Rk-Mew@mail.gmail.com>
Message-ID: <CAJZ5v0hGNNvUq-BNHynaWr-5YVC6ugki81R70SG4uu34Rk-Mew@mail.gmail.com>
Subject: Re: [PATCH] tracing/treewide: Remove second parameter of __assign_str()
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux trace kernel <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-block@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-rdma@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-tegra@vger.kernel.org, netdev@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-usb@vger.kernel.org, 
	linux-bcachefs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, linux-cifs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, linux-edac@vger.kernel.org, 
	selinux@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-hwmon@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-wpan@vger.kernel.org, 
	dev@openvswitch.org, linux-s390@vger.kernel.org, 
	tipc-discussion@lists.sourceforge.net, Julia Lawall <Julia.Lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_023844_228763_CFFA835C 
X-CRM114-Status: GOOD (  19.32  )
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

On Thu, May 16, 2024 at 7:35=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
>
> [
>    This is a treewide change. I will likely re-create this patch again in
>    the second week of the merge window of v6.10 and submit it then. Hopin=
g
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
>       sed -e 's/\(__assign_str([^,]*[^ ,]\) *,[^;]*/\1)/' $a > /tmp/test-=
file;
>       mv /tmp/test-file $a;
>   done
>
> I then searched for __assign_str() that did not end with ';' as those
> were multi line assignments that the sed script above would fail to catch=
.
>
> Note, the same updates will need to be done for:
>
>   __assign_str_len()
>   __assign_rel_str()
>   __assign_rel_str_len()
>
> I tested this with both an allmodconfig and an allyesconfig (build only f=
or both).
>
> [1] https://lore.kernel.org/linux-trace-kernel/20240222211442.634192653@g=
oodmis.org/
>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Julia Lawall <Julia.Lawall@inria.fr>
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Acked-by: Rafael J. Wysocki <rafael@kernel.org> # for thermal

