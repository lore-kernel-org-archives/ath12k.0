Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D72C00140
	for <ath12k@archiver.kernel.org>; Thu, 18 Aug 2022 22:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZMo8BIeoRevhUPCj7chzC+0l+VNG23wzjbyz5Drmy4=; b=DHT523Va5o16LZ
	6ezUXruTLrWzNdE1y7OIxJUUhg/Q+0ZJdM0k/zUu2YAv/nWihQ6k/rCGRa9LJOA13LO5qt524Jv3w
	5iVX1j072gO7HRvybTcXbAAJDtlbGTdb30KW6ippHF7sr5rIBsA+mdWUlhjO/KNAxpD2M7yqjsWkV
	y8BMtSVxTd1M6LB/Uxf7JGeEciyXDTDf+2fG9YWZ6nDIJ48FoqpDaLY1IlPGIt0B4szeAGlO2poL4
	QNm6685z5LdtuVNxZXatzW5d8Ob+jf3hbz0VzwGWDyvFG9b5YPKLjF9Kj9Icp/rGIs7soJFCIebu9
	0WCY0RV0cdsFKNfzIpIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOnxn-00AYVs-Ug
	for ath12k@archiver.kernel.org; Thu, 18 Aug 2022 22:26:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOnxh-00AYTK-T0
	for ath12k@lists.infradead.org; Thu, 18 Aug 2022 22:26:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IJxaC9005484;
	Thu, 18 Aug 2022 22:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iszVaAmW9X3RToKxj/pYGLOj5godrqfwPUOZSz3hae4=;
 b=YDSTVQSEukd+fbbQkAg/z/VmAZ6QFladWowuSUOx/NsBIKYHl3ab7/e+Xd8Vnr6JYJGN
 xfr/35rhYP1E0QEW0gAmg063XA8Odo6BH9adUXWgNtXZr3Jcu9Tv/Qtk47aIK9boTyQK
 oZNfBfU7wu55BKHsCNcHX99UZq+oRCoDL5rtcHv6KXyTEJZnk5fpu3gZK6oZzILDPCll
 Ze4Ht936S00cT5Q4Q26DQe8rYyyVz/qQ8aSuS8TrAWFY8VYHvzOkIW1guYSpYmFCYz+T
 KlW6h7H/Ry5O5BuB6gQFx1lN+5l+3ebi8QpDkgbUIhksSIQKelPETRjrBgHBxz9mN0sp lw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j1pwuhdua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 22:25:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27IMPpRe026678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 22:25:51 GMT
Received: from [10.110.11.6] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 18 Aug
 2022 15:25:51 -0700
Message-ID: <05841a52-3d2f-8704-b885-4b02e7a439e0@quicinc.com>
Date: Thu, 18 Aug 2022 15:25:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 33/50] wifi: ath12k: add mhi.c
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-34-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220812161003.27279-34-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aOY-R7OT4FNiYDzJ8DvzHDI6LeyuK1iQ
X-Proofpoint-ORIG-GUID: aOY-R7OT4FNiYDzJ8DvzHDI6LeyuK1iQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_16,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_152602_111523_DC3138D2 
X-CRM114-Status: GOOD (  24.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 8/12/2022 9:09 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> (Patches split into one patch per file for easier review, but the final
> commit will be one big patch. See the cover letter for more info.)
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/mhi.c | 615 ++++++++++++++++++++++++++++++++++
>   1 file changed, 615 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
> new file mode 100644
> index 000000000000..f77634994d97
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/mhi.c
> @@ -0,0 +1,615 @@
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
> +/*
> + * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/msi.h>
> +#include <linux/pci.h>
> +
> +#include "core.h"
> +#include "debug.h"
> +#include "mhi.h"
> +#include "pci.h"
> +
> +#define MHI_TIMEOUT_DEFAULT_MS	90000
> +
> +static struct mhi_channel_config ath12k_mhi_channels_qcn9274[] = {

should this be const?
in struct mhi_controller_config:
	const struct mhi_channel_config *ch_cfg;

> +	{
> +		.num = 0,
> +		.name = "LOOPBACK",
> +		.num_elements = 32,
> +		.event_ring = 1,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = 0x4,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +	},
> +	{
> +		.num = 1,
> +		.name = "LOOPBACK",
> +		.num_elements = 32,
> +		.event_ring = 1,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = 0x4,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +	},
> +	{
> +		.num = 20,
> +		.name = "IPCR",
> +		.num_elements = 32,
> +		.event_ring = 1,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = 0x4,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +	},
> +	{
> +		.num = 21,
> +		.name = "IPCR",
> +		.num_elements = 32,
> +		.event_ring = 1,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = 0x4,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = true,
> +	},
> +};
> +
> +static struct mhi_event_config ath12k_mhi_events_qcn9274[] = {

seems this should be const
but for some reason struct mhi_controller_config has:
	struct mhi_event_config *event_cfg;

(not const) so this can't be const :(

perhaps someone can propose a MHI interface change?
especially since internally to MHI in parse_ev_cfg() we have:
	const struct mhi_event_config *event_cfg;
	[...]
	for (i = 0; i < num; i++) {
		event_cfg = &config->event_cfg[i];

so it is treated as const

> +	{
> +		.num_elements = 32,
> +		.irq_moderation_ms = 0,
> +		.irq = 1,
> +		.data_type = MHI_ER_CTRL,
> +		.mode = MHI_DB_BRST_DISABLE,
> +		.hardware_event = false,
> +		.client_managed = false,
> +		.offload_channel = false,
> +	},
> +	{
> +		.num_elements = 256,
> +		.irq_moderation_ms = 1,
> +		.irq = 2,
> +		.mode = MHI_DB_BRST_DISABLE,
> +		.priority = 1,
> +		.hardware_event = false,
> +		.client_managed = false,
> +		.offload_channel = false,
> +	},
> +};
> +
> +struct mhi_controller_config ath12k_mhi_config_qcn9274 = {
> +	.max_channels = 30,
> +	.timeout_ms = 10000,
> +	.use_bounce_buf = false,
> +	.buf_len = 0,
> +	.num_channels = ARRAY_SIZE(ath12k_mhi_channels_qcn9274),
> +	.ch_cfg = ath12k_mhi_channels_qcn9274,
> +	.num_events = ARRAY_SIZE(ath12k_mhi_events_qcn9274),
> +	.event_cfg = ath12k_mhi_events_qcn9274,
> +};
> +
> +static struct mhi_channel_config ath12k_mhi_channels_wcn7850[] = {

const

> +	{
> +		.num = 0,
> +		.name = "LOOPBACK",
> +		.num_elements = 32,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = 0x4,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +	},
> +	{
> +		.num = 1,
> +		.name = "LOOPBACK",
> +		.num_elements = 32,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = 0x4,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +	},
> +	{
> +		.num = 20,
> +		.name = "IPCR",
> +		.num_elements = 64,
> +		.event_ring = 1,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = 0x4,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +	},
> +	{
> +		.num = 21,
> +		.name = "IPCR",
> +		.num_elements = 64,
> +		.event_ring = 1,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = 0x4,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = true,
> +	},
> +};
> +
> +static struct mhi_event_config ath12k_mhi_events_wcn7850[] = {

keep not const (for now) :(

> +	{
> +		.num_elements = 32,
> +		.irq_moderation_ms = 0,
> +		.irq = 1,
> +		.mode = MHI_DB_BRST_DISABLE,
> +		.data_type = MHI_ER_CTRL,
> +		.hardware_event = false,
> +		.client_managed = false,
> +		.offload_channel = false,
> +	},
> +	{
> +		.num_elements = 256,
> +		.irq_moderation_ms = 1,
> +		.irq = 2,
> +		.mode = MHI_DB_BRST_DISABLE,
> +		.priority = 1,
> +		.hardware_event = false,
> +		.client_managed = false,
> +		.offload_channel = false,
> +	},
> +};
> +
> +struct mhi_controller_config ath12k_mhi_config_wcn7850 = {

and this one should be const since it is registered via:

int mhi_register_controller(struct mhi_controller *mhi_cntrl,
			const struct mhi_controller_config *config);

> +	.max_channels = 128,
> +	.timeout_ms = 2000,
> +	.use_bounce_buf = false,
> +	.buf_len = 0,
> +	.num_channels = ARRAY_SIZE(ath12k_mhi_channels_wcn7850),
> +	.ch_cfg = ath12k_mhi_channels_wcn7850,
> +	.num_events = ARRAY_SIZE(ath12k_mhi_events_wcn7850),
> +	.event_cfg = ath12k_mhi_events_wcn7850,
> +};
> +

snip

> +static int ath12k_mhi_get_msi(struct ath12k_pci *ab_pci)
> +{
> +	struct ath12k_base *ab = ab_pci->ab;
> +	u32 user_base_data, base_vector;
> +	int ret, num_vectors, i;
> +	int *irq;
> +
> +	ret = ath12k_pci_get_user_msi_assignment(ab,
> +						 "MHI", &num_vectors,
> +						 &user_base_data, &base_vector);
> +	if (ret)
> +		return ret;
> +
> +	ath12k_dbg(ab, ATH12K_DBG_PCI, "Number of assigned MSI for MHI is %d, base vector is %d\n",
> +		   num_vectors, base_vector);
> +
> +	irq = kcalloc(num_vectors, sizeof(int), GFP_KERNEL);

prefer sizeof(*irq)?

> +	if (!irq)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_vectors; i++)
> +		irq[i] = ath12k_pci_get_msi_irq(ab->dev,
> +						base_vector + i);
> +
> +	ab_pci->mhi_ctrl->irq = irq;
> +	ab_pci->mhi_ctrl->nr_irqs = num_vectors;
> +
> +	return 0;
> +}
> +

snip

> +void ath12k_mhi_unregister(struct ath12k_pci *ab_pci)
> +{
> +	struct mhi_controller *mhi_ctrl = ab_pci->mhi_ctrl;
> +
> +	mhi_unregister_controller(mhi_ctrl);
> +	kfree(mhi_ctrl->irq);
> +	mhi_free_controller(mhi_ctrl);

consider setting ab_pci->mhi_ctrl = NULL to avoid dangling pointer?

> +}

rest snipped

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
