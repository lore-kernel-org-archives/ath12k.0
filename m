Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CBAF8FA70
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 12:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLbwCdBWP8XCPzz06MBWj+fnMPuaR1Bv20+9bKFHCJ8=; b=rn4ClPXRGWQfPzPf4zQS+JxmC4
	7+yRNnKzi2OrLFbNzBBz1gPxK3lh+ncIXDCcvgM+AVLzuTnifbDuHYPCN0Hu8VSrwFamR6I2t1UQk
	5mQXrHypLRwsrOjgIsxGZxApWyXQusTaXIjPlSfvbNmuSZY9Kfs/Gvb0DckPr6FQZMi9k4/i+UMPO
	YNFWv8bLf2OTOgM3ijcfswdpjip0ge2uA2BBe05YXeWXoCeFBnfy/o1JE6THlGxTFq96VweFIcPCB
	Nz/Tt2TnRwTSe/AzhHBAd0T9XWmeSUVR3SNO1SDQVRPr6+timjOSoRP3iOX+N1L1V8O2cvaSdK3kA
	24q2Blfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAS2-00000008bXO-3Mq4;
	Tue, 21 Apr 2026 12:43:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAS1-00000008bXI-03pr
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 12:43:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40B8960121;
	Tue, 21 Apr 2026 12:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4193C2BCB0;
	Tue, 21 Apr 2026 12:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776775416;
	bh=+V8ZfRYrjzwJXgqe+fTwt5G7FKr8RN3Pd3uuU7wkOoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKaBnixDB559hSNI2VTzNUIPYmrAI6E00jRbjPrOokUf/IxdtI+SshEpQoAyenhw8
	 76rWm2uvZ8+hauZIvZZX6A7nFC0SxJ6kMrA9ulppvSD3C+FJ/CzVar45/8h/DB2zcv
	 YGLim2xCtfRLj1iQMqdaLuz8sX6dE1TTVXRbPe3a1uXohDZKA/UZJ6tPd6x5Wi16eZ
	 T0URH9Vv45mpbG6NaRuAGhxQYk5PnNi6nxmwsm5JkQwEWynXiz5ODq1PfIo++vls3p
	 MtaICJCnPo6Zj/5EBQN8gEOGsJsJFR+lVLiJOVhWYo/K5b9K+gK/6TjrA0rrben6Ud
	 sTHdoBBwGyulA==
Date: Tue, 21 Apr 2026 18:13:17 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	vikash.garodia@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com, sean@poorly.run,
	akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com, marijn.suijten@somainline.org,
	airlied@gmail.com, simona@ffwll.ch,
	dikshita.agarwal@oss.qualcomm.com, bod@kernel.org,
	mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, jjohnson@kernel.org, mathieu.poirier@linaro.org,
	mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
	tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, harshal.dev@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 11/15] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <aedw5VUJvwVkYfF5@sumit-xelite>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <20260327131043.627120-12-sumit.garg@kernel.org>
 <ac-KQ7e8-syph1Zl@trex>
 <adOcMsk8a_Clb4WZ@sumit-xelite>
 <439f9bbf-1ba1-465f-b5af-01ba0ebb86d4@oss.qualcomm.com>
 <adYElwM6eT5T8hZM@trex>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adYElwM6eT5T8hZM@trex>
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

On Wed, Apr 08, 2026 at 09:32:39AM +0200, Jorge Ramirez wrote:
> On 07/04/26 15:14:22, Trilok Soni wrote:
> > On 4/6/2026 4:42 AM, Sumit Garg wrote:
> > > Hi Jorge,
> > > 
> > > On Fri, Apr 03, 2026 at 11:37:07AM +0200, Jorge Ramirez wrote:
> > >> On 27/03/26 18:40:39, Sumit Garg wrote:
> > >>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > >>>
> > >>> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> > >>> TZ service allows to support multiple TZ implementation backends like QTEE
> > >>> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> > >>> backend service.
> > >>
> > >> OP-TEE based PAS service relies on the linux driver to configure the
> > >> iommu (just as it is done on the no_tz case). This generic patch does
> > >> not cover that requirement.
> > > 
> > > That's exactly the reason why the kodiak EL2 dtso disables venus by
> > > default in patch #1 due to missing IOMMU configuration.
> > > 
> > >>
> > >> Because of that, it is probably better if the commit message doesnt
> > >> mention OP-TEE and instead maybe indicate that PAS wll support TEEs that
> > >> implement the same restrictions that QTEE (ie, iommu configuration).
> > > 
> > > The scope for this patch is to just adopt the generic PAS layer without
> > > affecting the client functionality.
> 
> the patchset cover letter + the commit message + the OP-TEE pull request
> being referenced gives the ilusion to users that with the current set
> they will get something functional (they will get a broken video
> platform instead if they try to use OP-TEE).
> 
> That was the point I was making: IMO the commit message walks on a thin
> line of "completeness"
> 
> QTEE and OP-TEE at this time implement different use cases (Venus with
> QTEE runs with Linux on EL1 , OP-TEE runs with Linux on EL2). So maybe
> worth mentioning this divergence.
> 

Sure, I can extend the cover letter to say media support with Linux at
EL2 is missing for both OP-TEE and QTEE which is being worked on as a
separate effort related to missing IOMMU support.

-Sumit

