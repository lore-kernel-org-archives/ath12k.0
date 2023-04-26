Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE21C77B78
	for <ath12k@archiver.kernel.org>; Wed, 26 Apr 2023 14:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VxeiSyKrPo5lnQIFDMzYMlvdDb8Pc4KRiRb1re1z7WE=; b=31C3kIxmhU2vpr
	CIsPv5B3oR+Bsm1FyLRwPTZo6Zd7WmKAxNjrMgq6+MZ8KAwC8gpxS89q+EO8OfXAR4YG+ERf5SKYm
	fpbm2jjxLY9BEDonff7DxnE/UpjWF2tMSPabw1bqN/MG8DzajGk+pedtAiju/rFyP6jZZnzbSuhVm
	aU9tiue0HZeVScygzh9rcv5xec7j28hWTRwv0hyRS7ansnh/o7NPIG9ciUwNyhqFKPC/5QHAxklCq
	cwVuDUOKNatWh7xEF6o+7EbCMPQUcz2Q9OOllySC3j0twYVGxB77jbhsJL6NiB4AzY02ZEUwcOpM+
	bm94pVCvgP7zo40Dyqew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prgAp-004D9X-38
	for ath12k@archiver.kernel.org;
	Wed, 26 Apr 2023 14:31:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prgAn-004D92-3A
	for ath12k@lists.infradead.org;
	Wed, 26 Apr 2023 14:31:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A96661A4D;
	Wed, 26 Apr 2023 14:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE24C433D2;
	Wed, 26 Apr 2023 14:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682519468;
	bh=1NdLuMS9alzONX0oYC1+o9aETwJMhrHT3EO+VwNaCSI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=LsfOuBaVwF6xb/MRn8GWx58A1ilhUD0RM5PDwxMXbYowbz1+ZJgMCDzxVQBGf04NE
	 RXOls1za0XpZZ/SSOSiwdBBxTzAWt3qAFmqEz2+9sxFi4g+bo/mC4KOFt7lBMbFlhq
	 JoeEnHpY1uNocWu/LW5ELGujxcLkOgvhV1xzKmDbj5d7NRKKliWFQmbDd7df1DMy16
	 W9VMve4xPFM/2SD2GTULGPjljC2YyWoDlfOwaA66L4M8GletTLUQtPfkK5d5J2OMl3
	 E9BjSc82S/PLukdwl9C3XS+s0nfXOr9lYNGTrOsT4rhD3Esx/NOxgheAI9+c58ofZC
	 9QcczyhMLxuRA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: send WMI_PEER_REORDER_QUEUE_SETUP_CMDID
 when
 ADDBA session starts
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230404070158.3368530-1-quic_cjhuang@quicinc.com>
References: <20230404070158.3368530-1-quic_cjhuang@quicinc.com>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_cjhuang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168251946566.11960.7919131610396931780.kvalo@kernel.org>
Date: Wed, 26 Apr 2023 14:31:07 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_073110_060448_03B1A788 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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

Carl Huang <quic_cjhuang@quicinc.com> wrote:

> Low receive throughput is seen on WCN7850 because ADDBA related
> parameters are not updated to firmware when receive ADDBA session starts.
> 
> Fix it by sending WMI_PEER_REORDER_QUEUE_SETUP_CMDID again to firmware
> to update the ADDBA related parameters for chips which have false
> reoq_lut_support in hw_params. For chips which have true reoq_lut_support
> in hw_params don't need this command to send to firmware.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e671fb86ecc0 wifi: ath12k: send WMI_PEER_REORDER_QUEUE_SETUP_CMDID when ADDBA session starts

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230404070158.3368530-1-quic_cjhuang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
