Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BF2C04E69
	for <ath12k@archiver.kernel.org>; Thu,  3 Aug 2023 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5i1Irflfu2Xk9956HB3p7DbcHuIENsglJOn0ezq4RUE=; b=sskBGuw76Zctev
	C/OT6tvxXe3DrjOveArvCqdXsPWpRKsWlyOMP5qJJE1RnJLN+tDcrRA5QlVFO+QW//EttK5ErBmGf
	0p2LpSKIQF+Z7sl3lgh7hsq6PfN+HzcHxI0WyTKn7WrFhf/gjxWSuP/hK+6DtACNSJ32Um7xvoX+T
	IcFs7KJTIxQ37vaGHl8nYZtLS5HVQENXsolTEJSKlasELrHa8cxox8llSAnKVHZMwcP0Mp5AgQvyV
	u8OsV8IGdYXojVmmpU/BJlRZ1LHwIFtC/v4rgeY1D/pyI3rdOOvp+IEwAQ+zV7pgBoLRT780cQtDH
	88QVKHyxDdxElLY1iUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRVbg-007Mzk-0f
	for ath12k@archiver.kernel.org;
	Thu, 03 Aug 2023 10:31:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUZ0-007BzY-3C
	for ath12k@bombadil.infradead.org;
	Thu, 03 Aug 2023 09:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3zPFdGD6yWbnVGbloMxuOklFkiZ85YTBFIZUdYS7YzI=; b=R39zV+6SvboimWHIQbOaM22gH/
	QYC528w212LRF93AYgeUzVohRzBNTMDlFAVnPYNzGmVMvnlm+3O1fN6h0tO+6c1bhwEe3lvJIjj0o
	zTn9cj5sRQCgqeGUQisN0LMbX5mkbq9knQvSgqXYH9tV3HHmUP9vOqFns+DKsr8ZCbw9YHyn78sjE
	w+ccRBqnSw/Pk/mNOyyDJis1nz/R9fIGk7/UdzBgxmwufh4LJR+oJFAS9vKt6gHmUgogHbuplyNc0
	ubuCndZiu1k58HebSIK/r1CZ2flDmZ4F6z1pPZZG1sBCy8qsNKPHa/wjIQjn/2SGyBwaYmypUe37L
	KB6t5/Zg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUYx-00GiH6-1D
	for ath12k@lists.infradead.org;
	Thu, 03 Aug 2023 09:24:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E56D761A44;
	Thu,  3 Aug 2023 09:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6952DC433C7;
	Thu,  3 Aug 2023 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691054645;
	bh=RWA4535ZuKGIVttpsyu29l+cYWXZI3ZPl5R1XmuKXF0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=P090hTeYE0R8lVbBQF3YBJilUXqZWAS1SnNTBHf0tHjONr0ia51gbKKo8HnOei1ry
	 SZM56VprOPBZgEEsVbyOY9wRZhS6fyD0iri9w8tCn9UxLFjlKmFfC3oxtk66Y3zOcQ
	 fxiG0/An0/15vO1hkFwhn7/rxii42sQNuBnkZPnmN7SF9pq1FjKneYJ1o2HxtgdhqW
	 sstROC0XYB5OPwos5qi3kWeIR+f9YTY5paKdzdVw8XWwSLtdDtXaQHHUdg8lKdSlgo
	 Sl04mti3/pj9/ncO9h7KPBq0B2cIQWcF1zzK0NUiNrWLuIpuHK5A9ye/W9hM93bYl5
	 8yKmCa25UdsJQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] wifi: ath12k: configure RDDM size to MHI for
 device
 recovery
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230721055305.20420-2-quic_wgong@quicinc.com>
References: <20230721055305.20420-2-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169105464227.894438.15435946207134709277.kvalo@kernel.org>
Date: Thu,  3 Aug 2023 09:24:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_102407_621404_34F125AE 
X-CRM114-Status: GOOD (  10.67  )
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

> RDDM is RAM DUMP DEBUG module, it is used to debug issues when firmware
> encounters an error.
> 
> The rddm_size is needed by firmware while MHI enter RDDM state. Add it
> to support device recovery when ath12k receive MHI_CB_EE_RDDM message.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

I'm not sure what "support device recovery" means exactly. How does this patch
change functionality from user's point of view?

No need to resend because of this, I can add that to the commit log.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230721055305.20420-2-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
