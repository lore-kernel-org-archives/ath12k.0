Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1442C4828D
	for <ath12k@archiver.kernel.org>; Tue,  6 Feb 2024 18:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4nL63sgympVlcOgoML4H1MOjPdo89UfExhp0HqzNDw=; b=vTUIIgqyibpJYNDJDqVjcxcenE
	gME3+Ly77ZJSOv4UxFdO021r10KLLFk+74YzV//+uhizwZSHCZMIkuq16XrwTNpi3w4es7QfkAjB5
	wnUotOCAXF0ixWUj/BhFkiniYCn1STFu95PkfrV1llPlzN97qIA8RAqLRVZNwL8YlDhjR2tLG9PyO
	o32fojwNaQrVYduEh84piG9xSc68PUomNdNMswGaGD1PSSaGy6Gh4bhxuWhdTvZ4suoGvYfC7ADMw
	eE9+H1lyOKWPd4rbcQJ2+rto8EToadEYLZBPeLqha1zRTWpCOJbAZA7gd9T4H6oqu7ahTqMSd2HO3
	0LSXHNrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXQ0O-00000008Vdz-2atl
	for ath12k@archiver.kernel.org;
	Tue, 06 Feb 2024 18:17:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXQ0L-00000008VdZ-1VFp
	for ath12k@lists.infradead.org;
	Tue, 06 Feb 2024 18:17:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C44D76164E;
	Tue,  6 Feb 2024 18:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9960C433C7;
	Tue,  6 Feb 2024 18:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707243428;
	bh=xRt41RhooFxuADCIIziuiKc9zziCs/ZmRVcIu4XkzKA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=LIoxyOzEoxdhwfk2gzwON9tBZO4x4rSvzL7IrhVvRL9h+KZFfAY2ZpxZ6WiZHAzML
	 t0eXd39bjcW6S+VjAw0Oe2RobvsT1u6GMVtmZM+ewpZLE8iHaD8HVeKMBdbh27xQcM
	 e1hf72zlSzmrV14a1sxCDr1hRfsvPwIRvx+XBmmXSBkdzkgcSl8A3GFfU6jF30rkqI
	 Fk9UP/UkOMqb1/LDlWD5epmY6Xo1g+lqkiQ5VmP0SAZR5zP89wG1BGKzpSynF87Wwk
	 gQG4vNBupjepvmVFwDggKDVBmA/A8DJUTK2Hcy1DzCAkPYdqK9ZSBqubZ5VB3lWn31
	 BNAfT6bgQ3mFQ==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6 05/11] wifi: ath12k: implement handling of P2P NoA event
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
	<20240130040303.370590-6-quic_kangyang@quicinc.com>
	<87plx9r2rp.fsf@kernel.org>
Date: Tue, 06 Feb 2024 20:17:05 +0200
In-Reply-To: <87plx9r2rp.fsf@kernel.org> (Kalle Valo's message of "Tue, 06 Feb
	2024 18:11:38 +0200")
Message-ID: <87eddpqwym.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_101709_498885_AE952939 
X-CRM114-Status: GOOD (  15.61  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Kang Yang <quic_kangyang@quicinc.com> writes:
>
>> The NoA(Notice of Absence) attribute is used by the P2P Group Owner to
>> signal its absence due to power save timing, concurrent operation, or
>> off-channel scanning. It is also used in the P2P Presence Request-Response
>> mechanism.
>>
>> The NoA attribute shall be present in the P2P IE in the beacon frames
>> transmitted by a P2P Group Owner when a NoA schedule is being advertised,
>> or when the CTWindow is non-zero.
>>
>> So add support to update P2P information after P2P GO is up through
>> event WMI_P2P_NOA_EVENTID, and always put it in probe resp.
>>
>> Create p2p.c and p2p.h for P2P related functions and definitions.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
>
> [...]
>
>> +static int ath12k_wmi_p2p_noa_event(struct ath12k_base *ab,
>> +				    struct sk_buff *skb)
>> +{
>> +	const void **tb;
>> +	const struct wmi_p2p_noa_event *ev;
>> +	const struct ath12k_wmi_p2p_noa_info *noa;
>> +	struct ath12k *ar;
>> +	int ret, vdev_id;
>> +
>> +	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
>> +	if (IS_ERR(tb)) {
>> +		ret = PTR_ERR(tb);
>> +		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ev = tb[WMI_TAG_P2P_NOA_EVENT];
>> +	noa = tb[WMI_TAG_P2P_NOA_INFO];
>> +
>> +	if (!ev || !noa) {
>> +		kfree(tb);
>> +		return -EPROTO;
>> +	}
>> +
>> +	vdev_id = __le32_to_cpu(ev->vdev_id);
>> +
>> +	ath12k_dbg(ab, ATH12K_DBG_WMI,
>> +		   "wmi tlv p2p noa vdev_id %i descriptors %u\n",
>> +		   vdev_id, le32_get_bits(noa->noa_attr, WMI_P2P_NOA_INFO_DESC_NUM));
>> +	ar = ath12k_mac_get_ar_by_vdev_id(ab, vdev_id);
>> +	if (!ar) {
>> +		ath12k_warn(ab, "invalid vdev id %d in P2P NoA event\n",
>> +			    vdev_id);
>> +		return -EINVAL;
>> +	}
>
> Aren't we leaking tb here? In this function I revamped the error
> handling to use the out label to make sure we are freeing tb in every
> error. Please review:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=12e182b47078a48169e873c51d438d7417e7e0c8

I realised that ret was uninitialised when no error, new version:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=43f3069f6580b8a67969a6f32377d35aa7dd8d9a

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

