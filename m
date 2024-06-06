Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96579C27C54
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 13:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4M673Ds8tqWX/vZRncHFI+K8HRiQlaSAGv6JvB/m+s=; b=AxnlBcL8flMdo7oNSPswKFWX9E
	A34Eh2AKIu1r6piMuolwSNhCgnRPRk9InXpDTgEubQP8pfsgEYiyWkr2C5VhVAuT4vV8s1jhle+aa
	cmUeOy8j7vW65HJ1aCGdBU4zquwKUtidrXelEMPxiBQONQjY/ddlT8E2RXJffL3FwcSHE0MR6mD/2
	qDGFhridqoiC/gskoqq5tIIOdhrV/dnmpHj14CjdeKyEKHSclEfGhwonbIx1L30NO15uFySi4wckK
	xSXGsYwufFW3Jwr+TKpzhdNUGy7WMGjlyYpAxyiQQ/Rpkz43oY0SexgpQXBKKIQxQA2Yqn19TRl2N
	mY9XWOZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFD2r-00000009qDR-0tvl
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 13:20:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFD2n-00000009qCj-2pZn
	for ath12k@lists.infradead.org;
	Thu, 06 Jun 2024 13:20:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADF8761DCC;
	Thu,  6 Jun 2024 13:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCBCC2BD10;
	Thu,  6 Jun 2024 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717680040;
	bh=p1e4aBHZ3YsRU1nPl3dRfnOZbbOmwhj+LhrDGnUEJMk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=s6AGzlym0r58jnIRrUSMF7IFB4ZSvYnsCzoMLwCUIPY6GkCeYPnJ5xNi9uJLRTWIN
	 On5tkRLsrl1JcKJwcq34jHjWSxVs4518r3DTj5w98peESmlSe30d0l23TDcyXKtBxY
	 dwM8i1ivk6UmGXXIdsRH8UptWMOu+BCv5974UfizoWZinoiMJBmQ2ONEzq27Paexy4
	 DfB+wvg8+q7UHR4+YfhMfcKAA9nFRsh4QRTgOfC9asR0vofLbE3VIxzpWkLoN8HgMx
	 hYJRNdzTXi2TQZlKRFHFQpheH6Xy2m8Fexs3A/I53AQOWnxZ7TROJNfSNCCYSBwIeZ
	 RNcpyCHoDtvUw==
From: Kalle Valo <kvalo@kernel.org>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v8 6/8] wifi: ath12k: Introduce device group abstraction
References: <20240531180411.1149605-1-quic_hprem@quicinc.com>
	<20240531180411.1149605-7-quic_hprem@quicinc.com>
Date: Thu, 06 Jun 2024 16:20:37 +0300
In-Reply-To: <20240531180411.1149605-7-quic_hprem@quicinc.com> (Harshitha
	Prem's message of "Fri, 31 May 2024 23:34:09 +0530")
Message-ID: <87le3iqkbe.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_062041_970914_E174B724 
X-CRM114-Status: GOOD (  26.27  )
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
> Currently, single device is probed and once firmware is ready, the device
> is registered to mac80211. For multi-link operation, different bands of
> different devices or same device would be part of a single wiphy and for
> this, hardware device group abstraction would be helpful.
>
> Hardware device group abstraction - when there are multiple devices (with
> single radio or dual radio) that are connected by any means of interface
> for communicating between them, then these devices can be combined
> together as a single group using a group id to form a group abstraction
> and register to mac80211.
>
> The grouping information of multiple devices would be based on device tree
> during device probe. If no such information is available then a single
> device will be part of group abstraction and registered to mac80211 else
> multiple devices advertised in device tree are combined and then registered
> to mac80211.
>
> For device group abstraction, a base structure named ath12k_hw_group (ag)
> and the following helpers are introduced:
>         ath12k_core_hw_group_alloc()    : allocate ath12k_hw_group (ag)
>                                           based on group id and number
>                                           of devices that are going to
>                                           be part of this group.
>         ath12k_core_hw_group_free()     : free ag during deinit.
>         ath12k_core_assign_hw_group()   : assign/map the details of group
>                                           to ath12k_base (ab).
>         ath12k_core_unassign_hw_group() : unassign/unmap the details of ag
>                                           in ath12k_base (ab).
>         ath12k_core_hw_group_create()   : create the devices which are part
>                                           of group (ag).
>         ath12k_core_hw_group_destroy()  : cleanup the devices in ag
>
> These helpers are used during device probe and mapping the group to the
> devices involved.
>
> Please find the illustration of how multiple devices might be combined
> together in future based on group id.
>
>                 Grouping of multiple devices (in future)
>
> +------------------------------------------------------------------------+
> |  +-------------------------------------+       +-------------------+   |
> |  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
> |  |   | ar (2GHz) | | | | ar (5GHz) |   |       |   | ar (6GHz) |   |   |
> |  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
> |  |          ath12k_base (ab)           |       | ath12k_base (ab)  |   |
> |  |         (Dual band device)          |       |                   |   |
> |  +-------------------------------------+       +-------------------+   |
> |                 ath12k_hw_group (ag) based on group id                 |
> +------------------------------------------------------------------------+

This is a good diagram, thanks for that. But how does struct ath12k_hw
fit into the diagram?

> In the above representation, two devices are combined into single group
> based on group id.
>
> Add base code changes where single device would be part of a group with an
> invalid group id forming an group abstraction. Multi device grouping will
> be introduced in future.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Co-developed-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Like I have said before, for adding any new locks there needs to be a
proper analysis for the locking and good justifications why new locks
are needed. I don't see any of that above.

BTW I will from now on require proper analysis also for additions to
enum ath12k_dev_flags.

> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -21,6 +21,9 @@ unsigned int ath12k_debug_mask;
>  module_param_named(debug_mask, ath12k_debug_mask, uint, 0644);
>  MODULE_PARM_DESC(debug_mask, "Debugging mask");
>  
> +static DEFINE_MUTEX(ath12k_hw_lock);
> +static struct list_head ath12k_hw_groups = LIST_HEAD_INIT(ath12k_hw_groups);

I can somehow understand/guess why this mutex is needed (even though
there's no documentation) but the naming is not really clear as we
already have struct ath12k_hw::hw_mutex.

> +/* Holds info on the group of devices that are registered as a single wiphy */
> +struct ath12k_hw_group {
> +	struct list_head list;
> +	u8 id;
> +	u8 num_devices;
> +	u8 num_probed;
> +	struct ath12k_base *ab[ATH12K_MAX_SOCS];
> +	/* To synchronize group create, assign, start, stop */
> +	struct mutex mutex_lock;
> +};

But why we really need this mutex? And does it really justify the extra
complexity it creates?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

