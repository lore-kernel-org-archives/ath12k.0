Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D359EC32793
	for <ath12k@archiver.kernel.org>; Wed, 18 Jan 2023 06:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7xeDz6iHAJxIKOnArpA5E/0gY2e+bJmkkTOdATlErKI=; b=vZZoNlr99NSM7m
	Hm5wlTaqkjoUVZ5pMkbiNWmB81VGz2CkJH59p/JxQFj+9oO7vikJuISjUA17hdT9vlvBVkjPVdq77
	uYfFvmPQKsnOlCOpfcadB+8MTJCoIe6RFFDXDOI9Z7TNN3p8ljbaFrFTfvxV8kvY43M1NdSgS9RyE
	2UPF4m3+lfE745rsbPo2vW3bOO8VKmRK6RBYWd/lbjMZNF6yU27SLim/Pj89hzAIUeETEcA9AA07b
	G6yeP5ASTISWp/x6CzWP8KI4rmmEFO3d66qIaPxStMlX57RsY92EkM/WR5EzVLQ6MFQ+fySpmyROO
	2rp7hWr0VQTqTZFqJY7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI26G-00H7HM-9X
	for ath12k@archiver.kernel.org; Wed, 18 Jan 2023 06:39:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI26D-00H7Gh-PJ
	for ath12k@lists.infradead.org; Wed, 18 Jan 2023 06:39:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2247EB81699;
	Wed, 18 Jan 2023 06:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAF1C433D2;
	Wed, 18 Jan 2023 06:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674023942;
	bh=IW4RxImM0AEh/L0YOiXTQp515dc31h+RKJMCNMFwJMU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=dEmaKn7kToJUnZ4FvaM5vXUatlXjdTRHM8N4FSzb4Xw6t8sdPA4FdBUnaOdM35Z7A
	 cWMfL1klYX7JsiEnsfLimsaAndsm31uQyWFZtK6heF+HZcu5m0ULZtcc/qfYa37k+j
	 5OAmA9r4B9hkH+whbL1+8RpTPa2SOUMw2t5ftlGb/pwib9GyEAe1Eh2bYxePPz8bwj
	 ITG5ewryNucEpp+5k4Jn9gHZZD2iWTjrMttVmfcWHLkhWRWW+AWSpr6BNQ+y119quL
	 i+0QicRsCEXHMxleqWw8YZrSWOTl+q0x2PTSLnRyvy75CL/NMqbKAdrREXWuQKcjSQ
	 qqCnF9homck9g==
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] wifi: ath12k: Fix incorrect qmi_file_type enum values
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221223050646.27785-2-quic_dinek@quicinc.com>
References: <20221223050646.27785-2-quic_dinek@quicinc.com>
To: Dinesh Karthikeyan <quic_dinek@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Dinesh Karthikeyan <quic_dinek@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167402394013.24104.16832782680191250462.kvalo@kernel.org>
Date: Wed, 18 Jan 2023 06:39:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_223905_997382_ABF52206 
X-CRM114-Status: UNSURE (   7.99  )
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

Dinesh Karthikeyan <quic_dinek@quicinc.com> wrote:

> Enum value for caldata in QMI_WLANFW_BDF_DOWNLOAD_REQ_V01 is set as 1
> which is reserved for BDF_TYPE_ELF. The expected qmi_file_type value
> for caldata is 2.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

27d7e348efb3 wifi: ath12k: Fix incorrect qmi_file_type enum values
42982259e9b7 wifi: ath12k: Add new qmi_bdf_type to handle caldata
801fc159e30d wifi: ath12k: Add support to read EEPROM caldata

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221223050646.27785-2-quic_dinek@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
