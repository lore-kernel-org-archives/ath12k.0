Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D730C87FCB
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 01:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPbotiFrWc+puIR0MdTKSi7kTwyXpagQ0y0ggzuZSrw=; b=nBml2RCo0wooBT8NbKRYw+pgFC
	6rstPD91d5e7t+QgrxtaS8mPxyu1wgPwFerNbWCID8iISn2mY9W7y8AnWN6D4gF38aojoT1jw3Z+y
	u2R6aQSSbktrWxXHb3+IUgkicftIVnx5eqOaOD0rHzo0o58iZ/jlBhL9ot/iMwX3Sc8gfuekyUyub
	10zbvl/58c3JuOE32HLMaEQtTEWH//n59+pEhRVsXrq7NB+TyHzw2EnuYey2dk2UqhAyFwWzs/mwv
	CtBGS/661vHMZe2cBAzM6SemuzPbCu9WuPbc7PUSjpV1xW3nMPwQVxXhfb5sK3vuvI+2M41IQoN+s
	FUxhqBdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujTPG-0000000E91F-32s2;
	Wed, 06 Aug 2025 01:57:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujTPD-0000000E90b-1Uup
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 01:57:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B702A5686B;
	Wed,  6 Aug 2025 01:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D6AC4CEF0;
	Wed,  6 Aug 2025 01:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754445445;
	bh=csXB9gb47w8+FD2wsMEeDNbF/7k2ffF9DLNSenl3YmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MI7hivLNFXepCxtmZ8Il7Bc0D4Ld7flGaMzjcwL+vHwkmUH0UwN8tV3KyNMbry6ip
	 XYMNsyShxYUIDxUk5zVhiKy0BoE5pB5IwPXzyXjADisCGomwkhz5hLorn2SfTvZrSp
	 8SYaV8Pry5+A1XtmxEJZT+ldvZvSqDkXywLo2OCQO54I9tImHitGwWNgWIGf7S/VSY
	 jPrKdVZa5tuXh2ERv/jz/GkTAl9J2P5MfUb/KEkNxsjZkvjk4kKXzrm8+5t32hBQ3A
	 rtSXp6U83nJPEmsLSy1Wh/OMMvxoGSc04zGpAKjO0oo89ZgCsbatrIUboc8Gjujd6z
	 6hIjf7czaZTUQ==
Date: Tue, 5 Aug 2025 18:57:23 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Dikshita Agarwal <quic_dikshita@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Remove pas id parameter
Message-ID: <di3tbtg7cxvrn5ewiiigodukek7om4uxlev5de37d7l76gyscp@mtgexdcar54v>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
 <658d7d55-fd5e-42cb-bc5d-abcc0b47a168@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <658d7d55-fd5e-42cb-bc5d-abcc0b47a168@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_185727_464747_E8F6A286 
X-CRM114-Status: GOOD (  16.55  )
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

On Mon, Aug 04, 2025 at 07:17:02AM -0700, Jeff Johnson wrote:
> On 8/4/2025 5:41 AM, Mukesh Ojha wrote:
> > pas id is not used in qcom_mdt_load_no_init() and it should not
> > be used as it is non-PAS specific function and has no relation
> > to PAS specific mechanism.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/firmware.c |  4 ++--
> >  drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
> >  drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
> >  drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
> >  drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
> >  drivers/soc/qcom/mdt_loader.c                | 14 ++++++--------
> >  include/linux/soc/qcom/mdt_loader.h          |  7 +++----
> >  7 files changed, 17 insertions(+), 21 deletions(-)
> 
> Since this patch touches files which go through different maintainers, do you
> have a plan on how this will be merged?
> 
> I can ack the drivers/net/wireless/ath change once I know how it will be handled.
> 

An ack from you and a venus maintainer would be preferable, then I can
pick the change through the qcom tree.

Regards,
Bjorn

> /jeff

