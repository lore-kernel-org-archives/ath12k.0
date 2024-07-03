Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFECC2BD09
	for <ath12k@archiver.kernel.org>; Wed,  3 Jul 2024 16:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRm7ji6PDix02KGfnAyicnyZPot2ym4RWjskT3osXLo=; b=szkUEESfVstVnK9lPHF8XzxUbd
	jKV0mF+q6S0AQQ/Gdfz/iIuD1jmefNOhpe1xUDArYx4vbvpMYR7ZXpoQRO65YAtU/eRxVTpfW8ZX3
	uAp+YztGltCwH4FrLZf5bGxNRTxaoEhLKNorqhFa61gWZQBAUma2zgXK4sGF6+u2ijik+D8bnXwa1
	LPuFUTwH1i58MwnjtvqJ7krjCm7wPS/dtXYSW5lU9frzJwEJbghZ5mfLZVCzOTi3LEwkrbRYwZhhg
	bjKHWtbo1BC6GK9jEk3uyWt4wPET/3NGYHuMK2I2ngbL6dm5StS1Nao7XDpdAltS9IbcwXOO9t654
	LlKcacNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2qN-0000000ArGV-3Xj5
	for ath12k@archiver.kernel.org;
	Wed, 03 Jul 2024 16:28:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2qL-0000000ArFx-37uo
	for ath12k@lists.infradead.org;
	Wed, 03 Jul 2024 16:28:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B01DB61E5B;
	Wed,  3 Jul 2024 16:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71385C2BD10;
	Wed,  3 Jul 2024 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720024108;
	bh=JkAcz5kIc6nLWgxw60e44YUTFyAuUCAwVALGXMhvrLg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=DBQo1wK7TyFynKUVl7/4XDE7hXaARLW022bOfaxMVOzwJOKwEEa79onqpyQuxuoRr
	 uOVxRxXVILqNHhanvBd/5u8dpHQfHhHbfTC1xBz4yKb9tEr8njQ33rqQWmVQ+eNgv1
	 V2wGVTVQkniHdXTA0Xc9uZvzd7dtse2p+nUs2rMdouQKcN8XUasv9B1PO6kR5uC7im
	 VAePHcT0M6dlR9dM6LFmfZVW14P5CYX4sS/81ED+0TnkxI5VxABtUy9A4DsyyMJNd2
	 FutGLeIfdhWbbWRd6Rj6x4+PUaenXliUoe7o23jctNZL+K/n9Dj5QNccQKZNZdQgXT
	 4Ue9jsIdO0tvQ==
From: Kalle Valo <kvalo@kernel.org>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Subject: Re: [PATCH v8 7/8] wifi: ath12k: refactor core start based on
 hardware group
References: <20240531180411.1149605-1-quic_hprem@quicinc.com>
	<20240531180411.1149605-8-quic_hprem@quicinc.com>
	<87plsuql2y.fsf@kernel.org>
	<dd2488bb-43f9-d546-7617-2a54ca3d1a1d@quicinc.com>
Date: Wed, 03 Jul 2024 19:28:25 +0300
In-Reply-To: <dd2488bb-43f9-d546-7617-2a54ca3d1a1d@quicinc.com> (Harshitha
	Prem's message of "Fri, 7 Jun 2024 19:19:09 +0530")
Message-ID: <87ed8ae8ye.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_092829_876157_44425BDF 
X-CRM114-Status: GOOD (  15.22  )
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

>>>   +static void ath12k_core_device_cleanup(struct ath12k_base *ab)
>>> +{
>>> +	mutex_lock(&ab->core_lock);
>>> +
>>> +	if (test_and_clear_bit(ATH12K_FLAG_CORE_HIF_IRQ_ENABLED, &ab->dev_flags))
>>> +		ath12k_hif_irq_disable(ab);
>>> +
>>> +	if (test_bit(ATH12K_FLAG_PDEV_CREATED, &ab->dev_flags))
>>> +		ath12k_core_pdev_destroy(ab);
>>> +
>>> +	if (test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags)) {
>>> +		ath12k_mac_unregister(ab);
>>> +		ath12k_mac_destroy(ab);
>>> +	}
>>> +
>>> +	mutex_unlock(&ab->core_lock);
>>> +}
>> This patch is just abusing flags and because of that we have
>> spaghetti
>> code. I have been disliking use of enum ath12k_dev_flags before but this
>> is just looks too much. I am wondering do we need to cleanup the ath12k
>> architecture first, reduce the usage of flags and then revisit this
>> patchset?
>> 
> yeah., more dev flags :( but flags were needed for the race conditions
> when multiple devices where involved in a group, some devices would
> have completed till pdev create some might not. Some crashes were seen
> because hif_irq_disable was called for a device in a group but that
> device was not even at the stage of core register. Will check the
> possibility to  reduce the flag usage but it seemed necessary for
> multiple device group clean up.

I think the core problem here is of mixing enum ath12k_hw_state and enum
ath12k_dev_flags, it's just a mess even before this patchset. For
example, these flags look like they should be part enum ath12k_hw_state
instead:

	ATH12K_FLAG_RECOVERY,
	ATH12K_FLAG_UNREGISTERING,
	ATH12K_FLAG_REGISTERED,
	ATH12K_FLAG_QMI_FAIL,

If we have an enum plus set of flags to handle the actual state then it
will become difficult to manage it all. Instead we should just have the
enum for tracking the state of the driver.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

