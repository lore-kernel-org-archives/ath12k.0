Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC76C04E69
	for <ath12k@archiver.kernel.org>; Wed,  2 Aug 2023 16:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYk5s5tzwV2Pc/uW0easonjSckIh3k8DEivXky1HNQE=; b=mazR9GkyroKIAG
	dCmDAulxlK4xXTWQoh3YIq6XkFCuaBwiIZd1TPw7iJjsvHAk6MEw50SKyeR5+B7KpVAfp73kJLv7G
	XKx8b9pxzhTZfKJh6fBPpfyfJvklwNGRmsUYQuJ0BlrwWGJhSFVRXRjdO9qWvdouGRy2bCM8FGaFE
	iP5FpXubSRtdDAALVzzxuhtKUdGwF6pxeBmMd7VwSZ6/7rbnsMlEhRx4qpZvd8ELD3DloR7gWOwED
	oviIqGF6beFxHXfLcqlm/mPdUK3OZ/XcXcgKHVcRU6ITRPPdSxY2l8Vv2Snx5y/5nzHWiUBXOE88K
	TgY4OV4ZIpkCDOECFHkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF7v-005QTQ-31
	for ath12k@archiver.kernel.org;
	Wed, 02 Aug 2023 16:55:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF7t-005QSX-0h
	for ath12k@lists.infradead.org;
	Wed, 02 Aug 2023 16:55:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1672B619CB;
	Wed,  2 Aug 2023 16:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5A3C433C8;
	Wed,  2 Aug 2023 16:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690995306;
	bh=qdxA9pBPS4Z9MxnRtXeIEl8r2HFOL4kudXJ/rb14Er0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=mXmi1FFp6Z+WjzNyOq5aKuBff8NmVE3a/zlPystDO4PU3vGxmrDF2OPktMcul7Onq
	 mrOWWOOmAmBWV+Tn0OZocRC6b7SeGr+uhnHQqRrzZ+5FWIRTdMSFlBzaUjjALviS+w
	 eLgwB8uF8r1jcDgY6HesOWu9xDhOZXmy1cpWbs2AnyWdKa5dD67MFik/GvMHDQVVZ1
	 EmmVwGl1jyXPIao/Rm4k3Xm54Qc6ptY6YPdWFFOuZqf5oP9G3+WaZyexT4mVq9MhU4
	 4dt2fpyx/8XsAxHiup6MYeICFXM8lqW+1lu2MW1NAlGbyNZO78wn5MW3iXDZelnIip
	 cUBR8jEaFioSA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: correct the data_type from QMI_OPT_FLAG to
 QMI_UNSIGNED_1_BYTE for mlo_capable
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230726093857.3610-1-quic_wgong@quicinc.com>
References: <20230726093857.3610-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169099530370.463701.4567477992736594889.kvalo@kernel.org>
Date: Wed,  2 Aug 2023 16:55:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_095509_304498_4F814825 
X-CRM114-Status: GOOD (  11.25  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> Currently, the encoding rule for field mlo_capable in struct
> qmi_wlanfw_host_cap_req_msg_v01 defined in array
> qmi_wlanfw_host_cap_req_msg_v01_ei uses type QMI_OPT_FLAG.
> 
> Unfortunately, all ath12k firmware actually expects this field to be of
> type NON QMI_OPT_FLAG such as QMI_UNSIGNED_1_BYTE/QMI_UNSIGNED_8_BYTE...
> And as a result, firmware is unable to correctly decode the mlo_capable
> field.
> 
> Change the ath12k definition as QMI_UNSIGNED_1_BYTE to match the firmware
> definition so that firmware can correctly parse the mlo_capable info from
> message QMI_WLANFW_HOST_CAP_REQ_V01 at wlan load time.
> 
> This is just an accidental typo and that both WCN7850 and QCN9274 firmwares
> use QMI_UNSIGNED_1_BYTE.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

15c8441dc1ed wifi: ath12k: correct the data_type from QMI_OPT_FLAG to QMI_UNSIGNED_1_BYTE for mlo_capable

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230726093857.3610-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
