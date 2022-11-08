Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02357C4332F
	for <ath12k@archiver.kernel.org>; Tue,  8 Nov 2022 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bI8G5sVn0u5ULislz1eD6r79qD+4uKYMmYwYIAi88SA=; b=MFR7BBNzFFZCfV
	yk4ISmYmcWel+z5/gcr0a1HfqnWXxOQRl4rkeiUsQQKeRPddi2wgrYWcRubG893aPPFcGrSWvE3WP
	8JERhx4kPqQ8zwAvjknfubKlfS3Svs8xidhJ3EHoNWBmF7+jKwbSPYe+d26QE+1LEzneQhwM1CCwP
	pYVlC6allnoGywaVVPq8UM0+ChEZR/D7IyRNOWxPVkffVChM5EYamT3EWijF6vV1ZE7aGMlF+I245
	Xr+aEsTQ3EuxhIuVNphIpm2Ob1fDtTcqOs+7N1YF0sAuuFhjMcfUrsTFECOIv9kRAobO9+E5UvMw0
	YaxFT05HQ+tqYPlWVjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPrE-005yTK-9x
	for ath12k@archiver.kernel.org; Tue, 08 Nov 2022 14:45:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPrB-005ySn-Hk
	for ath12k@lists.infradead.org; Tue, 08 Nov 2022 14:45:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D77FE614E3;
	Tue,  8 Nov 2022 14:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81372C433D6;
	Tue,  8 Nov 2022 14:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667918740;
	bh=2kooCGud+rjaS6L4Gd38qK6vl6TzkcqcMznVDB1kckk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Wqa17tY9DUXPi1vEdkphMT+axzdEDC3HrORIIEzjpzy3ODMARrJ4UmUfF4laAiyaW
	 8ioN1T1zlk7BUeQjoXsgec9ZPr7xcl57YgJdjEM+KRrPRJ+xMQb3whcBS331dfoLVt
	 buxvPQYZNESDcT+RRRQY0eNERL+dA1mFzApIWgZ/cuQbzyECkJNq9AvhGYIi6MsQnP
	 1D8guavBxaU1JA/wBjBsFVGUJ9oy+GwJlafR3M6CAEvvAMNTsY/7Mietj8E6jhKyFH
	 f4B9xAHF/wmjHb3S+9MY3RjkvQz8IusMhqzOOzcPJelScgPge6E/pCEg27D1AxFPb2
	 g8l+asUZCiBLA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 35/50] wifi: ath12k: add pci.c
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-36-kvalo@kernel.org>
	<7b06d248-c976-6c9f-4d5c-5dec7b1d5511@quicinc.com>
Date: Tue, 08 Nov 2022 16:45:37 +0200
In-Reply-To: <7b06d248-c976-6c9f-4d5c-5dec7b1d5511@quicinc.com> (Jeff
	Johnson's message of "Thu, 18 Aug 2022 16:02:14 -0700")
Message-ID: <878rklec8e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_064541_647025_BA0E9686 
X-CRM114-Status: GOOD (  17.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 8/12/2022 9:09 AM, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> (Patches split into one patch per file for easier review, but the final
>> commit will be one big patch. See the cover letter for more info.)
>>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/pci.c | 1344 +++++++++++++++++++++++++++++++++
>>   1 file changed, 1344 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/pci.c
>> b/drivers/net/wireless/ath/ath12k/pci.c
>
> snip
>
>> +static void ath12k_pci_remove(struct pci_dev *pdev)
>> +{
>> +	struct ath12k_base *ab = pci_get_drvdata(pdev);
>> +	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
>> +
>> +	if (test_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags)) {
>> +		ath12k_pci_power_down(ab);
>> +		ath12k_qmi_deinit_service(ab);
>> +		goto qmi_fail;
>> +	}
>> +
>> +	set_bit(ATH12K_FLAG_UNREGISTERING, &ab->dev_flags);
>> +
>> +	cancel_work_sync(&ab->reset_work);
>> +	ath12k_core_deinit(ab);
>> +
>> +qmi_fail:
>> +	ath12k_mhi_unregister(ab_pci);
>> +
>> +	ath12k_pci_free_irq(ab);
>> +	ath12k_pci_msi_free(ab_pci);
>> +	ath12k_pci_free_region(ab_pci);
>> +
>> +	ath12k_hal_srng_deinit(ab);
>> +	ath12k_ce_free_pipes(ab);
>> +	destroy_workqueue(ab->workqueue_aux);
>
> it seems strange/asymetrical to destroy this here.
>
> it was allocated in ath12k_core_alloc() so I'd expect it to be
> destroyed in ath12k_core_free() to maintain symmetry

Fixed.

> in addition I don't see ab->workqueue being destroyed, and imo that
> should also take place in ath12k_core_free() for the same reason

This is also fixed.

>> +static SIMPLE_DEV_PM_OPS(ath12k_pci_pm_ops,
>> +			 ath12k_pci_pm_suspend,
>> +			 ath12k_pci_pm_resume);
>> +
>> +static struct pci_driver ath12k_pci_driver = {
>> +	.name = "ath12k_pci",
>> +	.id_table = ath12k_pci_id_table,
>> +	.probe = ath12k_pci_probe,
>> +	.remove = ath12k_pci_remove,
>> +	.shutdown = ath12k_pci_shutdown,
>> +#ifdef CONFIG_PM
>> +	.driver.pm = &ath12k_pci_pm_ops,
>> +#endif
>
> conditional compilation is unnecessary here since SIMPLE_DEV_PM_OPS
> handles the conditional

Fixed.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
