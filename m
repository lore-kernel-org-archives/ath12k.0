Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D20F3381E
	for <ath12k@archiver.kernel.org>; Tue, 17 Mar 2026 09:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OryT/yzVxEaWLZ4zkBcnqg3Iwl+DJ1uWIWHpUgxFXQE=; b=kHJg5VV3BNkQRY5DhzKWHgGLDo
	mDuZnE7s6DlwLSvEWgnfoU6119P8RdNWROnwm0/xgbpHgvKD1EBRHaax3C+C6cvXBnOdDiaPP8Po+
	qZYvqP6pZ79W8YEdMY7QgM2Xg/zezG++bMzpvpYlvGAb7I+jwan2NdmRhzIT9olVRGpgiDVO7TT/A
	cn3tc89CfLY823Q3iCr6/t4zAM+L/wCH9QMIqWkN5mbsuVCmMaveG2/iyLMwVRZ+3hgDQy3IgzMFM
	7y7BEVMk8viq84nhavXx0SDdgZr4kGrjEXYAjIxJI0zsw19Eg3LOFQNQ4TG0yFdLwh3+pgjYjKKom
	mvF/kKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QP0-00000005nSu-3wpx;
	Tue, 17 Mar 2026 09:07:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QOx-00000005nPV-3ENB;
	Tue, 17 Mar 2026 09:07:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B65F54331B;
	Tue, 17 Mar 2026 09:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4788EC4CEF7;
	Tue, 17 Mar 2026 09:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773738466;
	bh=ZrKKE8ny7s5IpYiTG6uvqZyrDNosiYUjWstBwT2fgd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ndPpBm00/1/NTma8rKwc9SM+YUkIDM0gVjUwn4PhvzD64ijd6S+3FlDMvccFEaGsd
	 wPVJkOxEaZGVGAslWLDul+t387VwYV4TMxw1IUnTv9wN2LdTNrt9df+llf0Sm14dSD
	 7heb3H/0QH3ZjEdlPFaIPKHnoEdkhZgT31fVlZoc=
Date: Tue, 17 Mar 2026 10:07:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Jakub Kicinski <kuba@kernel.org>, konradybcio@kernel.org,
	andersson@kernel.org, linux-kernel@vger.kernel.org,
	Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Use the QMI service IDs from the QMI header
Message-ID: <2026031717-ethanol-zoning-80b5@gregkh>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316172251.2d57d0aa@kernel.org>
 <8757aec7-8c36-446a-9a34-f0717f64202a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8757aec7-8c36-446a-9a34-f0717f64202a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_020747_835189_AFF3F44B 
X-CRM114-Status: GOOD (  15.40  )
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

On Tue, Mar 17, 2026 at 09:51:32AM +0100, Daniel Lezcano wrote:
> On 3/17/26 01:22, Jakub Kicinski wrote:
> > On Mon, 16 Mar 2026 18:14:10 +0100 Daniel Lezcano wrote:
> > > This series is based on the immutable branch [1] containing the QMI
> > > service id definitions along with some drivers using them.
> > > 
> > > How a patch can be merged ?
> > 
> > Wait for the dependency to appear in respective trees after the merge
> > window then repost the patches individually. I'm starting to get
> > annoyed with all this cross-tree QMI/MHI noise.
> 
> An ack is simpler for everyone, especially when they are trivial

Why isn't this 4 different patches, all for different branches/trees as
there does not seem to be any dependencies here?

confused,

greg k-h

