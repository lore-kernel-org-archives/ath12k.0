Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1BFC44501
	for <ath12k@archiver.kernel.org>; Fri, 10 Jul 2026 12:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mX5s+LgF61GsTT2jOOQtbwBRT5YocgNpg7DpK7Idac=; b=hiluoo6sWlSYEvOtxBAjWP+cOP
	CedusPZtstnUEnYQDWcQ457ct65yGeQaJfjqSSC95pKAdjLEJ4Go+gdxEyin6oLOZP9XhTQGg5RAz
	Qsvny3QMCouk8jd083mLNMF74ebblBmxkYD0WDvUxOQLEkrrx6M+/1kjzfqojeVWhoUbUb3PgspSs
	eOZJWIc8GhN1E9+2MTer7IFrhtySNflvZLV7FwKREupkaRD+rYoySPXFdsNxoNCt4bNeyDZpahaYb
	yoZ/9kTfaJGv0cFFEhtcP3eU9BmMLMaDjVpU/CMErHfcGBYHWgGuW7rtTpsJ6bO0rb4BaGIMu45HD
	8GYvp4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiA5d-00000004twp-1p3X;
	Fri, 10 Jul 2026 12:12:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiA5b-00000004twd-355V
	for ath12k@lists.infradead.org;
	Fri, 10 Jul 2026 12:12:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DF9460051;
	Fri, 10 Jul 2026 12:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2EC1F000E9;
	Fri, 10 Jul 2026 12:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783685538;
	bh=2mX5s+LgF61GsTT2jOOQtbwBRT5YocgNpg7DpK7Idac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YsHYXBoUwEO/JD7uEwImzg3mv7r4evHYn6bmm/BpwFz7s+/PEwFuAjQwpC9NLZTD1
	 uJiaFsewk7OWDBXeUTrZRYi3CisEgF1I2aAOEqad225cY6f/P7our9/zVZA9xwWjUf
	 gWh99RMEJrfxKFrTpFsWA2bi+SyaLc9Cd6P8qCO0megJ5ZRuh7ZlTI3YW53k+vUyvV
	 8QEaTaE63VVnw+8W2DmuU+gHjLUFXUvjCp4nuKuqEckoC1l5cvi2RdnxTeafSuYftb
	 uui7ecoebrEKYvZpeR5W9/axJDkt1zUqKM0o3phcWbkxcx2zEVQaPpW16AabvYVH6k
	 mcLVwF5Hg+7vA==
Date: Fri, 10 Jul 2026 17:42:00 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
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
	amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v9 00/14] firmware: qcom: Add OP-TEE PAS service
 support
Message-ID: <alDhkHVnzReCgU6H@sumit-xelite>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <178362521364.2422497.1305957434056184382.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178362521364.2422497.1305957434056184382.b4-ty@kernel.org>
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

Hi Bjorn,

On Thu, Jul 09, 2026 at 02:32:39PM -0500, Bjorn Andersson wrote:
> 
> On Thu, 02 Jul 2026 17:28:16 +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Qcom platforms has the legacy of using non-standard SCM calls
> > splintered over the various kernel drivers. These SCM calls aren't
> > compliant with the standard SMC calling conventions which is a
> > prerequisite to enable migration to the FF-A specifications from Arm.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [01/14] firmware: qcom: Add a generic PAS service
>         commit: 08314e7c2c38b9ae6a5e01c58ed10a950859404d
> [02/14] firmware: qcom_scm: Migrate to generic PAS service
>         commit: 5c1a2975d23c51c01aca51945d0f10a4ee4c9020
> [03/14] firmware: qcom: Add a PAS TEE service
>         commit: b6f7978da0c4d26fe465aa6634f5a0b48f900de0
> [14/14] MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
>         commit: 6701259025d49139131a0eb2257659a066dcca22
> 
> This is available as an immutable branch, for other subsystems to pull at:
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260702115835.167602-2-sumit.garg@kernel.org
> 
> 
> [04/14] remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs
>         commit: 254030af0d81b12b7624d9ce85c6bdd3171629c6
> [05/14] remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs
>         commit: f3b1357673ddb37ae8b9a8fe44df73cbd2a519c5
> [06/14] remoteproc: qcom_wcnss: Switch to generic PAS TZ APIs
>         commit: ea3b5245f5deba916320b32a8e6510a74c034c17
> [07/14] remoteproc: qcom: Select QCOM_PAS generic service
>         commit: c4383254ac7a529736577e304176a10371c2ee0b
> 

Thanks for picking the partial set although I expected for you to pick
the entire set given acks from all the other subsystem maintainers. Let
me know how we should proceed further.

-Sumit

