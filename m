Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA17AF01821
	for <ath12k@archiver.kernel.org>; Fri,  6 Mar 2026 10:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6XSBhCGPook/lma52K8G/3Mhi4FmGh56CNTIG4CqsOA=; b=GtXUJLL1Y5J6orLDjldf/jsoJG
	IrvQp/deA2mLDuPUInIFaYg1I2WjjT2+6OgBahaVtUMf6OS5J9K3U97MDyxDIcPSiQT0F19Ib/hPB
	F5kHhp78EPdPnVhbsCOHSRlkaARM+sdsgM0PGw1ak5N/rVcMEaqEOeFW3B1vhs6I8P76PNBE6LxCw
	uUxZX/8gIyuZZU+j2hSP+X4l4RFsv8O6ykfbiTPDxQK9sVYC5S4Nq3lIKwCQ50AWdFprT3j0EYavO
	H0pwu4ZkHdL0kRxSyM1PFmz3lVOhQe2TiVi1dcZCFTt3DZv3s8E9syzUk1q4OttQovNfKJgew1Doe
	KvDh/Vgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySlz-00000003VZR-1Luo;
	Fri, 06 Mar 2026 10:51:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySlv-00000003VYl-3sOU
	for ath12k@lists.infradead.org;
	Fri, 06 Mar 2026 10:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96CE341AD7;
	Fri,  6 Mar 2026 10:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE76CC4CEF7;
	Fri,  6 Mar 2026 10:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772794264;
	bh=N/un1ct3aC4OeKYTUVQo9SBlq9RdaM42L1qkY0h+EJk=;
	h=From:To:Cc:Subject:Date:From;
	b=FOEJ4YYeVY/+uRUqYkk5lU/VGNZknbgr6QBcYs9Jk24o3j2FihSpo9So1NT2RiIMJ
	 9SvHtEschlq/UlN7LoAcRN9iQ3WMaSRAYmSIDAEVFkEkBVlVvAs/SKoLy4NeTF/Lc0
	 6145rbuUXU8SkvJlJGPqmnWam3h1QKIuJwst0Vb7EQSJ7d3DqAg4j/dYwYDgYNZbH+
	 PEJr65S4SPBKJ0avG8pXvfU76ugRbBjluct4vvbVQV8TkG2YJgRvvnjG2UiGGuMSjK
	 9jILTEiV0/MMhlzQD9mXBQaSEbZRj48pWLAB5KIrxbUuNi3dgcL9UBBgXd749UprpA
	 J1RVkQMwyd1tg==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com,
	sean@poorly.run,
	akhilpo@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	bod@kernel.org,
	mchehab@kernel.org,
	elder@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	jjohnson@kernel.org,
	mathieu.poirier@linaro.org,
	trilokkumar.soni@oss.qualcomm.com,
	mukesh.ojha@oss.qualcomm.com,
	pavan.kondeti@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com,
	tonyh@qti.qualcomm.com,
	vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com,
	jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org,
	apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH 00/14] firmware: qcom: Add OP-TEE PAS service support
Date: Fri,  6 Mar 2026 16:20:13 +0530
Message-ID: <20260306105027.290375-1-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_025108_079074_AA5A0EBB 
X-CRM114-Status: GOOD (  14.84  )
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

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Qcom platforms has the legacy of using non-standard SCM calls
splintered over the various kernel drivers. These SCM calls aren't
compliant with the standard SMC calling conventions which is a
prerequisite to enable migration to the FF-A specifications from
Arm.

OP-TEE as an alternative trusted OS to QTEE can't support these non-
standard SCM calls. And even for newer architectures QTEE won't be able
to support SCM calls either with FF-A requirements coming in. And with
both OP-TEE and QTEE drivers well integrated in the TEE subsystem, it
makes further sense to reuse the TEE bus client drivers infrastructure.

The added benefit of TEE bus infrastructure is that there is support
for discoverable/enumerable services. With that client drivers don't
have to manually invoke a special SCM call to know the service status.

So enable the generic Peripheral Authentication Service (PAS) provided
by the firmware. It acts as the common layer with different TZ
backends plugged in whether it's an SCM implementation or a proper
TEE bus based PAS service implementation.

The TEE PAS service ABI is designed to be extensible with additional API
as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
extensions of the PAS service needed while still maintaining backwards
compatibility.

Currently OP-TEE support is being added to provide the backend PAS
service implementation which can be found as part of this PR [1].
This implementation has been tested on Kodiak/RB3Gen2 board with lemans
EVK board being the next target. In addition to that WIN/IPQ targets
planning to use OP-TEE will use this service too.

Patch summary:
- Patch #1: adds Kodiak EL2 overlay since boot stack with TF-A/OP-TEE
  only allow UEFI and Linux to boot in EL2.
- Patch #2: adds generic PAS service.
- Patch #3: migrates SCM backend to generic PAS service.
- Patch #4: adds TEE/OP-TEE backend for generic PAS service.
- Patch #5-#13: migrates all client drivers to generic PAS service.
- Patch #14: drops legacy PAS SCM exported APIs.

The patch-set is based on v7.0-rc2 tag and can be found in git tree here
[2].

Merge strategy:
----------------

It is expected due to APIs dependency, the entire patch-set to go via
the Qcom tree. All other subsystem maintainers, it will be great if I
can get acks for the corresponding subsystem patches.

[1] https://github.com/OP-TEE/optee_os/pull/7721
[2] https://git.kernel.org/pub/scm/linux/kernel/git/sumit.garg/linux.git/log/?h=qcom-pas-v1

Mukesh Ojha (1):
  arm64: dts: qcom: kodiak: Add EL2 overlay

Sumit Garg (13):
  firmware: qcom: Add a generic PAS service
  firmware: qcom_scm: Migrate to generic PAS service
  firmware: qcom: Add a PAS TEE service
  remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs
  remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs
  soc: qcom: mdtloader: Switch to generic PAS TZ APIs
  remoteproc: qcom_wcnss: Switch to generic PAS TZ APIs
  remoteproc: qcom: Select QCOM_PAS_TEE service backend
  drm/msm: Switch to generic PAS TZ APIs
  media: qcom: Switch to generic PAS TZ APIs
  net: ipa: Switch to generic PAS TZ APIs
  wifi: ath12k: Switch to generic PAS TZ APIs
  firmware: qcom_scm: Remove SCM PAS wrappers

 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 arch/arm64/boot/dts/qcom/kodiak-el2.dtso      |  35 ++
 drivers/firmware/qcom/Kconfig                 |  18 +
 drivers/firmware/qcom/Makefile                |   2 +
 drivers/firmware/qcom/qcom_pas.c              | 295 +++++++++++
 drivers/firmware/qcom/qcom_pas.h              |  53 ++
 drivers/firmware/qcom/qcom_pas_tee.c          | 478 ++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              | 304 ++++-------
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  11 +-
 .../media/platform/qcom/iris/iris_firmware.c  |   9 +-
 drivers/media/platform/qcom/venus/firmware.c  |  11 +-
 drivers/net/ipa/ipa_main.c                    |  13 +-
 drivers/net/wireless/ath/ath12k/ahb.c         |   8 +-
 drivers/remoteproc/Kconfig                    |   1 +
 drivers/remoteproc/qcom_q6v5_mss.c            |   5 +-
 drivers/remoteproc/qcom_q6v5_pas.c            |  51 +-
 drivers/remoteproc/qcom_wcnss.c               |  12 +-
 drivers/soc/qcom/mdt_loader.c                 |  12 +-
 include/linux/firmware/qcom/qcom_pas.h        |  41 ++
 include/linux/firmware/qcom/qcom_scm.h        |  29 --
 include/linux/soc/qcom/mdt_loader.h           |   6 +-
 22 files changed, 1097 insertions(+), 303 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
 create mode 100644 drivers/firmware/qcom/qcom_pas.c
 create mode 100644 drivers/firmware/qcom/qcom_pas.h
 create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
 create mode 100644 include/linux/firmware/qcom/qcom_pas.h

-- 
2.51.0


