Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B28CAC592
	for <ath12k@archiver.kernel.org>; Fri, 19 Sep 2025 14:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QI+QlDddQH2xyS4s4TjTvXKMGYoZ1mcp20LQ/M7yRDw=; b=Gaa+85zQF6F1hlhb+C2cVheKzC
	/Pkqg8CiQy8dfp9MwsXcw5N2oUHB+FuUxFyPXt8jJOeerA3WSy9piZoJayReXb2fDk6+Zb8Gb8bFp
	w1kWxg/vVhjEztYp7Smf513TjXpuq9Fs8Nh+wuaGSRJhGbdsv9m+I357a5O5lrDG9qJgeItWETFGq
	xfFASsgaUs+2wUhKgoB9cCO4JmHBGAlSEV97yPBF0fh7el5kQd2LKq0qC6R/FMATTUiboZyyzQriY
	yuOaXaAiqMx7fhBJtMcP3lnJLt8bz+h5C7HgjtW5EKzYxmrr7xTMzxD4ArJ+/Bny5agpONUHiqIVR
	Ql/w3EZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzc9Z-000000039ot-2LkX;
	Fri, 19 Sep 2025 14:32:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzc9Y-000000039oa-3hrX
	for ath12k@lists.infradead.org;
	Fri, 19 Sep 2025 14:32:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 50FFA6013A
	for <ath12k@lists.infradead.org>; Fri, 19 Sep 2025 14:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06603C4CEF0
	for <ath12k@lists.infradead.org>; Fri, 19 Sep 2025 14:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758292320;
	bh=ezfOU/1GMLWeqS+bjgy1ZwWTdgQNEIEBXo9J8JeXB8E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=PWbawacudtOvyg3vVGMGGiOmwoIFBIWIpS9HPm2TganW/fRXX3vsJHZeKnS3jXOom
	 gDL7CLSKgSsw3JQo0g/8COHi6z+zdCIJk2uw+N4Nfzg/OunR+SOncvYiqLfqqdYh3y
	 ttqgmqxCm1waPpj3R3bwIrRP4fqjW/BcLgeScPBAQDohAOenjnzccsjU3OgEuiPCd7
	 J4alQTbXJ4fzC1B7vJh0MZUdfstGZnJb58f6EeOP7V95ncI20Y6CIy9YOowCB4cAH9
	 XS9VrF7uOLYRujPTj3cHxUFtvFjGAFHTgTuy9sxhYs5Oobg5tmj17uAlZr5wZnCRbC
	 XJrUZ18mNBkRg==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-72e565bf2f0so18475207b3.3
        for <ath12k@lists.infradead.org>; Fri, 19 Sep 2025 07:31:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKBQVNJftvMfjJ3CW4Rkch+DqtfW6yuHAmaNS6IFxLl90ATNTeR72a36YvQB7qLMGXRkIflaI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7nu0cpjPCl3VoaR8JRWek0amvYX4SLPqH3Lb92byxjS1aS4mb
	IO817Qmqfc4F2nFSEm+SfvYaiaJ8jjOxFkl//xhyBtaRHcZjeiBJzzwxp1tT590W4G3piLhzN1i
	p9I3lHZHFFWlM/g3Skxcg8FXjEETUFbA=
X-Google-Smtp-Source: AGHT+IFCQN6I/KYO7xVrBSNFPDc5Kyac3QZX8xN90CS+V124H8ksRuV/W1kaFUkMgoZAWdeH1sqzdd0wvkGzwsWpr9w=
X-Received: by 2002:a05:690c:5092:b0:734:81db:1b33 with SMTP id
 00721157ae682-73d3237e749mr28124147b3.19.1758292319285; Fri, 19 Sep 2025
 07:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <9cadcd6a-5f99-4a2f-8aac-c612f355d82a@oss.qualcomm.com>
In-Reply-To: <9cadcd6a-5f99-4a2f-8aac-c612f355d82a@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 19 Sep 2025 10:31:48 -0400
X-Gmail-Original-Message-ID: <CA+5PVA446=RjjQpbAeiZYVeX-PAx1MrPVU_yPnOtOyuoJjLxDQ@mail.gmail.com>
X-Gm-Features: AS18NWB_2BdrTn8cn6c5KQ00nGtZALj68uPuOx4rGtGAkFYLcFDgRu_jI6sPALQ
Message-ID: <CA+5PVA446=RjjQpbAeiZYVeX-PAx1MrPVU_yPnOtOyuoJjLxDQ@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath12k firmware ath-20250918
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Sep 18, 2025 at 2:17=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> The following changes since commit 37f3f2d8e14cff7b316616924331d57f6ec6e2=
59:
>
>   Merge branch 'robot/patch-0-1758163077' into 'main' (2025-09-18 12:26:2=
2 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20250918

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/696

josh

>
> for you to fetch changes up to 1d588f106ceea113c4c650b43d948da5746e704c:
>
>   ath12k: WCN7850 hw2.0: update board-2.bin (2025-09-18 11:03:58 -0700)
>
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath12k: WCN7850 hw2.0: update board-2.bin
>
>  ath12k/WCN7850/hw2.0/board-2.bin | Bin 1986952 -> 2253732 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

