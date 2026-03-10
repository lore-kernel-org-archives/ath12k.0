Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B404FCC9C1
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 04:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUwuuNkp7j1QoisugKNpnvmKSDbHjbWB+KmpJakSFto=; b=HUI8afnETVRm+wO6oqj0LP1uHP
	CBGSMIC4l994E8SYKoeoDtawduCebAxK8qSE8OvVWBXCbmfZQMXaYtbG8Zt0nd5Ziux+UggqYLDPo
	8iYnZ9CmlBQtm9XPs6kRa8rjI0eK8uPG+MseeED/tuVHgNK008uiu+Qp1NcMnzLkGT6l5O4wFfhNE
	obZxNwdxg2hDzIn1GphHo01WdTbSxg/nnobS+1nHqNXHJeo+NlRg7ibJyOThUElMJN5eqhCR88CZf
	J9CeQu8XqiqKgVFI0kdWzSVlztflcsc3k+LCLG4VXqpjvme7vOYo35+Tx/AAmYFSLBMBZFZ7nDmK2
	k8RbQhRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzpBE-00000008ioG-3Xae;
	Tue, 10 Mar 2026 04:58:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzpBC-00000008inj-0dri
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 04:58:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B21240B35;
	Tue, 10 Mar 2026 04:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3D3C19423;
	Tue, 10 Mar 2026 04:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773118728;
	bh=JuB3BBlaH8QMjjqlhAeA7SEGGjrsDEa4xPg7ybMmmPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sEbP38KgD0Y/oHZXROIDnP+raCdMDtwsbl+bsBTcVv27xQu+WehgToWFUMAdyS0Io
	 6BBvySH+5/nOZdUM8TzODpyRvRUckCruTavyE1a/WxHUh9FZgFEkT8+llsHR9zzotP
	 0xG+ORfxAEQZxgSAw0TAa3L8s0ioPxQENpYCOMMGohyLuwo3QRlFYj3Dzp9WGaM5Yo
	 n1S7+La+3K5TumLjJEb8ZG5HTyDO7TVC2Tk/hqv3buwFt/VgyuJJzq9GpsSedwAoPx
	 46DUZR5JHqxbKgcUItqID8xgSWamoAnR1H/PVZFaNRQbAmNYv0jMgwpTItA2DNEUHB
	 8XHyMqkcF5w8g==
Date: Tue, 10 Mar 2026 10:28:30 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
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
	trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
	pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
	tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
Message-ID: <aa-k9q735AtODTwD@sumit-xelite>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <5dab61a6-d8cc-431d-b59e-744d98195d90@kernel.org>
 <aa5Sw1qcCnD5clth@sumit-xelite>
 <52cd78c2-95e2-4f56-9adc-242b6cf3baab@kernel.org>
 <aa5z23EtUF9k1MTy@sumit-xelite>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa5z23EtUF9k1MTy@sumit-xelite>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_215850_255997_2266F64A 
X-CRM114-Status: GOOD (  46.93  )
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

On Mon, Mar 09, 2026 at 12:46:43PM +0530, Sumit Garg wrote:
> On Mon, Mar 09, 2026 at 08:10:02AM +0100, Krzysztof Kozlowski wrote:
> > On 09/03/2026 05:55, Sumit Garg wrote:
> > > On Fri, Mar 06, 2026 at 12:15:01PM +0100, Krzysztof Kozlowski wrote:
> > >> On 06/03/2026 11:50, Sumit Garg wrote:
> > >>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > >>>
> > >>> Qcom platforms has the legacy of using non-standard SCM calls
> > >>> splintered over the various kernel drivers. These SCM calls aren't
> > >>> compliant with the standard SMC calling conventions which is a
> > >>> prerequisite to enable migration to the FF-A specifications from
> > >>> Arm.
> > >>>
> > >>> OP-TEE as an alternative trusted OS to QTEE can't support these non-
> > >>> standard SCM calls. And even for newer architectures QTEE won't be able
> > >>> to support SCM calls either with FF-A requirements coming in. And with
> > >>> both OP-TEE and QTEE drivers well integrated in the TEE subsystem, it
> > >>> makes further sense to reuse the TEE bus client drivers infrastructure.
> > >>>
> > >>> The added benefit of TEE bus infrastructure is that there is support
> > >>> for discoverable/enumerable services. With that client drivers don't
> > >>> have to manually invoke a special SCM call to know the service status.
> > >>>
> > >>> So enable the generic Peripheral Authentication Service (PAS) provided
> > >>> by the firmware. It acts as the common layer with different TZ
> > >>> backends plugged in whether it's an SCM implementation or a proper
> > >>> TEE bus based PAS service implementation.
> > >>>
> > >>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > >>> ---
> > >>>  drivers/firmware/qcom/Kconfig          |   8 +
> > >>>  drivers/firmware/qcom/Makefile         |   1 +
> > >>>  drivers/firmware/qcom/qcom_pas.c       | 295 +++++++++++++++++++++++++
> > >>>  drivers/firmware/qcom/qcom_pas.h       |  53 +++++
> > >>>  include/linux/firmware/qcom/qcom_pas.h |  41 ++++
> > >>>  5 files changed, 398 insertions(+)
> > >>>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
> > >>>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
> > >>>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
> > >>>
> > >>> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> > >>> index b477d54b495a..8653639d06db 100644
> > >>> --- a/drivers/firmware/qcom/Kconfig
> > >>> +++ b/drivers/firmware/qcom/Kconfig
> > >>> @@ -6,6 +6,14 @@
> > >>>  
> > >>>  menu "Qualcomm firmware drivers"
> > >>>  
> > >>> +config QCOM_PAS
> > >>> +	tristate
> > >>> +	help
> > >>> +	  Enable the generic Peripheral Authentication Service (PAS) provided
> > >>> +	  by the firmware. It acts as the common layer with different TZ
> > >>> +	  backends plugged in whether it's an SCM implementation or a proper
> > >>> +	  TEE bus based PAS service implementation.
> > >>> +
> > >>>  config QCOM_SCM
> > >>>  	select QCOM_TZMEM
> > >>>  	tristate
> > >>> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
> > >>> index 0be40a1abc13..dc5ab45f906a 100644
> > >>> --- a/drivers/firmware/qcom/Makefile
> > >>> +++ b/drivers/firmware/qcom/Makefile
> > >>> @@ -8,3 +8,4 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
> > >>>  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
> > >>>  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
> > >>>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
> > >>> +obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
> > >>> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
> > >>> new file mode 100644
> > >>> index 000000000000..dc04ff1b6be0
> > >>> --- /dev/null
> > >>> +++ b/drivers/firmware/qcom/qcom_pas.c
> > >>> @@ -0,0 +1,295 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0
> > >>> +/*
> > >>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > >>> + */
> > >>> +
> > >>> +#include <linux/delay.h>
> > >>> +#include <linux/device/devres.h>
> > >>> +#include <linux/firmware/qcom/qcom_pas.h>
> > >>> +#include <linux/of.h>
> > >>> +#include <linux/kernel.h>
> > >>> +#include <linux/module.h>
> > >>> +#include <linux/slab.h>
> > >>> +
> > >>> +#include "qcom_pas.h"
> > >>> +#include "qcom_scm.h"
> > >>> +
> > >>> +static struct qcom_pas_ops *ops_ptr;
> > >>
> > >> I really dislike this singleton design. And it is not even needed! If
> > >> you were storing here some allocated instance of SCM/PAS I could
> > >> understand, but singleton for only ops? Just implement one driver (so
> > >> SCM + whatever you have here) which will decide which ops to use,
> > >> through the probe. Really, this is neither needed nor beneficial.
> > > 
> > > The motivation here is rather quite opposite to the single monolithic
> > > SCM driver design. The TZ services like PAS, ICE and so on are going to
> > > be implemented as independent discoverable devices on TEE bus which
> > > rather needs independent kernel client drivers.
> > 
> > You still have singleton here. So if you think you do opposite to
> > singleton, then drop this static.
> 
> Sure.
> 
> > 
> > > 
> > > Also, the single driver probe can't work here since the SCM driver is
> > > bound to the platform bus whereas the TEE PAS driver is bound to the TEE
> > > bus. So there is a reason for the current design.
> > > 
> > >>
> > >> It actually leads to more problems with this barrier handling, see
> > >> further comments.
> > > 
> > > The barrier handling is something that I carried over from existing
> > > implmentation but I can't see a reason why it can't be replaced with a
> > > simple mutex. See diff below for mutex.
> > > 
> > >> ...
> > >>
> > >>> +
> > >>> +/**
> > >>> + * qcom_pas_shutdown() - Shut down the remote processor
> > >>> + * @pas_id:	peripheral authentication service id
> > >>> + *
> > >>> + * Returns 0 on success.
> > >>> + */
> > >>> +int qcom_pas_shutdown(u32 pas_id)
> > >>> +{
> > >>> +	if (ops_ptr)
> > >>> +		return ops_ptr->shutdown(ops_ptr->dev, pas_id);
> > >>> +
> > >>> +	return -ENODEV;
> > >>> +}
> > >>> +EXPORT_SYMBOL_GPL(qcom_pas_shutdown);
> > >>> +
> > >>> +/**
> > >>> + * qcom_pas_supported() - Check if the peripheral authentication service is
> > >>> + *			  available for the given peripheral
> > >>> + * @pas_id:	peripheral authentication service id
> > >>> + *
> > >>> + * Returns true if PAS is supported for this peripheral, otherwise false.
> > >>> + */
> > >>> +bool qcom_pas_supported(u32 pas_id)
> > >>> +{
> > >>> +	if (ops_ptr)
> > >>
> > >> Lack of barriers here is not looking right. Existing/old code is not a
> > >> good example, I fixed only the obvious issue, but new code should be
> > >> correct from the beginning.
> > >>
> > >> Barriers should normally be always paired, unless you have some clear
> > >> path no concurrent execution can happen here, but such explanation is
> > >> missing, look:
> > > 
> > > Actually concurrent execution is rather required here since TZ can
> > > support parallel bring-up of co-processors. The synchonization is only
> > > needed when PAS client drivers are performing a deferred probe waiting
> > > for the service to be available. However, you are right explanation is
> > > missing here which I will add in the next version.
> > 
> > Hm? Existing comments are completely useless. Your comment said just
> > "barrier" basically... That's nothing useful.
> 
> Agree, following is something I plan for v2 (using mutex instead of a
> barrier):
> 
> /*
>  * The ops mutex here is only intended to synchronize when client drivers
>  * are in parallel checking for PAS service availability. However, once the
>  * PAS backend becomes available, it is allowed for multiple threads to enter
>  * TZ for parallel bringup of co-processors during boot.
>  */
> static DEFINE_MUTEX(ops_mutex);

After more testing, it came out that there are corner cases where the
registered ops structure writes aren't visible to other cores. So indeed
a data barrier is needed instead of mutex. I will add relevant code
comments.

-Sumit

