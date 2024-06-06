Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB34EC27C54
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 13:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4urqivDUMbksuzYWs3bNmVK/WCeVqEsP0D9AsGas6k=; b=wIe/bES5TSwyS10JcFK7vdOyqo
	xVts7xJd04Lyju6BoUen46lpJcCkPKZZITWFbovQShEjmp4YWc7VUJUDITU4BeMiLBHDH+j89Qvhc
	8cYQ6MVuOuaGPWxciA6JF3NcbyOZ3/mvTaTtDILXAn7sMS/PYbn801K4Tu+cND1U29fVX+nyuxOcz
	KgU3xVgE45olix8tlrEercb8sOuvQ5qFwwzE/YE+FlIf6sCIf0gnczqeWFZ/mx2B8HN5rzf0cZa5i
	81X7mrhR9FUUor6jeAjwySLTR+IXqr3dJ55pIBvMkjdB3UkwNXl2LkQm0M4aWR6f8Chl+FP1lyV9c
	NpwaWLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFCmu-00000009mjA-1mlO
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 13:04:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFCmq-00000009mi4-2Itd
	for ath12k@lists.infradead.org;
	Thu, 06 Jun 2024 13:04:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DA6EDCE1900;
	Thu,  6 Jun 2024 13:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44591C2BD10;
	Thu,  6 Jun 2024 13:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717679048;
	bh=oLN/PQHH+GwmUKU1YirPBfQYc0rGJjuyGvIzizBGKPc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KmcG1K3RRO6XZL8MpVWMW0ZeNX3aENLbWwq50mtAdkvwzdJF+7pYCcgSQao2iigyL
	 KTF6mNUTSXXhc8njqvlNxsRDvVj35+3RU2npykK/iZvzEeU+FqTc+mp9VYNXethR+G
	 gPSP6geCa0wAiaIeVZN0P5jRsNiIn0KXQ6dSUeHNEa/r0J27OcHGOSvjGvNqs0wWT7
	 4CTTjVy4wKLQpnjE9t+dpc3R1HqbeU6ASDVtOQZWC7KnevS4VK/L2qAMsnMAMy0/zB
	 gVQJMyMzfT9XwL6owGJAZ5DpGdw+w7bdhn+9fTb3M0IEwIFoo7GaunLaB+wsa4N9mk
	 qPzzaSIHsI9Kg==
From: Kalle Valo <kvalo@kernel.org>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Subject: Re: [PATCH v8 7/8] wifi: ath12k: refactor core start based on
 hardware group
References: <20240531180411.1149605-1-quic_hprem@quicinc.com>
	<20240531180411.1149605-8-quic_hprem@quicinc.com>
Date: Thu, 06 Jun 2024 16:04:05 +0300
In-Reply-To: <20240531180411.1149605-8-quic_hprem@quicinc.com> (Harshitha
	Prem's message of "Fri, 31 May 2024 23:34:10 +0530")
Message-ID: <87plsuql2y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_060413_036516_DABF7BC2 
X-CRM114-Status: GOOD (  23.58  )
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

Harshitha Prem <quic_hprem@quicinc.com> writes:

> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>
> Currently, mac allocate/register and core_pdev_create are initiated
> immediately when QMI firmware ready event is received for a particular
> device.
>
> With hardware device group abstraction, QMI firmware ready event can be
> received simultaneously for different devices in the group and so, it
> should not be registered immediately rather it has to be deferred until
> all devices in the group has received QMI firmware ready.
>
> To handle this, refactor the code of core start to move the following
> apis inside a wrapper ath12k_core_hw_group_start()
>         * ath12k_mac_allocate()
>         * ath12k_core_pdev_create()
>         * ath12k_core_rfkill_config()
>         * ath12k_mac_register()
>         * ath12k_hif_irq_enable()
>
> similarly, move the corresponding destroy/unregister/disable apis
> inside wrapper ath12k_core_hw_group_stop()
>
> Add the device flags to indicate pdev created and IRQ enabled which would
> be helpful for device clean up during failure cases.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Co-developed-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 210 +++++++++++++++++++------
>  drivers/net/wireless/ath/ath12k/core.h |  32 ++++
>  2 files changed, 191 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index ebe31cbb6435..90c70dbfc50a 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -563,6 +563,9 @@ u32 ath12k_core_get_max_num_tids(struct ath12k_base *ab)
>  
>  static void ath12k_core_stop(struct ath12k_base *ab)
>  {
> +	clear_bit(ATH12K_FLAG_CORE_STARTED, &ab->dev_flags);
> +	ath12k_dec_num_core_started(ab);
> +
>  	if (!test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags))
>  		ath12k_qmi_firmware_stop(ab);
>  
> @@ -689,11 +692,15 @@ static int ath12k_core_pdev_create(struct ath12k_base *ab)
>  		return ret;
>  	}
>  
> +	set_bit(ATH12K_FLAG_PDEV_CREATED, &ab->dev_flags);
> +
>  	return 0;
>  }
>  
>  static void ath12k_core_pdev_destroy(struct ath12k_base *ab)
>  {
> +	clear_bit(ATH12K_FLAG_PDEV_CREATED, &ab->dev_flags);
> +
>  	ath12k_dp_pdev_free(ab);
>  }
>  
> @@ -702,6 +709,8 @@ static int ath12k_core_start(struct ath12k_base *ab,
>  {
>  	int ret;
>  
> +	lockdep_assert_held(&ab->core_lock);
> +
>  	ret = ath12k_wmi_attach(ab);
>  	if (ret) {
>  		ath12k_err(ab, "failed to attach wmi: %d\n", ret);
> @@ -795,6 +804,12 @@ static int ath12k_core_start(struct ath12k_base *ab,
>  		/* ACPI is optional so continue in case of an error */
>  		ath12k_dbg(ab, ATH12K_DBG_BOOT, "acpi failed: %d\n", ret);
>  
> +	if (!test_bit(ATH12K_FLAG_CORE_STARTED, &ab->dev_flags)) {
> +		/* Indicate the core start in the appropriate group */
> +		ath12k_inc_num_core_started(ab);
> +		set_bit(ATH12K_FLAG_CORE_STARTED, &ab->dev_flags);
> +	}
> +
>  	return 0;
>  
>  err_reo_cleanup:
> @@ -806,6 +821,108 @@ static int ath12k_core_start(struct ath12k_base *ab,
>  	return ret;
>  }
>  
> +static void ath12k_core_device_cleanup(struct ath12k_base *ab)
> +{
> +	mutex_lock(&ab->core_lock);
> +
> +	if (test_and_clear_bit(ATH12K_FLAG_CORE_HIF_IRQ_ENABLED, &ab->dev_flags))
> +		ath12k_hif_irq_disable(ab);
> +
> +	if (test_bit(ATH12K_FLAG_PDEV_CREATED, &ab->dev_flags))
> +		ath12k_core_pdev_destroy(ab);
> +
> +	if (test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags)) {
> +		ath12k_mac_unregister(ab);
> +		ath12k_mac_destroy(ab);
> +	}
> +
> +	mutex_unlock(&ab->core_lock);
> +}

This patch is just abusing flags and because of that we have spaghetti
code. I have been disliking use of enum ath12k_dev_flags before but this
is just looks too much. I am wondering do we need to cleanup the ath12k
architecture first, reduce the usage of flags and then revisit this
patchset?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

