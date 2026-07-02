Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16210C43602
	for <ath12k@archiver.kernel.org>; Thu,  2 Jul 2026 19:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dfas/91RHw7TRgs4MMexcFlE2KWowDBMjBihd9aSOjU=; b=r9aymSo1MnghcEk+UzyP0q1uSF
	ofG2wi4zwiQhBu8eScN+r6gLwStePlj7nf+H8eycyqxPUz8NIrX4kpwEihw75jEionhjbmGp/j/+Y
	HvCvYDMt5PP8qVYlR8U6NGP9mcHsvUUtmOQS2jbtRW3pSKJoOB+Ns8uJxbMktsv0Cq6LxrXaYCaAU
	s0p9jb4R7SvOjLYzkgZ6O57R3/MK4WXL2b8TR3vFY82ydVBFFnVXALKMRHeTTEvGE5vCpRFmoS1hA
	/P30Dm0eNbRGpR8F5/3aOUXi/vYsULeqBEnu0xjCtWlUtz8zEsh0sVCHjrYhYY3xcDg9fR9F8xVqe
	RV0jWviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMrb-00000005LYK-3UxR;
	Thu, 02 Jul 2026 19:14:19 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMrZ-00000005LXm-2s89
	for ath12k@lists.infradead.org;
	Thu, 02 Jul 2026 19:14:19 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so2139787a12.1
        for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 12:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783019655; cv=none;
        d=google.com; s=arc-20260327;
        b=CLSXnELxsukAPQAJie8JQgP08Ml+o7w3yORwDanuqru/+fNGZcvWNacnmUAFvzJnrQ
         6YBv/HbnzJzaTbr+Ho30qy7cNH/82ofArOD16Ly56rcUh6doSGRc08QbowYg3MpCCTJ/
         82Horja5lAWPiTTYNs466NLBWt132L1c6MpSzav4Q0eCEVvmSlKuRQ9Su1/5wthqEWM3
         OBQf1aJAvVYYLj9FIhB4DMhQS++8C2acSA79Ue2FiT0bDB9ltPz80EHh0uTtDOTrO5DO
         c/Cf7HmI3T1vG7FjOBz+jhMxIxuZUVwtYQ69RFcA5H+Rq+SAk9oPEjnwV4ROuX51F7FN
         Dhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dfas/91RHw7TRgs4MMexcFlE2KWowDBMjBihd9aSOjU=;
        fh=jiV4H1w2RzEqADMe9CAWPJcV7otE1AWclhcEgWrDT4U=;
        b=cvO+NprIwGTxxzy2ZVTHYEvH0AgaZlBI7MdABBN+x2T7PFt3WM6TfWxz4jlmTJAo2z
         tl1d15lzavCru3vjdwXWJDDglQPJZi02PJ8azYVET/zI7Jor3CY2ElJgBjvdVxmcaVlB
         U9mfPZEUmuNx4L5JKPNcBRc/AAon9MlLe9+W3RRNTwXDlu3PLcvXy4YBgeZFXDnGW+Dx
         Q/9/b3mAca7a+BuIlIorTEi/YyWM7QpdsW8VWGEhkDbBQruwH1PZlxQOlkuEMNnoQLzu
         47gdAH6H1W4T6Uc9uh5rcUa3qBWwMn+Ftlu3tmMr+cPQH5hGCRRlxvfeRhZAN1qLeBAn
         ZQag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783019655; x=1783624455; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dfas/91RHw7TRgs4MMexcFlE2KWowDBMjBihd9aSOjU=;
        b=NjNly0BkF7KpyUgFLMCBp08PV2kwex2a4TVVRPqI3rQg1y3tBWzcyGMx8WpjgUQ9v2
         sJOM1RWR0GrC2uFfaUCFB/ghP8oJ679ee+hKf8HiM2rlNdXlNGwfbphLujb2xGlAZILm
         LsFBb/wyedOw/F4xvkt6Sv072wglT0LPsfVDtoCIb39dwOOpiIfHphhNT1aH87TgZylu
         45UTh172jQ10nr8KLNdSn5aLPTsvxxjlyBkNKG4QvykV6JeQ8uuqZJrZuzJUpWZM73a7
         o26d5vFoTdEPNB36XImDZqSNKwuXXodHcgo6Yx4TGGMXb3Uk8Lmx38LbIENkkcLzArut
         Er8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783019655; x=1783624455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dfas/91RHw7TRgs4MMexcFlE2KWowDBMjBihd9aSOjU=;
        b=CKZ2KzzjwwONpxjZDsJJdU9XsrgrpSnu7tYNnspQ3fhS2ZFC9sFgwnt286dtTmqMHq
         PIOsPETvIuNoSgj1ufSlDo/fg3U6Ac9wJz3nu9MVba8iruE/hR+MypD7k9jK9ZbsQlga
         iO2fexzCbk2HjwFE3UnMq+MkW2VX9rHaz+vZhiEzvy7rs7Gh5XY7wUN3ByU5C5y1/nMd
         qxifizE7q01tfzKZrh0tGSwI+Le/lheoM0ymFavj3+55bfIwrO9gAFhL/oQbMdc7+f5O
         QdkYMnXKebPcNMxzeq3Q6fEw7V1P5i/X7UrTNweO1iKLZ1ngIJQVdBPIQQxc24gidnKk
         SkiQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7bDTMMm3+HSe7ykYsclvkN2jw4kG2Em4NnS/vWRezp5j7hVdnDdIFiwkag5M4omfPHuPR+C4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQnohG4YU3RzqWrLZGeum1Q/MZQVkOUhMgoS0SdvTviUP7fKzD
	vUwwZGSoW1zF4wBRSwccVIjzQB8meiM6A5/0lp1x69Zml8jaYPXIXgrm9xstNFE45+v1bHItvMz
	NVQ6FBWXX/y2k/UtX6pqQV9+uUN6cp9hwn8yUkAVwOw==
X-Gm-Gg: AfdE7cmWxtMNnF/pWv2n5KNN4UyyJ153Z/2oYeedp3O05ojnzKLJlzM1bU8Mjk83VjR
	WwO6yZpTRktNCO7JklEARpah538Vo8oINlL6kGErMvkYcMLCfUHhrSge+WLSbH9BlCjCMVNwjXP
	94YTBFCkLJEQGYzeSKB1HelQ+c37kGOEskPzJB2HReyn9zhcn3Q8uPuy0R6ax2XWLU8Ju5mHsty
	aCa0Fph/7P0xpjX2U8BMpJGAcUarPQM4AhCaHV0udqOigPduqbBIzjCyqSRt2pq55A1wBmvB65J
	kn49kboxU9IzdrKwRHiDx1KmHnrIor0=
X-Received: by 2002:a05:6402:42c6:b0:695:f580:a66f with SMTP id
 4fb4d7f45d1cf-698a2cda40dmr3064278a12.21.1783019655273; Thu, 02 Jul 2026
 12:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260702115835.167602-1-sumit.garg@kernel.org>
In-Reply-To: <20260702115835.167602-1-sumit.garg@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 2 Jul 2026 13:14:03 -0600
X-Gm-Features: AVVi8CeXvNLFBEH_Z9SIZx0oNo56nh0xA5WRLgXhkbS1U9sxKdwz3gfEHooCZ0g
Message-ID: <CANLsYkyFJ+CbUJpwWAy28KHvmNz6rJRtM5KrEzHjyAha-7grTQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/14] firmware: qcom: Add OP-TEE PAS service support
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-media@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run, 
	akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev, 
	jesszhan0024@gmail.com, marijn.suijten@somainline.org, airlied@gmail.com, 
	simona@ffwll.ch, vikash.garodia@oss.qualcomm.com, bod@kernel.org, 
	mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	jjohnson@kernel.org, trilokkumar.soni@oss.qualcomm.com, 
	mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com, 
	jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com, 
	vignesh.viswanathan@oss.qualcomm.com, srinivas.kandagatla@oss.qualcomm.com, 
	amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org, 
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com, 
	skare@qti.qualcomm.com, linux-kernel@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_121417_794243_5C783445 
X-CRM114-Status: GOOD (  34.89  )
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

Hey Sumit - nice hearing from you...

Is there some kind of overarching design harminisation between what
you are proposing here and what Arnaud posted back in April [1] ?

[1]. https://lists.trustedfirmware.org/archives/list/op-tee@lists.trustedfi=
rmware.org/thread/VMKTRATYUFWL2TP7NHN5KJ37MSVZZMPK/

On Thu, 2 Jul 2026 at 05:59, Sumit Garg <sumit.garg@kernel.org> wrote:
>
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
>
> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> support these non-standard SCM calls. And even for newer architectures
> using S-EL2 with Hafnium support, QTEE won't be able to support SCM
> calls either with FF-A requirements coming in. And with both OP-TEE
> and QTEE drivers well integrated in the TEE subsystem, it makes further
> sense to reuse the TEE bus client drivers infrastructure.
>
> The added benefit of TEE bus infrastructure is that there is support
> for discoverable/enumerable services. With that client drivers don't
> have to manually invoke a special SCM call to know the service status.
>
> So enable the generic Peripheral Authentication Service (PAS) provided
> by the firmware. It acts as the common layer with different TZ
> backends plugged in whether it's an SCM implementation or a proper
> TEE bus based PAS service implementation.
>
> The TEE PAS service ABI is designed to be extensible with additional API
> as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
> extensions of the PAS service needed while still maintaining backwards
> compatibility.
>
> Currently OP-TEE support is being added to provide the backend PAS
> service implementation which can be found as part of this PR [1].
> This implementation has been tested on Kodiak/RB3Gen2 and lemans
> EVK boards. In addition to that WIN/IPQ targets tested OP-TEE with
> this service too. Surely the backwards compatibility is maintained and
> tested for SCM backend.
>
> Note that kernel PAS service support while running in EL2 is at parity
> among OP-TEE vs QTEE. Especially the media (venus/iris) support depends
> on proper IOMMU support being worked out on the PAS client end.
>
> Patch summary:
> - Patch #1: adds generic PAS service.
> - Patch #2: migrates SCM backend to generic PAS service.
> - Patch #3: adds TEE/OP-TEE backend for generic PAS service.
> - Patch #4-#12: migrates all client drivers to generic PAS service.
> - Patch #13: drops legacy PAS SCM exported APIs.
>
> The patch-set is based on v7.2-rc1 and can be found in git tree
> here [2].
>
> Merge strategy:
>
> It is expected due to APIs dependency, the entire patch-set to go via
> the Qcom tree. All other subsystem maintainers, it will be great if I
> can get acks for the corresponding subsystem patches.
>
> [1] https://github.com/OP-TEE/optee_os/pull/7721 (already merged)
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/sumit.garg/linux.git/=
log/?h=3Dqcom-pas-v9
>
> ---
> Changes in v9:
> - Rebased to 7.2-rc1.
> - Enable SCM backend similar to TEE if ARCH_QCOM is set.
> - Address misc. comments from Konrad.
> - Add checks for corner cases (although not reachable as per OP-TEE ABI)
>   reported by Shashiko on patch #3.
> - Picked up review tags from Konrad.
>
> Changes in v8:
> - Rebased on mainline tip (no functional changes).
> - Now Lemans EVK is also tested to support OP-TEE PAS here:
>   https://github.com/OP-TEE/optee_os/pull/7845
> - Drop Kodiak DT patch as it is carried independently by Mukesh here:
>   https://lore.kernel.org/lkml/20260624063952.2242702-1-mukesh.ojha@oss.q=
ualcomm.com/
> - Regarding Sashiko comments, I have already replied in v6 the ones that
>   don't apply but in v7 I got the same comments again. Specific context
>   reasoning which Shashiko ignores:
>     - ABI contract between Linux and TZ
>     - No support for multiple concurrent backends
>     - The TZ backend doesn=E2=80=99t detach during the entire boot cycle
>
> Changes in v7:
> - Rebased to qcom tree (for-next branch) tip.
> - Merged patch #5 and #7 due to build dependency.
> - Disabled modem for kodiak EL2 as it isn't tested yet.
> - Fix an issue found out by sashiko-bot for patch #4.
>
> Changes in v6:
> - Rebased to v7.1-rc4 tag.
> - Patch #14: fixed ret error print.
> - Add Kconfig descriptions for PAS symbols such that they are visible
>   in menuconfig to update.
>
> Changes in v5:
> - Incorporated misc. comments from Mukesh.
> - Split up patch #11 into 2 to add an independent commit for passing
>   proper PAS ID to set_remote_state API.
> - Picked up tags.
>
> Changes in v4:
> - Incorporate misc. comments on patch #4.
> - Picked up an ack for patch #10.
> - Clarify in cover letter about state of media support.
>
> Changes in v3:
> - Incorporated some style and misc. comments for patch #2, #3 and #4.
> - Add QCOM_PAS Kconfig dependency for various subsystems.
> - Switch from pseudo TA to proper TA invoke commands.
>
> Changes in v2:
> - Fixed kernel doc warnings.
> - Polish commit message and comments for patch #2.
> - Pass proper PAS ID in set_remote_state API for media firmware drivers.
> - Added Maintainer entry and dropped MODULE_AUTHOR.
>
> Sumit Garg (14):
>   firmware: qcom: Add a generic PAS service
>   firmware: qcom_scm: Migrate to generic PAS service
>   firmware: qcom: Add a PAS TEE service
>   remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs
>   remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs
>   remoteproc: qcom_wcnss: Switch to generic PAS TZ APIs
>   remoteproc: qcom: Select QCOM_PAS generic service
>   drm/msm: Switch to generic PAS TZ APIs
>   media: qcom: Switch to generic PAS TZ APIs
>   media: qcom: Pass proper PAS ID to set_remote_state API
>   net: ipa: Switch to generic PAS TZ APIs
>   wifi: ath12k: Switch to generic PAS TZ APIs
>   firmware: qcom_scm: Remove SCM PAS wrappers
>   MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
>
>  MAINTAINERS                                   |   9 +
>  drivers/firmware/qcom/Kconfig                 |  22 +-
>  drivers/firmware/qcom/Makefile                |   2 +
>  drivers/firmware/qcom/qcom_pas.c              | 299 +++++++++++
>  drivers/firmware/qcom/qcom_pas.h              |  50 ++
>  drivers/firmware/qcom/qcom_pas_tee.c          | 479 ++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c              | 302 ++++-------
>  drivers/gpu/drm/msm/Kconfig                   |   1 +
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   4 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  11 +-
>  drivers/media/platform/qcom/iris/Kconfig      |  27 +-
>  .../media/platform/qcom/iris/iris_firmware.c  |   9 +-
>  drivers/media/platform/qcom/venus/Kconfig     |   1 +
>  drivers/media/platform/qcom/venus/firmware.c  |  11 +-
>  drivers/net/ipa/Kconfig                       |   2 +-
>  drivers/net/ipa/ipa_main.c                    |  13 +-
>  drivers/net/wireless/ath/ath12k/Kconfig       |   2 +-
>  drivers/net/wireless/ath/ath12k/ahb.c         |  10 +-
>  drivers/remoteproc/Kconfig                    |   4 +-
>  drivers/remoteproc/qcom_q6v5_mss.c            |   5 +-
>  drivers/remoteproc/qcom_q6v5_pas.c            |  51 +-
>  drivers/remoteproc/qcom_wcnss.c               |  12 +-
>  drivers/soc/qcom/mdt_loader.c                 |  12 +-
>  include/linux/firmware/qcom/qcom_pas.h        |  43 ++
>  include/linux/firmware/qcom/qcom_scm.h        |  29 --
>  include/linux/soc/qcom/mdt_loader.h           |   6 +-
>  26 files changed, 1095 insertions(+), 321 deletions(-)
>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
>  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
>
> --
> 2.53.0
>

