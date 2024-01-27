Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2797BC47422
	for <ath12k@archiver.kernel.org>; Sat, 27 Jan 2024 00:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5Dmcn0tLMetworJ7ghrTDfwdElvkBrKOKq8NFKf98U=; b=jzdVoW71RjuCIsYOKuBnfKY+oR
	WC6ZYW00Yc8HnxAWQPPmEHvyye7yVxEOKoYEkVL52ngc4OXCIqHaS5JVbn1cv3ZU8b44i35eAcxuB
	4wWYWmlcIH2ORHbY0z+e0gQcxK3sbNxUzX/S5tTIYSqD/a6Y8DrlxaPn8EDHmOCIr5pYcbKjzGJr7
	nbKo9Ih0Rw6ZWcGB2ynOKmNKmzQ2g3MWgrI9coEY4c/1n2WP7rYp7z6vzVdkrNxXnQg///c9TFNbF
	QIrdWoe/U/3j1iXo6tINYazXDsunmYA/gUX/EN1XJsihNpY+eB+TFiav3mfaKYwt2oKRuebaNUZ5r
	SSuopjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWUN-00000005yBq-36HG
	for ath12k@archiver.kernel.org;
	Sat, 27 Jan 2024 00:24:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWUK-00000005yB6-3VcE
	for ath12k@lists.infradead.org;
	Sat, 27 Jan 2024 00:24:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40R0LX3P023033;
	Sat, 27 Jan 2024 00:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=z5Dmcn0tLMetworJ7ghrTDfwdElvkBrKOKq8NFKf98U=; b=VR
	eFo0qnmoIgOcCZWk/uBYYbj9Vu9+iya4StpuwCaF/+iA6AbVno63TlFUcXKjeeHP
	jnkDDweukyB3G3yMTaS1BAHHilRd7WvdUuKTh1rOEtma31JYLX+TDlBNXqpO/GVE
	MD9k8ZqwuM6qIABfuCg1iZmpuUnaLVun9yktZVfi4oFnXv74sYUs8ci5dN6U3IHz
	T1JLYwSDOYhvHOWogvo6un3iyaLH4aQzRyCZ+XSPKJTWbRShIFAqeJzKC3cahmS3
	cIDP/eEEoM81mzqUniJxwl1+m7V/D5Z73jrSVwoV1cyRZsAfarDPgKozLjk0NkXm
	jgvySIGuSUyJh5w6Easg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvq6sg06v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 00:23:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40R0NwN4031376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 00:23:58 GMT
Received: from [10.110.0.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 16:23:57 -0800
Message-ID: <8cc71105-9901-4732-aafd-f8e116e485f3@quicinc.com>
Date: Fri, 26 Jan 2024 16:23:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] wifi: ath12k: fix broken structure
 wmi_vdev_create_cmd
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240126115231.356658-1-quic_kangyang@quicinc.com>
 <20240126115231.356658-8-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240126115231.356658-8-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W8CU0_xQDw2XLbMnrt3YR4EYZMLjDA1_
X-Proofpoint-ORIG-GUID: W8CU0_xQDw2XLbMnrt3YR4EYZMLjDA1_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=841
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401270001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_162401_033381_4CDEC0B9 
X-CRM114-Status: GOOD (  14.97  )
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

On 1/26/2024 3:52 AM, Kang Yang wrote:
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
> v4: no change.
> v3: no change.
> v2: add Tested-on tag of QCN9274.
> 
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 5 +++++
>  drivers/net/wireless/ath/ath12k/wmi.h | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index c7e732c6c145..34e676799616 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -828,7 +828,12 @@ int ath12k_wmi_vdev_create(struct ath12k *ar, u8 *macaddr,
>  	cmd->vdev_subtype = cpu_to_le32(args->subtype);
>  	cmd->num_cfg_txrx_streams = cpu_to_le32(WMI_NUM_SUPPORTED_BAND_MAX);
>  	cmd->pdev_id = cpu_to_le32(args->pdev_id);
> +	if (args->if_stats_id != ATH12K_INVAL_VDEV_STATS_ID)
> +		cmd->vdev_stats_id_valid = cpu_to_le32(true);
> +	else
> +		cmd->vdev_stats_id_valid = cpu_to_le32(false);

else clause is unnecessary since the struct is zeroed when allocated

>  	cmd->vdev_stats_id = cpu_to_le32(args->if_stats_id);

suggest this only be done inside:
 if (args->if_stats_id != ATH12K_INVAL_VDEV_STATS_ID)

> +
>  	ether_addr_copy(cmd->vdev_macaddr.addr, macaddr);
>  
>  	ptr = skb->data + sizeof(*cmd);
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index 0efed12dd7ab..74b0ee9f86bf 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -2712,6 +2712,9 @@ struct wmi_vdev_create_cmd {
>  	struct ath12k_wmi_mac_addr_params vdev_macaddr;
>  	__le32 num_cfg_txrx_streams;
>  	__le32 pdev_id;
> +	__le32 mbssid_flags;
> +	__le32 mbssid_tx_vdev_id;
> +	__le32 vdev_stats_id_valid;
>  	__le32 vdev_stats_id;
>  } __packed;
>  


