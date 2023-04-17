Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383C9C77B70
	for <ath12k@archiver.kernel.org>; Mon, 17 Apr 2023 14:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7OvImSxDM6cHQB2EOrSQxvjqk/gC8qEQ53tW25PItWk=; b=HcQVRnUY/BSWHP
	jLxcRCpYjSND9Aqb9V6hOp3EhB4RcjbIQ1yuUZgW0JJRSl0cfl6aYKhZ2fTZRJvf0HQJbwYqGl9ct
	TVQ7Ar8C6okrF27d/6wLo7xlPIOvQcbTHyw4nP3xtzhKHZOHoygmLeSeFc9vgLn6YtRbx0vt7Aatf
	HqstjbYj24DpcYaJE0Lx6AIu40N9i9900jc3cqmPeqqZyiW7ZramljZAL/FIvqoewHKtvNs4tTZQC
	U9Tv5fyMcogsGiE7cXjA4BpnjIrB+NBfd+ElKyz4KDW3CVmCVTg5jTwov7Mtqas5311EzEs1oRyp1
	gA4wWjhWIMKs9QdRPhZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poPpp-00GcrJ-2o
	for ath12k@archiver.kernel.org;
	Mon, 17 Apr 2023 14:28:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poPpl-00GcqK-2k
	for ath12k@lists.infradead.org;
	Mon, 17 Apr 2023 14:27:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0571561053;
	Mon, 17 Apr 2023 14:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C88C433EF;
	Mon, 17 Apr 2023 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681741676;
	bh=kQ89RqR3vyMHs4lrtUkl49TDqulexyeGzMps29u9i8U=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RoZMxYBJCt4tV0PkQVsOpIk/LjcoX+J4yKwBWuOaDj0xNrFh3VrBxocDCrapDBjZx
	 nOQYdel0IRW8pZKEGP1CJcChCHhj6QJYE8/6ZgnkrLfh/ushW8rcc7oDdcBatGdp9Z
	 LgZhTtmYgwrRNQ5G2pRkqmIMUOIp5EoNeotfnEzvQzsegy1NGeuIInNZRBwWd2Es9P
	 Ch0yhkwuE7HoFasuZ4Kn8mudEGTYDEGSgPj9/8dN9UNUJmkVsrZhMGVU/ms3qiyoxx
	 K7yGrOnSnXSxYYSr/pSZPVLDXlNdQLkkizhnOVeyXG3MojakSZRtVHh5omkNcVt88b
	 OZmWZrDXUbPJw==
From: Kalle Valo <kvalo@kernel.org>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: send WMI_PEER_REORDER_QUEUE_SETUP_CMDID when ADDBA session starts
References: <20230404070158.3368530-1-quic_cjhuang@quicinc.com>
Date: Mon, 17 Apr 2023 17:27:50 +0300
In-Reply-To: <20230404070158.3368530-1-quic_cjhuang@quicinc.com> (Carl Huang's
	message of "Tue, 4 Apr 2023 15:01:58 +0800")
Message-ID: <87cz42wpll.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_072757_924652_D25D8BC9 
X-CRM114-Status: GOOD (  17.60  )
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

Carl Huang <quic_cjhuang@quicinc.com> writes:

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
> ---
>  drivers/net/wireless/ath/ath12k/dp_rx.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index e78478a5b978..256e4cbfae54 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -977,6 +977,9 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
>  			ath12k_warn(ab, "failed to update reo for rx tid %d\n", tid);
>  			return ret;
>  		}
> +		if (!ab->hw_params->reoq_lut_support)
> +			ret = ath12k_wmi_peer_rx_reorder_queue_setup(ar, vdev_id, peer_mac,
> +								     paddr, tid, 1, ba_win_sz);
>  
>  		return ret;
>  	}

This added new warnings:

drivers/net/wireless/ath/ath12k/dp_rx.c:981: line length of 91 exceeds 90 columns
drivers/net/wireless/ath/ath12k/dp_rx.c:982: line length of 95 exceeds 90 columns

I fixed them in the pending branch. There was also no warning message if
ath12k_wmi_peer_rx_reorder_queue_setup() fails, I added that as well:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=750111a1341bba3b4f679ff97891fb1943f3643c

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
