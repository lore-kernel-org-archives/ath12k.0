Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532D8C87FCF
	for <ath12k@archiver.kernel.org>; Thu,  7 Aug 2025 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkMB3UBpWmmCjSN5e4d9ujGEpFa0EVqJGvtzJKvx07U=; b=H99A1D3a8UpACb5IubCSiWQV1m
	4toAniP35myVehlR/tIrnfYR9VK4CyBB8BvuqhHd+gNHPxYVam7ZtLbuwJWA/Ox2utfW4y2Jc8X+1
	WeyL0rcpMeqGIy8hNmjwhDNuFXx71/JmRuFAz0qDbO9MI1hhkeYr0gEYHoT026/RLv/fOJmkKxX6S
	/aiw9SPzZY+9ioJPSosJ5reU5KUV34uAZ/UiDvu8K0gD0wFdM/cyeGdcNkp1wa6vc7EJ3CbcBx7Bi
	R9ahSXGd0OMVwEvLdjGxrPAGBrmNYBBCLy5EH2bIas50rORyTl9f1zVcx6KFYNXvvP0xYvOooz5Kv
	nnUDbGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk3pV-00000001BLT-0EsN;
	Thu, 07 Aug 2025 16:51:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk3pS-00000001BKr-2lnc
	for ath12k@lists.infradead.org;
	Thu, 07 Aug 2025 16:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DBBF443A5B;
	Thu,  7 Aug 2025 16:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03939C4CEEB;
	Thu,  7 Aug 2025 16:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754585457;
	bh=ZCdy8wrGaS31m/vyICQ0sTRH47wx7RDv45XHLSPATl8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=qNik9z27Gusn8Dk1XqpuixFITS1eF8nfsD0OLtmIPFNYe8ipK9j1zenCckHJewAyM
	 iO45DVl+9CJrbLfDQxwixJ+ih9YbPa7rGjcdQltbZVhAgHvCMnEE+jtzDK/D/xZDL6
	 XoVIemImM3IpQMChEHWkSCVIEEnNHKhu/xsfoqbWUO69SuQQwBfSdKH8R/3bp0iYWx
	 f6r7qWaYqYY4JGlcRlDa6C0j77xWgFxE0ptgcU+nBvut0XvZ3J1A52VIDzU0SXS5bB
	 VnSBaN8zI5C/Rz5qp+/4SpLU7X3QJFi9LuEPl/g1Rqyp6ZPN92hCyZ6cdhr1JgVqdG
	 d9jRG0oTobIPw==
Date: Thu, 7 Aug 2025 09:50:52 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] soc: qcom: mdt_loader: Remove pas id parameter
Message-ID: <vvo63eeg7q37qrgcpsiw5a6dl4ffa4usrr6lqozwyqknyz23ny@g4m7oeeudvby>
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
 <20250806172531.1865088-3-mukesh.ojha@oss.qualcomm.com>
 <c9d761a2-7121-4ce6-84c7-232a6c4ce976@oss.qualcomm.com>
 <20250807053610.siel2gsvl2igc3ga@hu-mojha-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807053610.siel2gsvl2igc3ga@hu-mojha-hyd.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_095058_714275_3FDD9D03 
X-CRM114-Status: GOOD (  18.13  )
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

On Thu, Aug 07, 2025 at 11:06:10AM +0530, Mukesh Ojha wrote:
> On Wed, Aug 06, 2025 at 12:07:05PM -0700, Jeff Johnson wrote:
> > On 8/6/2025 10:25 AM, Mukesh Ojha wrote:
> > > pas id is not used in qcom_mdt_load_no_init() and it should not
> > > be used as it is non-PAS specific function and has no relation
> > > to PAS specific mechanism.
> > ...> @@ -353,7 +353,7 @@ static int __qcom_mdt_load(struct device *dev, const
> > struct firmware *fw,
> > >  	if (!mdt_header_valid(fw))
> > >  		return -EINVAL;
> > >  
> > > -	is_split = qcom_mdt_bins_are_split(fw, fw_name);
> > > +	is_split = qcom_mdt_bins_are_split(fw);
> > 
> > this should be in the 4/4 patch
> > 
> 
> Rush to send patches!!
> 

Please don't!

Also remember that this isn't a regression fix and we're in the merge
window, so we're not going to pick these changes this week anyways.

Regards,
Bjorn

> -- 
> -Mukesh

