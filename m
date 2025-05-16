Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9255C54795
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 18:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzzkSiZrg4oJeY3DBEUNx4n2bS19YxHxGP5sLJRKfY8=; b=i5/jUFQTPImx5tSqKWskGCC9cE
	5TItVE3kbccpNz4a8wH8sS/itTW+C21E1+jau5W4XYJOBu6B8hYgpwZiV/hGDHaTSCB3YsTtIhzHr
	8fiDqrPVMRR5Jn8O4H0WweRuoVniVqjJ54WMIcxduR1ALEq7pJ9opNAhkC0IsU76S7ki1Xjm2bEtV
	8YRgGFF5FqjPvmMK1lm+rEMBenroskv3jySMGEVDijsB7FhmRgv/oqIyBKdUg7Im5Hoe54tDuq0fg
	ER08BPgWK9jQETtdyaa+2O230kFYBsVwZ35ADOEpr0KxjBAhvyIenakinF6Kq2jzN0o+UoZLslIIV
	wkx2EMsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG01w-00000004MNw-1o5w;
	Fri, 16 May 2025 18:43:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG01D-00000004MGL-18l9;
	Fri, 16 May 2025 18:42:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1747420952; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UB58WcAzPfmeQxe/5HlsaQ5qwCCfD3VwmFuzrSEowItxfPOF5c3Q2xLQQNXim4CWyY/t2tGz7TA0digxQxndyRoFUiCbuvsz90gQJR2hBB6QetgDJdSO2yavqNdkbtvowdFwQzig8zgTOslXFazXQApQd9TdwdVuyYpsrVMjt/c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747420952; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MzzkSiZrg4oJeY3DBEUNx4n2bS19YxHxGP5sLJRKfY8=; 
	b=MDf3bxyMFRUmfvwUSN8BfhmOcz5TC5subx1VSeD/d3+mEQR475vYKDlIiAbNMUlY9MVfp75dWp5TbwYtJ4lmhsPRjEKqIttwy/QpXSfUB+/ogf4uFsDc/5oZxjYllJsjzwrBZA4CsMdPv/quI4fKmHerHrGy3qjTevFWALK37So=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747420952;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MzzkSiZrg4oJeY3DBEUNx4n2bS19YxHxGP5sLJRKfY8=;
	b=DDyMzMFqhCtktAIbag3MZAEfhMX2KogDJacB8zTo/0Ctr7PTYEvaLiHmFt44rQtI
	x8jrfeV3A04XflvyyemEfVEa2J8laJZOKUJg/ojNjePSC9OWS6zcvHvkYK2dm+6z5mZ
	BcVokWCp3hz5UmDeuY+VDrMYm2egk1Y8T6MKMGfo=
Received: by mx.zohomail.com with SMTPS id 17474209503341.7831844100325043;
	Fri, 16 May 2025 11:42:30 -0700 (PDT)
Message-ID: <0e21b693-e03e-4a76-aada-0c48aeae6eec@collabora.com>
Date: Fri, 16 May 2025 23:42:21 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@collabora.com, kernel@collabora.com,
 sebastian.reichel@collabora.com, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, Baochen Qiang <quic_bqiang@quicinc.com>,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: Re: [PATCH v5] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jeff Johnson <jjohnson@kernel.org>, Youssef Samir
 <quic_yabdulra@quicinc.com>, Matthew Leung <quic_mattleun@quicinc.com>,
 Yan Zhen <yanzhen@vivo.com>, Alex Elder <elder@kernel.org>,
 Kunwu Chan <chentao@kylinos.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>
References: <20250514081447.279981-1-usama.anjum@collabora.com>
 <f6eac84d-3d67-4f99-a9c5-a9f03d748010@oss.qualcomm.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <f6eac84d-3d67-4f99-a9c5-a9f03d748010@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_114251_351168_3AFE06EB 
X-CRM114-Status: GOOD (  21.90  )
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

On 5/16/25 7:59 PM, Jeff Hugo wrote:
> On 5/14/2025 2:14 AM, Muhammad Usama Anjum wrote:
>> Fix dma_direct_alloc() failure at resume time during bhie_table
>> allocation because of memory pressure. There is a report where at
>> resume time, the memory from the dma doesn't get allocated and MHI
>> fails to re-initialize.
>>
>> To fix it, don't free the memory at power down during suspend /
>> hibernation. Instead, use the same allocated memory again after every
>> resume / hibernation. This patch has been tested with resume and
>> hibernation both.
>>
>> There are two allocations of bhie; rddm and fbc. Optimize both of those
> 
> There are 3, but you touch 2.  I just commented on this in v4.  Only
> touching two is fine (the device for the 3rd one doesn't need this), but
> the documentation must be accurate.
Yeah, for 3rd one in mhi_load_image_bhie(), this optimization isn't
needed. Let me rephrase and resent v6.

> 
>> allocations. The rddm is of constant size for a given hardware. While
>> the fbc_image size depends on the firmware. If the firmware changes,
>> we'll free and allocate new memory for it. This patch is moticated from
> 
> moticated?  Motivated maybe?
I'm using checkpatch --strict --codespell and hopping that it'll catch
typos. But it misses some of them. Do you use any such tool?

> 
>> the ath12k [1] and ath11k [2] patches. They don't free the memory and
>> reuse the same memory if new size is same. The firmware caching hasn't
>> been implemented for the drivers other than the nouveau. (The changing
>> of firmware isn't tested/supported for wireless drivers. But let's
>> follow the example patches here.)
>>
>> [1] https://lore.kernel.org/all/20240419034034.2842-1-
>> quic_bqiang@quicinc.com/
>> [2] https://lore.kernel.org/all/20220506141448.10340-1-
>> quic_akolli@quicinc.com/
>>
>> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-
>> QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>> Tested-on: WCN7850 hw2.0 WLAN.HMT.1.1.c5-00284-
>> QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
>> Tested-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>> Changes since v1:
>> - Don't free bhie tables during suspend/hibernation only
>> - Handle fbc_image changed size correctly
>> - Remove fbc_image getting set to NULL in *free_bhie_table()
>>
>> Changes since v2:
>> - Remove the new mhi_partial_unprepare_after_power_down() and instead
>>    update mhi_power_down_keep_dev() to use
>>    mhi_power_down_unprepare_keep_dev() as suggested by Mani
>> - Update all users of this API such as ath12k (previously only ath11k
>>    was updated)
>> - Define prev_fw_sz in docs
>> - Do better alignment of comments
>>
>> Changes since v3:
>> - Fix state machine of ath12k by setting ATH12K_MHI_DEINIT with
>>    ATH12K_MHI_POWER_OFF_KEEP_DEV state (Thanks Sebastian for testing and
>>    finding the problem)
>> - Use static with mhi_power_down_unprepare_keep_dev()
>> - Remove crash log as it was showing that kworker wasn't able to
>>    allocate memory.
>>
>> Changes since v4:
>> - Update desctiption
> 
> While I'm commenting on spelling, "description"
> 
> 
> Code looks ok to me. I think we just need to hash out some of the
> documentation and this will be good to go.
Thanks

> 


-- 
Regards,
Usama

