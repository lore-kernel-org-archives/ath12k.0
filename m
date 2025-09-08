Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45B0CAC581
	for <ath12k@archiver.kernel.org>; Mon,  8 Sep 2025 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzH5e3TRkeUoqbXoi2uQG9jgA9WM+uAuto/uJGKlYrA=; b=LLp6Ny/7E3UAK1KxM9QTl+7bKq
	QIUnsgnmdc0To0KPhn0DM//TewrPhcSqh01bkZw1JCO0LZ88kLAGbSUvkOjk+d0lPXFfrgegSj11D
	KQNUV5yUdjcsyXUyfQVeyPtqwFVgDK7NvGDg5BlIBBxNniPEPULxtpQbs0EVSlGwl4muBcyC8smIj
	qtOsboJnM4mfnEti/I2dS6mdpEfnlnBQ3PqnyLJV568kmK2cBrWcu2yIrC9PDGv7uZmvqv6sC5BG8
	STdYbpRd3/8KM/d0Z+/JNhCT8xsSWW3t6ibFXdBdbiFPjg2doAQrqxCQrOQEch18RAFG3dfZ2XXds
	nG1n0WkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYnH-0000000GGkR-1nKN;
	Mon, 08 Sep 2025 10:08:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYBY-0000000G27A-2m8B
	for ath12k@lists.infradead.org;
	Mon, 08 Sep 2025 09:29:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888wZeG008832;
	Mon, 8 Sep 2025 09:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jzH5e3TRkeUoqbXoi2uQG9jgA9WM+uAuto/uJGKlYrA=; b=lSOz04J7jhCYCiwz
	zbqlCIfmQhQIIjfdTdaEobDFsFNZFHCZrE4dVO29Ect4T+63rzYVGfy1R5iXDqGT
	BRXr3r8hHAJq4oVKxuisxmW5MZyLxQFKV8hPUFrQCIZAJvNlFzjRl1ibcGjfs8D1
	JknUqBDHtSPgs7uZWJF8ew7GV1+qY7BN1HJLkGF04uJoEKjW6hslkLW5/m+Z+p/B
	RyU3Mdh3O4S/kXujDEg8f2Wu8OHZqPxr61ta294EeFStHz7khY+MDV3okfTKKLpF
	q5yEJLNvYtHu7lPVMZmdub32QRz/GbZmAQ2yFRoxMp8a2K5pEZw0Ow8vpKIK85Ko
	/QNBxQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0m2ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 09:29:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5889TCmH031523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Sep 2025 09:29:12 GMT
Received: from [10.133.33.112] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 8 Sep
 2025 02:29:11 -0700
Message-ID: <34f0689a-bfac-4363-a35b-069ae88f0dde@quicinc.com>
Date: Mon, 8 Sep 2025 17:29:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix WMI TLV header misalignment
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, <jjohnson@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250908015139.1301437-1-miaoqing.pan@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250908015139.1301437-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mYBTYlZqi1K523x4r6pyJts4CTUlw5Br
X-Proofpoint-GUID: mYBTYlZqi1K523x4r6pyJts4CTUlw5Br
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXwwQ/2EIekPbC
 hFMhjGoBXGjEpQO0c4xZQ8CZOJDG5ysjtz2hs9RLlin5RlwOk7nGVHvcGIDaFq1+89nE/qNc0KW
 7hQ1VaJHO2sEM2/auiHtn+sAhEyV8wNm+oC9LFNS0hlNa4BIGOZvjfH6v9Atz03/SifSxboc2lg
 qhqBhZPL3S6diW6u3lgXBWbU+JxIkgVGkaaWotLJaAO29WaOuetlAT3EtLddC689v+0d0c8JSql
 bQ3PempYicyplUtVIBmAFzNohZUXBpPrCpIPhUkDLp5ptiSnCws8kZOu5xciZ8uE0oVqqLDDvRb
 /lw+izJ1nAvG1MzVc00UjkMC7KzrJkqQ/we7CX2mIAhdsjWgm+fcGHueu/SaoaKe8O67zP4OaUt
 8OVABC/2
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bea1e9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8
 a=J7m7x4hWGeMiwygy9zQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_022916_825786_204DC689 
X-CRM114-Status: GOOD (  16.43  )
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



On 9/8/2025 9:51 AM, Miaoqing Pan wrote:
> When buf_len is not 4-byte aligned in ath12k_wmi_mgmt_send(), the
> firmware asserts and triggers a recovery. The following error
> messages are observed:
> 
> ath12k_pci 0004:01:00.0: failed to submit WMI_MGMT_TX_SEND_CMDID cmd
> ath12k_pci 0004:01:00.0: failed to send mgmt frame: -108
> ath12k_pci 0004:01:00.0: failed to tx mgmt frame, vdev_id 0 :-108
> ath12k_pci 0004:01:00.0: waiting recovery start...
> 
> This issue was observed when running 'iw wlanx set power_save off/on'
> in MLO station mode, which triggers the sending of an SMPS action frame
> with a length of 27 bytes to the AP. To resolve the misalignment, use
> buf_len_aligned instead of buf_len when constructing the WMI TLV header.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00011-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 742ffeb48bce..29dadedefdd2 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -843,7 +843,7 @@ int ath12k_wmi_mgmt_send(struct ath12k_link_vif *arvif, u32 buf_id,
>  	cmd->tx_params_valid = 0;
>  
>  	frame_tlv = (struct wmi_tlv *)(skb->data + sizeof(*cmd));
> -	frame_tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_BYTE, buf_len);
> +	frame_tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_BYTE, buf_len_aligned);
>  
>  	memcpy(frame_tlv->value, frame->data, buf_len);
>  
> 
> base-commit: 27893dd6341b929f87d45fc4d65c5778179319dd

Reviewed-by:  Baochen Qiang <baochen.qiang@oss.qualcomm.com>



