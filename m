Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79812C77B72
	for <ath12k@archiver.kernel.org>; Mon, 17 Apr 2023 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTLE0tijxciHpX5dwCvx+cggTM0D4Xj+yzCCboMJ3wc=; b=3tOkh9WXPV3Bo4
	F/LW/lrpL3sTeNnmpBluxIjVia+o/WFkdZ1I5uhm+k8GAE52lv4f5bwF0H6LvnfOusYZeOKIW4lk3
	Kggz7XnaGDxuyx2F2v8KlaM55s68AVczJkvcGbGWVJaSnGJL7+VRfY/WIkvFYL27MbEpplqq+PFij
	MmPGygWyArfPp4g4HZp14NaasRFPVLjb/Krl50LHEnBdLfwJqd/OFFccEMCcnmjjszE5UNFUZG6Dk
	xLKGzNvaG4dwLf04YQysglOX2UAK833aWV/6OlpfXpkUQAJtbsdSrYCyESRnKm+6cU51Igh3Gq9e0
	XcSFizMHQNZSwyOOvN/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poOTy-00GH4J-0Q
	for ath12k@archiver.kernel.org;
	Mon, 17 Apr 2023 13:01:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poOTv-00GH2a-0I
	for ath12k@lists.infradead.org;
	Mon, 17 Apr 2023 13:01:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A301A617E2;
	Mon, 17 Apr 2023 13:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCE8C433D2;
	Mon, 17 Apr 2023 13:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681736478;
	bh=vBAfpOF39qoB/LjTpHJuu0BLFpzakopzM1Xko9cDe1Q=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=T/0MqB+/a4fdfVUVd2KPtRAXv4rRwo6YUfv/7DbpK/n/J511474q9GURGeTFEy4GU
	 OIcXqLjtnQxtEeCXjy+67GD9qEVI+ZMa4JsJsRwQJwcRur3hBrkKZFnWPZSC9XiELG
	 9YZ5gikTIoNrgcUD25bqNDoKYvQAr31U8j+7/+WNVuJMdHFKAzSqhMlKE1DquXcVyn
	 FPZOG8Qbjo8QvPle0sgK01Ee9BaV6eeo+zaES8d4P0v36xvRBtoggqJf5CjAMRY6Xb
	 lrLj1NpwNXYiqO72xGN6X71Q0Wf4rmq7yzR1NgK07Fr0KPAuELTyXL5xL5z53pcJYp
	 CORrRlpOzT+dg==
From: Kalle Valo <kvalo@kernel.org>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Subject: Re: [PATCH v3 03/11] wifi: ath12k: process EHT capabilities
References: <20230413215156.2649-1-quic_alokad@quicinc.com>
	<20230413215156.2649-4-quic_alokad@quicinc.com>
Date: Mon, 17 Apr 2023 16:01:14 +0300
In-Reply-To: <20230413215156.2649-4-quic_alokad@quicinc.com> (Aloka Dixit's
	message of "Thu, 13 Apr 2023 14:51:48 -0700")
Message-ID: <87h6tewtlx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_060119_165230_7F119971 
X-CRM114-Status: UNSURE (   9.20  )
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

Aloka Dixit <quic_alokad@quicinc.com> writes:

> Add WMI support to process the EHT capabilities passed by the firmware.
> Add required EHT specific definitions in structures ath12k_band_cap and
> ath12k_wmi_svc_rdy_ext_parse.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>

This had a new warning:

drivers/net/wireless/ath/ath12k/wmi.c:4072: line length of 97 exceeds 90 columns

I fixed that in the pending branch. But please use ath12k-check before
you submit the patches.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
