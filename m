Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0B6C25B47
	for <ath12k@archiver.kernel.org>; Wed, 25 Oct 2023 09:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AgaDjARyTtuoC2haGmTr8ERrj0nlTrD0mXO4eERjHh4=; b=pGN8Dka7iNuio1
	keHeNstERwxojEFhgXKTEWW29/AlhhO1HvJeUibkaKxbY35+yldFHoi9tKghJNKrzjl0wNcg9M1lM
	uH8KjQ42W1yzbSlOxy0x9l/+WaFHFzR86GeCzq68MThRa/gbYggmUKmezwfmOT1LoNsmFEIw1rLhK
	QGXdio7yCDGuqmjGEpbePGAfU9G8v9trZ/RlGH94J43XS7I1z2mZ6Dx/FAdhCBodpQnLO6bq0wrvh
	u5gTI/9EkW8QG+xwSQ4eAchryiWJTNLCf7OF6qvwcjPY3vBPGlNL38G0w4EyHKDctQmE6CMRUBVIr
	9sw9lOX+owxklF6xdQNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvadf-00Bt5P-1T
	for ath12k@archiver.kernel.org;
	Wed, 25 Oct 2023 09:57:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvadd-00Bt54-06
	for ath12k@lists.infradead.org;
	Wed, 25 Oct 2023 09:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 92E36B80A53;
	Wed, 25 Oct 2023 09:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0969CC433C8;
	Wed, 25 Oct 2023 09:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698227839;
	bh=XH0mySti5cO3fR7h0L9DVAHGidW+BOWuspUP3B9M5QE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Ln2oYs7bnaxB3alqOBqNDzqsH1x6WiC4huVQ0Q0UNpHmYlBlFjYWvfvxPGEhp6XoN
	 Wh0IGqJiS1I0dVCeaDBQy9zUqr/LumfroUHrg7uKAUr7GbnJN4lKVy+0zDrw8Uhh+q
	 GRnbW0VyAKaP+yFSNIls/dUeNtEvM8x4oPC6KIoIspVHXlPyFfDkqQAFol6HS8ysaw
	 F7tOTb72p0uxd2VxyyMbAgVoTgeGu0FNrEqNOPfZeICuYhM2wWD+cvofhMcaGxpxxj
	 CvafzzKPwmP/TMZGU+Y0jhqSwlhaUBeAMszfRZ76l9v/zQQM6+/1/vdUxpd/TYyqI5
	 EYLDIcYLjlMAg==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] wifi: ath12k: rename the wmi_sc naming convention to
 wmi_ab
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231018153008.29820-2-quic_periyasa@quicinc.com>
References: <20231018153008.29820-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169822783577.891844.18069802184068494913.kvalo@kernel.org>
Date: Wed, 25 Oct 2023 09:57:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_025721_223604_F15BDDF8 
X-CRM114-Status: UNSURE (   6.94  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> In WMI layer module, the identifier wmi_sc is used to represent
> an instance of ath12k_wmi_base structure. However, within ath12k,
> the convention is to use "ab" to represent an SoC "base" struct.
> So change the all instances of wmi_sc to wmi_ab.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00125-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

25ebf4c3c141 wifi: ath12k: rename the wmi_sc naming convention to wmi_ab
cda8607e824b wifi: ath12k: rename the sc naming convention to ab

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231018153008.29820-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
