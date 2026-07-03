Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B14EC44500
	for <ath12k@archiver.kernel.org>; Fri,  3 Jul 2026 04:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLKVDQfsx9hZuipTAI+f27y7jhAau5VYS8053c6lGBE=; b=rLwfUVTJWXvvo3/+41NKnf9EiC
	+j9SKGYGAlpcD0nSV036vVysMDT46AxlrkH0qu2IvqdAD2RJnvzkwsrRyndZ+uhSuemU2vLM/ymWp
	YqsCk7xSBRSX6bDd3QV/2FAWTLFmzKrwc1p8eYsluFq0B5dWm/Y5a6FhqeZXrp0bXLeLQ1qRp6ro0
	NBqMA9dmDbI1pQnQPqMQTZE0/FtYBEZYz0WGAzIIBpwBxoMITir1yA7vGSQqMxEZzCsZQ7b1vt7xA
	O/Zi3XEkXKgmrxy54GfKB3haZfAF6XT7Okkt4fuzrNOT/r6gc4orhdaFc9EGtTItdHGDJoHzoG4nP
	Z+aNTGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfVHa-000000060Cd-0VgE;
	Fri, 03 Jul 2026 04:13:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfVHY-000000060CC-0SGT
	for ath12k@lists.infradead.org;
	Fri, 03 Jul 2026 04:13:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 52C58600E2;
	Fri,  3 Jul 2026 04:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAC81F000E9;
	Fri,  3 Jul 2026 04:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783052018;
	bh=XLKVDQfsx9hZuipTAI+f27y7jhAau5VYS8053c6lGBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uj8F8wmZ+tjwYybD0ILNCuG9cg9/UTh0dnsYv5PvEEHPRYJcXrHBe/YtA1XQ+Bt5j
	 fSuYrb2UtnrdJsGZaEsTOq+nFRxUFvjnGai4AR3JLyuAGIlyq/RJh4Fg0ZVUyTpye7
	 BnKE6qNFt9LWzrP06cWdVPQ1Iffu7w4FGnk6k87jXWvu6PoecArR3sURE4IbAuyixt
	 a369HkjK0Fr3bVKoo3K9DT6q+/FNFVquikETXxbba4eIx3NB3adQwgu9kGFiDgmwVi
	 9k0oMh73t5fALUnl5GShBbDm/0UPkyU543XUwvy0nEsaOx5Zw32MAgn+Xv/noN1C+8
	 zjrsjdWwEGAYw==
Date: Fri, 3 Jul 2026 09:43:19 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
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
	bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
	trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
	pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
	tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v9 00/14] firmware: qcom: Add OP-TEE PAS service support
Message-ID: <akc23w16MeSu8ODb@sumit-xelite>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <CANLsYkyFJ+CbUJpwWAy28KHvmNz6rJRtM5KrEzHjyAha-7grTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANLsYkyFJ+CbUJpwWAy28KHvmNz6rJRtM5KrEzHjyAha-7grTQ@mail.gmail.com>
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

Hey Mathieu,

On Thu, Jul 02, 2026 at 01:14:03PM -0600, Mathieu Poirier wrote:
> Hey Sumit - nice hearing from you...
> 

Good to hear from you too.

> Is there some kind of overarching design harminisation between what
> you are proposing here and what Arnaud posted back in April [1] ?

The design here for remoteproc bringup on Qcom platforms for OP-TEE is
carried forward from whatever existed earlier with QTEE. This patch-set
just adds OP-TEE backend and replicate the same co-processor bringup
design as QTEE.

Co-processor bringup using a TEE is very different on Qcom platforms as
compared to what ST did. The image formats for Qcom are custom ones
using MBN format over ELF for which the MDT loader exists in the kernel
only. Similarly the firmware image authentication is very tightly
coupled with Qcom secure boot chain.

The ST framework rather uses an ELF loader in OP-TEE for image loading
and have an authentication mechanism similar to TAs. Also, the OP-TEE
ABI is altogether different from the PAS ABI that Qcom has for the TEE.

-Sumit

> 
> [1]. https://lists.trustedfirmware.org/archives/list/op-tee@lists.trustedfirmware.org/thread/VMKTRATYUFWL2TP7NHN5KJ37MSVZZMPK/
> 
> On Thu, 2 Jul 2026 at 05:59, Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >
> > Qcom platforms has the legacy of using non-standard SCM calls
> > splintered over the various kernel drivers. These SCM calls aren't
> > compliant with the standard SMC calling conventions which is a
> > prerequisite to enable migration to the FF-A specifications from Arm.
> >
> > OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> > support these non-standard SCM calls. And even for newer architectures
> > using S-EL2 with Hafnium support, QTEE won't be able to support SCM
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
> > The TEE PAS service ABI is designed to be extensible with additional API
> > as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
> > extensions of the PAS service needed while still maintaining backwards
> > compatibility.
> >
> > Currently OP-TEE support is being added to provide the backend PAS
> > service implementation which can be found as part of this PR [1].
> > This implementation has been tested on Kodiak/RB3Gen2 and lemans
> > EVK boards. In addition to that WIN/IPQ targets tested OP-TEE with
> > this service too. Surely the backwards compatibility is maintained and
> > tested for SCM backend.
> >
> > Note that kernel PAS service support while running in EL2 is at parity
> > among OP-TEE vs QTEE. Especially the media (venus/iris) support depends
> > on proper IOMMU support being worked out on the PAS client end.
> >
> > Patch summary:
> > - Patch #1: adds generic PAS service.
> > - Patch #2: migrates SCM backend to generic PAS service.
> > - Patch #3: adds TEE/OP-TEE backend for generic PAS service.
> > - Patch #4-#12: migrates all client drivers to generic PAS service.
> > - Patch #13: drops legacy PAS SCM exported APIs.
> >
> > The patch-set is based on v7.2-rc1 and can be found in git tree
> > here [2].
> >
> > Merge strategy:
> >
> > It is expected due to APIs dependency, the entire patch-set to go via
> > the Qcom tree. All other subsystem maintainers, it will be great if I
> > can get acks for the corresponding subsystem patches.
> >
> > [1] https://github.com/OP-TEE/optee_os/pull/7721 (already merged)
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/sumit.garg/linux.git/log/?h=qcom-pas-v9
> >
> > ---
> > Changes in v9:
> > - Rebased to 7.2-rc1.
> > - Enable SCM backend similar to TEE if ARCH_QCOM is set.
> > - Address misc. comments from Konrad.
> > - Add checks for corner cases (although not reachable as per OP-TEE ABI)
> >   reported by Shashiko on patch #3.
> > - Picked up review tags from Konrad.
> >
> > Changes in v8:
> > - Rebased on mainline tip (no functional changes).
> > - Now Lemans EVK is also tested to support OP-TEE PAS here:
> >   https://github.com/OP-TEE/optee_os/pull/7845
> > - Drop Kodiak DT patch as it is carried independently by Mukesh here:
> >   https://lore.kernel.org/lkml/20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com/
> > - Regarding Sashiko comments, I have already replied in v6 the ones that
> >   don't apply but in v7 I got the same comments again. Specific context
> >   reasoning which Shashiko ignores:
> >     - ABI contract between Linux and TZ
> >     - No support for multiple concurrent backends
> >     - The TZ backend doesn’t detach during the entire boot cycle
> >
> > Changes in v7:
> > - Rebased to qcom tree (for-next branch) tip.
> > - Merged patch #5 and #7 due to build dependency.
> > - Disabled modem for kodiak EL2 as it isn't tested yet.
> > - Fix an issue found out by sashiko-bot for patch #4.
> >
> > Changes in v6:
> > - Rebased to v7.1-rc4 tag.
> > - Patch #14: fixed ret error print.
> > - Add Kconfig descriptions for PAS symbols such that they are visible
> >   in menuconfig to update.
> >
> > Changes in v5:
> > - Incorporated misc. comments from Mukesh.
> > - Split up patch #11 into 2 to add an independent commit for passing
> >   proper PAS ID to set_remote_state API.
> > - Picked up tags.
> >
> > Changes in v4:
> > - Incorporate misc. comments on patch #4.
> > - Picked up an ack for patch #10.
> > - Clarify in cover letter about state of media support.
> >
> > Changes in v3:
> > - Incorporated some style and misc. comments for patch #2, #3 and #4.
> > - Add QCOM_PAS Kconfig dependency for various subsystems.
> > - Switch from pseudo TA to proper TA invoke commands.
> >
> > Changes in v2:
> > - Fixed kernel doc warnings.
> > - Polish commit message and comments for patch #2.
> > - Pass proper PAS ID in set_remote_state API for media firmware drivers.
> > - Added Maintainer entry and dropped MODULE_AUTHOR.
> >
> > Sumit Garg (14):
> >   firmware: qcom: Add a generic PAS service
> >   firmware: qcom_scm: Migrate to generic PAS service
> >   firmware: qcom: Add a PAS TEE service
> >   remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs
> >   remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs
> >   remoteproc: qcom_wcnss: Switch to generic PAS TZ APIs
> >   remoteproc: qcom: Select QCOM_PAS generic service
> >   drm/msm: Switch to generic PAS TZ APIs
> >   media: qcom: Switch to generic PAS TZ APIs
> >   media: qcom: Pass proper PAS ID to set_remote_state API
> >   net: ipa: Switch to generic PAS TZ APIs
> >   wifi: ath12k: Switch to generic PAS TZ APIs
> >   firmware: qcom_scm: Remove SCM PAS wrappers
> >   MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
> >
> >  MAINTAINERS                                   |   9 +
> >  drivers/firmware/qcom/Kconfig                 |  22 +-
> >  drivers/firmware/qcom/Makefile                |   2 +
> >  drivers/firmware/qcom/qcom_pas.c              | 299 +++++++++++
> >  drivers/firmware/qcom/qcom_pas.h              |  50 ++
> >  drivers/firmware/qcom/qcom_pas_tee.c          | 479 ++++++++++++++++++
> >  drivers/firmware/qcom/qcom_scm.c              | 302 ++++-------
> >  drivers/gpu/drm/msm/Kconfig                   |   1 +
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   4 +-
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  11 +-
> >  drivers/media/platform/qcom/iris/Kconfig      |  27 +-
> >  .../media/platform/qcom/iris/iris_firmware.c  |   9 +-
> >  drivers/media/platform/qcom/venus/Kconfig     |   1 +
> >  drivers/media/platform/qcom/venus/firmware.c  |  11 +-
> >  drivers/net/ipa/Kconfig                       |   2 +-
> >  drivers/net/ipa/ipa_main.c                    |  13 +-
> >  drivers/net/wireless/ath/ath12k/Kconfig       |   2 +-
> >  drivers/net/wireless/ath/ath12k/ahb.c         |  10 +-
> >  drivers/remoteproc/Kconfig                    |   4 +-
> >  drivers/remoteproc/qcom_q6v5_mss.c            |   5 +-
> >  drivers/remoteproc/qcom_q6v5_pas.c            |  51 +-
> >  drivers/remoteproc/qcom_wcnss.c               |  12 +-
> >  drivers/soc/qcom/mdt_loader.c                 |  12 +-
> >  include/linux/firmware/qcom/qcom_pas.h        |  43 ++
> >  include/linux/firmware/qcom/qcom_scm.h        |  29 --
> >  include/linux/soc/qcom/mdt_loader.h           |   6 +-
> >  26 files changed, 1095 insertions(+), 321 deletions(-)
> >  create mode 100644 drivers/firmware/qcom/qcom_pas.c
> >  create mode 100644 drivers/firmware/qcom/qcom_pas.h
> >  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
> >  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
> >
> > --
> > 2.53.0
> >
> 

