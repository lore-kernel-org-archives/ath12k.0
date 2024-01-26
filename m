Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4077CC47422
	for <ath12k@archiver.kernel.org>; Fri, 26 Jan 2024 16:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2Ia3moUYey/x0UkjmfimIJWyvghpcTAYwOCQViLM2E=; b=ydjlUCP0Gi3cGARtPz7yK4/kF8
	JbYKFS6eRSp6BaU88ltUGgGEirEuQnyI2AgwV3sOBheU2lJ6MBzX7lAJnDgcYuLWywyv0UnRLWui3
	zLHEDrabHXZKXuAe9Jq0PYYVcRTzngYYGlbrpj6C30acnNWd710q1AUsiajyL2G5frA3hTHfkGwua
	eSCAyu7xlFnZKWbvokIimk9p8OPAJWPhsa3M0cqBwMg41V1wEQ5FHcrc6n+qLiPZwZPOKTwZ36cXV
	rskMxcTWCN72LlU6iDjqskm/hpuPUkpEti66iOo9WoMBw+Z1GhkPdKj1nWhv3ClWlnZwVQ+BEvUln
	AFXQ3XoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTPUw-00000004lVp-3ksf
	for ath12k@archiver.kernel.org;
	Fri, 26 Jan 2024 16:56:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTPUt-00000004lV6-49Vu
	for ath12k@lists.infradead.org;
	Fri, 26 Jan 2024 16:56:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QEbXJM022238;
	Fri, 26 Jan 2024 16:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=r2Ia3moUYey/x0UkjmfimIJWyvghpcTAYwOCQViLM2E=; b=aT
	EiAmgPeFStU7Yrep5+b4dM+b4GGkNkSujzzFAgLrD1J79m8Wrew5bynCm9jzkXzg
	faKpkzUGWu3qnxL1EpVHlaUVAxjXWk3im3qVBM2RP+AqURL4qNj6GJ4kVaOepR4E
	jTN9CcjitQS4zRsfbex8vCu02kba1DGZv3yJaUBDS8kYKl6ZUnBR6AF/Hjw5Lg+C
	D+9ryc4ojkZIsrhorEwWiUiB4up8BSmFMJOnmL247y1ZqsO/6LJcf23oPSiXFDvh
	XoMvPOOqSpil0cALJGO5Wo6HvTFoqgrDsbY8Yz6Y+nh0VYHlZLmEGBrlZgJ7eaSS
	tzlI/A8qPttTzBhDlCZA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv4casnbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 16:56:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QGu5rm004348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 16:56:05 GMT
Received: from [10.110.0.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 08:56:05 -0800
Message-ID: <0dd4948b-e967-4562-b98e-2f4643205ca4@quicinc.com>
Date: Fri, 26 Jan 2024 08:56:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/11] wifi: ath12k: fix incorrect logic of calculating
 vdev_stats_id
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240126115231.356658-1-quic_kangyang@quicinc.com>
 <20240126115231.356658-11-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240126115231.356658-11-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kUI0LojrLdh6Nev53lxvaDV7edxRorVJ
X-Proofpoint-GUID: kUI0LojrLdh6Nev53lxvaDV7edxRorVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_085608_077342_E55639FF 
X-CRM114-Status: GOOD (  29.16  )
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
> During calculate vdev_stats_id, will copmare vdev_stats_id with

s/copmare /compare /

> ATH12K_INVAL_VDEV_STATS_ID. If vdev_stats_id is relatively small, then
> assign ATH12K_INVAL_VDEV_STATS_ID to vdev_stats_id.
> 
> Obviously, this logic is incorrect. ATH12K_INVAL_VDEV_STATS_ID is 0xff,
> and the data type of this variable is u8. Which means this judgement
> will always be true. So will get 0xff for every vdev except the first
> one.
> 
> Correct this logic and replace it with the maximum value
> ATH12K_MAX_VDEV_STATS_ID.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")

Fixes is an upstream tag so it should be grouped with the SOB

Since this is a preexisting issue that is unrelated to P2P I'm thinking
you should remove it from the P2P series and send it separately?

> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
> 
> v4: new patch.
> 
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index d8c8bd420aa2..6b8b92d22553 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -5520,7 +5520,7 @@ ath12k_mac_get_vdev_stats_id(struct ath12k_vif *arvif)
>  	do {
>  		if (ab->free_vdev_stats_id_map & (1LL << vdev_stats_id)) {
>  			vdev_stats_id++;
> -			if (vdev_stats_id <= ATH12K_INVAL_VDEV_STATS_ID) {
> +			if (vdev_stats_id >= ATH12K_MAX_VDEV_STATS_ID) {

as you already noted it can't be > so just make this ==

but why isn't this instead using ATH12K_MAX_VDEV_STATS_ID (which is
currently unused)

But even the current value for that seems wrong based upon the firmware
documentation:
    /**
     * vdev_stats_id indicates the ID for the REO Rx stats collection
     * For Beryllium: 0-47 is the valid range and >=48 is invalid
     * This vdev_stats_id field should be ignored unless the
     * vdev_stats_id_valid field is non-zero.
     */

And it seems there is another bigger issue here since, as the firmware
document indicates, the vdev_stats_id field should be ignored unless the
vdev_stats_id_valid field is non-zero, but in ath12k_wmi_vdev_create()
we don't set vdev_stats_id_valid -- and we cannot set it since it isn't
even present in the ath12k struct wmi_vdev_create_cmd! And comparing our
struct to the firmware definition shows we have missing fields!!!
Everything is correct up to pdev_id, but then there is divergence:

our struct
struct wmi_vdev_create_cmd {
	__le32 tlv_header;
	__le32 vdev_id;
	__le32 vdev_type;
	__le32 vdev_subtype;
	struct ath12k_wmi_mac_addr_params vdev_macaddr;
	__le32 num_cfg_txrx_streams;
	__le32 pdev_id;
	__le32 vdev_stats_id;
} __packed;

firmware definition
typedef struct {
    A_UINT32 tlv_header; /** TLV tag and len; tag equals
WMITLV_TAG_STRUC_wmi_vdev_create_cmd_fixed_param */
    /** unique id identifying the VDEV, generated by the caller */
    A_UINT32 vdev_id;
    /** VDEV type (AP,STA,IBSS,MONITOR) */
    A_UINT32 vdev_type;
    /** VDEV subtype (P2PDEV, P2PCLI, P2PGO, BT3.0, BRIDGE) */
    A_UINT32 vdev_subtype;
    /** VDEV MAC address */
    wmi_mac_addr vdev_macaddr;
    /** Number of configured txrx streams */
    A_UINT32 num_cfg_txrx_streams;
    /**
     * pdev_id for identifying the MAC,
     * See macros starting with WMI_PDEV_ID_ for values.
     */
    A_UINT32 pdev_id;
    /** control flags for this vdev (DEPRECATED)
     * Use @mbss_capability_flags in vdev start instead.
     */
    A_UINT32 flags;
    /**  vdevid of transmitted AP (mbssid case) (DEPRECATED)
     * Use @vdevid_trans in vdev start instead.
     */
    A_UINT32 vdevid_trans;
    /* vdev_stats_id_valid indicates whether vdev_stats_id is valid */
    A_UINT32 vdev_stats_id_valid;
    /**
     * vdev_stats_id indicates the ID for the REO Rx stats collection
     * For Beryllium: 0-47 is the valid range and >=48 is invalid
     * This vdev_stats_id field should be ignored unless the
     * vdev_stats_id_valid field is non-zero.
     */
    A_UINT32 vdev_stats_id;
/* This TLV is followed by another TLV of array of structures
 *   wmi_vdev_txrx_streams cfg_txrx_streams[];
 *   wmi_vdev_create_mlo_params mlo_params[0,1];
 *       optional TLV, only present for MLO vdev;
 *       if the vdev is not MLO the array length should be 0.
 */
} wmi_vdev_create_cmd_fixed_param;

(note the deprecated fields must still have their space allocated in the
data structure)

So currently when host is writing to vdev_stats_id firmware will
interpret this as the deprecated flags

So it seems like we also need to fix the WMI struct to:
struct wmi_vdev_create_cmd {
	__le32 tlv_header;
	__le32 vdev_id;
	__le32 vdev_type;
	__le32 vdev_subtype;
	struct ath12k_wmi_mac_addr_params vdev_macaddr;
	__le32 num_cfg_txrx_streams;
	__le32 pdev_id;
	__le32 flags; /* deprecated */
	__le32 vdevid_trans; /* deprecated */
	__le32 vdev_stats_id_valid;
	__le32 vdev_stats_id;
} __packed;

>  				vdev_stats_id = ATH12K_INVAL_VDEV_STATS_ID;
>  				break;
>  			}


