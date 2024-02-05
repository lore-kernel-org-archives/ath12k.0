Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D1EC48295
	for <ath12k@archiver.kernel.org>; Mon,  5 Feb 2024 15:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4F6RPwQGZTT+sSsxKUCg2ZUNXuaxVdJgIr/ZkGz/2o=; b=z38TZPFkWcgD/I+UgdHZgVmzN0
	al4cT6BEumICGE9bgczpL0tS/ddRtfZS2Nia1v+g0bsDX9LH4UPysP7uB0pidYGmi8QnpXganuO4G
	sV9zTmbD86ZGrGe116Ryl0sn+/l0MlM2Nlunmko+QvdT/EZ5NKqlp1vOUvqi3lf3eGVL2VS1uzSZ6
	d3MjRg1/Ih08QIXszytlA4rHMoh0gctlWKAeDJ0d66Z486CI77HH2bCIM3ckDiaEoYnqWvpacjSRm
	D2yA7uUQCW5oHd7VCO9KozNtbavsgRo1zmLJur+G4W83Ftj8BCbIu7jaFDtGKQId+foBYtrLxuQqP
	iqShyNhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1BO-00000003r3C-1RPj
	for ath12k@archiver.kernel.org;
	Mon, 05 Feb 2024 15:46:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1BG-00000003r2G-0ytI
	for ath12k@lists.infradead.org;
	Mon, 05 Feb 2024 15:46:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0554BCE0FC5;
	Mon,  5 Feb 2024 15:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A47DC433F1;
	Mon,  5 Feb 2024 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707148003;
	bh=wOYus2KV7H9zl64+dCvGqXqXOnxoX0AZshbkkve11Ao=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=SQo26lezeAEOk2xSsdnNb4lXYiwwB2gGkRJRMnkHDk1y7kyaFzp0mKLp2YEIFjS3b
	 kvJYUMhzPAP/owOY+rOdwcHYONVmU/Od8GOcHXfWOS6FqmJPquq6q3Jj2+jS8GP7JH
	 gQRN82FvR4JRdP5iflxGHo8sZ+/wwNvh4CQlr7EoabCWiAW6hNAblwAuHOzTISDav4
	 IJL/CnXgkRklXhbo7+OS4nJ9cR13/lN+ZZRAAimfam6Cm8nXUgOiExymArBFHdldO6
	 uQpjQzRXnBRimCGKVxg2bcO73guVPBSClYpGu0JOOgxh6AIn/WrMunpHdT7ai0t3kq
	 Zo5ucvgzbWQZA==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6 01/11] wifi: ath12k: fix broken structure
 wmi_vdev_create_cmd
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
	<20240130040303.370590-2-quic_kangyang@quicinc.com>
Date: Mon, 05 Feb 2024 17:46:40 +0200
In-Reply-To: <20240130040303.370590-2-quic_kangyang@quicinc.com> (Kang Yang's
	message of "Tue, 30 Jan 2024 12:02:53 +0800")
Message-ID: <87jznisylb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_074646_481980_257D187E 
X-CRM114-Status: GOOD (  16.67  )
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

> Current structure wmi_vdev_create_cmd is not matched to the firmware
> definition. So update it.
>
> And update vdev_stats_id_valid for vdev_stats_id.
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
>
> v6: position adjustment.
> v5: no change.
> v4: no change.
> v3: no change.
> v2:
>     1. add Tested-on tag of QCN9274.
>     2. update copyright.

BTW it's quite a lot of work to add changelog to every patch, especially
if there are 11 patches. It's totally fine to have the list of changes
between versions in the cover letter, no need to add them individually
to every patch. Though this is not a problem, just trying to reduce your
workload.

> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 3 +++
>  drivers/net/wireless/ath/ath12k/wmi.h | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 2fa724e5851a..d8ebaf4b8359 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -826,6 +826,9 @@ int ath12k_wmi_vdev_create(struct ath12k *ar, u8 *macaddr,
>  	cmd->vdev_stats_id = cpu_to_le32(args->if_stats_id);
>  	ether_addr_copy(cmd->vdev_macaddr.addr, macaddr);
>  
> +	if (args->if_stats_id != ATH12K_INVAL_VDEV_STATS_ID)
> +		cmd->vdev_stats_id_valid = cpu_to_le32(true);

Using 'true' in a firmware interface looks odd to me and I think what we
mean is BIT(0), right? I'll change this in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

