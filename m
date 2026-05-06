Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CB3CD342C
	for <ath12k@archiver.kernel.org>; Wed,  6 May 2026 11:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYOWZy/XZn1vikPDpBLJMJ3W3GMA3XhObeDGzJDvr40=; b=lVi15EpMQuBQ4QJsxaP9PgB1EV
	RgJ8evsRXRq6Akpt6GKN7CdgtyHG2rGxf1+P+X8wU1dw0u4kZdwuvXnIBSzVTgPihCSirCIiHVUUD
	/LKoi4mN5oBREtr/9HAxCG6M7cEA0cnpRFYlTinxHNfBSHzG3wOaeQAMWQzfQs4nusqWRV9zMORYd
	+gXSnjORCLAZYmNW+jImmZ0XWFP7wYsPMdbuYJE9T58QJ5eQ8s9Ze9YR/w+CrnxIUyL3rgP9u0ZI8
	/qk1xxsBmzB5R5B7oq6W6ggON3Pbn7bx54Jee8B8tYbGCRX3XRW79Mcep3PST5cSCWMfVAKnHuGDW
	rF32pV7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKagg-00000000fiG-19B5;
	Wed, 06 May 2026 11:45:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKagf-00000000fhp-2XyH
	for ath12k@lists.infradead.org;
	Wed, 06 May 2026 11:45:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3D9341ABC;
	Wed,  6 May 2026 11:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E248C2BCB8;
	Wed,  6 May 2026 11:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778067907;
	bh=hhTrGP4S/BXwCHAiPhtKUBT3aM5H12HQDgaM3WyB8SM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JK9RzoigiB1D3DXGs/HNMPpy5luVXNjQDMJ/gNJwQwvD3QX5cwaaDXLByrbYh0rD7
	 unldqglV7SpdVuXWY+NgLy2tFLcj1HLkdrYiuAfhotSgVMFmyVebpugEr32x4ihMc0
	 /tOg24M8MPx0qFmabWfnU+kelwaO+lTgzJKEa2z6qkJ7YGiJg6aNwzN4jGpgCTc8oc
	 NVhfIHljXCC/NcCUwAOnt7rBjjzZnbCv+41BW+iXoF7z+oYkX7+01Kuy8XgtzhiqEs
	 2wR7jxsdr6NctbnKkN145c3AfMYB1T4A8mwdhnVOx2bukV3wZrjpRg2SdK/mGdfwkf
	 QLBVpImLnNOrQ==
Date: Wed, 6 May 2026 17:14:50 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
	Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
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
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v5 14/16] wifi: ath12k: Switch to generic PAS TZ APIs
Message-ID: <afspsrA8zT8Fb4z-@sumit-xelite>
References: <20260504130603.1474043-1-sumit.garg@kernel.org>
 <20260504130603.1474043-15-sumit.garg@kernel.org>
 <3bfdc11c-115f-45ab-b0ab-75ad88dc6f31@oss.qualcomm.com>
 <ae68bdb3-d683-4e7a-a27f-739214656ce2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae68bdb3-d683-4e7a-a27f-739214656ce2@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_044509_684328_437934D9 
X-CRM114-Status: GOOD (  15.17  )
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

On Tue, May 05, 2026 at 07:50:03AM -0700, Jeff Johnson wrote:
> On 5/5/2026 7:27 AM, Jeff Johnson wrote:
> > On 5/4/2026 6:06 AM, Sumit Garg wrote:
> >> @@ -485,9 +485,9 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
> >>  		pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
> >>  			 ATH12K_AHB_UPD_SWID;
> >>  		/* Release the firmware */
> >> -		ret = qcom_scm_pas_shutdown(pasid);
> >> +		ret = qcom_pas_shutdown(pasid);
> >>  		if (ret)
> >> -			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
> >> +			ath12k_err(ab, "pas shutdown failed for userPD%d: %d\n",
> >>  				   ab_ahb->userpd_id);
> > 
> > at some point the "ret" param was dropped, and this now generates build warnings
> The 'ret' param was dropped by:
> 8fb66931fe31 ("wifi: ath12k: Enable IPQ5424 WiFi device support")
> 
> Not sure if that was on purpose or accidental. Sowmiya?
> 
> -       if (ret)
> -               ath12k_err(ab, "scm pas shutdown failed for userPD%d: %d\n",
> -                          ab_ahb->userpd_id, ret);
> ...
> +               if (ret)
> +                       ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
> +                                  ab_ahb->userpd_id);
>

Ah I see, not sure why I didn't see any build issues in the defconfig
builds. Maybe this driver isn't enabled there?

Anyhow I can add the "ret" back here.

-Sumit

