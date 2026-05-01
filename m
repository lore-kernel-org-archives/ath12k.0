Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2643CD3424
	for <ath12k@archiver.kernel.org>; Fri,  1 May 2026 13:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVKEfR25vIfqWIOwtw5rTJ/Gq+Y70/4wIR5etL2oJjI=; b=c6XQ7tFu2V/Cm/oI2/orSWRwPL
	xdYdkEchq3bp1lsf7cwT4DgESnZ4qAD+nbYq/TzYukXBgnSxH5GtAMXvN582Vkds5VNlbagliqXZM
	WVqBzDgLfsIYJ46KEDTgvVUJXdib768Hziga5LqeshFNXby9ikQ+HXlw2V2GDah1OZFraZQaHr8Kq
	9XNJYdQV8SXFjvwA0QPChg18fpl4Q4HuOkUhjzC9Guiveee0o22dPavs+XZHBREgJE10IIm64VM4z
	B3heJPDqhESoL9j+2uiFokcNhH2ahoHkhCbktL8bBdchrXRo9qr3T/yWqknuW8cMi6tG75kRoUMB6
	lGfSthwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIo15-00000007B3c-2qm2;
	Fri, 01 May 2026 13:34:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIo13-00000007B3V-3uCC
	for ath12k@lists.infradead.org;
	Fri, 01 May 2026 13:34:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06C976014C;
	Fri,  1 May 2026 13:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6C8C2BCB4;
	Fri,  1 May 2026 13:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777642488;
	bh=tsrIRzcCwRZ1mCWsxCCDt11tSch/5ZWTkz/77qH/V8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cw4x0vGraiUU3oevv5rhBvLp1fivalq4w76GVWFrJWZ8MiQVr1UevA0GARaNEm5Ei
	 1+wHfuWxHGdbKw6GomF8n/7YboY0zxjofY5ndfI6LUn56szOX6xRZbJgbIoRZLieZF
	 BEVu6wvKz5VkYk3m4h56MtienQqdhZRwiWFKuObV6gmyZet7/Q3nOud/8CuGagYu9L
	 SWrFnfewi3e7nLk0TlJiCqoy1gf+wPvrmydkyFdtKZsOBcolUFlyt++0V14lvBRZBD
	 dMkUmOvnfIkZ1mVYe2PRogNO1VxcOpy9VLDK4qkwHgGR9U8GgFl7nZffjuZM9M6Kd+
	 tK3yClTCE8m1A==
Date: Fri, 1 May 2026 19:04:31 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
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
	dikshita.agarwal@oss.qualcomm.com, bod@kernel.org,
	mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, jjohnson@kernel.org, mathieu.poirier@linaro.org,
	trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
	vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/15] firmware: qcom: Add OP-TEE PAS service support
Message-ID: <afSr5zT7lTWzXvif@sumit-xelite>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260429065926.5iliebd3d2j6bong@hu-mojha-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065926.5iliebd3d2j6bong@hu-mojha-hyd.qualcomm.com>
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

On Wed, Apr 29, 2026 at 12:29:26PM +0530, Mukesh Ojha wrote:
> On Mon, Apr 27, 2026 at 03:25:48PM +0530, Sumit Garg wrote:
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
> > This implementation has been tested on Kodiak/RB3Gen2 board with lemans
> > EVK board being the next target. In addition to that WIN/IPQ targets
> > planning to use OP-TEE will use this service too. Surely the backwards
> > compatibility is maintained and tested for SCM backend.
> > 
> > Note that kernel PAS service support while running in EL2 is at parity
> > among OP-TEE vs QTEE. Especially the media (venus/iris) support depends
> > on proper IOMMU support being worked out on the PAS client end.
> > 
> > Patch summary:
> > - Patch #1: adds Kodiak EL2 overlay since boot stack with TF-A/OP-TEE
> >   only allow UEFI and Linux to boot in EL2.
> > - Patch #2: adds generic PAS service.
> > - Patch #3: migrates SCM backend to generic PAS service.
> > - Patch #4: adds TEE/OP-TEE backend for generic PAS service.
> > - Patch #5-#13: migrates all client drivers to generic PAS service.
> > - Patch #14: drops legacy PAS SCM exported APIs.
> 
> 
> Gave it a try to test the series on Lemans with Gunyah as well as KVM
> hypervisor and all the remote processor are coming up successfully.
> 
> Feel free to carry 
> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> 
> for the Series.
>

Thanks for taking time to test this patch-set.

-Sumit

> 
> > The patch-set is based on v7.1-rc1 tag and can be found in git tree here
> > [2].
> > 
> > Merge strategy:
> > 
> > It is expected due to APIs dependency, the entire patch-set to go via
> > the Qcom tree. All other subsystem maintainers, it will be great if I
> > can get acks for the corresponding subsystem patches.
> > 
> > [1] https://github.com/OP-TEE/optee_os/pull/7721
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/sumit.garg/linux.git/log/?h=qcom-pas-v4
> > 
> > ---
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
> > Mukesh Ojha (1):
> >   arm64: dts: qcom: kodiak: Add EL2 overlay
> > 
> > Sumit Garg (14):
> >   firmware: qcom: Add a generic PAS service
> >   firmware: qcom_scm: Migrate to generic PAS service
> >   firmware: qcom: Add a PAS TEE service
> >   remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs
> >   remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs
> >   soc: qcom: mdtloader: Switch to generic PAS TZ APIs
> >   remoteproc: qcom_wcnss: Switch to generic PAS TZ APIs
> >   remoteproc: qcom: Select QCOM_PAS generic service
> >   drm/msm: Switch to generic PAS TZ APIs
> >   media: qcom: Switch to generic PAS TZ APIs
> >   net: ipa: Switch to generic PAS TZ APIs
> >   wifi: ath12k: Switch to generic PAS TZ APIs
> >   firmware: qcom_scm: Remove SCM PAS wrappers
> >   MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
> > 
> >  MAINTAINERS                                   |   9 +
> >  arch/arm64/boot/dts/qcom/Makefile             |   2 +
> >  arch/arm64/boot/dts/qcom/kodiak-el2.dtso      |  35 ++
> >  drivers/firmware/qcom/Kconfig                 |  19 +
> >  drivers/firmware/qcom/Makefile                |   2 +
> >  drivers/firmware/qcom/qcom_pas.c              | 288 +++++++++++
> >  drivers/firmware/qcom/qcom_pas.h              |  50 ++
> >  drivers/firmware/qcom/qcom_pas_tee.c          | 479 ++++++++++++++++++
> >  drivers/firmware/qcom/qcom_scm.c              | 302 ++++-------
> >  drivers/gpu/drm/msm/Kconfig                   |   1 +
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   4 +-
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  11 +-
> >  drivers/media/platform/qcom/iris/Kconfig      |  25 +-
> >  .../media/platform/qcom/iris/iris_firmware.c  |   9 +-
> >  drivers/media/platform/qcom/venus/Kconfig     |   1 +
> >  drivers/media/platform/qcom/venus/firmware.c  |  11 +-
> >  drivers/net/ipa/Kconfig                       |   2 +-
> >  drivers/net/ipa/ipa_main.c                    |  13 +-
> >  drivers/net/wireless/ath/ath12k/Kconfig       |   2 +-
> >  drivers/net/wireless/ath/ath12k/ahb.c         |   8 +-
> >  drivers/remoteproc/Kconfig                    |   1 +
> >  drivers/remoteproc/qcom_q6v5_mss.c            |   5 +-
> >  drivers/remoteproc/qcom_q6v5_pas.c            |  51 +-
> >  drivers/remoteproc/qcom_wcnss.c               |  12 +-
> >  drivers/soc/qcom/mdt_loader.c                 |  12 +-
> >  include/linux/firmware/qcom/qcom_pas.h        |  43 ++
> >  include/linux/firmware/qcom/qcom_scm.h        |  29 --
> >  include/linux/soc/qcom/mdt_loader.h           |   6 +-
> >  28 files changed, 1115 insertions(+), 317 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> >  create mode 100644 drivers/firmware/qcom/qcom_pas.c
> >  create mode 100644 drivers/firmware/qcom/qcom_pas.h
> >  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
> >  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> -Mukesh Ojha
> 

