Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45DAC4345F
	for <ath12k@archiver.kernel.org>; Tue, 16 Apr 2024 07:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atefIRgk9edzGhcPKmWYrTVkXKwiU3xnRxT/Ij0Ct50=; b=PLKWhvbv8o+z4fPpjq5Dq2hrgu
	S8Kp/ABrQGuetG/2s5fA38zLtwv1FvMKVGve4B2SknNqMKm3OGlYVPwZxyjryMIbi9FubqTX0t3g/
	ObjELiNpltq+zh3mnnjlYan/k4EHOArB8KyHZQbQUxnuc5jpiP0xur+RpIo32GuHIU63rRuuv7DhG
	DBrPIrcxFP4skRKkJKygIKQ1TJTGcKTEixrdY/9+QOkcGMsksLVf+2lT2kGFsTXSrB+XBs8uhpy5y
	svFq7aP1Ww7Dq8DtJtOvkxTlsGhb/peOT5rBRD0ZX3Bf1AD7zI/5eqrC/uCzDs21peGfVsLacEZjA
	wzMGS4nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwd4p-0000000BENl-0WZO
	for ath12k@archiver.kernel.org;
	Tue, 16 Apr 2024 07:17:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwd4C-0000000BDoZ-15Z9
	for ath12k@lists.infradead.org;
	Tue, 16 Apr 2024 07:17:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CCD6ACE0F09;
	Tue, 16 Apr 2024 07:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5ECC113CE;
	Tue, 16 Apr 2024 07:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713251834;
	bh=pgF5tfPygm4FX7vHgvq0eWcS9uo06XOqLTA2zpWv4Q0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=UwQANtT0V+DX5EMQnuTIkw1Zu69yuO8MASqyjS2TKn/V86BKsiwHQP4MdfeV359+y
	 oGfZMcuvLED8JDBjxfvSykYA9OjgTkqo/MKsSxEQ4MqYfLf4e7EtSThzbfs47UPakF
	 6+1fhtOktxyQfwTt5FaJxmUcQ2vzYifKTyBLpzTnks2NgwVQUUyAC2XSFoz2tRM73q
	 /Q51isVkfJp8fC73dzAuc8Zpv/5IIZWUEodkpjaeTBhUPhsfIemGXa9gkHH4Fhiomv
	 rgexl1W7ubyZMRo+A7J5Ye36oS+h8GeWkcmtOLqCwMasDIr0kW5m5H31jiIoPU69rQ
	 l8ju4flwzco+w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] wifi: ath12k: fix mac id extraction when MSDU
 spillover in
 rx error path
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240404141538.1277258-1-quic_nithp@quicinc.com>
References: <20240404141538.1277258-1-quic_nithp@quicinc.com>
To: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>, Nithyanantham Paramasivam
	<quic_nithp@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171325183100.4097708.11184145689430531302.kvalo@kernel.org>
Date: Tue, 16 Apr 2024 07:17:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_001721_017510_71414890 
X-CRM114-Status: GOOD (  10.25  )
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

Nithyanantham Paramasivam <quic_nithp@quicinc.com> wrote:

> Currently, in the rx error data path, mac id is extracted from the
> last 64bits of MSDU end description tag for each entry received in
> the WBM error ring. Then, each entry will be updated into the MSDU
> list for further processing. The extracted mac id is valid when a
> single MSDU is not fragmented and received in the WBM error ring.
> 
> In scenarios where the size of a single MSDU received exceeds the
> descriptor buffer size, resulting in fragmented or spillover MSDU
> entries into the WBM error ring. In this case, the extracted mac id
> from each spillover entry is invalid except the last spillover entry
> of the MSDU. This invalid mac id leads to packet rejection.
> 
> To address this issue, check if the MSDU continuation flag is set,
> then extract the valid mac id from the last spillover entry.
> Propagate the valid mac id to all the spillover entries of the single
> MSDU in the temporary MSDU list(scatter_msdu_list). Then, update this
> into the MSDU list (msdu_list) for further processing.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

f351772c544b wifi: ath12k: fix mac id extraction when MSDU spillover in rx error path

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240404141538.1277258-1-quic_nithp@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


