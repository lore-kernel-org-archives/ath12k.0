Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1409AC77B71
	for <ath12k@archiver.kernel.org>; Wed, 12 Apr 2023 09:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5nEeBG8ks7U6H90KLwgojP4846sR7m/ybCBodMF17w=; b=vhTVQRy+Air3dH
	U1NlwqCTDTHKvBQhp2mgLRSpjAcFkgQaoIijFJG8dlZSyLN6EhrOAgAmethJrLKn8VOMcsD2Nm8Zh
	62N4bAEfXAxsAgFu6NF+YZ9DoaMqw9ZDvah8YwtsQd0tvt+u50SNQA3vwFuycxW+BiKj1r8OqsLgq
	e5mWY7lVc0hzxSOTq6ohH7DeTOrz1YmBeZlDRVT7IIAorDi3UEffZH6x4mmGgBE+lSBtBl/LZNbBf
	xj0Qa47ZSOWyINbQkOsBul2kVSUDgUVZBc2VMSNpfXS/t50d62OLJacGGTEP8i+ESt2ustaL2zMzR
	RkNFfdpTpmbLvJo/y8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmWdD-002NGx-2O
	for ath12k@archiver.kernel.org;
	Wed, 12 Apr 2023 09:19:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmWdA-002NGC-24
	for ath12k@lists.infradead.org;
	Wed, 12 Apr 2023 09:19:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D02C660FD2;
	Wed, 12 Apr 2023 09:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C112C4339B;
	Wed, 12 Apr 2023 09:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681291147;
	bh=bzUvRwr59wVHRCDw1b7h2SYW2FjX9c1LwaIMpXjxMC0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=gR3sR1H8RAfDkkf3k9GB1vF9MrG4JOn8jsLuLs+DXzFSTyURE39ukj8p13W5O6IAW
	 gb73EdhiBQ/2dqB0XQ0Cc3iSHdhcwX7nOJ/619pzVD9u4XlJDid4L3LLCIuY5hcsie
	 70eRKsuDXqhuN9iStOK3Dpg//AIUTyMTo1idEYwGi/z+34dS3WL9/NLR9pkHTntJBr
	 66m8xpAkB9RaluqcO9fOLby1Zj774yqnrDwGI2BmvIM/NzhB8V8CtrijCnLWGIyGqv
	 h6INV4zfsVPl0SgQ0o5O8Xm4jpvP9Zan2FahSkfyqhZOx9uUp8jXOR9QJxAkGSRyQT
	 7wPpzcHGViZ9w==
From: Kalle Valo <kvalo@kernel.org>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Subject: Re: [PATCH v2 06/11] wifi: ath12k: prepare EHT peer assoc parameters
References: <20230403225146.14139-1-quic_alokad@quicinc.com>
	<20230403225146.14139-7-quic_alokad@quicinc.com>
	<b3282c7d-07c5-8657-fca2-c286f82cb235@quicinc.com>
Date: Wed, 12 Apr 2023 12:19:03 +0300
In-Reply-To: <b3282c7d-07c5-8657-fca2-c286f82cb235@quicinc.com> (Aloka Dixit's
	message of "Mon, 10 Apr 2023 09:22:53 -0700")
Message-ID: <87r0sp8nlk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_021908_740533_33706EC7 
X-CRM114-Status: GOOD (  12.77  )
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

Aloka Dixit <quic_alokad@quicinc.com> writes:

> On 4/3/2023 3:51 PM, Aloka Dixit wrote:
>
>> Add new parameters and prepare the association data for an EHT peer.
>> MCS data uses the format described in IEEE P802.11be/D2.0, May 2022,
>> 9.4.2.313.4, convert it into the format expected by the firmware.
>>
>> +	case IEEE80211_STA_RX_BW_320:
>> +		bw = &eht_cap->eht_mcs_nss_supp.bw._320;
>> +		ath12k_mac_set_eht_mcs(bw->rx_tx_mcs9_max_nss,
>> +				       bw->rx_tx_mcs9_max_nss,
>> +				       bw->rx_tx_mcs11_max_nss,
>> +				       bw->rx_tx_mcs13_max_nss,
>> +				       &rx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_320],
>> +				       &tx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_320]);
>> +		arg->peer_eht_mcs_count++;
>> +		fallthrough;
>> +
>> +	case IEEE80211_STA_RX_BW_160:
>> +		bw = &eht_cap->eht_mcs_nss_supp.bw._160;
>> +		ath12k_mac_set_eht_mcs(bw->rx_tx_mcs9_max_nss,
>> +				       bw->rx_tx_mcs9_max_nss,
>> +				       bw->rx_tx_mcs11_max_nss,
>> +				       bw->rx_tx_mcs13_max_nss,
>> +				       &rx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_160],
>> +				       &tx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_160]);
>> +		fallthrough;
>> +
>
> 'arg->peer_eht_mcs_count++' is missing for 160 MHz case.
> Should I send a follow-up now for the series or wait for comments on
> the remaining part for some time.

Sending a new version sounds like the best.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
