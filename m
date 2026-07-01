Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A4AC43458
	for <ath12k@archiver.kernel.org>; Wed,  1 Jul 2026 07:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozLRk5I8ZKe5jB7VBK0AxnV4gzUhCLP0jS540MNnO9g=; b=Xgd37+YNVJCNAXqIyhPsGobCRF
	MKJQmOd+gHpJulDBeICYmKRZayrm8fCH87aQg0TI3gIxaUp5DtQXWGqsoe6CG9OreKXJDaJiQ67g2
	e6TrDm2x6FOQamkShRyFPIuXLgBscFx3Sf3bZ/3PSPN/DyFqpN0R3qj1DiEQ9uMYvY1g09khiQQyA
	ho2qCqE50F8iPIv9vjG/Ky7SVBG28SK4bDHbfEvnaOp+PNvK8fvL5OBklUwusGhwRv6BsRJJC0Vna
	j5mv2SxEinOZ/WutZ9C7bbrMz+8rcbdS/nmHTdUWU8rMa8Vfh+tZwn2oSPWrc3rFIfnK8yxJKX5+H
	Ly6pmgug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepcw-00000000vbq-3aDM;
	Wed, 01 Jul 2026 07:44:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepcv-00000000vbk-1mlU
	for ath12k@lists.infradead.org;
	Wed, 01 Jul 2026 07:44:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D76BD438F6;
	Wed,  1 Jul 2026 07:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5CD1F000E9;
	Wed,  1 Jul 2026 07:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782891896;
	bh=ozLRk5I8ZKe5jB7VBK0AxnV4gzUhCLP0jS540MNnO9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dD+FtfSd5ABFPT3H7OfKYHQf1GhlF3Yo9yrHYAAXziAe/Fsg7c/odLOXZtLTqVQCe
	 D/pDweTD81vwaMb8rKmT+FrAGjs+FpSOnXpPdkb99/rhqJIB1vO/QmniEvWdB7oXDn
	 DZzE69+CG5ADgir5cNGGOsF7YxupkO6eRgUvcwWPKLgQveI5ufw+JD6KYNUPCKthhr
	 mlenbMWEKT2oATLz7eAgfqNzIe3jnK+B2mYUrmUbTfTh+4JbVYANXZMbVlCom12Yn9
	 MzJtJwFhD9G/dQgElq/K4ovkn+kFfs8nocf3PN4BiO0Df9ixYLI4M9HZ52nGxvyKX2
	 EAUHpr8LFM4QA==
Date: Wed, 1 Jul 2026 13:14:38 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, konradybcio@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com, sean@poorly.run,
	akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com, marijn.suijten@somainline.org,
	airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
	bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
	mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
	mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
	vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v8 10/14] media: qcom: Pass proper PAS ID to
 set_remote_state API
Message-ID: <akTFZgKBQYQUYxx4@sumit-xelite>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-11-sumit.garg@kernel.org>
 <c251430d-2184-4ecc-8d05-9cb47533e5ec@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c251430d-2184-4ecc-8d05-9cb47533e5ec@oss.qualcomm.com>
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

On Tue, Jun 30, 2026 at 02:42:25PM +0200, Konrad Dybcio wrote:
> On 6/26/26 3:34 PM, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > As per testing the SCM backend just ignores it while OP-TEE makes
> > use of it to for proper book keeping purpose.
> > 
> > Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> > Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
> >  drivers/media/platform/qcom/venus/firmware.c     | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> > index ea9654dd679e..d2e7ba4f37e3 100644
> > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > @@ -110,5 +110,5 @@ int iris_fw_unload(struct iris_core *core)
> >  
> >  int iris_set_hw_state(struct iris_core *core, bool resume)
> >  {
> > -	return qcom_pas_set_remote_state(resume, 0);
> > +	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
> >  }
> > diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> > index 3a38ff985822..3c0727ea137d 100644
> > --- a/drivers/media/platform/qcom/venus/firmware.c
> > +++ b/drivers/media/platform/qcom/venus/firmware.c
> > @@ -59,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
> >  	int ret;
> >  
> >  	if (core->use_tz) {
> > -		ret = qcom_pas_set_remote_state(resume, 0);
> > +		ret = qcom_pas_set_remote_state(resume, VENUS_PAS_ID);
> 
> This should not be in the middle of a mildly related series..
> The PAS IDs should be centralized into a single header. And the
> name of the driver shouldn't be part of the define. I would guesstimate
> that on the secure side it's probably called VPU or VIDEO

I agree with your comments, this is something I would also like to
consolidate on OP-TEE side as well: see discussion here [1].

However, the patch itself was needed to do book keeping on OP-TEE side
but I can drop it since anyhow the video isn't functional yet in
upstream dependent on the proper IOMMU support.

[1] https://github.com/OP-TEE/optee_os/pull/7845#discussion_r3434507317

-Sumit

