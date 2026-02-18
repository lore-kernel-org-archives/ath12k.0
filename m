Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DC0E9A02C
	for <ath12k@archiver.kernel.org>; Wed, 18 Feb 2026 18:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFO694JGZghLwRjP+Q0ArC5oiDQPi8VPrT/t+tbGzIM=; b=rUKIl+Ipj4EA6OTmA9sRjiSsvP
	y9swGuao0nuetWjxp9K82Re9BBHdApJx0/mcmsr7VWrJmg4nQbabnyTtvTvekjNdyyKYzoHld6UUG
	8/EtQh1nw0ro5GnPGaXp6B4f3Jdd/8k4YTvEHvw4iOZt2SMWI3d73lT+RYio8tnZiU1hfIrF4ZuiE
	iG0/949Xq/frvqzXIwyJE8F1C7p2aGEu9COKdadTCefpuXX26gnS4tYHQVb29LbyULosFuWSGxfFw
	XTcKm+YDEpr+Twl6Zyxda0R3W+HUJ2h2+spNrjSlJR8O7zQLPSZmjMIWJBaxYuHdXaAU3BmIuNV8u
	5SuZzNHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmfc-0000000AGvm-1g2e;
	Wed, 18 Feb 2026 18:53:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmfb-0000000AGvV-1zOE;
	Wed, 18 Feb 2026 18:53:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E2CE600AE;
	Wed, 18 Feb 2026 18:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCBAC116D0;
	Wed, 18 Feb 2026 18:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771440786;
	bh=FRllGX9nLo+CpVjaG2YksqYXbdeYtFiLPME24SliD7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2CDNTESaRrCSKdOZB0a+CsOvs025z6t9xnHCAm3im4+gboUNNyQeWvceFb40N2a6
	 n10wr669Z/L56T1OtSoIZxx4KuriPXk4IVW+DPp9St0G/W7cmbmZ8+fT3DdSVjOOi2
	 j2g1UgpKskVk9/JyA1iOGJv9N844ExVPzQEmCJP87qXAUVnir/tDa7xTNWXhjjhT43
	 pEHN2Pu1nbA35ys6G+xXR+NspnXzOxKM/cL39h29+7O2Zlz5a6zEdARjQ0s9DjssYx
	 LTKd+IbBqjkATDYHd4K/95FiT9W4gvtcV/AusAC4SwQmjpYZWsmdGdgSVwYGnbOl2R
	 ZSJWh3inAfFSA==
Date: Wed, 18 Feb 2026 12:53:03 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
Message-ID: <q2gogah4suu3nftewye2l3iud2nxwdi7ykzqnagnz7npmrurgm@7icn643kozp6>
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
 <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
 <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
 <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
 <608ff2a7-775e-46ae-ba8b-9d9c2f8219bc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <608ff2a7-775e-46ae-ba8b-9d9c2f8219bc@oss.qualcomm.com>
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

On Wed, Feb 18, 2026 at 10:00:22AM -0800, Jeff Johnson wrote:
> On 2/16/2026 7:25 AM, Bjorn Andersson wrote:
> > It might very well be that the underlying bug is my expectation that
> > elem_size should be reflected in the struct and not only in the encoded
> > message, and hence what I wrote in https://github.com/linux-msm/qmic.
> > Perhaps the length-specifier of an array should always be u32?
> > 
> > @Chris, what does the downstream generator produce here?
> 
> Is this behavior just constrained to QMI_DATA_LEN TLVs?
> 
> I'm looking at downstream Android WLAN code and it has the same discrepancy,
> so it appears the code generator is always producing a u32 member in the host
> struct to hold a QMI_DATA_LEN member even though the actual element size as
> defined in the qmi_elem_info array is either sizeof(u8) or sizeof(u16).
> 
> Does this issue get fixed if we change the member in the host struct, i.e. for
> the issue mentioned (that I chopped off) modify:
> struct qmi_wlanfw_request_mem_ind_msg_v01 {
> -	u32 mem_seg_len;
> +	u8 mem_seg_len;
> 

Yes, that would fix the problem.

But if your elem_info arrays are coming from the downstream tool, then I
think the correct way to fix this would be to move in the other
direction and turn some those u8/u16 members elsewhere into u32.

I have the downstream code generator source here somewhere...

Regards,
Bjorn

