Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64297FF885A
	for <ath12k@archiver.kernel.org>; Mon,  4 May 2026 11:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Ky4TLi+pWWLfaNiO3475y1wifMU6r120dQKx3mQAGM=; b=ytV7K/mgEhA4whYmJ2cYY63a1b
	KDjrTLPEWvdh5ssBQLnwKPGuUUFMrzhtU1vxNWxSWct0vAUSyang6o/leyHEUun46PB7WEGiZvpu1
	pf8HckxZPIHOnKzM3ORlGt4tsk/KqL0BTr50GTO1lbCqCCpEfa1Rp6UH+MvADgDm1pmjJhRmtjTLp
	cap+Tv/8Go3DlQ4z8lUPvQFLMHrENr9EOl5ESSRaacjYDXDOmUOiGMGoaIFQMB7bXrtGs/m+o9MO3
	/v/eMBwdKIAafsygY24D+D1+5qE8HPo4uRrrX9W+vbdVsU650aCN4PYhLrd/Kz+MP1JhA8yAqiQea
	ZZgooLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrSy-0000000D2Zs-1T0P;
	Mon, 04 May 2026 11:28:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrSw-0000000D2ZM-18jc
	for ath12k@lists.infradead.org;
	Mon, 04 May 2026 11:27:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB137435E8;
	Mon,  4 May 2026 11:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6DCC2BCB9;
	Mon,  4 May 2026 11:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777894077;
	bh=vmwhKpIuJ/kZwCXjcaFmLTe8fKVmq6dYhXjPDXJ2dss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8pMY5gALGtg1xGJyZawkZqX7NzKmzo4hhJUD7PMuWFYqDT8DYoMLbSATCHNzy+9j
	 9pzpd9WM9PXAQ+qliFpwwott2DWy2pCyXdx5Pw7lqK3jbHhf1CT65KX7rWU5Cw0MIc
	 sd8rLoBV6+GFdaDmgxzjH9jwRFlBKMUpt6nmcM3IcrwXVlCgYr+0etwE0BZvRLMz+b
	 8klOVo3i4ybTG3ezMXQ+iQ5THKHKoQEMA6oGmz/eHqqXBbEiXLOVss8ditfDjE6JuP
	 tpjWuBpj+w4SeVFI9wVqlnmhjC0SfO4TRkmpW6BSmb6MzURpeP0INtWUP8lduNUb2T
	 mLFJIqtsD3TIw==
Date: Mon, 4 May 2026 16:57:40 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com, sean@poorly.run,
	akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com, marijn.suijten@somainline.org,
	airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com, bod@kernel.org,
	mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, jjohnson@kernel.org, mathieu.poirier@linaro.org,
	trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
	pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
	tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, op-tee@lists.trustedfirmware.org,
	apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 04/15] firmware: qcom: Add a PAS TEE service
Message-ID: <afiCrIYSm8AK9xn9@sumit-xelite>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-5-sumit.garg@kernel.org>
 <ab4b5257-92df-4201-ab04-436ab77b2fd8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab4b5257-92df-4201-ab04-436ab77b2fd8@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_042758_353767_AB6C5C59 
X-CRM114-Status: GOOD (  20.84  )
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

On Mon, May 04, 2026 at 03:33:06PM +0530, Harshal Dev wrote:
> Hi Sumit,
> 
> On 4/27/2026 3:25 PM, Sumit Garg via OP-TEE wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Add support for Peripheral Authentication Service (PAS) driver based
> > on TEE bus with OP-TEE providing the backend PAS service implementation.
> > 
> > The TEE PAS service ABI is designed to be extensible with additional API
> > as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
> > extensions of the PAS service needed while still maintaining backwards
> > compatibility.
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/Kconfig        |  10 +
> >  drivers/firmware/qcom/Makefile       |   1 +
> >  drivers/firmware/qcom/qcom_pas_tee.c | 479 +++++++++++++++++++++++++++
> >  3 files changed, 490 insertions(+)
> >  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
> 
> [...]
> 
> > diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
> 
> > +static int qcom_pas_tee_mem_setup(struct device *dev, u32 pas_id,
> > +				  phys_addr_t addr, phys_addr_t size)
> > +{
> 
> [...]
> 
> > +
> > +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> > +	if (ret < 0 || inv_arg.ret != 0) {
> > +		dev_err(dev, "PAS mem setup failed, pas_id: %d, ret: %d, err: 0x%x\n",
> > +			pas_id, ret, inv_arg.ret);
> > +		return ret ?: -EINVAL;
> 
> Following the example from qcom_scm_pas_mem_setup() here:
> https://elixir.bootlin.com/linux/v7.0.1/source/drivers/firmware/qcom/qcom_scm.c#L778
> 
> I think it should be:
> return ret ?: inv_arg.ret;

inv_arg.ret return a GP TEE error code which doesn't map 1:1 to kernel
error codes. The client drivers won't benefit without having a way to
decode those errors. So just printing here can help the user to debug
any issues.

> 
> This way the client (say mdt_loader) knows what error OPTEE PAS service returned.
> I can see that is tries to print this error:
> https://elixir.bootlin.com/linux/v7.0.1/source/drivers/soc/qcom/mdt_loader.c#L286
> 
> With that,
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> 

Thanks, I hope with above I can keep your tag.

-Sumit

