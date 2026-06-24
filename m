Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C16CCDE001
	for <ath12k@archiver.kernel.org>; Wed, 24 Jun 2026 07:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyO/oxy6yOszauGRa3+ycH46BEmZ6m/DyI0yY1OAvNo=; b=WZQBdDS96O8NiKoyrc8XnsiLaQ
	wJrTSyQEyI/+CcYHYXqlg7vp2UKL5Ezc0xeqO1PF8obtZwHo1HPyvRNaN8/xCtAJ8xLxoTXvd0tae
	2jDwgNqBc8CS9q1wl/kH4lwu1sbbu4WYDkLnUgFxRt35A+PvWWwIerrJbVKKxMkBAgedTgVxHvI2Q
	HUBIC+C1zDCcZTaLT4DIsaARDLFEw1yk4jrG1FV47Q0fl/Xql+m6Qr5mzr0K2S9Ww1uCZjpFnkjkh
	qRVe+BcYJnPh86w8hNUx/OnIsiUawl29ezBAEzE2q4/PIrkK3kRPzwvIXUpH9MGO/+B4P9gbOaBvN
	Esyw8tIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIKQ-00000007LRE-0eqm;
	Wed, 24 Jun 2026 07:47:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIKN-00000007LQU-2So5
	for ath12k@lists.infradead.org;
	Wed, 24 Jun 2026 07:47:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5u3LJ1889332
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 07:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uyO/oxy6yOszauGRa3+ycH46BEmZ6m/DyI0yY1OAvNo=; b=EKNzaJANf1T/xYRC
	xJ23FK4GIyni/i9EsLzVYv9VTaMwY9Pra/uHTHJrR4ebZeA34TYUsXTBLKiTzHgE
	1QB5QnCQ5wLUlBa9n7Lxzocco9k2j6tKICXEqd6unBbUDA2WRzmwNUM4VRQYjL6G
	IHwWQrQ8C+Tea8a0tcKoco7M5YPYec8VLPW2ks6nVNkFs0MAB2kP33hqEzOHt2jv
	1pJAlpc0AJ2ItvsIXORTkOgq/9dzKlCfi0X19SHHXIL0djBFzIA1FRPHS50Ko4mc
	cRbiDneV2y911jfJsoCwRL2tV/6f1AXOx6nD5OdEYDmcYT45gpAV3wcVC5Vx5z7o
	EWBKxg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eysv3kyya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 07:47:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842b0dd8107so567278b3a.0
        for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 00:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782287238; x=1782892038; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uyO/oxy6yOszauGRa3+ycH46BEmZ6m/DyI0yY1OAvNo=;
        b=NdCH7QGszw827p0OWrUPBb7+NhXPBY8ilYWjh5sC0b81YtjTBG1+Di3Ra973PIudi1
         DINsA4d8Cg9Xejfm2F9/Ohy0d4apH1X+quKaXPqR78GD1ihJ2VhQLfIb6CjmhxWQQmao
         zLxwqfpm+NzP3fZcy2FVEBmQmwfZ9UX07J1sP6Ycn029BaF54/lmqDCkxq89Ey6iKNW5
         HAIVLdX0qlGkfkA+kuARafu3ZWpW2/j+NXUNdh/eSn4HztK2J8kbBZybnXf5PHC3nRin
         iRpx54BBQlhgu4IK0qe/bIjTY+25JGq2Jt/eZeFFZmUwZXr6QAmk3BzSghsptW2xRUbA
         Rn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782287238; x=1782892038;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyO/oxy6yOszauGRa3+ycH46BEmZ6m/DyI0yY1OAvNo=;
        b=GdwN4JzLh7MxQHlxO0aPwdv655Y4cY718nZCrXzNckdkyzg2cegOZw3vbHJQHKGj/Q
         IO09RRkG3D0pEm/9UyEcgqK6IM8sT48GnCe/NNDFbO5/mNvYvnUL8/fi0W9jACuMc1SU
         EO6ocNdArQ/ieJdPB3WpKLYBJEIZxSZKaaTcjrLTukvd6C9tp13WHx1Lr4xzUNlIBCSc
         Fsh610RAKwy8+oUzR4kmrADhm5OobIuD4a+RfLI9ziSy0k41fjPXLiexRphWTDHeA6SU
         SFkK1k1tFXWC1yom2EEq2tv01m4P5xvW63nritGhsylT6aJplV2V2ai6W3O8pLSAfe3p
         AklA==
X-Forwarded-Encrypted: i=1; AFNElJ8lxw45VrTJEnS2T46xE8V/5R4dj0x0o1maR6tif2rLxsUY/m09vgFafwqdNmRuShxNJDny5io=@lists.infradead.org
X-Gm-Message-State: AOJu0YypL9KKbRctGs62/BCRzbydfKr/qw/ML1JSR1rILy3lCCG4SSWT
	Yx/kK3BSCKEDMiSDOPnVVxKqFL4HmcEaSWhGsPYEkD0gidh3yGuUK7ATPcdqDyEOg7b+aSKNrJT
	hLdtYpGTGW5brYgpoROUlo4jqjAXgPDMkgujbcOBAjOjZYV3vxdNo+EYs1k8udaEhm10DWZLg
X-Gm-Gg: AfdE7clbwvJEm7g+zUUMOi8MUsQ0nk6vjNha6X4RUJOc22VJeeZRWwQ0uhg3n/bbUG/
	vKNTExl/SPba2NgyeT76FFNRxwvhqmgU1A3Fz3/EFjMnqLZ4KjSWNrBoYiCMMWOwDC0sdQ6OBkY
	yjbtZGZHazcLnf5QP0f2H7Ft7xfDhMlp53g7OoWO8LBChv5G2V0Mp2u0RnoUqjo10/mQHzSMVMJ
	AklVP7wwjjP9CNd6Vc68jJVA0apmn7jah143KO8cLcU8VCIHsG0smmYY3izDH8m1LuZBTTmv97o
	0+kW3djMtlWdXWPnqJr75DpkOCC08c46sRWuURWmZY9O5rjAfV26Pe72KGBB++HT5pP+NxGVTJu
	GIHrSesWkJVspGlQa6+ZsCnk4GBFEGraktLtzjGVXYEvhCY9RWZ6ebEsZuvk/3me26oGTEHQ7oS
	YkoLymdqUx
X-Received: by 2002:a05:6a00:17a9:b0:841:edb9:4ea2 with SMTP id d2e1a72fcca58-845a2c58284mr3191051b3a.32.1782287238159;
        Wed, 24 Jun 2026 00:47:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a9:b0:841:edb9:4ea2 with SMTP id d2e1a72fcca58-845a2c58284mr3191019b3a.32.1782287237687;
        Wed, 24 Jun 2026 00:47:17 -0700 (PDT)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb775sm1345215b3a.20.2026.06.24.00.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:47:17 -0700 (PDT)
Message-ID: <4cdfb71b-2ef8-4985-8294-c4a29e37faa3@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 15:47:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] Add device-specific reset for Qualcomm devices
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, bhelgaas@google.com,
        alex@shazbot.org, mani@kernel.org
Cc: jjohnson@kernel.org, linux-pci@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, mhi@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260623183115.1585273-1-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623183115.1585273-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2MyBTYWx0ZWRfX+T+HG+83XqhF
 RmLbbCp83cTQSiXnOoKST/Ge+asYYTm+Kt/H7gRxayOqwh/NQTZhYemkP92WjsJ1AkmSbsgJdrr
 na7gsk5aGO0z9JHQy3+NwMYSqY85SR8=
X-Authority-Analysis: v=2.4 cv=WtAb99fv c=1 sm=1 tr=0 ts=6a3b8b86 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=rq6MREiLanR6HC4oPXQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: JNU1mu_sVr7xTElhzS5WQ6YAWO11ORFc
X-Proofpoint-GUID: JNU1mu_sVr7xTElhzS5WQ6YAWO11ORFc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2MyBTYWx0ZWRfX17J6bYeVMWnG
 BbEnLSQeW8EhTk0qnr/bV2WY16L0hf7c67+wLaV8lQmeOnKDb8KwWXqxVR/iqJnKprZSfhcQers
 XgCuNFGLtMUDO84xHLrCmDlzTBRwzYYSvW74ZUibfZKcyDYZoamdOrRf0MO1yHxZWltRCVTzDVj
 v3G3Iex36x6LKhuMpvwGgU037ovAXuTL3Fgnq+FsPSa56tYg7xdCuC5O4NU74M3FHb8LxvsuPBO
 5nLWQZUcgBIFLgKiVLQkFjAktHbWh0D+GzCT1KQObuh9CaBPFmDdosxVve9KOFqWbv3kDx0Ohds
 KdPXwRSQP8aKgdvaRU2dGRUvQtUlVzGoEeqQJ/8b44s/X+5wUEKtQkxlxWF3ngvUDIXLMAj5fHz
 Frp+A3ZNiNzSquvKpGAFQXm89lkHvJGpiWw5upfPvEULu34V4XQTLmqaHHBf/DFpFrK1/VlwIMt
 W6NsRw9aGonzsRsJ/9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_004719_645104_D9195BC8 
X-CRM114-Status: GOOD (  28.75  )
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



On 6/24/2026 2:31 AM, Jose Ignacio Tornos Martinez wrote:
> Some Qualcomm PCIe devices (WCN6855/WCN7850 WiFi cards, SDX62/SDX65 modems)
> lack working reset methods for VFIO passthrough scenarios. These devices
> have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
> broken bus reset.
> 
> The problem manifests in VFIO passthrough scenarios:
> 
> - WCN6855 (17cb:1103) and WCN7850 (17cb:1107) WiFi devices:
>   Normal VM operation works fine, including clean shutdown/reboot.
>   However, when the VM terminates uncleanly (crash, force-off), VFIO
>   attempts to reset the device before it can be assigned to another VM.
>   Without a working reset method, the device remains in an undefined state,
>   preventing reuse.
> 
> - SDX62/SDX65 (17cb:0308) 5G modems: Never successfully initialize even
>   on first VM assignment without proper reset capability.
> 
> Add device-specific reset methods using BAR-space hardware reset registers
> that exist in these devices:
> 
> - WCN6855/WCN7850 WiFi devices use SoC global reset via BAR0 (sequence from
>   ath11k/ath12k driver: ath11k_pci_soc_global_reset(), ath11k_pci_sw_reset(),
>   ath11k_mhi_set_mhictrl_reset()):
>   - Write/clear reset bit at offset 0x3008
>   - Wait for PCIe link recovery (up to 5 seconds)
>   - Clear MHI controller SYSERR status at offset 0x38
> 
> - SDX62/SDX65 modem devices use MHI SoC reset via BAR0 (sequence from MHI
>   driver: mhi_soc_reset(), mhi_pci_reset_prepare()):
>   - Write reset request to offset 0xb0
>   - Wait 2 seconds for reset completion
> 
> These are true hardware reset mechanisms (not power management or firmware
> error recovery), providing proper device reset for VFIO scenarios.
> 
> Testing was performed on desktop platforms with M.2 WiFi and modem cards
> using M.2-to-PCIe adapters, including extensive force-reset cycling to
> verify stability.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
> v10:
>   - Complete redesign based on maintainer feedback (Manivannan Sadhasivam,
>     Alex Williamson): use actual hardware reset registers from
>     device drivers instead of D3hot power cycling
> v9: https://lore.kernel.org/all/20260612142638.1243895-1-jtornosm@redhat.com/
> 
>  drivers/pci/quirks.c | 118 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 431c021d7414..8ad3f214e520 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -4240,6 +4240,121 @@ static int reset_hinic_vf_dev(struct pci_dev *pdev, bool probe)
>  	return 0;
>  }
>  
> +#define QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET	0x3008
> +#define QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET_V	BIT(0)
> +#define QUALCOMM_WIFI_MHISTATUS			0x48
> +#define QUALCOMM_WIFI_MHICTRL			0x38
> +#define QUALCOMM_WIFI_MHICTRL_RESET_MASK	0x2
> +
> +/*
> + * Qualcomm WiFi device-specific reset using SoC global reset via BAR0
> + * registers.
> + */
> +static int reset_qualcomm_wifi(struct pci_dev *pdev, bool probe)
> +{
> +	bool link_recovered = false;
> +	unsigned long timeout;
> +	void __iomem *bar;
> +	u32 val;
> +	u16 cmd;
> +
> +	if (probe)
> +		return 0;
> +
> +	if (pdev->current_state != PCI_D0)
> +		return -EINVAL;
> +
> +	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
> +	pci_write_config_word(pdev, PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
> +
> +	bar = pci_iomap(pdev, 0, 0);
> +	if (!bar) {
> +		pci_write_config_word(pdev, PCI_COMMAND, cmd);
> +		return -ENODEV;
> +	}
> +
> +	val = ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);

QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET is beyond the first 4K bar area hence requires MHI
wakeup before accessing, see [1]. the wakeup callback for WCN6855 is
ath11k_pci_bus_wake_up() which calls mhi_device_get_sync(). Not sure how this can be done
here. Maybe Mani can provide some hints?

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/pcic.c#n216


> +	val |= QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET_V;
> +	iowrite32(val, bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
> +	ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
> +
> +	msleep(10);
> +
> +	val &= ~QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET_V;
> +	iowrite32(val, bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
> +	ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
> +
> +	msleep(10);
> +
> +	timeout = jiffies + msecs_to_jiffies(5000);
> +	while (time_before(jiffies, timeout)) {
> +		val = ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
> +		if (val != 0xffffffff) {
> +			link_recovered = true;
> +			break;
> +		}
> +		msleep(20);
> +	}
> +
> +	if (!link_recovered) {
> +		pci_err(pdev, "PCIe link failed to recover after reset\n");
> +		goto out_restore;
> +	}
> +
> +	/* After SOC_GLOBAL_RESET, MHISTATUS may still have SYSERR bit set
> +	 * and thus need to set MHICTRL_RESET to clear SYSERR.
> +	 */
> +	iowrite32(QUALCOMM_WIFI_MHICTRL_RESET_MASK, bar + QUALCOMM_WIFI_MHICTRL);
> +	ioread32(bar + QUALCOMM_WIFI_MHICTRL);
> +
> +	msleep(10);
> +
> +out_restore:
> +	pci_iounmap(pdev, bar);
> +	pci_write_config_word(pdev, PCI_COMMAND, cmd);
> +
> +	return link_recovered ? 0 : -ETIMEDOUT;
> +}
> +
> +#define MHI_SOC_RESET_REQ_OFFSET		0xb0
> +#define MHI_SOC_RESET_REQ			BIT(0)
> +
> +/*
> + * Qualcomm modem device-specific reset using MHI SoC reset via BAR0
> + * register.
> + */
> +static int reset_qualcomm_modem(struct pci_dev *pdev, bool probe)
> +{
> +	void __iomem *bar;
> +	u16 cmd;
> +
> +	if (probe)
> +		return 0;
> +
> +	if (pdev->current_state != PCI_D0)
> +		return -EINVAL;
> +
> +	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
> +	pci_write_config_word(pdev, PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
> +
> +	bar = pci_iomap(pdev, 0, 0);
> +	if (!bar) {
> +		pci_write_config_word(pdev, PCI_COMMAND, cmd);
> +		return -ENODEV;
> +	}
> +
> +	iowrite32(MHI_SOC_RESET_REQ, bar + MHI_SOC_RESET_REQ_OFFSET);
> +	ioread32(bar + MHI_SOC_RESET_REQ_OFFSET);
> +
> +	/* Be sure device reset has been executed */
> +	msleep(2000);
> +
> +	pci_iounmap(pdev, bar);
> +	pci_write_config_word(pdev, PCI_COMMAND, cmd);
> +
> +	return 0;
> +}
> +
>  static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
>  	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82599_SFP_VF,
>  		 reset_intel_82599_sfp_virtfn },
> @@ -4255,6 +4370,9 @@ static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
>  		reset_chelsio_generic_dev },
>  	{ PCI_VENDOR_ID_HUAWEI, PCI_DEVICE_ID_HINIC_VF,
>  		reset_hinic_vf_dev },
> +	{ PCI_VENDOR_ID_QCOM, 0x1103, reset_qualcomm_wifi },  /* WCN6855 WiFi */
> +	{ PCI_VENDOR_ID_QCOM, 0x1107, reset_qualcomm_wifi },  /* WCN7850 WiFi */
> +	{ PCI_VENDOR_ID_QCOM, 0x0308, reset_qualcomm_modem }, /* SDX62/SDX65 modems */
>  	{ 0 }
>  };
>  


