Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03B1C47DA2
	for <ath12k@archiver.kernel.org>; Wed, 17 Jan 2024 13:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A47iWRxXRXLPpf4Pb/AtyMut21hiz5KbS1UfLjgcPbg=; b=IbaApYssNusSThRKRjsaoIWJex
	0EvjQSwWFpMjdsjEtKe2K29hTxmnYLdWgCXFPcWkdvrI2Fly9Y4PNrdHrf9f81b9fp6mSpEthQ1gF
	5lI+KYoTL7yuLFpB65+Lr2jDWX/i9pE3bm+GvaV0iJfcreIWwWItIGeAZJuQ2wxhduD58HV7v620o
	uBCLw0MKIKw/40CAzxIfQQRtQgnJE8Ai18hbYQK3bDCU6mG6wQhkJebg6dmjEL0R1LWA3a5hK1/Ik
	TyBT30RQC1eMM7yXUUtEvRKNgIwP45E+FldImwi9d+dVfrER8H0CVDvWCl58Ww4AzjRDvMmEFfPsq
	GOaWSGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ5ss-00GSA9-1X
	for ath12k@archiver.kernel.org;
	Wed, 17 Jan 2024 13:23:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ5sp-00GS77-1d
	for ath12k@lists.infradead.org;
	Wed, 17 Jan 2024 13:23:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD6C361615;
	Wed, 17 Jan 2024 13:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A54C43394;
	Wed, 17 Jan 2024 13:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705497756;
	bh=5MaC06DyRKdoDd/JrP6Svdd+kkMv0hjjAGKODA055TU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VDr34NIkGaAdf0kdamE+1LFea3I+18FhyIilo4Q17cVR7Dkso0HbY3dLpf3jwEn5i
	 B/PRD/lMnLJ1icgmDvTgp6Bbnbzyul9WyqvuS/Dp4njwVQXOY1zjE/oY4u0A6W2FcV
	 xkfGMvs8SYlnpjjaT51PZMfhUAakS6ioR9PzynRa5uY57hL4BZ1u3rkxTx6g2+MS2J
	 JA4LKfwrQw3keCoacN7DxLfBELbEs6JAi+U4OgiPytqhP29mMlteo1dqrhGxGm8nlj
	 7mOnqFUY6zmVX+aibVRBiPKSGy2Im/Zt+YdRutUxFrY2MIGg+bFZ8nQBjA/v3lcXYl
	 a3sh1TGiznnSQ==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 03/10] wifi: ath12k: implement handling of P2P NoA event
References: <20240112092824.7664-1-quic_kangyang@quicinc.com>
	<20240112092824.7664-4-quic_kangyang@quicinc.com>
Date: Wed, 17 Jan 2024 15:22:33 +0200
In-Reply-To: <20240112092824.7664-4-quic_kangyang@quicinc.com> (Kang Yang's
	message of "Fri, 12 Jan 2024 17:28:17 +0800")
Message-ID: <87h6jc5c2u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_052307_657303_E50AA275 
X-CRM114-Status: GOOD (  15.63  )
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

Kang Yang <quic_kangyang@quicinc.com> writes:

> The NoA(Notice of Absence) attribute is used by the P2P Group Owner to
> signal its absence due to power save timing, concurrent operation, or
> off-channel scanning. It is also used in the P2P Presence Request-Response
> mechanism.
>
> The NoA attribute shall be present in the P2P IE in the beacon frames
> transmitted by a P2P Group Owner when a NoA schedule is being advertised,
> or when the CTWindow is non-zero.
>
> So add support to update P2P information after P2P GO is up through
> event WMI_P2P_NOA_EVENTID, and always put it in probe resp.
>
> Create p2p.c and p2p.h for P2P related functions and definitions.
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

[...]

> +static void ath12k_mac_add_p2p_noa_ie(struct ath12k *ar,
> +				      struct ieee80211_vif *vif,
> +				      struct sk_buff *skb,
> +				      bool is_prb_rsp)
> +{
> +	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
> +
> +	if (likely(!is_prb_rsp))
> +		return;
> +
> +	spin_lock_bh(&ar->data_lock);
> +	if (arvif->u.ap.noa_data)
> +		if (!pskb_expand_head(skb, 0, arvif->u.ap.noa_len,
> +				      GFP_ATOMIC))
> +			skb_put_data(skb, arvif->u.ap.noa_data,
> +				     arvif->u.ap.noa_len);
> +	spin_unlock_bh(&ar->data_lock);
> +}

The if checks can be simplified and please add empty lines:

spin_lock_bh(&ar->data_lock);

if (arvif->u.ap.noa_data &&
    !pskb_expand_head(skb, 0, arvif->u.ap.noa_len, GFP_ATOMIC))
		skb_put_data(skb, arvif->u.ap.noa_data,
			     arvif->u.ap.noa_len);

spin_unlock_bh(&ar->data_lock);

Though I'm not really fond of the idea having pskb_expand_head() call
within the if check but I guess it's the cleanest option here.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

