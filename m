Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EDEF46102
	for <ath12k@archiver.kernel.org>; Mon, 23 Mar 2026 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OoZlOYwtIRVBN+zwUl9hKCmyEoYe5Ca5+OJrDuDQec=; b=zmDQmnmIa34aLVwXaCD3uPRaLy
	560nfW5SwFbDETOBZsxIgmSnuCbRkMY7CTnwdVgMOYrI5VowCauNJb8VGwGm3QGF5EiG9X9I7LFfh
	VbzwLcK6nlK994b8fGvpnu2O+I0tr7cK0KMXSpjskuzXeWDmRPZoe0UBQ00CoqsiuQGgkD8hMUj2L
	JnYRQkfGQiI7uso15TIfBPwANwLk2vgqNiQD8+rwQn6+zgRj6fTCcx5xQwuXdUm3ZZrSafl8PG/vA
	GLCFcNK5b0L0Lhwz0JUNhDwUjuVi2a5mS9Ph3S63hJvId/7jH/ST7OjpdeSbRAPWlGPXZmWPEcCtJ
	W6dPBDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4euI-0000000Gjuj-0krb;
	Mon, 23 Mar 2026 13:01:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4euF-0000000GjuL-25Sx
	for ath12k@lists.infradead.org;
	Mon, 23 Mar 2026 13:01:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10EE443562;
	Mon, 23 Mar 2026 13:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36476C4CEF7;
	Mon, 23 Mar 2026 13:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774270877;
	bh=VHSP/3HxZRiZrR1EBuPV5EE+ZKFRtnX/Jig0jtt+O30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VsIz4BKKNr5zD6NxUiPN+ZyH2K7G6mW06vF88wJIeWeZg6vCyCns3s8BAQFVWYqAJ
	 soWLj3bmIApwDsJGR4ez1uVODIqanQMZeuMSUqjOUfD7f9j5xXecbzxbqTYmk2EOas
	 EH2+F/zb0wr9/8c9phiA5W2OOTw9pMvq/balc+x21AT2qwzhY5BJSG7N3qYN20Dd0l
	 bVtRwTNEZv4jSbkskiPYkh1K7RaF8uNWQivU/IcouchUPENHfc5Dl7N1pC0gGuqAQr
	 rEDwGhp8z+WAV0WJNN/rekPkrfZtmTK31Cq4Q1iL2gNfpE6QQC+wlQ+aG264dk3oLH
	 ly3vuSHiEqdEA==
Date: Mon, 23 Mar 2026 18:31:00 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
	akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com, marijn.suijten@somainline.org,
	airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com, bod@kernel.org,
	mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, jjohnson@kernel.org, mathieu.poirier@linaro.org,
	trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
	vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/15] firmware: qcom: Add a generic PAS service
Message-ID: <acE5jPxBJxOr3N5l@sumit-xelite>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
 <20260312062756.694390-3-sumit.garg@kernel.org>
 <20260313075948.nbopdkctdcvzlj3f@hu-mojha-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313075948.nbopdkctdcvzlj3f@hu-mojha-hyd.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_060119_622582_5A4510E6 
X-CRM114-Status: GOOD (  27.24  )
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

On Fri, Mar 13, 2026 at 01:29:48PM +0530, Mukesh Ojha wrote:
> On Thu, Mar 12, 2026 at 11:57:43AM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Qcom platforms has the legacy of using non-standard SCM calls
> > splintered over the various kernel drivers. These SCM calls aren't
> > compliant with the standard SMC calling conventions which is a
> > prerequisite to enable migration to the FF-A specifications from Arm.
> > 
> > OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> > support these non-standard SCM calls. And even for newer architectures
> > with S-EL2 and Hafnium support, QTEE won't be able to support SCM
> > calls either with FF-A requirements coming in. And with both OP-TEE
> > and QTEE drivers well integrated in the TEE subsystem, it makes further
> > sense to reuse the TEE bus client drivers infrastructure.
> > 
> > The added benefit of TEE bus infrastructure is that there is support
> > for discoverable/enumerable services. With that client drivers don't
> > have to manually invoke a special SCM call to know the service status.
> > 
> > So enable the generic Peripheral Authentication Service (PAS) provided
> > by the firmware. It acts as the common layer with different TZ
> > backends plugged in whether it's an SCM implementation or a proper
> > TEE bus based PAS service implementation.
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/Kconfig          |   8 +
> >  drivers/firmware/qcom/Makefile         |   1 +
> >  drivers/firmware/qcom/qcom_pas.c       | 298 +++++++++++++++++++++++++
> >  drivers/firmware/qcom/qcom_pas.h       |  53 +++++
> >  include/linux/firmware/qcom/qcom_pas.h |  41 ++++
> >  5 files changed, 401 insertions(+)
> >  create mode 100644 drivers/firmware/qcom/qcom_pas.c
> >  create mode 100644 drivers/firmware/qcom/qcom_pas.h
> >  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
> > 

<snip>

> > diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
> > new file mode 100644
> > index 000000000000..beb1bae55546
> > --- /dev/null
> > +++ b/drivers/firmware/qcom/qcom_pas.c
> > @@ -0,0 +1,298 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> 
> I know, this is new file but most of the documentation and some of the
> function are rename to reflect pas service.
> 
> Should this carry original file copyright ? Not sure..
>

This file only contains the wrapper generic PAS APIs which aren't
re-used from any other file. Carrying copyrights solely based on moving
API documentation in not very clear to me. Any other thoughts?

-Sumit

