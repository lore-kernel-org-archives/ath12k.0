Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FBED3F299
	for <ath12k@archiver.kernel.org>; Fri, 18 Oct 2024 20:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYUJiD7ApYvTpRJsQ1bYBY1nsri10Ivt7bnChrddq3o=; b=2L+3pxrt8YYN2vBYJdGFCfB7VV
	/dArN0PlcnuuCBO60rdpDiFSLFbpy8KBMu7+M/nimYxN/hplKtRI1wq6IdKaIM/miLLfF0Jvxs2T3
	RHPyazQ9vOMG5UZqLtF5BxjXzL6b7seP0zAPuvvnlo1cQ3qeRCexTAGlvkV4YPcs3dRUaTe3Gut4r
	CJOJjbvmLR1ll36oOYvG4JpqaUpGs5B9S0pcPx4nCVRANAh5UdjUnlrpGeqXDcuoG5tTCjzb6jvZs
	GzKQWTstXAb2refZSe8Sv65OapltQah1JWGrBwvfG1cW1HyuMAUBYaINyZ7t24mCO9hc6g+lvRrOM
	Ezs6DzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1td9-00000001wmd-1n9e
	for ath12k@archiver.kernel.org;
	Fri, 18 Oct 2024 20:31:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1tbP-00000001wTI-0yOT
	for ath12k@lists.infradead.org;
	Fri, 18 Oct 2024 20:29:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IF1Zin007753
	for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 20:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rYUJiD7ApYvTpRJsQ1bYBY1nsri10Ivt7bnChrddq3o=; b=nyAIkbbMX+udPA3y
	1lRwsoNMFBk9Ww/lnl1lxWJMQc7EsLXnd8HrWkf2oXkbnj8f3xnzy7/AJ1kkiilJ
	gp5mq5UMGG+RxIHwWIGpf7om8CyyAbgzAsMm0ks/TPPh161rzYOiAYZUA6FjrXHk
	JrtJaleKZLLZR6nW7j7pQoz/hOa2LzesPli3UlMujt69DfyYW/pZyeijfCYZ/soI
	+DljgU7G/XaExwGI3gMAe6pt0XSMFve1K/QWB11w2TSpdeH35xyGoOy8ELcRGvju
	AU90Rj2aCeR2lMnFpeAXcRKNK2yBtEMw/tCx8QGr3VjiCtxrFJ7tTGMSAKeocXJw
	DJ36NQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b5hsvets-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 20:29:37 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-4a47ed15aecso48599137.2
        for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 13:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729283377; x=1729888177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rYUJiD7ApYvTpRJsQ1bYBY1nsri10Ivt7bnChrddq3o=;
        b=gLI2Hu3Ni3fZXo0LB5QnNVYM/7ibKsbp2c6D34DeucWxCo87UX6Vzk2z+bHC9fNnT+
         l4bK39V9+1a9cRJJJNCQGP+wCpOnZWQ0L0FYD8Vi60muZ1wQhW4TX0zCy30I3ZK36rRx
         J2hpQ1Ik8hPC8o4rJx/8K13mL5gbTylYH6zQA1IFjLWd+3SwCZ/praSyvBcuQFtzblAE
         e4Icm9UkKRNp5TfyIVwE90ukg6XOsqp5E8dvwUMktxoDlAnOf5K3/oZxAkkdRIBa/Cfb
         kY/f+8DQ2XxxWO58N9LfF6rx+u00eSOK19jICNvxuxMDISQ/VPKezUL27ZH65n9ncbsU
         DVBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcVEgTWdc2khB+3zjPgFqyzx2JJXPk+gjKRdlxPzNC6BVw09wRvT2aUYTcFTtSaMriOxRIBXs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbd2+1Nkt1XBiThEStnjCKSOdp3uhZHe57gHK8BEdITMMW/V1S
	0SNlUj1mnUWHyLmZjhISC9qtDPpH8ZApQhFg46l48KVfApzkG+CeC0HNrU1R6+1XIEjjU/C8uQW
	9sxxVwkEjFR/8KYqn/gPWanYThzf/xhqTi4z3T2SBeV0oEX18sujhYqNg+N7i
X-Received: by 2002:a05:6102:54aa:b0:4a4:7928:6393 with SMTP id ada2fe7eead31-4a5d6aa073emr1468435137.1.1729283376700;
        Fri, 18 Oct 2024 13:29:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV6cf2iLFe/iU5ghNENNX107Q8tlBgHtXRRRcLsgGkNhiPdRTNON5xp9EQBfOgK5cwd1Rj0A==
X-Received: by 2002:a05:6102:54aa:b0:4a4:7928:6393 with SMTP id ada2fe7eead31-4a5d6aa073emr1468428137.1.1729283376248;
        Fri, 18 Oct 2024 13:29:36 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68ad4e23sm135801066b.62.2024.10.18.13.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 13:29:35 -0700 (PDT)
Message-ID: <243cd21d-6a35-4ff0-9b38-ec519a804670@oss.qualcomm.com>
Date: Fri, 18 Oct 2024 22:29:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/22] wifi: ath12k: add AHB driver support for IPQ5332
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-18-quic_rajkbhag@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241015182637.955753-18-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bcYWPOX_DYECLmxhxl-bQvGDbLLa5UAu
X-Proofpoint-ORIG-GUID: bcYWPOX_DYECLmxhxl-bQvGDbLLa5UAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_132939_428081_4A4718F2 
X-CRM114-Status: GOOD (  29.06  )
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

On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
> From: Balamurugan S <quic_bselvara@quicinc.com>
> 
> Add Initial Ath12k AHB driver support for IPQ5332. IPQ5332 is AHB
> based IEEE802.11be 2 GHz 2x2 WiFi device.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---

[...]

> +enum ext_irq_num {
> +	host2wbm_desc_feed = 16,
> +	host2reo_re_injection,

Why?


> +static u32 ath12k_ahb_cmem_read32(struct ath12k_base *ab, u32 offset)
> +{
> +	offset = offset - HAL_IPQ5332_CMEM_BASE;
> +	return ioread32(ab->mem_cmem + offset);

return ioread32(ab->mem_cmem + offset - HAL_IPQ5332_CMEM_BASE)?

Or maybe the mem_cmem base should be moved?

> +static int ath12k_ahb_start(struct ath12k_base *ab)
> +{
> +	ath12k_ahb_ce_irqs_enable(ab);
> +	ath12k_ce_rx_post_buf(ab);
> +
> +	return 0;
> +}

Neither this nor ath12k_pci returns anything useful - perhaps make this void?

> +static void ath12k_ahb_free_ext_irq(struct ath12k_base *ab)

Any reason we're not using devm APIs?

> +static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
> +{
> +	struct ath12k_ext_irq_grp *irq_grp;
> +	const struct hal_ops *hal_ops;
> +	int i, j, irq, irq_idx, ret;
> +	u32 num_irq;
> +
> +	hal_ops = ab->hw_params->hal_ops;
> +	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
> +		irq_grp = &ab->ext_irq_grp[i];
> +		num_irq = 0;
> +
> +		irq_grp->ab = ab;
> +		irq_grp->grp_id = i;
> +
> +		irq_grp->napi_ndev = alloc_netdev_dummy(0);
> +		if (!irq_grp->napi_ndev)
> +			return -ENOMEM;
> +
> +		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
> +			       ath12k_ahb_ext_grp_napi_poll);
> +
> +		for (j = 0; j < ATH12K_EXT_IRQ_NUM_MAX; j++) {
> +			if (ab->hw_params->ring_mask->tx[i] &&
> +			    j <= ATH12K_MAX_TCL_RING_NUM &&
> +			    (ab->hw_params->ring_mask->tx[i] &
> +			     BIT(hal_ops->tcl_to_wbm_rbm_map[j].wbm_ring_num))) {
> +				irq_grp->irqs[num_irq++] =
> +					wbm2host_tx_completions_ring1 - j;
> +			}

This is unreadable

> +
> +			if (ab->hw_params->ring_mask->rx[i] & BIT(j)) {

Consider taking a pointer to ring_mask so that the lines are shorter

> +				irq_grp->irqs[num_irq++] =
> +					reo2host_destination_ring1 - j;
> +			}
> +
> +			if (ab->hw_params->ring_mask->rx_err[i] & BIT(j))
> +				irq_grp->irqs[num_irq++] = reo2host_exception;
> +
> +			if (ab->hw_params->ring_mask->rx_wbm_rel[i] & BIT(j))
> +				irq_grp->irqs[num_irq++] = wbm2host_rx_release;
> +
> +			if (ab->hw_params->ring_mask->reo_status[i] & BIT(j))
> +				irq_grp->irqs[num_irq++] = reo2host_status;
> +
> +			if (ab->hw_params->ring_mask->rx_mon_dest[i] & BIT(j))
> +				irq_grp->irqs[num_irq++] =
> +					rxdma2host_monitor_destination_mac1;
> +		}
> +
> +		irq_grp->num_irq = num_irq;
> +
> +		for (j = 0; j < irq_grp->num_irq; j++) {
> +			irq_idx = irq_grp->irqs[j];
> +
> +			irq = platform_get_irq_byname(ab->pdev,
> +						      irq_name[irq_idx]);
> +			ab->irq_num[irq_idx] = irq;
> +			irq_set_status_flags(irq, IRQ_NOAUTOEN | IRQ_DISABLE_UNLAZY);
> +			ret = request_irq(irq, ath12k_ahb_ext_interrupt_handler,
> +					  IRQF_TRIGGER_RISING,
> +					  irq_name[irq_idx], irq_grp);
> +			if (ret) {
> +				ath12k_err(ab, "failed request_irq for %d\n",
> +					   irq);
> +			}
> +		}

Instead of doing all this magic, can we request the IRQs manually, as we
have interrupt-names in dt?

> +	}
> +
> +	return 0;
> +}
> +
> +static int ath12k_ahb_config_irq(struct ath12k_base *ab)
> +{
> +	int irq, irq_idx, i;
> +	int ret;
> +
> +	/* Configure CE irqs */
> +	for (i = 0; i < ab->hw_params->ce_count; i++) {
> +		struct ath12k_ce_pipe *ce_pipe = &ab->ce.ce_pipe[i];
> +
> +		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
> +			continue;
> +
> +		irq_idx = ATH12K_IRQ_CE0_OFFSET + i;
> +
> +		INIT_WORK(&ce_pipe->intr_wq, ath12k_ahb_ce_workqueue);
> +		irq = platform_get_irq_byname(ab->pdev, irq_name[irq_idx]);
> +		ret = request_irq(irq, ath12k_ahb_ce_interrupt_handler,
> +				  IRQF_TRIGGER_RISING, irq_name[irq_idx],
> +				  ce_pipe);
> +		if (ret)
> +			return ret;
> +
> +		ab->irq_num[irq_idx] = irq;
> +	}
> +
> +	/* Configure external interrupts */
> +	ret = ath12k_ahb_config_ext_irq(ab);
> +
> +	return ret;
> +}
> +
> +static int ath12k_ahb_map_service_to_pipe(struct ath12k_base *ab, u16 service_id,
> +					  u8 *ul_pipe, u8 *dl_pipe)
> +{
> +	const struct service_to_pipe *entry;
> +	bool ul_set = false, dl_set = false;
> +	int i;
> +
> +	for (i = 0; i < ab->hw_params->svc_to_ce_map_len; i++) {
> +		entry = &ab->hw_params->svc_to_ce_map[i];
> +
> +		if (__le32_to_cpu(entry->service_id) != service_id)
> +			continue;
> +
> +		switch (__le32_to_cpu(entry->pipedir)) {
> +		case PIPEDIR_NONE:
> +			break;
> +		case PIPEDIR_IN:
> +			WARN_ON(dl_set);
> +			*dl_pipe = __le32_to_cpu(entry->pipenum);
> +			dl_set = true;
> +			break;
> +		case PIPEDIR_OUT:
> +			WARN_ON(ul_set);
> +			*ul_pipe = __le32_to_cpu(entry->pipenum);
> +			ul_set = true;
> +			break;
> +		case PIPEDIR_INOUT:
> +			WARN_ON(dl_set);
> +			WARN_ON(ul_set);
> +			*dl_pipe = __le32_to_cpu(entry->pipenum);
> +			*ul_pipe = __le32_to_cpu(entry->pipenum);
> +			dl_set = true;
> +			ul_set = true;
> +			break;
> +		}

if pipedir == PIPEDIR_IN || pipedir == PIPEDIR_INOUT
if pipedir == PIPEDIR_OUT || pipedir == PIPE_INOUT

?

> +	}
> +
> +	if (WARN_ON(!ul_set || !dl_set))
> +		return -ENOENT;
> +
> +	return 0;
> +}
> +
> +static const struct ath12k_hif_ops ath12k_ahb_hif_ops_ipq5332 = {
> +	.start = ath12k_ahb_start,
> +	.stop = ath12k_ahb_stop,
> +	.read32 = ath12k_ahb_read32,
> +	.write32 = ath12k_ahb_write32,
> +	.cmem_read32 = ath12k_ahb_cmem_read32,
> +	.cmem_write32 = ath12k_ahb_cmem_write32,
> +	.irq_enable = ath12k_ahb_ext_irq_enable,
> +	.irq_disable = ath12k_ahb_ext_irq_disable,
> +	.map_service_to_pipe = ath12k_ahb_map_service_to_pipe,
> +};
> +
> +static int ath12k_ahb_clock_init(struct ath12k_base *ab)
> +{
> +	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
> +	int ret;
> +
> +	ab_ahb->xo_clk = devm_clk_get(ab->dev, "gcc_xo_clk");
> +	if (IS_ERR_OR_NULL(ab_ahb->xo_clk)) {
> +		ath12k_err(ab, "failed to get gcc_xo_clk: %d\n",
> +			   PTR_ERR_OR_ZERO(ab_ahb->xo_clk));
> +		ret = ab_ahb->xo_clk ? PTR_ERR(ab_ahb->xo_clk) : -ENODEV;
> +		ab_ahb->xo_clk = NULL;
> +		return ret;
> +	}

Won't clk core print errors in both of these cases?

> +
> +	return 0;
> +}
> +
> +static void ath12k_ahb_clock_deinit(struct ath12k_base *ab)
> +{
> +	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
> +
> +	devm_clk_put(ab->dev, ab_ahb->xo_clk);
> +	ab_ahb->xo_clk = NULL;
> +}
> +
> +static int ath12k_ahb_clock_enable(struct ath12k_base *ab)
> +{
> +	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
> +	int ret;
> +
> +	if (IS_ERR_OR_NULL(ab_ahb->xo_clk)) {
> +		ath12k_err(ab, "clock is not initialized\n");
> +		return -EIO;
> +	}
> +
> +	ret = clk_prepare_enable(ab_ahb->xo_clk);
> +	if (ret) {
> +		ath12k_err(ab, "failed to enable gcc_xo_clk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ath12k_ahb_clock_disable(struct ath12k_base *ab)
> +{
> +	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
> +
> +	clk_disable_unprepare(ab_ahb->xo_clk);
> +}
> +
> +static int ath12k_ahb_resource_init(struct ath12k_base *ab)
> +{
> +	struct platform_device *pdev = ab->pdev;
> +	struct resource *mem_res;
> +	void __iomem *mem;
> +	int ret;
> +
> +	mem = devm_platform_get_and_ioremap_resource(pdev, 0, &mem_res);
> +	if (IS_ERR(mem)) {
> +		dev_err(&pdev->dev, "ioremap error\n");
> +		ret = PTR_ERR(mem);
> +		goto out;

If you assign ab->mem directly, you can get rid of the line below
and return the error here

> +	}
> +
> +	ab->mem = mem;
> +	ab->mem_len = resource_size(mem_res);
> +
> +	if (ab->hw_params->ce_remap) {
> +		const struct ce_remap *ce_remap = ab->hw_params->ce_remap;
> +		/* ce register space is moved out of wcss and the space is not
> +		 * contiguous, hence remapping the CE registers to a new space
> +		 * for accessing them.
> +		 */

Please capitalize words consistently

> +		ab->mem_ce = ioremap(ce_remap->base, ce_remap->size);
> +		if (IS_ERR(ab->mem_ce)) {
> +			dev_err(&pdev->dev, "ce ioremap error\n");
> +			ret = -ENOMEM;
> +			goto err_mem_unmap;
> +		}
> +		ab->ce_remap = true;
> +		ab->ce_remap_base_addr = HAL_IPQ5332_CE_WFSS_REG_BASE;
> +	}
> +
> +	if (ab->hw_params->cmem_remap) {
> +		const struct cmem_remap *cmem_remap = ab->hw_params->cmem_remap;
> +		/* For device like IPQ5332 CMEM region is outside WCSS block.

IPQ5332 is not a 'device'

> +		 * Allocate separate I/O remap to access CMEM address.
> +		 */
> +		ab->mem_cmem = ioremap(cmem_remap->base, cmem_remap->size);
> +		if (IS_ERR(ab->mem_cmem)) {
> +			dev_err(&pdev->dev, "cmem ioremap error\n");
> +			ret = -ENOMEM;
> +			goto err_mem_ce_unmap;
> +		}
> +	}

[...]

> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to set 32-bit consistent dma\n");

s/consistent/coherent

You're setting the mask, not the DMA itself

[...]

> +	/* Set fixed_mem_region to true for platforms that support fixed memory
> +	 * reservation from DT. If memory is reserved from DT for FW, ath12k driver
> +	 * need not to allocate memory.
> +	 */
> +	if (!of_property_read_u32(ab->dev->of_node, "memory-region", &addr)) {
> +		set_bit(ATH12K_FLAG_FIXED_MEM_REGION, &ab->dev_flags);
> +		mem_node = of_find_node_by_name(NULL, "mlo_global_mem_0");

This is not mentioned or documented anywhere.

Konrad

