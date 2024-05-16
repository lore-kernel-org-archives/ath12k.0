Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC79C25B74
	for <ath12k@archiver.kernel.org>; Thu, 16 May 2024 06:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmGAOmq9KgnXtCCWA0FZSoLX8Og36V+X2IJS00E2W0c=; b=Eu7uuC9rxe1ZAaZ3a3Cxa+3xdF
	evdubtlPkDdMDfmWkQNgu2frMWsrs6iCluZ7JkXRna7n8GyU71N8VVdaKlz4KqGR4TW8pvNWXk6om
	m8KdeG8UKbMOBlXsePF5LeXE7ljDBrNp7tKiVmbqlE0b3zC1cVBsREDECFbhub0PgoQ4DmQZfx2VF
	JNdJ8XGGQSwZa7N3SyHkktSnwpQl1S0yJzZIuS7gu/wF9Dpno3lpVmYN5x0vd4BLU64VLA1I/mxQo
	m1Yd1VOKsWDy/8TugHUSALg1M4hZjivK9et4sWZKJbrEzhNXWyMRB0oGPLj1YcXgImn955gWCfNx5
	GkwLHs6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Ugx-00000003sq0-20oy
	for ath12k@archiver.kernel.org;
	Thu, 16 May 2024 06:34:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Ugu-00000003spU-04kF
	for ath12k@lists.infradead.org;
	Thu, 16 May 2024 06:34:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 26974CE16AA;
	Thu, 16 May 2024 06:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53FEEC113CC;
	Thu, 16 May 2024 06:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715841249;
	bh=PyEXMCM3kNnzkPpDE49M7RWi2C8lgsKApAg0eQOMHfo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KnVHoX5I0qELPgqXF1ablAotWoPtarExqniZv4J53kK+wT0myUD9vDuzQlWARZtWz
	 CljCYRfc1rMOot6ffafWgxVF08qTqcGQc2YyLs4v8RdjzENkesP1HjHpmG7eK2DKFE
	 xyzpLMcn9uk6hkh+oKUobMfonqW7ERXe/7bdLZTZ9B7KuNF+Z4ad/wPm5mIb/q16Dc
	 6EkiEHLSAE4Ou4Yf2rNiz5TvnwrSUDNS92PF6+y2NUBGQ6ZuDuR8cuO4fhyK/P/W/F
	 7U9CPHpVRQPOzX6cfa4UF586kNnnf0gD02/8FyvnUw7BVfxClUQF/uigUB9UULL0bL
	 DncwNlUeb80vw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Muna Sinada <quic_msinada@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: Add Dynamic VLAN support
References: <20240506231752.942567-1-quic_msinada@quicinc.com>
	<b69c3612-3d9c-491a-b98c-03b9997654d7@quicinc.com>
Date: Thu, 16 May 2024 09:34:06 +0300
In-Reply-To: <b69c3612-3d9c-491a-b98c-03b9997654d7@quicinc.com> (Jeff
	Johnson's message of "Mon, 13 May 2024 10:17:18 -0700")
Message-ID: <874jayi7tt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_233412_274210_DA9B7099 
X-CRM114-Status: GOOD (  14.39  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 5/6/2024 4:17 PM, Muna Sinada wrote:
>> Add support for dynamic VLAN. VLAN group traffic is encapsulated and
>> encrypted in mac80211 and driver needs to set flags for the VLAN group
>> traffic to skip hardware encapsulation and encryption.
>> 
>> VLAN group traffic utilizes ext MSDU and HTT Metadata to set
>> encapsulation type to RAW and encryption type to OPEN in order to
>> inform firmware to skip hardware encapsulation and encryption.
>> 
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> 
>> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
>
> My first test of this patch gave intermittent connectivity, but a second test
> didn't show that, so I think my issues were actually with my home router.
> So giving this:
>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>
> However I do have one question:
>
>> +struct hal_tx_msdu_metadata {
>> +	__le32 info0;
>> +	__le32 rsvd3[6];
>
> why not rsvd0?
>
> If that is OK, Kalle can change this in 'pending'

Muna, please always reply to review comments. Not replying to them gives
an impression that you have ignored them and makes it harder for
maintainers to trust your patches. I noticed you addressed the review
comment in v2 but you still need to answer to review comments.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

