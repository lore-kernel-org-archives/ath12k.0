Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3BCEA8553
	for <ath12k@archiver.kernel.org>; Mon,  9 Mar 2026 05:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEEY8GMBvGKVO44N5SXYqEoRlm4m8r7t7QjTxhDWfhY=; b=1B4GK6HKG7d14xC0m8g4kF3lS7
	haTywLv5RhbINVfL+HF0Nw4AOQDc+MycvnA/2xnpxqtG4ADdmnFq0HqDspz4GM+HMt3Ixu1MPRM8S
	56ahDvuSthsD3u/6axK7bNyFdM/XwBrof77yX7vYeWTUJfQOKVeg2V0Wp+ougdxh/tRyTyKF33r5D
	P04v3j73evoQAuKNVaXY8loiHcKbg/M0Ev0vJAdC9gIpaaAcs1OTDq7mWi2Smrm39wvAoM5wGaz7K
	DrxO7HpRXjX0LNhM9wzdG1AQwRUhJsabMZaJfmE59pYmWwck/0Rp2BJ9/sEAFRcwj0i5UH9cfX9Jo
	Dr8yn9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzSmp-00000006faA-1IXW;
	Mon, 09 Mar 2026 05:04:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzSmn-00000006fZp-1urE
	for ath12k@lists.infradead.org;
	Mon, 09 Mar 2026 05:04:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 994F740B34;
	Mon,  9 Mar 2026 05:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F1CC4CEF7;
	Mon,  9 Mar 2026 05:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773032648;
	bh=nlljNcMEmbBFbwMlFYIHGVsIVpYN3RV0Ax1svPiwBxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kifEbwgH38BQFm5WxRPTeN3CNvd4K+gkDSR75UnwaDfst+kFhLsxDZG1gwvv0J2zV
	 niepDzatZrDdxCyHDXvhhEYaaQDTaD9gHpvogArXx689+0dN/J0l163W+YpD1I7TTg
	 KoowqFeMkUjngRi6nIIGr6ofrkDkLXrijpMGjI44dDeljAI41dks9IHL49Qcbc2Jtx
	 EsgvJI3bOn0gaQgOvxo+NlrKVhm8I++VaArWtdCGv7V3J5RxvyJ0DpEE0gVbE3av+F
	 YXcofqmqvy7VrQqhyw3fGViE5VGK9u0SxRxFRyCohcNvIvvlghkKvcJ8/a4adVDxJr
	 2HH0J6B12cKPg==
Date: Mon, 9 Mar 2026 10:33:49 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
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
	trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
	pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
	tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
Message-ID: <aa5UtcfiIe78oj1S@sumit-xelite>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <00a7e65d-aad3-4029-af51-ff0870e65595@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00a7e65d-aad3-4029-af51-ff0870e65595@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_220409_517444_967C1D57 
X-CRM114-Status: GOOD (  10.95  )
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

On Fri, Mar 06, 2026 at 07:49:07AM -0800, Jeff Johnson wrote:
> On 3/6/2026 2:50 AM, Sumit Garg wrote:
> 
> I missed one k-doc warning...
> 
> > +/**
> > + * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
> 
> s/scm_//
> 
> Warning: drivers/firmware/qcom/qcom_pas.c:173 expecting prototype for
> qcom_scm_pas_auth_and_reset(). Prototype was for qcom_pas_auth_and_reset() instead
> 

Thanks for the k-doc warnings report, I will fix them in the next
version.

-Sumit

> > + *				   and reset the remote processor
> > + * @pas_id:	peripheral authentication service id
> > + *
> > + * Return 0 on success.
> > + */
> > +int qcom_pas_auth_and_reset(u32 pas_id)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
> > +
> > +	return -ENODEV;
> > +}
> 

