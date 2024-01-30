Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD776C47DA9
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 17:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R91xTAZZLScQein94RfA/1kNt+S9K1rKtqX2d0Y6oPA=; b=K4sB/EhsO5VPBgWw5eS92zActI
	EooTd2JkdgO54+BK615kV+Dbp9TXXofBlK41CfGLe9Ci+9tCRsmOGgzn40zJofmx8lnum2Gyf2wqW
	61Hu7OBbZsTmej3FseS5RacTS4ShXL4YZxaYWb3f5DeI75GA6ZrypF5fyEK4BiuOU/JGlWapDanvD
	SYIVdrFh0/0qwmmzOMnPmwjdDg71bhlKQ+SDxPXsl35L02EDpBvwrqoci9hYsPQ9Gu1wp4uJOA37E
	FHR1e9H3Paj/p6yL1hMaGJKEoS6UWuFJycs5c+8nuFVAt18sp7v8UP8hPoGWMtSmdYVP0dkPTkVRq
	EaboJZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrW5-0000000HUoo-1dJc
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 17:03:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrW2-0000000HUm2-1vRb
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 17:03:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40UDw6aR023962;
	Tue, 30 Jan 2024 17:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=R91xTAZZLScQein94RfA/1kNt+S9K1rKtqX2d0Y6oPA=; b=Op
	pb0o/el6tugu6MsH0jQj+7TQzxZvfoI1EDoGC94ClMYk0R9ed0o4M+a3E1dMecj5
	z4Dv5c7T3sOxEaa8RFxGt+1M7Edh2N07sIA4eml3S451yMV2vKLowmj6SDq75SUv
	W1VVfPnsr1DB3H70Ifm9IpBi4WSQCVONCplBGlRafj9GGTBzdZuskeReePMOBmzh
	rcZbGoafMhuTglGKO6vD4c290HyUOxXeDo81Z6NZ9Q2qh66Yca4AzUDRxBSFGDY0
	5tmsrfT749nVytPiAX4ppk6CPKzFm6E7Mp0lnXsbF7iovebPR5ODqRD9N+g13lGI
	wyhu+OPlPn9tFLfJG/ZQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxvwqs9c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 17:03:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40UH2t2h023579
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 17:02:55 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 30 Jan
 2024 09:02:55 -0800
Message-ID: <f947f804-6fd1-41eb-8b6f-c562d51e5441@quicinc.com>
Date: Tue, 30 Jan 2024 09:02:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] wifi: ath12k: add P2P IE in beacon template
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
 <20240130040303.370590-5-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240130040303.370590-5-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JRMmqsgLw1jy_BiyDBaE4YlGh47vGPJS
X-Proofpoint-GUID: JRMmqsgLw1jy_BiyDBaE4YlGh47vGPJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_07,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=981
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401300126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_090318_661436_8DE22D85 
X-CRM114-Status: GOOD (  15.65  )
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

On 1/29/2024 8:02 PM, Kang Yang wrote:
> P2P Element is a necessary component of P2P protocol communication.
> It contains the Vendor Specific Information Element which includes
> the WFA OUI and an OUI Type indicating P2P.
> 
> Add P2P IE in beacon template, and implement WMI interface for it.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
> 
> v6: no change.
> v5: no change.
> v4: no change.
> v3: no change.
> v2:
>     1. add Tested-on tag of QCN9274.
>     2. update copyright.
> 
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 85 ++++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/wmi.c | 39 ++++++++++++
>  drivers/net/wireless/ath/ath12k/wmi.h | 10 +++-
>  3 files changed, 131 insertions(+), 3 deletions(-)
...
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -1713,6 +1713,45 @@ int ath12k_wmi_send_bcn_offload_control_cmd(struct ath12k *ar,
>  	return ret;
>  }
>  
> +int ath12k_wmi_p2p_go_bcn_ie(struct ath12k *ar, u32 vdev_id,
> +			     const u8 *p2p_ie)
> +{
...
> +	ptr = skb->data;
> +	cmd = ptr;
> +	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_P2P_GO_SET_BEACON_IE,
> +						 sizeof(*cmd));
> +	cmd->vdev_id = cpu_to_le32(vdev_id);
> +	cmd->ie_buf_len = cpu_to_le32(p2p_ie_len);
> +
> +	ptr = skb->data + sizeof(*cmd);

IMO better would be: ptr += sizeof(*cmd);

Kalle can probably adjust this in the pending branch

> +	tlv = ptr;
> +	tlv->header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_ARRAY_BYTE,
> +					     aligned_len);
> +	memcpy(tlv->value, p2p_ie, p2p_ie_len);
> +
> +	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_P2P_GO_SET_BEACON_IE);
> +	if (ret) {
> +		ath12k_warn(ar->ab, "failed to send WMI_P2P_GO_SET_BEACON_IE\n");
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
> +}

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



