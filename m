Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CB5EF36E5
	for <ath12k@archiver.kernel.org>; Mon,  9 Mar 2026 06:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGWgSedNpw+jcvQLMdlLcw3u+fJ/OgZYalQERjD1cCw=; b=AhlQCKTv8Fw/j021/cqOKkfJwa
	8W/cIJkvHo4Nl9nTk1aZNhVud599wpeElXxFrvDoK55YRajsef9azSih2RNx4C80XjeHB/wxSUgkX
	CNgM0epcBSIZxia/P68qhJxRMLNYqLB1yVl08xcgZSHevJl6Lo0Nw5UCVFMvaf8xRaldJBBaDVacH
	XZP3dJZCwINxkIs9mB2keEBbMNE5+PALF9b9izxfffmWot+dp6UmIQ4xnQ1We07nxTUTyqfmpGMXv
	jd9BrKfS7Iwe/Kp54oxFg2zNj7Tifvm1pj03T7ofi98jCYeqYOIu4qMj1TSqecQFmmuR2oemh7cvE
	/tmWr8WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUEd-00000006k8r-2udF;
	Mon, 09 Mar 2026 06:36:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUEc-00000006k8i-22dt
	for ath12k@lists.infradead.org;
	Mon, 09 Mar 2026 06:36:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37802600AE;
	Mon,  9 Mar 2026 06:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E4BC4CEF7;
	Mon,  9 Mar 2026 06:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773038216;
	bh=Pgj4R6bQeh6HMXJuLoPivqu3vjWcFEa22yQSHvr8zv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtwvVialX+jhd/rtEXsSoghkKV59lcELLWu582bNzCKfZM5iwgmRAH7TQxkpbbhhL
	 pMJijlo4qz7s3Qyl2sWvMZLQZw1no1r8OcgnEry93Y2Do4LzVyyf9ezA2q9zI3lXck
	 6hy+PSg8E8G49tlc2TlC+8oKLBCKcjnZuUlOYK5v5IX8yKf9yrwN/kGC/2c7wPKdQd
	 UoQc0rNbWR6hmUia8rjyLDShDXxjvqJ40/bSiIapTW0WKT6OaG0ocRUvpULqdtlW14
	 jIaqubQBGrwJGjBYmYRyE6X1Fdrgt7ywJy132ru/cg5j5dsXWFbjIKBv2OovSywfVH
	 uGNzMM9361/iw==
Date: Mon, 9 Mar 2026 12:06:38 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
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
	mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
	vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
Message-ID: <aa5qdscMRq7abfwT@sumit-xelite>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
 <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
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

On Fri, Mar 06, 2026 at 02:00:48PM -0800, Jeff Johnson wrote:
> On 3/6/2026 11:47 AM, Trilok Soni wrote:
> > On 3/6/2026 2:50 AM, Sumit Garg wrote:
> >> +MODULE_LICENSE("GPL");
> >> +MODULE_AUTHOR("Sumit Garg <sumit.garg@oss.qualcomm.com>");
> > 
> > What is the convention for Qualcomm authored drivers? In some drivers
> > I find that Qualcomm doesn't add MODULE_AUTHOR. Can Qualcomm community
> > clarify it here. I prefer consistency here for the Qualcomm submissions. 
> 
> WLAN team was told to not have MODULE_AUTHOR(), so ath10k was the last WLAN
> driver that had a MODULE_AUTHOR() -- ath11k and ath12k do not have one.

As I said in my other reply, it is quite subsystem specific.

> 
> And in reality it is very rare for a given module, over time, to only have a
> single author. The git history contains the real authorship. So just for that
> reason I'd drop it.

Sure, but you would like the driver author to be involved in future
maintenence of the driver. In my experience that's how usually the kernel
development process works. If a separate maintainer's entry is fine then I
can switch to that instead.

-Sumit

